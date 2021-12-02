-- "gamemodes\\rust\\entities\\weapons\\rust_bow.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
-- COPYRIGHT DOWN 2021, ALL RIGHTS RESERVED

DEFINE_BASECLASS("rust_base")
SWEP.Base   = "rust_base"

SWEP.Author = "Down"

SWEP.Damage = 20
SWEP.SwayScale          = -0.25
SWEP.BobScale           = -0.5
SWEP.ViewModelFOV       = 64

SWEP.WorldModel = "models/weapons/darky_m/rust/w_bow.mdl"
SWEP.ViewModel = "models/weapons/darky_m/rust/c_bow.mdl"
SWEP.UseHands = true

SWEP.NextFire = 0
SWEP.NextDeploy = 0

SWEP.VMPos = Vector()
SWEP.DownPos = Vector(0, 0, -2)

function SWEP:Initialize()
    self:SetNetworkedInt("Wear", 100)
end

function SWEP:PrimaryAttack()
    local pl = self:GetOwner()

    if (self.Deployed && !self.Attacked && self.NextFire < SysTime()) then
        self:EmitSound("audioclips/weapons/bow/bow_attack_" .. math.random(1, 3) .. ".wav")
        self.Deployed = false
        self.Attacked = true

        self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
        self:FireArrow()
    end
end

function SWEP:SecondaryAttack()
end

function SWEP:Deploy()
    self:SendWeaponAnim(ACT_VM_DRAW)

    self.NextDeploy = SysTime() + 1
    self.NextFire = SysTime() + 1
end

function SWEP:FireArrow()
    if (SERVER) then
        local pl = self:GetOwner()
    
        local ang = pl:GetAimVector():Angle()

        local arrowang = pl:GetAimVector():Angle()
        arrowang:RotateAroundAxis(arrowang:Right(), 270)

        local pos = pl:EyePos() + pl:GetForward() * 30
    
        local ent = ents.Create("rust_projectile")
        ent:SetOwner(pl)
        ent:SetPos(pos)
        ent:SetAngles(arrowang)
        ent:Spawn()
        ent:Activate()
        ent:SetModel("models/weapons/darky_m/rust/bone_arrow.mdl")
        ent:Throw(pl:GetForward(), 5000)
        local Damage = self.Damage
        ent.PhysicsCollide = function(me, collider)
            ent:Remove()
            local other = collider.HitEntity
            if (other:IsPlayer() or (other.gRust and other:GetDamageable())) then
				local dmg = DamageInfo()
				dmg:SetDamage(Damage)
				dmg:SetAttacker(pl)
				dmg:SetDamageType(DMG_CLUB)
				dmg:SetInflictor(self)
				
				other:TakeDamageInfo(dmg)
				ent.Damaged = true
                if (other:IsPlayer() or other:GetDamageSound()) then
                    pl:EmitSound("hit.default")
                end
            end
        end
    end

    self:GetInventorySlot():SetClip(0)
end

function SWEP:Think()
    local pl = self:GetOwner()

    if (pl:KeyDown(IN_ATTACK2)) then
        if (!self.Deployed && !self.Attacked && self.NextDeploy < SysTime()) then
            if (self:GetInventorySlot():GetClip() <= 0) then
                if (!pl:HasItem("arrow")) then return end

                if (SERVER) then
                    pl:RemoveItem("arrow", 1)
                end

                self:GetInventorySlot():SetClip(1)
            end

            if (SERVER && !IsFirstTimePredicted()) then
                pl:EmitSound("audioclips/weapons/bow/bow_draw.wav", 100)
            end
            self:SendWeaponAnim(ACT_VM_DEPLOY)
            self.NextFire = SysTime() + 1.5
            self.NextDeploy = SysTime() + 0.75
            self.Deployed = true
        end
    else
        if (self.Deployed && !self.Attacked) then
            self:EmitSound("audioclips/weapons/bow/bow_draw_cancel.wav", 100)
            self:SendWeaponAnim(ACT_VM_UNDEPLOY)
        end
        
        self.Attacked = false
        self.Deployed = false
    end
end

