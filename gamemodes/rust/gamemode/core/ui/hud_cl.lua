-- "gamemodes\\rust\\gamemode\\core\\ui\\hud_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local surface = surface
local surface_SetDrawColor  = surface.SetDrawColor
local surface_SetMaterial      = surface.SetMaterial
local surface_DrawRect      = surface.DrawRect
local surface_DrawTexturedRect      = surface.DrawTexturedRect

local BarIndex = 1
local function DrawBar(val, min, max, icon, col)
	val = math.Clamp(val, min, max)

	local scrw, scrh = ScrW(), ScrH()
	local Spacing = scrh * 0.001
	local Padding = scrh * 0.00475

	local Width, Height = scrh * 0.266, (scrh * 0.1125 - Spacing) / 3
	local Margin = scrh * 0.0225

	local x, y = scrw - Margin - Width, scrh - Margin - Height * BarIndex - Spacing * BarIndex + Spacing * 2

	surface_SetDrawColor(80, 76, 70, 175)
	surface_DrawRect(x, y, Width, Height - Spacing)
	
	surface_SetDrawColor(160, 152, 140, 255)
	surface_SetMaterial(icon)
	surface_DrawTexturedRect(x + Padding, y + Padding, Height - Padding * 2, Height - Padding * 2)

	surface_SetDrawColor(col)
	surface_DrawRect(x + Height - Spacing, y + Padding, ((Width - Height - Padding) * (val / max)), Height - Padding * 2)

	draw.SimpleText(val, "gRust.32px", x + Height + Margin, y + Height * 0.5, Color(255, 255, 255, 165), 1, 1)

	BarIndex = BarIndex + 1
end

local MaxDist = gRust.Config.InteractRange
local LookingEnt
local Alpha = 0

local TraceMins, TraceMaxs = Vector(-4, -4, -4), Vector(4, 4, 4)
local function DrawEntityDisplay()
	local pl = LocalPlayer()
	local tr = {}
	tr.start = pl:EyePos()
	tr.endpos = tr.start + pl:GetAimVector() * 72.5
	tr.mins = TraceMins
	tr.maxs = TraceMaxs
	tr.filter = pl
	tr = util.TraceHull(tr)
	local ent = tr.Entity

	if (IsValid(ent) and ent.gRust) then
		LookingEnt = ent
	end
	
	local DisplayName = ent.GetDisplayName and ent:GetDisplayName()
	if (DisplayName == "") then DisplayName = nil end

	if (!IsValid(ent) or (!DisplayName and !ent.ShowHealth) or tr.HitPos:DistToSqr(pl:EyePos()) > MaxDist) then
		Alpha = Lerp(0.15, Alpha, 0)
	else
		Alpha = Lerp(0.15, Alpha, 255)
	end
	
	if (Alpha < 0.1) then return end
	if (!IsValid(LookingEnt)) then return end

	if (LookingEnt.ShowHealth) then -- Health
		local Health = LookingEnt:Health()
		local Width = ScrW() * 0.117
		local Height = ScrH() * 0.012
	
		surface.SetDrawColor(117, 120, 62, Alpha)
		surface.DrawRect(ScrW() * 0.5 - Width * 0.5, ScrH() * 0.224, Width, Height)
	
		surface.SetDrawColor(255, 255, 255, Alpha)
		surface.DrawRect(ScrW() * 0.5 - Width * 0.5, ScrH() * 0.224, Width * (Health / LookingEnt:GetMaxHealth()), Height)
	
		draw.SimpleText(Health .. "/" .. LookingEnt:GetMaxHealth(), "gRust.30px", ScrW() * 0.5 + Width * 0.5, ScrH() * 0.203, Color(255, 255, 255, Alpha), 2, 2)
	end

	DisplayName = LookingEnt:GetDisplayName()
	if (DisplayName == "") then DisplayName = nil end
	local scrw, scrh = ScrW(), ScrH()

	if (DisplayName) then
		if (Alpha < 1) then return end

		local IS = scrh * 0.036
		surface.SetDrawColor(255, 255, 255, Alpha)
		surface.SetMaterial(LookingEnt.DisplayIcon)
		surface.DrawTexturedRect(scrw * 0.5 - IS * 0.5, scrh * 0.435 - IS * 0.5, IS, IS)

		draw.SimpleText(DisplayName, "gRust.31px", scrw * 0.5, scrh * 0.4625, Color(255, 255, 255, Alpha), 1, 1)

		local CS = scrh * 0.012
		surface.SetDrawColor(255, 255, 255, Alpha)
		surface.SetMaterial(gRust.GetIcon("circle"))
		surface.DrawTexturedRect(scrw * 0.5 - CS * 0.5, scrh * 0.5 - CS * 0.5, CS, CS)
	end

	if (LookingEnt.Options) then
		draw.SimpleText("MORE OPTIONS ARE AVAILABLE", "gRust.26px", scrw * 0.5, scrh * 0.535, Color(255, 255, 255, Alpha), 1, 1)
		draw.SimpleText("HOLD DOWN [USE] TO OPEN MENU", "gRust.26px", scrw * 0.5, scrh * 0.555, Color(255, 255, 255, Alpha), 1, 1)
	end
end

hook.Add("PreDrawHalos", "gRust.ItemHalo", function()
	if (!IsValid(LookingEnt)) then return end

	local pl = LocalPlayer()
	local tr = {}
	tr.start = pl:EyePos()
	tr.endpos = tr.start + pl:GetAimVector() * 72.5
	tr.mins = TraceMins
	tr.maxs = TraceMaxs
	tr.filter = pl
	tr = util.TraceHull(tr)
	local ent = tr.Entity

	if (!ent.gRust or !ent.DrawHalo) then return end
	if (ent:GetPos():DistToSqr(pl:GetPos()) > MaxDist) then return end

	halo.Add({LookingEnt}, color_white, 3, 3, 2)
end)

CreateClientConVar("grust_drawhud", "1", false)
function GM:HUDPaint()
	if (!LocalPlayer():Alive()) then return end
	if (GetConVar("grust_drawhud"):GetBool() == false) then return end

	DrawEntityDisplay()
	self:DrawCompass()
end

function GM:PostRenderVGUI()
	if (!LocalPlayer():Alive()) then return end
	if (GetConVar("grust_drawhud"):GetBool() == false) then return end
	if (IsValid(gRust.TechTreeMenu)) then return end

	self:DrawTeam()
	self:DrawPieMenu()

	local scrw, scrh = ScrW(), ScrH()
	local ContainerWidth, ContainerHeight = scrh * 0.266, scrh * 0.1125
	local Margin = scrh * 0.0225

	local pl = LocalPlayer()

	--surface_SetDrawColor(225, 225, 225, 200)
	--surface_DrawRect(scrw - Margin - ContainerWidth, scrh - Margin - ContainerHeight, ContainerWidth, ContainerHeight)

	BarIndex = 1
	DrawBar(pl:GetHunger(), 0, 500, gRust.GetIcon("food"), Color(193, 109, 53))
	DrawBar(pl:GetThirst(), 0, 250, gRust.GetIcon("cup"), Color(69, 148, 205))
	DrawBar(pl:Health(), 0, pl:GetMaxHealth(), gRust.GetIcon("health"), Color(136, 179, 58))
end

local NoDraw = {
	["CHudHealth"] = true,
	["CHudWeaponSelection"] = true,
	["CHudAmmo"] = true,
	["CHudSecondaryAmmo"] = true,
	["CHudDamageIndicator"] = true
}

function GM:HUDShouldDraw(n)
	return !NoDraw[n]
end

