-- "gamemodes\\rust\\entities\\weapons\\rust_sap.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_sap.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_semi_auto_pistol.mdl"

SWEP.Primary.Automatic = false

--
-- Stats
--
SWEP.Damage     = 40
SWEP.RPM        = 400
SWEP.AimCone    = 0.25
SWEP.Capacity   = 10
SWEP.ReloadTime = 2.9
SWEP.DrawTime   = 0.5

SWEP.Ammo       = "pistol_ammo"

SWEP.HoldType 	= "pistol"

--
-- Ironsights
--
SWEP.IronSightPos 	= Vector(-3.06, 0, 2.44)
SWEP.IronSightAng 	= Vector(0.029, 0.039, 0)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 35

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.fire-alt"
SWEP.SilencedSound	= "darky_rust.semi-pistol-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 1.5
SWEP.RecoilTable = {
	Angle(-2.5, 0, 0),
}

