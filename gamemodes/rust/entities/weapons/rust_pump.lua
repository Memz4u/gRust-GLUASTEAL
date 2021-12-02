-- "gamemodes\\rust\\entities\\weapons\\rust_pump.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_baseshotgun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_sawnoffshotgun.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_sawnoffshotgun.mdl"

--
-- Stats
--
SWEP.Damage     = 10
SWEP.RPM        = 55
SWEP.AimCone    = 0.2
SWEP.Capacity   = 6
SWEP.ReloadTime = 4.75
SWEP.DrawTime   = 1

SWEP.Bullets 	= 20

SWEP.Ammo       = "shotgun_ammo"

SWEP.HoldType 	= "shotgun"

--
-- Ironsights
--
SWEP.IronSightPos   = Vector(-3.84, -10.051, 3.598)
SWEP.IronSightAng   = Vector(-0.63, 0.059, 0)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 20

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.sawnoff-shotgun-attack"
SWEP.SilencedSound	= "darky_rust.sawnoff-shotgun-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.1
SWEP.RecoilTable = {
	Angle(-140, -70, 0),
}

