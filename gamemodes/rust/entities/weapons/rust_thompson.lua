-- "gamemodes\\rust\\entities\\weapons\\rust_thompson.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_thompson.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_thompson.mdl"

--
-- Stats
--
SWEP.Damage     = 37
SWEP.RPM        = 462
SWEP.AimCone    = 0.2
SWEP.Capacity   = 20
SWEP.ReloadTime = 4
SWEP.DrawTime   = 1

SWEP.Ammo       = "pistol_ammo"

SWEP.HoldType 	= "smg"

--
-- Ironsights
--
SWEP.IronSightPos 	= Vector(-4.9675, -4, 3)
SWEP.IronSightAng 	= Vector(-0.4, 0, 0.385)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 35.5

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.thompson-attack"
SWEP.SilencedSound	= "darky_rust.thompson-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.5
SWEP.RecoilTable = {
	Angle(-2.5531914893617, 3, 0),
	Angle(-3.6170212765957, -1.25, 0),
	Angle(-3.8297872340426, 1, 0),
	Angle(-3.1914893617021, 2.5, 0),
	Angle(-2.7659574468085, 1.25, 0),
	Angle(-2.1276595744681, 2.75, 0),
	Angle(-3.4042553191489, 0.5, 0),
	Angle(-2.3404255319149, -2, 0),
	Angle(-2.1276595744681, -3, 0),
	Angle(-1.7021276595745, -2.75, 0),
	Angle(-1.2765957446809, -3.25, 0),
	Angle(-1.7021276595745, -2.25, 0),
	Angle(-2.3404255319149, -0.75, 0),
	Angle(-2.3404255319149, 0.5, 0),
	Angle(-1.063829787234, 2.25, 0),
	Angle(-1.7021276595745, 2.25, 0),
	Angle(-1.7021276595745, 2.5, 0),
	Angle(-0.85106382978723, 2, 0),
	Angle(-1.063829787234, 2.25, 0),
	Angle(-2.1276595744681, -1, 0),	
}

