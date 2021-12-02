-- "gamemodes\\rust\\entities\\weapons\\rust_mp5.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_mp5.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_mp5.mdl"

--
-- Stats
--
SWEP.Damage     = 35
SWEP.RPM        = 600
SWEP.AimCone    = 0.2
SWEP.Capacity   = 30
SWEP.ReloadTime = 4
SWEP.DrawTime   = 1.6

SWEP.Ammo       = "pistol_ammo"

SWEP.HoldType 	= "smg"

--
-- Ironsights
--
SWEP.IronSightPos 	= Vector(-6.41, -2, 3)
SWEP.IronSightAng 	= Vector(0.5, 1, -1.465)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 40

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.mp5-attack"
SWEP.SilencedSound	= "darky_rust.mp5-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.5
SWEP.RecoilTable = {
	Angle(-2.5531914893617, 3, 0),
	Angle(-2.5531914893617, 1.25, 0),
	Angle(-3.6170212765957, -1.75, 0),
	Angle(-2.9787234042553, -0, 0),
	Angle(-2.5531914893617, 2, 0),
	Angle(-1.7021276595745, 2.75, 0),
	Angle(-0.63829787234043, 2.75, 0),
	Angle(-2.1276595744681, 1.75, 0),
	Angle(-1.7021276595745, -1, 0),
	Angle(-0.21276595744681, -2, 0),
	Angle(-0.42553191489362, -2, 0),
	Angle(-0.42553191489362, -2, 0),
	Angle(-0.85106382978723, -1.25, 0),
	Angle(-1.2765957446809, 0.75, 0),
	Angle(-0.85106382978723, 2.25, 0),
	Angle(-0.21276595744681, 1.75, 0),
	Angle(-0.42553191489362, 1.5, 0),
	Angle(-0.21276595744681, 1.75, 0),
	Angle(-1.2765957446809, 0.75, 0),
	Angle(-0.85106382978723, -1.5, 0),
	Angle(-0.42553191489362, -1.75, 0),
	Angle(-0.21276595744681, -1.5, 0),
	Angle(-0.42553191489362, -1.5, 0),
	Angle(-0.21276595744681, -1.5, 0),
	Angle(-0.85106382978723, 0.25, 0),
	Angle(-0.21276595744681, 1.75, 0),
	Angle(1.063829787234, 1.25, 0),
	Angle(-1.063829787234, 1.5, 0),
	Angle(0, -2.5, 0),
	Angle(0.21276595744681, -1.75, 0),
	Angle(0.42553191489362, 1.75, 0),
}

