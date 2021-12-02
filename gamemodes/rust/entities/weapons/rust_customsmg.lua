-- "gamemodes\\rust\\entities\\weapons\\rust_customsmg.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_smg.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_customsmg.mdl"

--
-- Stats
--
SWEP.Damage     = 50
SWEP.RPM        = 600
SWEP.AimCone    = 0.2
SWEP.Capacity   = 24
SWEP.ReloadTime = 4
SWEP.DrawTime   = 1

SWEP.Ammo       = "pistol_ammo"
SWEP.HoldType	= "smg"

--
-- Viewmodel
--

SWEP.VMPos			= Vector(0, 0, 0)

--
-- Ironsights
--
SWEP.IronSightPos 	= Vector(-6.95, 0, 3.68)
SWEP.IronSightAng 	= Vector(-0.35, -0.2, -0.615)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 37.5

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.smg-attack"
SWEP.SilencedSound	= "darky_rust.smg-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.5
SWEP.RecoilTable = {
	Angle(-2.5531914893617, -3, 0),
	Angle(-2.1276595744681,  1, 0),
	Angle(-2.3404255319149, 0.25, 0),
	Angle(-2.1276595744681, -0.75, 0),
	Angle(-2.1276595744681, -1, 0),
	Angle(-2.1276595744681, -0.5, 0),
	Angle(-2.5531914893617, -0.75, 0),
	Angle(-2.3404255319149, -0.5, 0),
	Angle(-2.5531914893617, -0.5, 0),
	Angle(-2.5531914893617, 0.25, 0),
	Angle(-2.3404255319149, 0.75, 0),
	Angle(-2.1276595744681, 1.5, 0),
	Angle(-2.1276595744681, 1.25, 0),
	Angle(-2.1276595744681, 1.25, 0),
	Angle(-2.3404255319149, 1.25, 0),
	Angle(-2.3404255319149, 0, 0),
	Angle(-2.1276595744681, -1, 0),
	Angle(-2.1276595744681, -1.5, 0),
	Angle(-1.9148936170213, -1.5, 0),
	Angle(-1.9148936170213, -2.25, 0),
	Angle(-2.1276595744681, -2.25, 0),
	Angle(-1.9148936170213, 1.5, 0),
	Angle(-1.4893617021277, 1.75, 0),
	Angle(2.7659574468085, 0.5, 0),	
}

