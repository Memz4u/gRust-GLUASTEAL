-- "gamemodes\\rust\\entities\\weapons\\rust_m92.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_m92.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_m92.mdl"

SWEP.Primary.Automatic = false

--
-- Stats
--
SWEP.Damage     = 45
SWEP.RPM        = 400
SWEP.AimCone    = 0.3
SWEP.Capacity   = 15
SWEP.ReloadTime = 2.2
SWEP.DrawTime   = 0.5

SWEP.Ammo       = "pistol_ammo"

--
-- Ironsights
--
SWEP.IronSightPos 	= Vector(-3.711, 0, 1.799)
SWEP.IronSightAng 	= Vector(0.209, 0, 0)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 30

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.m92-attack"
SWEP.SilencedSound	= "darky_rust.m92-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.35
SWEP.RecoilTable = {
	Angle(-2.5*4, 0.4, 0),
}

