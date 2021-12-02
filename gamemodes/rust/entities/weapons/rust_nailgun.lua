-- "gamemodes\\rust\\entities\\weapons\\rust_nailgun.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_nailgun.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_nailgun.mdl"

SWEP.Primary.Automatic = false

--
-- Stats
--
SWEP.Damage     = 15
SWEP.RPM        = 400
SWEP.AimCone    = 0.3
SWEP.Capacity   = 16
SWEP.ReloadTime = 3.1
SWEP.DrawTime   = 0.5

SWEP.Ammo       = "nailgun_nails"

SWEP.HoldType 	= "smg"

--
-- Ironsights
--
SWEP.IronSightPos 	= Vector(-4.441, -7.068, 1.6)
SWEP.IronSightAng 	= Vector(0.6, 0, 0)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 20

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.nailgun-attack"
SWEP.SilencedSound	= "darky_rust.nailgun-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.2
SWEP.RecoilTable = {
	Angle(-2.5*6, 0.4, 0),
}

--
-- Effects
--
SWEP.MuzzleEffect   = ""
SWEP.ShellEject     = ""

--
-- Bullet Drop
--

SWEP.TrajDropPerStep = 30

