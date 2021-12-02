-- "gamemodes\\rust\\entities\\weapons\\rust_spas12.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_baseshotgun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_spas12.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_spas12.mdl"

--
-- Stats
--
SWEP.Damage     = 12
SWEP.RPM        = 240
SWEP.AimCone    = 0.2
SWEP.Capacity   = 6
SWEP.ReloadTime = 4.9
SWEP.DrawTime   = 1

SWEP.Bullets 	= 16

SWEP.Ammo       = "shotgun_ammo"

SWEP.HoldType 	= "shotgun"

--
-- Ironsights
--
SWEP.IronSightPos   = Vector(-4.41, -1.5, 3.177)
SWEP.IronSightAng   = Vector(0.714, 0, 0)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 32.5

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.spas12-attack"
SWEP.SilencedSound	= "darky_rust.spas12-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.1
SWEP.RecoilTable = {
	Angle(-140, -70, 0),
}

