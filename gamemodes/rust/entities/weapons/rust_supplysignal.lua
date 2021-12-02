-- "gamemodes\\rust\\entities\\weapons\\rust_supplysignal.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

SWEP.Base = "rust_basethrow"

SWEP.WorldModel         = "models/weapons/darky_m/rust/w_beancan.mdl"
SWEP.ViewModel          = "models/weapons/darky_m/rust/c_beancan.mdl"

SWEP.ThrowDelay = 0.25
SWEP.ThrowForce = 750
SWEP.FuseTime	= 5
SWEP.Stick		= false
SWEP.Damage     = 50

function SWEP:FuseCallback(ent, damage)
    local pos = ent:GetPos()
    pos.z = 7000
    
    local ent = ents.Create("rust_supplydrop")
    ent:SetPos(pos)
    ent:Spawn()
end

