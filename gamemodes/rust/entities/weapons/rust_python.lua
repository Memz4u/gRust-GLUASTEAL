-- "gamemodes\\rust\\entities\\weapons\\rust_python.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_python.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_python.mdl"

SWEP.Primary.Automatic = false

--
-- Stats
--
SWEP.Damage     = 55
SWEP.RPM        = 400
SWEP.AimCone    = 0.25
SWEP.Capacity   = 6
SWEP.ReloadTime = 3.75
SWEP.DrawTime   = 0.5

SWEP.Ammo       = "pistol_ammo"

SWEP.HoldType 	= "pistol"

--
-- Ironsights
--
SWEP.IronSightPos 	= Vector(-4.385, -5.453, 2.475)
SWEP.IronSightAng 	= Vector(0.1, 0.07, 0)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 25

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.python-attack"
SWEP.SilencedSound	= "darky_rust.python-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 4
SWEP.RecoilTable = {
	Angle(-2.5, 0, 0),
}

