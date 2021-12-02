-- "gamemodes\\rust\\entities\\weapons\\rust_buildingplan\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
STRUCTURE_FLOOR = 0
STRUCTURE_WALL  = 1
STRUCTURE_STAIR = 2

SWEP.Base    = "rust_base"
SWEP.PieMenu = {
	{
		Name = "Floor Frame",
		Icon = "materials/icons/build/floor_frame.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model= "models/building/twig_fframe.mdl",
		Type = STRUCTURE_FLOOR
	},
	{
		Name = "Wall",
		Icon = "materials/icons/build/wall.png",
		Desc = [[Secure your base
		by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_wall.mdl",
		Type = STRUCTURE_WALL
	},
	{
		Name = "Door Frame",
		Icon = "materials/icons/build/doorframe.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_dframe.mdl",
		Type = STRUCTURE_WALL
	},
	{
		Name = "Window Frame",
		Icon = "materials/icons/build/wall_window.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_wind.mdl",
		Type = STRUCTURE_WALL
	},
	{
		Name = "Wall Frame",
		Icon = "materials/icons/build/wall_frame.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_gframe.mdl",
		Type = STRUCTURE_WALL
	},
	{
		Name = "Half Wall",
		Icon = "materials/icons/build/wall_half.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_hwall.mdl",
		Type = STRUCTURE_WALL
	},
	{
		Name = "Low Wall",
		Icon = "materials/icons/build/wall_low.png",
		Desc = [[Secure your base
		by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_twall.mdl",
		Type = STRUCTURE_WALL
	},
	{
		Name = "U Stairs",
		Icon = "materials/icons/build/stairs_u.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_ust.mdl",
		Type = STRUCTURE_STAIR
	},
	{
		Name = "L Stairs",
		Icon = "materials/icons/build/stairs_l.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_lst.mdl",
		Type = STRUCTURE_STAIR
	},
	{
		Name = "Roof",
		Icon = "materials/icons/build/roof.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_floor_trig.mdl"
	},
	{
		Name = "Foundation",
		Icon = "materials/icons/build/foundation.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_foundation.mdl",
		Type = STRUCTURE_FLOOR
	},
	{
		Name = "Triangle Foundation",
		Icon = "materials/icons/build/triangle_foundation.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_foundation_trig.mdl",
		Type = STRUCTURE_FLOOR
	},
	{
		Name = "Foundation Steps",
		Icon = "materials/icons/build/foundation_steps.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_steps.mdl",
		Type = STRUCTURE_FLOOR
	},
	{
		Name = "Floor",
		Icon = "materials/icons/build/floor.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_floor.mdl",
		Type = STRUCTURE_FLOOR
	},
	{
		Name = "Floor Triangle",
		Icon = "materials/icons/build/floor_triangle.png",
		Desc = [[Secure your base
				by enclosing it in walls]],
		Foot = "50x Wood",
		Model = "models/building/twig_floor_trig.mdl",
		Type = STRUCTURE_FLOOR
	},
}

function SWEP:PlacementPosition()
	local pl = self:GetOwner()

	local tr = {}
	tr.start = pl:EyePos()
	tr.endpos = tr.start + pl:GetAimVector() * 185
	tr.filter = pl
	tr = util.TraceLine(tr)

	return tr.HitPos, Angle(0, pl:EyeAngles().y, 0)
end

function SWEP:CanBuild(pos)
	local pl = self:GetOwner()

	if (!pl:HasBuildPrivilege(pos)) then
		return false, "No build privilege"
	end

	if (!pl:HasItem("wood", 50)) then
		return false, "Not enough wood"
	end
	
	if (string.find(self.SelectedModel, "foundation")) then
		local tr = {}
		tr.start = pos
		tr.endpos = pos - Vector(0, 0, 75)
		tr = util.TraceLine(tr)
		return tr.HitWorld
	end

	return self.Socket
end

-- Unoptimised, but this is the best my brain can think of
function SWEP:GetNearestSocket()
	local NearEnts = ents.FindByClass("rust_structure")
	local pl = self:GetOwner()
	local BuildPos = pl:EyePos() + pl:GetAimVector() * 85

	local SelectedBlock = gRust.BuildingBlocks[self.SelectedModel]

	local ClosestDist
	local ClosestSocket
	local Structure
	for k, v in ipairs(NearEnts) do
		if (v:GetPos():DistToSqr(BuildPos) > 35000) then continue end
		local Block = gRust.BuildingBlocks[v:GetOriginalModel()]
		if (!Block) then continue end
		for i, j in ipairs(Block.Sockets) do
			local Dist = v:LocalToWorld(j.pos):DistToSqr(BuildPos)
			if (!ClosestDist or ClosestDist > Dist) then
				local tr = {}
				tr.start = v:LocalToWorld(j.pos)
				tr.endpos = v:LocalToWorld(j.pos) + Vector(0, 0, 25) + (v:GetAngles() + j.ang):Right() * 20
				tr.filter = v
				debugoverlay.Line(tr.start, tr.endpos, 1, Color(255, 0, 0), true)
				tr = util.TraceHull(tr)
				if (tr.Hit and
					Block.Type == SelectedBlock.Type and
					!(self.SelectedModel == "models/building/twig_dframe.mdl" and
					string.find(tr.Entity:GetOriginalModel(), "trig"))) then continue end

				ClosestDist = Dist
				ClosestSocket = j
				Structure = v
			end
		end
	end
	
	if (!IsValid(Structure)) then return end
	return Structure:LocalToWorld(ClosestSocket.pos), Structure:GetAngles() + ClosestSocket.ang, Structure
end

function SWEP:GetSocket()
	local pl = self:GetOwner()
	local BuildPos, BuildAng = self:PlacementPosition()
	local SelectedBlock = gRust.BuildingBlocks[self.SelectedModel]

	local pos, ang, Structure = self:GetNearestSocket()
	if (!pos) then return end

	pos = pos + ang:Right() * SelectedBlock.Offset.x
	pos = pos + ang:Forward() * SelectedBlock.Offset.y
	pos = pos + ang:Up() * SelectedBlock.Offset.z
	ang = ang + SelectedBlock.Angle

	if (pos && pos:DistToSqr(BuildPos) < 20000) then
		return pos, ang, Structure
	end
end

function SWEP:GetBuildPos()
	local SocketPos, SocketAng, Structure = self:GetSocket()
	if (SocketPos) then
		self.Socket = true
		return SocketPos, SocketAng, Structure
	else
		self.Socket = false
	end

	return self:PlacementPosition()
end

function SWEP:Deploy()
	if (self.ShownHint) then return end

	timer.Simple(2, function()
		local pl = self:GetOwner()
		if (pl:GetActiveWeapon() ~= self) then return end
		pl:Hint("build_menu", "HOLD [RIGHT CLICK] TO OPEN THE BUILD MENU", 3)
		
		self.ShownHint = true
	end)
end

