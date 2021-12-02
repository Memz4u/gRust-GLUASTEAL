-- "gamemodes\\rust\\entities\\weapons\\rust_revolver.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_revolver.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_revolver.mdl"

SWEP.Primary.Automatic = false

--
-- Stats
--
SWEP.Damage     = 35
SWEP.RPM        = 343
SWEP.AimCone    = 0.3
SWEP.Capacity   = 8
SWEP.ReloadTime = 3.4
SWEP.DrawTime   = 0.5

SWEP.Ammo       = "pistol_ammo"

SWEP.HoldType 	= "pistol"

--
-- Ironsights
--
SWEP.IronSightPos 	= Vector(-3.33, 0, 0.875)
SWEP.IronSightAng 	= Vector(1.129, 0.035, 0)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 30

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.revolver-attack"
SWEP.SilencedSound	= "darky_rust.revolver-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.25
SWEP.RecoilTable = {
	Angle(-25.5, 0.8, 0),
}

