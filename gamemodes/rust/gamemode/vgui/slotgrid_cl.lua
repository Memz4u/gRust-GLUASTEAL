-- "gamemodes\\rust\\gamemode\\vgui\\slotgrid_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local PANEL = {}

AccessorFunc(PANEL, "Rows", "Rows", FORCE_NUMBER)
AccessorFunc(PANEL, "Cols", "Cols", FORCE_NUMBER)
AccessorFunc(PANEL, "Margin", "Margin", FORCE_NUMBER)

AccessorFunc(PANEL, "Entity", "Entity")
AccessorFunc(PANEL, "InventoryOffset", "InventoryOffset", FORCE_NUMBER)

function PANEL:Init()
	self.Slots = {}

	self.NeedLayout = true
end

function PANEL:GetInventory()
	return self:GetEntity().Inventory
end

function PANEL:SetSelection(n)
	self.Slots[self.Selected or 1]:SetSelected(false)
	self.Selected = n

	if (!n) then return end
	self.Slots[n]:SetSelected(true)
end

function PANEL:OnSelection(i)
end

function PANEL:PerformLayout()
	if (!self.NeedLayout) then return end

	local Wide, Tall = self:GetWide(), self:GetTall()
	local Cols, Rows = self:GetCols(), self:GetRows()

	for k, v in ipairs(self.Slots) do
		v:Remove()
		self.Slots[k] = nil
	end

	local i = 1
	for x = 1, Rows do
		local Row = self:Add("Panel")
		Row:SetTall(Tall / Rows)
		Row:Dock(TOP)

		for y = 1, Cols do
			local Ent = self:GetEntity()
			local Slot = Row:Add("gRust.Inventory.Slot")
			Slot:SetWide(Wide / Cols - (self:GetMargin() * 0.5))
			Slot:Dock(LEFT)
			Slot:SetEntity(Ent)
			Slot:SetID(i + (self:GetInventoryOffset() or 0))
			Slot.OnQuickSwap = function(me)
				if (Ent == LocalPlayer()) then
					local OtherContainer = gRust.Inventory.Container
					if (OtherContainer) then
						LocalPlayer():MoveSlot(Ent, OtherContainer, me:GetID(), OtherContainer:FindEmptySlot(), me.Item:GetQuantity())
						return
					end

					if (!me.Item) then return end
					local Slot = me:GetID() < 7 and Ent:FindEmptySlot(7, nil, me.Item) or Ent:FindEmptySlot(1, 6, me.Item)
					if (!Slot) then return end

					LocalPlayer():MoveSlot(Ent, Ent, me:GetID(), Slot, me.Item:GetQuantity())
				else
					local Slot = LocalPlayer():FindEmptySlot(nil, nil, me.Item)
					if (!Slot or !me.Item) then return end

					LocalPlayer():MoveSlot(Ent, LocalPlayer(), me:GetID(), Slot, me.Item:GetQuantity())
				end
			end
			local OldOnMouseReleased = Slot.OnMouseReleased
			Slot.OnMouseReleased = function(me)
				OldOnMouseReleased(me)
				
				if (IsValid(LocalPlayer().SelectedSlot)) then
					LocalPlayer().SelectedSlot:SetSelected(false)
				end

				gRust.Inventory:OnSelection(me:GetEntity(), me:GetID())
				me:SetSelected(true)
				LocalPlayer().SelectedSlot = me
			end

			local LeftMargin = 0
			local TopMargin = 0

			if (x > 1) then
				LeftMargin = self:GetMargin()
			end

			if (y > 1) then
				TopMargin = self:GetMargin()
			end

			Slot:DockMargin(TopMargin, LeftMargin, 0, 0)
			self.Slots[i] = Slot

			i = i + 1
		end
	end

	self:Update()
	self.NeedLayout = false
end

function PANEL:Update()
	local Inventory = self:GetInventory()
	if (!Inventory) then return end

	for i = 1, self:GetRows() * self:GetCols() do
		local Item = Inventory[i + (self:GetInventoryOffset() or 0)]
		if (!self.Slots[i]) then continue end

		self.Slots[i]:SetItem(Item)
	end
end

vgui.Register("gRust.Inventory.SlotGrid", PANEL, "Panel")

