-- "gamemodes\\rust\\entities\\weapons\\rust_baseshotgun\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
DEFINE_BASECLASS("rust_basegun")
SWEP.Base   = "rust_basegun"

SWEP.Primary.Automatic = false

function SWEP:PrimaryAttack()
    if (self:GetReloading()) then return end
    BaseClass.PrimaryAttack(self)

    timer.Simple(0.25, function()
        self:SendWeaponAnim(ACT_SHOTGUN_PUMP)
    end)
end

function SWEP:InsertShell()
    local InventorySlot = self:GetInventorySlot()
    local pl = self:GetOwner()

    if (InventorySlot:GetClip() >= self.Capacity or !pl:HasItem("shotgun_ammo")) then
        self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
        self.NextShellInsert = nil
        self:SetReloading(false)
    else
        self:PlayAnimation("Reload")
        self.NextShellInsert = CurTime() + self:GetOwner():GetViewModel():SequenceDuration()

        InventorySlot:SetClip(InventorySlot:GetClip() + 1)
        self:GetOwner():SyncSlot(self.InventorySlot)
        self:SetClip1(InventorySlot:GetClip())
        pl:RemoveItem("shotgun_ammo", 1)
    end
end

function SWEP:Think()
    BaseClass.Think(self)

    if (self.NextShellInsert and self.NextShellInsert < CurTime()) then
        self:InsertShell()
    end
end

function SWEP:Reload()
    if (!self:GetOwner():HasItem("shotgun_ammo")) then return end
    if (self:GetReloading()) then return end
    if (CLIENT) then return end


    self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)
    self:SetReloading(true)
    self.NextShellInsert = CurTime() +  self:GetOwner():GetViewModel():SequenceDuration()
end

function SWEP:Holster()
    self.NextShellInsert = nil
    return BaseClass.Holster(self)
end

