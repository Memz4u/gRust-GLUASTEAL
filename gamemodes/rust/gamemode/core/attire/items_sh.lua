-- "gamemodes\\rust\\gamemode\\core\\attire\\items_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
gRust.Attire = {}

ATTIRE_FULLBODY     = 0
ATTIRE_HEAD         = 1

function gRust.RegisterAttire(id, data)
	util.PrecacheModel(data.model)
	gRust.Attire[id] = data
end

gRust.RegisterAttire("hazmat_suit", {
	type    = ATTIRE_FULLBODY,
	model   = "models/player/darky_m/rust/hazmat.mdl"
})

gRust.RegisterAttire("scientist_suit", {
	type    = ATTIRE_FULLBODY,
	model   = "models/player/darky_m/rust/scientist.mdl"
})

gRust.RegisterAttire("ushanka_hat", {
	type    = ATTIRE_HEAD,
	model   = "models/russianhat1.mdl",
	attach  = "eyes",
	offset =
	{
		pos = Vector(-4, 0, -9),
		ang = Angle(0, 180, 0),
	}
})

gRust.RegisterAttire("batman_mask", {
	type    = ATTIRE_HEAD,
	model   = "models/gmod_tower/batmanmask.mdl",
	attach  = "eyes",
	offset =
	{
		pos = Vector(-2.5, 0, 0),
		ang = Angle(0, 0, 0),
	}
})

--
-- Halloween
--

gRust.RegisterAttire("jason_mask", {
	type    = ATTIRE_HEAD,
	model   = "models/gmod_tower/halloween_jasonmask.mdl",
	attach  = "eyes",
	offset =
	{
		pos = Vector(-4.75, 0, -6.5),
		ang = Angle(0, 0, 0),
	}
})

gRust.RegisterAttire("pumpkin_head", {
	type    = ATTIRE_HEAD,
	model   = "models/gmod_tower/halloween_pumpkinhat.mdl",
	attach  = "eyes",
	offset =
	{
		pos = Vector(0, 0, -8),
		ang = Angle(0, 0, 0),
	}
})

gRust.RegisterAttire("headcrab_hat", {
	type    = ATTIRE_HEAD,
	model   = "models/gmod_tower/headcrabhat.mdl",
	attach  = "eyes",
	offset =
	{
		pos = Vector(0, 0, 0),
		ang = Angle(0, 0, 0),
	}
})

gRust.RegisterAttire("witch_hat", {
	type    = ATTIRE_HEAD,
	model   = "models/gmod_tower/witchhat.mdl",
	attach  = "eyes",
	offset =
	{
		pos = Vector(0, 0, 1),
		ang = Angle(0, -90, 0),
	}
})

hook.Add("CalcView", "2iodsfkjds", function(pl, origin, ang)
	if (true) then return end
	return {origin = origin + pl:GetForward() * 50 + pl:GetUp() * -10,
	angles = ang + Angle(0, 180, 0),
	drawviewer = true}
end)

