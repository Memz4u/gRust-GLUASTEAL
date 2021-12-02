-- "gamemodes\\rust\\entities\\weapons\\rust_base\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.VMPos      = Vector(-6, 0, -0.5)
SWEP.VMAng      = Angle(0, 0, 0)

SWEP.DownPos    = Vector(-5, 0, -4)
SWEP.DownAng    = Angle(0, 0, 0)

SWEP.Author     = "Down"

--Internal Vars
SWEP.m_WeaponDeploySpeed = 1

function SWEP:SetupDataTables()
end

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
end

function SWEP:GetInventorySlot()
    if (SERVER) then
        return self:GetOwner().Inventory[self.InventorySlot]
    else
        return self:GetOwner().SelectedSlot
    end
end

function SWEP:IsBroken()
    if (!self:GetInventorySlot().GetWear) then return end -- TODO: Find out why this errors
    return self:GetInventorySlot():GetWear() <= 0
end

SWEP.Animations =
{
    ["Deploy"] = ACT_VM_DEPLOY,
    ["PrimaryAttack"] = ACT_VM_PRIMARYATTACK,
    ["PrimaryAttackEmpty"] = ACT_VM_PRIMARYATTACK_1,
    ["SecondaryAttack"] = ACT_VM_SECONDARYATTACK,
    ["Reload"] = ACT_VM_RELOAD,
    ["ShotgunReloadFinish"] = ACT_SHOTGUN_RELOAD_FINISH,
    ["Throw"] = ACT_VM_THROW,
    ["SwingHit"] = ACT_VM_SWINGHIT,
    ["SwingMiss"] = ACT_VM_SWINGMISS,
    ["PullPin"] = ACT_VM_PULLPIN,
}

function SWEP:PlayAnimation(name)
    self:SendWeaponAnim(self.Animations[name])
end

