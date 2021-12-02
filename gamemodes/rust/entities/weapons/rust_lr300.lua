-- "gamemodes\\rust\\entities\\weapons\\rust_lr300.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_lr300.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_lr300.mdl"

--
-- Stats
--
SWEP.Damage     = 40
SWEP.RPM        = 500
SWEP.AimCone    = 0.1
SWEP.Capacity   = 30
SWEP.ReloadTime = 4
SWEP.DrawTime   = 2

SWEP.Ammo       = "rifle_ammo"

SWEP.HoldType 	= "ar2"

--
-- Ironsights
--
SWEP.IronSightPos   = Vector(-4.425, 0, 1.05)
SWEP.IronSightAng   = Vector(0.37, 0.05, 0.1)
SWEP.IronSightTime  = 0.075
SWEP.IronSightFOV   = 35

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.lr300-attack"
SWEP.SilencedSound	= "darky_rust.lr300-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.5
SWEP.RecoilTable = {
	Angle(-2.5531914893617, 3, 0),
	Angle(-3.4042553191489, -1.25, 0),
	Angle(-2.9787234042553, -1, 0),
	Angle(-2.3404255319149, -1.75, 0),
	Angle(-2.7659574468085, -1.25, 0),
	Angle(-2.5531914893617, -1.5, 0),
	Angle(-2.1276595744681, -2.75, 0),
	Angle(-2.7659574468085, -1.25, 0),
	Angle(-2.3404255319149, 2.25, 0),
	Angle(-1.2765957446809, 3.5, 0),
	Angle(-1.063829787234, 3.25, 0),
	Angle(-0.85106382978723, 3.25, 0),
	Angle(-1.063829787234, 3, 0),
	Angle(-1.2765957446809, 2.75, 0),
	Angle(-2.1276595744681, -1.25, 0),
	Angle(-1.2765957446809, -2.75, 0),
	Angle(-0.63829787234043, -3, 0),
	Angle(-0.42553191489362, -2.75, 0),
	Angle(-0.42553191489362, -3, 0),
	Angle(-0.63829787234043, -2.75, 0),
	Angle(-0.63829787234043, -3, 0),
	Angle(-0.42553191489362, -3, 0),
	Angle(-0.42553191489362, -3.25, 0),
	Angle(-1.2765957446809, -2.5, 0),
	Angle(-2.5531914893617, 1, 0),
	Angle(-0.85106382978723, 2.75, 0),
	Angle(-0.63829787234043, 3.5, 0),
	Angle(-0.42553191489362, 3.75, 0),
	Angle(-0.21276595744681, 3.75, 0),
	Angle(-0.21276595744681, 3.5, 0),	
	Angle(0, -0.25, 0),
}

