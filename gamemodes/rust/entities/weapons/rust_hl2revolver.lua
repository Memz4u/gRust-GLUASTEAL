-- "gamemodes\\rust\\entities\\weapons\\rust_hl2revolver.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_ak47u.mdl"
SWEP.ViewModel  = "models/weapons/c_357.mdl"

--
-- Stats
--
SWEP.Damage     = 25
SWEP.RPM        = 60
SWEP.AimCone    = 0
SWEP.Capacity   = 6
SWEP.ReloadTime = 4.4
SWEP.DrawTime   = 1

SWEP.VMPos = Vector(0, 0, 0)

--
-- Ironsights
--
SWEP.IronSightPos   = Vector(-4.675, -1.3, 0.6)
SWEP.IronSightAng   = Vector(0.25, 1, -0.125)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 25

--
-- Sounds
--
SWEP.ShootSound		= "weapons/357_fire2.wav"
SWEP.SilencedSound	= "darky_rust.ak74u-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 1.5
SWEP.RecoilTable = {
	Angle(-2.5531914893617, 3, 0),
	Angle(-4.2553191489362, -3.5, 0),
	Angle(-4.2553191489362, 0.5, 0),
	Angle(-3.8297872340426, -4, 0),
	Angle(-3.4042553191489, -3, 0),
	Angle(-4.0425531914894, -0.75, 0),
	Angle(-3.4042553191489, 1.75, 0),
	Angle(-2.7659574468085, 3.75, 0),
	Angle(-1.4893617021277, 5.75, 0),
	Angle(-1.2765957446809, 6, 0),
	Angle(-1.9148936170213, 5, 0),
	Angle(-3.4042553191489, 3.75, 0),
	Angle(-3.6170212765957, 1.75, 0),
	Angle(-4.2553191489362, 0.75, 0),
	Angle(-4.0425531914894, -1.75, 0),
	Angle(-3.1914893617021, -3, 0),
	Angle(-2.7659574468085, -4, 0),
	Angle(-2.3404255319149, -5.25, 0),
	Angle(-2.7659574468085, -5.75, 0),
	Angle(-1.9148936170213, -6.25, 0),
	Angle(-1.7021276595745, -5.5, 0),
	Angle(-1.4893617021277, -5, 0),
	Angle(-1.7021276595745, -4.5, 0),
	Angle(-3.8297872340426, -2.5, 0),
	Angle(-3.6170212765957, 4, 0),
	Angle(-2.1276595744681, 3.75, 0),
	Angle(-2.5531914893617, 4.5, 0),
	Angle(-2.1276595744681, 4.25, 0),
	Angle(-1.7021276595745, 4, 0),
	Angle(-1.7021276595745, 3.75, 0),
}

