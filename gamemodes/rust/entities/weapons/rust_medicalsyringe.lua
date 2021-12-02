-- "gamemodes\\rust\\entities\\weapons\\rust_medicalsyringe.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

SWEP.Base        = "rust_medical"

SWEP.ViewModel  = "models/weapons/darky_m/rust/c_syringe_v2.mdl"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_syringe_v2.mdl"

SWEP.Delay      = 2.65
SWEP.AddHealth  = 25
SWEP.ViewModelFOV = 55

SWEP.Animations =
{
    ["Deploy"] = ACT_VM_DRAW,
    ["PrimaryAttack"] = ACT_VM_THROW,
    ["PrimaryAttackEmpty"] = ACT_VM_PRIMARYATTACK_1,
    ["SecondaryAttack"] = ACT_VM_SECONDARYATTACK,
    ["Reload"] = ACT_VM_RELOAD,
    ["ShotgunReloadFinish"] = ACT_SHOTGUN_RELOAD_FINISH,
    ["Throw"] = ACT_VM_THROW,
    ["SwingHit"] = ACT_VM_SWINGHIT,
    ["SwingMiss"] = ACT_VM_SWINGMISS,
    ["PullPin"] = ACT_VM_PULLPIN,
}

