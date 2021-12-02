-- "gamemodes\\rust\\entities\\weapons\\rust_crossbow.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_crossbow.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_crossbow.mdl"

--
-- Stats
--
SWEP.Damage     = 40
SWEP.RPM        = 450
SWEP.AimCone    = 0.2
SWEP.Capacity   = 1
SWEP.ReloadTime = 4.4
SWEP.DrawTime   = 1

SWEP.Ammo       = "arrow"

SWEP.HoldType 	= "ar2"

SWEP.Primary.Automatic = false

--
-- Ironsights
--
SWEP.IronSightPos 	= Vector(-6.893, -1.732, 3.26)
SWEP.IronSightAng 	= Vector(3, 1.5, -3.15)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 25

--
-- Sounds
--
SWEP.ShootSound		= "weapons/rust_mp3/crossbow-attack-2.mp3"
SWEP.SilencedSound	= "darky_rust.ak74u-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.5
SWEP.RecoilTable = {
	Angle(-2.5531914893617, 3, 0)
}

