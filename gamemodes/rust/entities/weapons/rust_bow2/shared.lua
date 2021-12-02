-- "gamemodes\\rust\\entities\\weapons\\rust_bow2\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
DEFINE_BASECLASS("rust_base")
SWEP.Base   = "rust_base"

SWEP.WorldModel = "models/weapons/darky_m/rust/w_bow.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_bow.mdl"

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
    
        local ent = ents.Create("rust_arrow")
        ent:SetOwner(pl)
        ent:SetPos(pos)
        ent:SetAngles(arrowang)
        ent:Spawn()
        ent:Activate()
        ent:SetVelocity((ang:Forward() * 3500))
        ent.Damage = self.Damage
    end

    self.InvSlot.clip = 0
end

function SWEP:Think()
    if (!IsFirstTimePredicted()) then return end
    local pl = self:GetOwner()

    if (pl:KeyDown(IN_ATTACK2)) then
        if (!self.Deployed && !self.Attacked && self.NextDeploy < SysTime()) then
            if (self.InvSlot.clip <= 0) then
                if (!pl:HasItem("rust_arrow").hasitem) then return end

                if (SERVER) then
                    pl:RemoveFromInventory("rust_arrow", 1)
                end

                self.InvSlot.clip = 1
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

