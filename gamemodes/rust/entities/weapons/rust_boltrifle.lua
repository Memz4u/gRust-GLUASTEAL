-- "gamemodes\\rust\\entities\\weapons\\rust_boltrifle.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_baseshotgun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_boltrifle.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_boltrifle.mdl"

--
-- Stats
--
SWEP.Damage     = 80
SWEP.RPM        = 35
SWEP.AimCone    = 0
SWEP.Capacity   = 4
SWEP.ReloadTime = 4.25
SWEP.DrawTime   = 1

SWEP.Bullets 	= 1

SWEP.Ammo       = "rifle_ammo"

--
-- Ironsights
--
SWEP.IronSightPos   = Vector(-3.51, -2.5, 2.618)
SWEP.IronSightAng   = Vector(-0.42, 0, 0.99)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 40

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.extra-gunshot-h"
SWEP.SilencedSound	= "darky_rust.bolt-rifle-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 15
SWEP.RecoilTable = {
	Angle(-0.1, -0.08, 0),
}

