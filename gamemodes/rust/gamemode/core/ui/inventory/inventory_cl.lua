-- "gamemodes\\rust\\gamemode\\core\\ui\\inventory\\inventory_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local InitialPos = -(ScrW() * 0.1)
local LeftWidth, RightWidth = ScrW() * 0.35, ScrW() * 0.36
local LeftShift, RightShift = ScrW() * 0.0055, 0

local OpenItemMenu

local Margin = ScrH() * 0.0055
local function LeftPanel()
	local Frame = gRust.Inventory

	local scrw, scrh = ScrW(), ScrH()

	local Panel = Frame:Add("Panel")
	Panel:Dock(LEFT)
	Panel:SetWide(LeftWidth - LeftShift)
	Panel.DropPanel = true -- Drops the item when dragged ontop of

	local TeamButton = Panel:Add("gRust.Button")
	TeamButton:SetY(scrh - scrh * 0.1)
	TeamButton:SetWide(scrh * 0.11)
	TeamButton:SetHeight(scrh * 0.03)
	TeamButton:SetX(Panel:GetWide() - scrh * 0.125)
	if (#gRust.Team == 0) then
		TeamButton:SetText("Create Team")
	else
		TeamButton:SetText("Leave Team")
	end
	TeamButton.DoClick = function(me)
		if (#gRust.Team == 0) then
			me:SetText("Leave Team")
			gRust.CreateTeam()
		else
			me:SetText("Create Team")
			gRust.LeaveTeam()
		end
	end
	
	local BottomMargin = scrh * 0.161
	local GridContainer = Panel:Add("Panel")
	GridContainer:Dock(BOTTOM)
	GridContainer:SetTall(scrh * 0.083)
	GridContainer:DockMargin(scrh * 0.0725, 0, scrh * 0.0235, BottomMargin)

	local Grid = GridContainer:Add("gRust.Inventory.SlotGrid")
	Grid:Dock(FILL)
	Grid:SetCols(6)
	Grid:SetRows(1)
	Grid:SetEntity(LocalPlayer())
	Grid:SetInventoryOffset(30)
	Grid:SetMargin(Margin)
	Grid.OnSelection = function(me, i)
	end

	Frame.Attire = Grid

	local PlayerModel = Panel:Add("DModelPanel")
	PlayerModel:Dock(FILL)
	PlayerModel:SetModel("models/humans/group01/male_07.mdl")
	PlayerModel.DropPanel = true -- Drops the item when dragged ontop of
	PlayerModel.LayoutEntity = function(me, ent)
		ent:SetAngles(Angle(0, 55, 0))
		ent:SetPos(Vector(20, 10, 0))
	end
	PlayerModel.Think = function(me)
		me:SetModel(LocalPlayer():GetModel())
	end
end

local ItemMenu
local function MiddlePanel()
	local Frame = gRust.Inventory

	local Panel = Frame:Add("Panel")
	Panel.DropPanel = true -- Drops the item when dragged ontop of
	Panel:Dock(FILL)

	local Tall = ScrW() - (LeftWidth + RightWidth)
	local Grid = Panel:Add("gRust.Inventory.SlotGrid")
	Grid:Dock(BOTTOM)
	Grid:SetCols(6)
	Grid:SetRows(4)
	Grid:SetTall(Tall - (Tall / 3) + (Margin * 2))
	Grid:DockMargin(0, 0, 0, ScrH() * 0.1175)
	Grid:SetMargin(Margin)
	Grid:SetEntity(LocalPlayer())
	Grid:SetInventoryOffset(6) -- Skip hotbar

	local Button = Panel:Add("gRust.Button")
	Button:Dock(TOP)
	Button:SetTall(ScrH() * 0.0675)
	Button:DockMargin(ScrW() * 0.05, 0, ScrW() * 0.041, 0)
	Button.DoClick = function(me)
		gRust.CloseInventory()
		gRust.OpenCrafting()
	end
	Button.PaintOver = function(me, w, h)
		draw.SimpleText("CRAFTING", "gRust.53px", w * 0.393, h * 0.5, Color(243, 243, 243, 150), 1, 1)
		
		local Padding = h * 0.15
		surface.SetDrawColor(243, 243, 243, 150)
		surface.SetMaterial(gRust.GetIcon("enter"))
		surface.DrawTexturedRect(w - h - Padding * 0.5, Padding, h - Padding * 2, h - Padding * 2)
	end

	OpenItemMenu = function(ent, i)
		local Item = ent.Inventory[i]
		if (Item == nil) then return end
		local ItemData = gRust.Items[Item:GetItem()]
		local Removed = false
		if (IsValid(ItemMenu)) then
			Removed = true
			ItemMenu:Remove()
			ItemMenu:SetAlpha(255)
		end

		ItemMenu = Panel:Add("Panel")
		ItemMenu:Dock(BOTTOM)
		ItemMenu:SetTall(ScrH() * 0.3)
		ItemMenu:DockMargin(0, 0, 0, ScrH() * 0.01)
		if (!Removed) then
			ItemMenu:SetAlpha(0)
			ItemMenu:AlphaTo(255, 0.1, 0)
		end

		local Text = ItemMenu:Add("gRust.Label")
		Text:Dock(TOP)
		Text:SetColor(Color(0, 0, 0, 0))
		Text:SetText(ItemData:GetName())
		Text:SetTextSize(40)
		Text:SetTall(ScrH() * 0.03)

		local Container = ItemMenu:Add("Panel")
		Container:Dock(BOTTOM)
		Container:SetTall(ScrH() * 0.2)

		local Actions = Container:Add("Panel")
		Actions:Dock(RIGHT)
		Actions:SetWide(ScrH() * 0.2)
		Actions:DockMargin(ScrH() * 0.003, ScrH() * 0.003, 0, 0)
		Actions.Paint = function(me, w, h)
			surface.SetDrawColor(80, 76, 70, 175)
			surface.DrawRect(0, 0, w, h)
		end

		if (ItemData.Actions) then
			for k, v in ipairs(ItemData.Actions) do
				local Button = Actions:Add("gRust.Button")
				Button:SetText(v.Name)
				Button:Dock(BOTTOM)
				Button:SetTall(ScrH() * 0.045)
				Button:DockMargin(0, 1, 0, 0)
				Button.DoClick = function()
					v.Func(ent, i)
				end
			end
		end

		local Spacing = Container:Add("Panel")
		Spacing:Dock(FILL)
		Spacing.Paint = function(me, w, h)
			surface.SetDrawColor(80, 76, 70, 175)
			surface.DrawRect(0, 0, w, h)
		end

		local Info = ItemMenu:Add("DPanel")
		Info:Dock(FILL)
		Info.Paint = function(me, w, h)
			surface.SetDrawColor(80, 76, 70, 175)
			surface.DrawRect(0, 0, w, h)
		end

		local Icon = Info:Add("DImage")
		Icon:Dock(RIGHT)
		Icon:SetImage(ItemData:GetIcon())
		Icon:SetWide(ScrH() * 0.06)
		local Margin = ScrH() * 0.005
		Icon:DockMargin(Margin, Margin, Margin, Margin)
	end

	Frame.Slots = Grid
end

local function RightPanel()
	local Frame = gRust.Inventory
	
	local scrw, scrh = ScrW(), ScrH()

	local Panel = Frame:Add("Panel")
	Panel:Dock(RIGHT)
	Panel:SetWide(RightWidth + LeftShift)
	Panel.DropPanel = true -- Drops the item when dragged ontop of

	if (Frame.Container) then
		Frame.UpdateContainer = function()
			if (!Frame.Container.ConstructInventory) then return end
			Frame.Container:ConstructInventory(Panel, {
				margin = Margin,
				wide = RightWidth + LeftShift
			})
		end

		--Frame.UpdateContainer()
	end
end

local MoveTime = 0.125
function gRust.OpenInventory(ent)
	if (IsValid(gRust.Inventory)) then return end
	if (IsValid(gRust.CraftingMenu)) then
		gRust.CloseCrafting()
	end

	gRust.QuickSwapQueue = 0
	local scrw, scrh = ScrW(), ScrH()

	local Frame = vgui.Create("Panel")
	Frame:SetX(InitialPos)
	Frame:SetSize(scrw, scrh)
	Frame:SetAlpha(0)
	Frame:AlphaTo(255, MoveTime, 0)
	Frame:MoveTo(0, 0, MoveTime, 0, 0.5)
	Frame.Container = ent
	Frame.Paint = function(me, w, h)
		surface.SetDrawColor(26, 25, 22, 245)
		surface.DrawRect(0, 0, w, h)

		me:DrawBlur(6)
	end
	Frame.OnSelection = function(me, ent, i)
		OpenItemMenu(ent, i)
	end

	gui.EnableScreenClicker(true)
	gRust.Inventory = Frame

	LeftPanel()
	RightPanel()
	MiddlePanel()
end

function gRust.CloseInventory()
	if (!IsValid(gRust.Inventory)) then return end

	gui.EnableScreenClicker(false)
	local Frame = gRust.Inventory
	Frame:AlphaTo(0, MoveTime, 0)
	Frame:MoveTo(InitialPos, 0, MoveTime, 0, nil, function()
		Frame:Remove()
	end)

	if (IsValid(LocalPlayer().SelectedSlot)) then
		LocalPlayer().SelectedSlot:SetSelected(false)
	end
end

--
-- Functions
--

function GM:ScoreboardShow()
	if (IsValid(gRust.Inventory)) then
		gRust.CloseInventory()
	else
		gRust.OpenInventory()
	end
end

function GM:ScoreboardHide()
end

gRust.LoadHotbar(ScrW() - (LeftWidth + RightWidth), LeftWidth - LeftShift, Margin)
hook.Add("InitPostEntity", "gRust.LoadHotbar", function()
	gRust.LoadHotbar(ScrW() - (LeftWidth + RightWidth), LeftWidth - LeftShift, Margin)
end)

