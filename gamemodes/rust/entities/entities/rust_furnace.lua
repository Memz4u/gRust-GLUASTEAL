-- "gamemodes\\rust\\entities\\entities\\rust_furnace.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

ENT.Base = "rust_process"

ENT.Deploy = {}
ENT.Deploy.Model = "models/deployable/furnace.mdl"

ENT.StopOnEmpty = false
ENT.Byproduct	= "charcoal"

ENT.Pickup   	= "furnace"

ENT.ProcessItems =
{
	["sulfur_ore"] =
	{
		{
			item = "sulfur",
			amount = 1,
		}
	},
	["metal_ore"] =
	{
		{
			item = "metal_fragments",
			amount = 1,
		}
	},
	["hqmetal_ore"] =
	{
		{
			item = "hq_metal",
			amount = 1,
		}
	}
}

ENT.DisplayIcon 	= gRust.GetIcon("open")

function ENT:Initialize()
	if (CLIENT) then return end

	self:SetModel("models/deployable/furnace.mdl")
	self:PhysicsInitStatic(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	self:SetInteractable(true)
	self:CreateInventory(12)
	self:SetFuel("wood")

	self:SetDamageable(true)

	self:SetDamageable(true)
    self:SetHealth(200)
    self:SetMaxHealth(200)

    self:SetMeleeDamage(0.2)
    self:SetBulletDamage(0.05)
    self:SetExplosiveDamage(0.4)

	self:SetInteractable(true)
	self:SetDisplayName("OPEN")
end

function ENT:Draw()
	self:DrawModel()

    if (self:GetNW2Bool("gRust.Enabled")) then
        if (!self.Fire) then
            ParticleEffectAttach( "rust_fire", PATTACH_POINT_FOLLOW, self, 1 )
            self.Fire = true
        end
    else
        if (self.Fire) then
            self:StopParticles()
            self.Fire = false
        end
    end
end

local Container
function ENT:ConstructInventory(panel, data, rows)
	if (IsValid(Container)) then
		Container:Remove()
	end

	Container = panel:Add("Panel")
	Container:Dock(FILL)

	local LeftMargin = ScrW() * 0.02
	local RightMargin = ScrW() * 0.05

	local Controls = Container:Add("Panel")
	Controls:Dock(BOTTOM)
	Controls:SetTall(ScrH() * 0.13)
	Controls:DockMargin(LeftMargin, 0, RightMargin, ScrH() * 0.15)

	local Title = Controls:Add("Panel")
	Title:Dock(TOP)
	Title:SetTall(ScrH() * 0.03)
	Title:DockMargin(0, 0, 0, ScrH() * 0.003)
	Title.Paint = function(me, w, h)
		surface.SetDrawColor(80, 76, 70, 175)
		surface.DrawRect(0, 0, w, h)
	end

	local ButtonPanel = Controls:Add("Panel")
	ButtonPanel:Dock(FILL)
	ButtonPanel.Paint = function(me, w, h)
		surface.SetDrawColor(80, 76, 70, 175)
		surface.DrawRect(0, 0, w, h)
	end

	local Margin = ScrH() * 0.01
	local ToggleButton = ButtonPanel:Add("gRust.Button")
	ToggleButton:Dock(LEFT)
	ToggleButton:SetText("Turn On")
	ToggleButton:DockMargin(Margin, Margin, Margin, Margin)
	ToggleButton:SetWide(ScrW() * 0.11)

	ToggleButton:SetDefaultColor(Color(39, 102, 65))
	ToggleButton:SetHoveredColor(Color(47, 136, 47))
	ToggleButton:SetActiveColor(Color(106, 177, 49))

	ToggleButton.Think = function(me)
		local On = self:GetNW2Bool("gRust.Enabled", false)
		if (On) then
			if (!me.On) then
				me.On = true
				me:SetText("Turn Off")

				ToggleButton:SetDefaultColor(Color(102, 59, 39))
				ToggleButton:SetHoveredColor(Color(136, 87, 47))
				ToggleButton:SetActiveColor(Color(177, 68, 49))
			end
		else
			if (me.On) then
				me.On = false
				me:SetText("Turn On")

				ToggleButton:SetDefaultColor(Color(39, 102, 65))
				ToggleButton:SetHoveredColor(Color(47, 136, 47))
				ToggleButton:SetActiveColor(Color(106, 177, 49))
			end
		end
	end
	ToggleButton.DoClick = function(me)
		self:Toggle()
	end

	local i = 1
	local function CreateRow(name)
		local Grid = Container:Add("gRust.Inventory.SlotGrid")
		Grid:Dock(BOTTOM)
		Grid:SetCols(6)
		Grid:SetRows(1)
		Grid:SetInventoryOffset((i - 1) * 6)
		Grid:SetEntity(self)
		Grid:SetMargin(data.margin)
		Grid:DockMargin(LeftMargin, 0, RightMargin, ScrH() * 0.01)
		Grid:SetTall(((data.wide / 8) + data.margin))
	
		local Name = Container:Add("Panel")
		Name:Dock(BOTTOM)
		Name:SetTall(ScrH() * 0.03)
		Name:DockMargin(LeftMargin - ScrW() *0.005, 0, RightMargin, ScrH() * 0.008)
		Name.Paint = function(me, w, h)
			surface.SetDrawColor(80, 76, 70, 175)
			surface.DrawRect(0, 0, w, h)
			draw.SimpleText(name, "gRust.38px", w * 0.01, h * 0.5, Color(255, 255, 255, 200), 0, 1)
		end

		i = i + 1
	end

	CreateRow("OUTPUT")
	CreateRow("INPUT")
end

