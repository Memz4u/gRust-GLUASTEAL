-- "gamemodes\\rust\\entities\\entities\\rust_storage\\cl_init.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
include("shared.lua")

ENT.InventorySlots 	= 16
ENT.InventoryName	= "CONTAINER"

function ENT:Interact()
	LocalPlayer():RequestInventory(self)

    gRust.OpenInventory(self)
end

local Container
local Grid
function ENT:ConstructInventory(panel, data, rows)
	if (IsValid(Container)) then
		Grid:Update()
		if (table.IsEmpty(data)) then
			Container:Remove()
		end
		return
	end

    local Rows = rows or (self.InventorySlots / 6)

	Container = panel:Add("Panel")
	Container:Dock(FILL)

	Grid = Container:Add("gRust.Inventory.SlotGrid")
	Grid:Dock(BOTTOM)
	Grid:SetCols(6)
	Grid:SetRows(Rows)
	Grid:SetEntity(self)
	Grid:SetMargin(data.margin)
	local LeftMargin = ScrW() * 0.02
	local RightMargin = ScrW() * 0.05
    Grid:DockMargin(LeftMargin, 0, RightMargin, ScrH() * 0.165)
    Grid:SetTall(((data.wide / (Rows * 2)) + data.margin * Rows) * (Rows - 1))

	local Name = Container:Add("Panel")
	Name:Dock(BOTTOM)
	Name:SetTall(ScrH() * 0.03)
    Name:DockMargin(LeftMargin, 0, RightMargin, ScrH() * 0.008)
	Name.Paint = function(me, w, h)
		if (!IsValid(self)) then Container:Remove() end

		surface.SetDrawColor(80, 76, 70, 175)
		surface.DrawRect(0, 0, w, h)

		if (!self.InventoryName) then return end
		draw.SimpleText(string.upper(self.InventoryName), "gRust.38px", w * 0.01, h * 0.5, Color(255, 255, 255, 200), 0, 1)
	end

	local Loot = Container:Add("DLabel")
	Loot:Dock(BOTTOM)
	Loot:SetFont("gRust.58px")
	Loot:SetText("LOOT")
	Loot:SetColor(Color(255, 255, 255, 225))
    Loot:DockMargin(LeftMargin, 0, RightMargin, ScrH() * 0.008)
	Loot:SetTall(ScrH() * 0.025)
end

