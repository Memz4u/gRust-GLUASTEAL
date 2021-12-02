-- "gamemodes\\rust\\gamemode\\vgui\\slot_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
DEFINE_BASECLASS("gRust.DragPanel")
local PANEL = {}

AccessorFunc(PANEL, "Selected", "Selected", FORCE_BOOL)
AccessorFunc(PANEL, "ID", "ID", FORCE_NUMBER)
AccessorFunc(PANEL, "Entity", "Entity")

gRust.QuickSwapQueueh = 0
local QuickSwapTime = 0.225

local BlueprintIcon = Material("items/misc/blueprint.png", "smooth")

function PANEL:Init()
	self:NoClipping(true)

	self.Text = self:Add("DLabel")
	self.Text:SetFont("gRust.30px")
	self.Text:SetText("")
	self.Text:SetWide(100)
	self.Text:SetContentAlignment(6)
	self.Text:SetTextColor(Color(200, 200, 200, 200))
end

function PANEL:PerformLayout()
	local Margin = self:GetTall() * 0.05
	self.Text:SetX(self:GetWide() - self.Text:GetWide() - Margin)
	self.Text:SetY(self:GetTall() - self.Text:GetTall() - Margin)
end

function PANEL:DrawDrag(x, y, w, h)
	if (!self.Item) then return end

	surface.SetMaterial(Material(gRust.Items[self.Item:GetItem()]:GetIcon()))
	surface.SetDrawColor(255, 255, 255, 200)
	surface.DrawTexturedRect(x, y, w, h)
end

function PANEL:CanDrag()
	return self.Item ~= nil
end

function PANEL:OnDropped(Other, mcode)
	if (!Other.Item) then return end
	local Amount = Other.Item:GetQuantity()
	if (mcode == 1) then
		Amount = 1
	elseif (mcode == 2) then
		if (LocalPlayer():KeyDown(IN_SPEED)) then
			Amount = Amount / 3
		else
			Amount = Amount * 0.5
		end
	end

	LocalPlayer():EmitSound(gRust.RandomGroupedSound(string.format("drop.%s", gRust.Items[Other:GetItem():GetItem()]:GetSound())))

	LocalPlayer():MoveSlot(Other:GetEntity(), self:GetEntity(), Other:GetID(), self:GetID(), math.ceil(Amount))
end

function PANEL:OnRelease(other)
	if (!other) then return end
	if (!self.Item) then return end
	if (other.DropPanel) then
		net.Start("gRust.Drop")
		net.WriteEntity(self:GetEntity())
		net.WriteUInt(self:GetID(), 6)
		net.WriteUInt(self.Item:GetQuantity(), 20)
		net.SendToServer()
	end
end

function PANEL:OnCursorEntered()
	self.BounceStart = SysTime()
	LocalPlayer():EmitSound("ui.blip")
end

function PANEL:SetItem(item)
	self.Item = item
	if (!item) then
		self.Text:SetText("")
		self.Icon = nil
		return
	end

	local ItemData = gRust.Items[item:GetItem()]
	self.Icon = Material(ItemData:GetIcon(), "smooth")

	if (item:GetQuantity() > 1) then
		-- TODO: Format string based on actual item register
		self.Text:SetText(string.format("x%i", item:GetQuantity()))
	else
		self.Text:SetText("")
	end
end

function PANEL:GetItem()
	return self.Item
end

function PANEL:OnDrag()
	if (!self.Item) then return end

	LocalPlayer():EmitSound(gRust.RandomGroupedSound(string.format("drop.%s", gRust.Items[self.Item:GetItem()]:GetSound())))
end

function PANEL:OnQuickSwap()
end

function PANEL:Think()
	BaseClass.Think(self)

	if (!input.IsMouseDown(108)) then
		if (!self:IsHovered()) then return end
		if (!self:GetItem() or (!self.HadLastItem and !input.IsKeyDown(KEY_H))) then return end
		if ((self.RMBDown or input.IsKeyDown(KEY_H)) && !self.QuickSwapStart) then
			gRust.QuickSwapQueue = gRust.QuickSwapQueue + 1
			self.QuickSwapStart = SysTime() + ((gRust.QuickSwapQueue - 1) * QuickSwapTime)
			
			LocalPlayer():EmitSound(gRust.RandomGroupedSound(string.format("pickup.%s", gRust.Items[self.Item:GetItem()]:GetSound())))
			timer.Simple(gRust.QuickSwapQueue * QuickSwapTime, function()
				if (!IsValid(self)) then return end
				if (!self.Item) then return end
				LocalPlayer():EmitSound(gRust.RandomGroupedSound(string.format("drop.%s", gRust.Items[self.Item:GetItem()]:GetSound())))
				self:OnQuickSwap()
				self.QuickSwapStart = nil
				gRust.QuickSwapQueue = gRust.QuickSwapQueue - 1
			end)

			self.RMBDown = false
			return
		end

		self.RMBDown = false
	elseif (self:IsHovered()) then
		self.RMBDown = true
	else
		self.RMBDown = false
	end
	
	-- Prevents a click from being detected when an item is rmb dragged
	self.HadLastItem = self.Item ~= nil
end

local QuickSwapCircle = Circles.New(CIRCLE_FILLED, 200, 100, 100)
QuickSwapCircle:SetRotation(90)

local BounceMax = 5
function PANEL:Paint(w, h)
	if (!IsValid(LocalPlayer())) then return end
	if (!LocalPlayer():Alive()) then return end
	local AddSize = Anim.Bounce(Lerp((SysTime() - (self.BounceStart or SysTime())) / 0.075, 0, 1)) * BounceMax

	if (self:GetSelected()) then
		surface.SetDrawColor(0, 127, 211, 200)
	else
		surface.SetDrawColor(80, 76, 70, 175)
	end

	surface.DrawRect(-AddSize, -AddSize, w + AddSize * 2, h + AddSize * 2)

	if (!self.Item) then return end
	local ID = gRust.Items[self.Item:GetItem()]
	if (ID:GetWeapon()) then
		if (ID:GetDurability()) then
			surface.SetDrawColor(90, 206, 45, 20)
			surface.DrawRect(-AddSize, -AddSize, w * 0.07, h + AddSize * 2)
	
			local WearFrac = self.Item:GetWear() / 1000
			local Height = h + AddSize * 2
			
			surface.SetDrawColor(137, 181, 55, 255)
			surface.DrawRect(-AddSize, Height - (Height * WearFrac), w * 0.07, Height * WearFrac)
		end

		if (ID:GetClip()) then
			self.Text:SetText(self.Item:GetClip())
		end
	end
	
	if (!self.Icon) then return end

	local Margin = ScrH() * 0.006 - AddSize
	if (ID:GetBlueprint() == true) then
		surface.SetDrawColor(200, 200, 200)
		surface.SetMaterial(BlueprintIcon)
		surface.DrawTexturedRect(Margin, Margin - ScrH() * 0.0035, w - (Margin * 2), h - (Margin * 2))
	end

	surface.SetDrawColor(200, 200, 200)
	surface.SetMaterial(self.Icon)
	surface.DrawTexturedRect(Margin, Margin - ScrH() * 0.0035, w - (Margin * 2), h - (Margin * 2))

	if (self.QuickSwapStart) then
		local LerpStart = Lerp((SysTime() - self.QuickSwapStart) / QuickSwapTime, 0, 1)

		surface.SetDrawColor(133, 228 ,70)
		draw.NoTexture()
		QuickSwapCircle:SetRadius((w * 0.25) + math.sin(LerpStart * math.pi) * 4)
		QuickSwapCircle:SetStartAngle(LerpStart * 360)
		QuickSwapCircle:SetPos(w * 0.5, h * 0.5)
		QuickSwapCircle()
	end
end

local DraggedID
local Dragging = false
local DragPanel

vgui.Register("gRust.Inventory.Slot", PANEL, "gRust.DragPanel")

