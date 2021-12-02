-- "gamemodes\\rust\\entities\\weapons\\rust_dbarrel.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_doublebarrel.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_doublebarrel.mdl"

--
-- Stats
--
SWEP.Damage     = 9
SWEP.RPM        = 100
SWEP.AimCone    = 0.2
SWEP.Capacity   = 2
SWEP.ReloadTime = 5.1
SWEP.DrawTime   = 1

SWEP.Bullets 	= 12

SWEP.Ammo       = "shotgun_ammo"

--
-- Ironsights
--
SWEP.IronSightPos   = Vector(-4.49, 0.019, 3.95)
SWEP.IronSightAng   = Vector(0, 0, 0)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 32.5

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.double-shotgun-attack"
SWEP.SilencedSound	= "darky_rust.double-shotgun-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.175
SWEP.RecoilTable = {
	Angle(-140, -70, 0),
}

