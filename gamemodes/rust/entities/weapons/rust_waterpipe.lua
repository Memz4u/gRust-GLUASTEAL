-- "gamemodes\\rust\\entities\\weapons\\rust_waterpipe.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_waterpipe.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_waterpipe.mdl"

--
-- Stats
--
SWEP.Damage     = 12
SWEP.RPM        = 13
SWEP.AimCone    = 0.3
SWEP.Capacity   = 1
SWEP.ReloadTime = 4.5
SWEP.DrawTime   = 2.4

SWEP.Bullets 	= 18

SWEP.Ammo       = "handmade_shells"

--
-- Ironsights
--
SWEP.IronSightPos   = Vector(-5.16, -2.421, 2.68)
SWEP.IronSightAng   = Vector(2.338, 0.975, 0)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 30

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.waterpipe-shotgun-attack"
SWEP.SilencedSound	= "darky_rust.waterpipe-shotgun-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.1
SWEP.RecoilTable = {
	Angle(-140, -70, 0),
}

