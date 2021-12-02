-- "gamemodes\\rust\\entities\\weapons\\rust_basegun\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
DEFINE_BASECLASS("rust_base")
SWEP.Base   = "rust_base"

SWEP.Primary.Automatic = true

--
-- Stats
--
SWEP.Damage     = 50
SWEP.RPM        = 450
SWEP.AimCone    = 0.2
SWEP.Capacity   = 30
SWEP.ReloadTime = 4.4
SWEP.DrawTime   = 1

SWEP.Bullets    = 1

SWEP.Ammo       = "rifle_ammo"

--
-- Effects
--
SWEP.MuzzleEffect   = "CS_MuzzleFlash"
SWEP.ShellEject     = "EjectBrass_762Nato"

function SWEP:SetupDataTables()
    BaseClass.SetupDataTables(self)
    self:NetworkVar("Bool", 0, "Reloading")
end

function SWEP:DoEffects(ent)
    --
    -- Shell Eject
    --

    local Shell = self.ShellEject
    if (Shell) then
        local Attach = ent:GetAttachment(2)
        if (!Attach) then return end
    
        local Effect = EffectData()
        Effect:SetOrigin(Attach.Pos)
        Effect:SetAngles(Attach.Ang)
        Effect:SetEntity(ent)
        Effect:SetFlags(50)
        Effect:SetAttachment(2)
        util.Effect(Shell, Effect)
    end

    --
    -- Muzzle Flash
    --

    local Flash = self.MuzzleEffect
    if (Flash) then
        local Attach = ent:GetAttachment(1)
        if (!Attach) then return end

        local Effect = EffectData()
        Effect:SetOrigin(Attach.Pos)
        Effect:SetAngles(Attach.Ang)
        Effect:SetEntity(ent)
        Effect:SetFlags(50)
        Effect:SetAttachment(1)
        util.Effect(Flash, Effect)
    end
end

SWEP.MaxTrajSteps = 50
SWEP.TrajStepSpeed = 0.1 -- seconds per step
SWEP.TrajStraightStep = 1250 -- straignt line step (no ballistics & damage drop)
SWEP.TrajStepLength = 750 -- every step legth after straight one
SWEP.TrajDropPerStep = 4 -- multiplier of bullet drop and damage drop on every step

function SWEP:ShootBullet(damage, aimcone)
    local pl = self:GetOwner()

	local bullet = {}
	bullet.Num		= self.Bullets
	bullet.Src		= pl:GetShootPos()			-- Source
	bullet.Dir		= pl:GetAimVector()			-- Dir of bullet
	bullet.Spread	= Vector(aimcone, aimcone, 0)		-- Aim Cone
	bullet.Tracer	= 5						-- Show a tracer on every x bullets
	bullet.Force	= 1						-- Amount of force to give to phys objects
	bullet.Damage	= damage
    bullet.Callback = function(ent, tr, dmg)
        dmg:SetDamageType(DMG_BULLET)
    end

	--pl:FireBullets(bullet)

    if (CLIENT) then
        self:DoEffects(pl:ShouldDrawLocalPlayer() and self or pl:GetViewModel())
    else
        self:GetInventorySlot():SetWear(self:GetInventorySlot():GetWear() - 6)
    end

    local function traceit(start, endpos, drop)
        local Result = util.TraceLine({
            start = start,
            endpos = endpos - Vector(0, 0, drop),
            filter = pl,
            mask = MASK_SHOT,
        })

        --debugoverlay.Line(Result.StartPos, Result.HitPos, 0.5)

        local effectdata = EffectData()
        effectdata:SetOrigin(endpos)
        effectdata:SetStart(start)
        effectdata:SetMagnitude(self.TrajStepSpeed*100) -- using SetMagnitude for trajectory speed
        effectdata:SetEntity(self)
        util.Effect( "bullet_tracer", effectdata )

        return Result.StartPos, Result.HitPos, Result.Normal, Result.Hit
    end

    local HS, HP, HN, HH = traceit(pl:GetShootPos(), pl:GetShootPos() + (pl:GetAimVector() + Vector(math.Rand(-aimcone, aimcone), math.Rand(-aimcone, aimcone), math.Rand(-aimcone, aimcone))) * self.TrajStraightStep, 0)

    local TimerID = "trajectory"..CurTime()

    local function endfire(dmgmin)
        bullet.Src = HS
        bullet.Dir = HN
        bullet.Damage = damage - dmgmin*self.TrajDropPerStep

        pl:FireBullets(bullet)

        timer.Remove(TimerID)
    end

    if HH then
        endfire(0)
        return
    end

    if CLIENT then return end

    local ms = self.MaxTrajSteps

    timer.Create(TimerID, self.TrajStepSpeed, ms, function()
        if not pl:IsValid() or not self:IsValid() then return end -- just to be safe

        local repsleft = timer.RepsLeft(TimerID)
        HS, HP, HN, HH = traceit(HP, HP + HN*self.TrajStepLength, self.TrajDropPerStep * (ms-repsleft))

        -- debugoverlay.Text(HP, ""..damage-(ms-repsleft)*4, 0.1)

        if HH then endfire(ms-repsleft) end
    end)
end

function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire(CurTime() + (60 / self.RPM))
    local pl = self:GetOwner()
    if (pl.FreeLooking) then return end
    
    if (self:Clip1() <= 0) then return end
    if (self:IsBroken()) then return end

    local AimCone = self.AimCone

    if (pl:KeyDown(IN_ATTACK2) && self.Bullets == 1) then
        self:PlayAnimation("PrimaryAttackEmpty")
        AimCone = 0
    else
        self:PlayAnimation("PrimaryAttack")
    end
    
    pl:SetAnimation(PLAYER_ATTACK1)
    self:EmitSound(self.ShootSound, 511)
    
    if (IsFirstTimePredicted()) then
        self:ShootBullet(self.Damage, AimCone)
    end
    if (SERVER) then
        local InvSlot = self:GetInventorySlot()
        InvSlot:SetClip(InvSlot:GetClip() - 1)
        self:SetClip1(InvSlot:GetClip())
        pl:HaltSprint(0.6)

        pl:SyncSlot(self.InventorySlot)
    else
        self:Recoil()
    end
end

function SWEP:Reload()
    if (self:GetReloading()) then return end
    if (self:Clip1() == self.Capacity) then return end
    local AmmoCount = self:GetOwner():ItemCount(self.Ammo)
    if (AmmoCount == 0) then return end
    
    self:SetReloading(true)
    self:PlayAnimation("Reload")
    self.NextReload = CurTime() + self.ReloadTime

    self:GetOwner():SetAnimation(PLAYER_RELOAD)

    self:SetNextPrimaryFire(CurTime() + self.ReloadTime)
end

function SWEP:Deploy()
    self:PlayAnimation("Deploy")

    if (SERVER) then
        self:SetClip1(self:GetInventorySlot():GetClip())
        self:SetNextPrimaryFire(CurTime() + self.DrawTime)
    end
    
    if (self.HoldType) then
        self:SetHoldType(self.HoldType)
    end
end

