-- "gamemodes\\rust\\entities\\weapons\\rust_sar.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_sar.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_sar.mdl"

SWEP.Primary.Automatic = false

--
-- Stats
--
SWEP.Damage     = 40
SWEP.RPM        = 343
SWEP.AimCone    = 0.15
SWEP.Capacity   = 16
SWEP.ReloadTime = 4.4
SWEP.DrawTime   = 1.6

SWEP.Ammo       = "rifle_ammo"

SWEP.HoldType 	= "ar2"

--
-- Ironsights
--
SWEP.IronSightPos 	= Vector(-5.18, -2.985, 2.519)
SWEP.IronSightAng 	= Vector(0, 0, 0)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 30

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.sar-attack"
SWEP.SilencedSound	= "darky_rust.sar-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.5
SWEP.RecoilTable = {
	Angle(-2.5, 0, 0),
	Angle(-8, 0.25, 0),
	Angle(-8, 0, 0),
	Angle(-8, -0.25, 0),
	Angle(-8, -0.25, 0),
	Angle(-8, 0, 0),
}

