-- "gamemodes\\rust\\entities\\weapons\\rust_medical.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

SWEP.Base = "rust_base"

SWEP.VMPos = Vector()
SWEP.VMAng = Vector()

SWEP.DownPos = Vector(0, 0, -2)

SWEP.Delay      = 3.85
SWEP.AddHealth  = 10

function SWEP:PrimaryAttack()
    self:PlayAnimation("PrimaryAttack")
    self.NextUse = CurTime() + self.Delay

    self:SetNextPrimaryFire(self.NextUse)
end

function SWEP:Think()
    if (SERVER and self.NextUse and self.NextUse < CurTime()) then
        self.NextUse = nil

        local pl = self:GetOwner()
        pl:RemoveItem(self:GetInventorySlot():GetItem(), 1, self.InventorySlot)

        pl:SetHealth(math.min(pl:Health() + self.AddHealth, pl:GetMaxHealth()))
    end
end

function SWEP:Holster()
    self.NextUse = nil

    return true
end

function SWEP:Deploy()
    self:SendWeaponAnim(ACT_VM_DEPLOY)
end

