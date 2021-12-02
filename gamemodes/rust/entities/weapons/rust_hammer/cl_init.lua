-- "gamemodes\\rust\\entities\\weapons\\rust_hammer\\cl_init.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
include("shared.lua")

SWEP.VMPos = Vector(-2, -1, 0.5)
SWEP.VMAng = Vector(0, 0, 0)

local PieMenu =
{
	{
		Name = "Upgrade to HQ Metal",
		Desc = "Upgrades to Stone",
		Icon = "icons/level_top.png",
		Foot = "25x HQ Metal",
		Condition = function()
			return LocalPlayer():HasItem("hq_metal", 25)
		end,
		Func = function(ent)
			net.Start("gRust.Upgrade")
			net.WriteEntity(ent)
			net.WriteUInt(3, 3)
			net.SendToServer()
		end
	},
	{
		Name = "Demolish",
		Desc = "Rotate the structure in place",
		Icon = "icons/demolish.png",
		Foot = "200x Wood",
		Func = function(ent)
			net.Start("gRust.Demolish")
			net.WriteEntity(ent)
			net.SendToServer()
		end
	},
	{
		Name = "Rotate",
		Desc = "Rotate the structure in place",
		Icon = "icons/rotate.png",
		Foot = "200x Wood",
		Func = function(ent)
			net.Start("gRust.Rotate")
			net.WriteEntity(ent)
			net.SendToServer()
		end
	},
	{
		Name = "Upgrade to Wood",
		Desc = "Upgrades to wood",
		Icon = "icons/level_wood.png",
		Foot = "200x Wood",
		Condition = function()
			return LocalPlayer():HasItem("wood", 200)
		end,
		Func = function(ent)
			net.Start("gRust.Upgrade")
			net.WriteEntity(ent)
			net.WriteUInt(0, 3)
			net.SendToServer()
		end
	},
	{
		Name = "Upgrade to Stone",
		Desc = "Upgrades to Stone",
		Icon = "icons/level_stone.png",
		Foot = "200x Stone",
		Condition = function()
			return LocalPlayer():HasItem("stone", 200)
		end,
		Func = function(ent)
			net.Start("gRust.Upgrade")
			net.WriteEntity(ent)
			net.WriteUInt(1, 3)
			net.SendToServer()
		end
	},
	{
		Name = "Upgrade to Metal",
		Desc = "Upgrades to Metal",
		Icon = "icons/level_metal.png",
		Foot = "200x Metal Fragments",
		Condition = function()
			return LocalPlayer():HasItem("metal_fragments", 200)
		end,
		Func = function(ent)
			net.Start("gRust.Upgrade")
			net.WriteEntity(ent)
			net.WriteUInt(2, 3)
			net.SendToServer()
		end
	},
}

function SWEP:SecondaryAttack()
	if (!IsValid(self.LastStructure)) then return end

	self.UseStructure = self.LastStructure
	self.PieOpen = true
	gRust.OpenPieMenu(PieMenu, function(SelectionIndex)
		PieMenu[SelectionIndex].Func(self.UseStructure)
	end)
end

function SWEP:ClearStructureEffects(ent)
	if (IsValid(self.LastStructure)) then
		self.LastStructure:SetMaterial()
		self.LastStructure:SetColor(DefaultColor)
		self.LastStructure = nil
	end
end

local DefaultColor = Color(255, 255, 255)
local NoiseColor = Color(57, 182, 255)
local Dist = gRust.Config.MeleeRange * 2.25
function SWEP:CheckStructure()
	local pl = self:GetOwner()

	pl:LagCompensation(true)
	local tr = pl:GetEyeTraceNoCursor()
	pl:LagCompensation(false)

	if (tr.HitPos:DistToSqr(pl:EyePos()) > Dist or tr.Entity:GetClass() ~= "rust_structure") then
		self:ClearStructureEffects()
		return
	end

	if (self.LastStructure ~= tr.Entity) then
		self:ClearStructureEffects()
	end

	tr.Entity:SetMaterial("models/building/build_noise.vmt")
	tr.Entity:SetColor(NoiseColor)
	self.LastStructure = tr.Entity
end

function SWEP:CheckPieMenu()
	local pl = self:GetOwner()
	self:CheckStructure()
	
	print(self.PieOpen)
	if (!pl:KeyDown(IN_ATTACK2) and self.PieOpen) then
		gRust.ClosePieMenu()
		self.PieOpen = false
	end
end

function SWEP:Holster()
	self:ClearStructureEffects()
end

function SWEP:OnRemove()
	self:ClearStructureEffects()
end

--
-- Pickup
--

local PickupTime = 0.5
function SWEP:Think()
	self:CheckStructure()
	local pl = self:GetOwner()
	if (pl:KeyDown(IN_USE)) then
		if (self.PickupStart) then return end
		timer.Simple(0.2, function()
			if (pl:KeyDown(IN_USE) and !self.PickupStart) then
				self.PickupStart = CurTime()
			end
		end)
	else
		self.PickupStart = nil
	end
end

local Width = ScrH() * 0.275
local Height = ScrH() * 0.0125
local Y = ScrH() * 0.45
function SWEP:DrawHUD()
	self:CheckPieMenu()
	
	if (!self.PickupStart) then return end
	local ent = self:GetOwner():GetEyeTraceNoCursor().Entity
	if (!IsValid(ent) or !ent.Pickup) then return end

	local scrw, scrh = ScrW(), ScrH()

	local Progress = (CurTime() - self.PickupStart) / PickupTime
	local Alpha = math.min(math.Remap(Progress, 0, 0.25, 0, 1), 1)
	surface.SetDrawColor(255, 255, 255, Alpha * 100)
	surface.DrawRect(scrw * 0.5 - Width * 0.5, scrh * 0.45 - Height * 0.5, Width, Height)

	draw.SimpleText("Pickup", "gRust.28px", scrw * 0.5 - Width * 0.415, Y - scrh * 0.025, Color(255, 255, 255, Alpha * 255), 0, 2)
	surface.SetDrawColor(255, 255, 255, Alpha * 255)
	surface.DrawRect(scrw * 0.5 - Width * 0.5, Y - Height * 0.5, (Width * Progress), Height)

	surface.SetMaterial(gRust.GetIcon("give"))
	surface.SetDrawColor(ColorAlpha(gRust.Colors.Primary, Alpha * 255))
	surface.DrawTexturedRect(scrw * 0.5 - Width * 0.5, Y - scrh * 0.03, scrh * 0.025, scrh * 0.025)

	if (Progress >= 1) then
		self.PickupStart = nil
		net.Start("gRust.Pickup")
		net.WriteEntity(ent)
		net.SendToServer()
	end
end

