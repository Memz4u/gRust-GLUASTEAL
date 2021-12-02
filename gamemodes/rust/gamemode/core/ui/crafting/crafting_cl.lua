-- "gamemodes\\rust\\gamemode\\core\\ui\\crafting\\crafting_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local InitialPos = ScrW() * 0.1
local LeftMargin, RightMargin = ScrW() * 0.05575, ScrW() * 0.0675
local TopMargin, BottomMargin = ScrH() * 0.0725, ScrH() * 0.1615

local LeftWidth = ScrW() * 0.437
local Spacing = ScrH() * 0.005

local SelectedCategory = 1
local SelectedItem = gRust.Items["rock"]
local CraftAmount = 1
local LastChange = 0

local SelectedSkin = ""
local UpdateSkins

local TierAnimStart = 0

local LockIcon = Material("icons/lock.png", "smooth")

local TierColors =
{
	[1] =
	{
		Background 	= gRust.Colors.Secondary,
		Text 		= Color(208, 255, 146, 200)
	},
	[2] =
	{
		Background 	= gRust.Colors.Blue,
		Text 		= Color(0, 162, 255, 225)
	},
	[3] =
	{
		Background	= gRust.Colors.Primary,
		Text 		= Color(255, 147, 58, 225)
	},
	[4] =
	{
		Background	= Color(255 ,208 ,0),
		Text 		= Color(255, 255, 255, 225)
	}
}

local function DrawPanel(me, w, h)
	surface.SetDrawColor(80, 76, 70, 175)
	surface.DrawRect(0, 0, w, h)
end

local function InventoryButton()
	local Frame = gRust.CraftingMenu

	local Margin = ScrW() * 0.01
	local Width = ScrW() * 0.2025
	local Button = Frame:Add("gRust.Button")
	Button:SetWide(Width - Margin * 0.5)
	Button:SetTall(ScrH() * 0.0675)
	Button:SetPos(ScrW() * 0.5 - (Width * 0.5) - Margin * 0.5)
	Button.DoClick = function(me)
		gRust.CloseCrafting()
		gRust.OpenInventory()
	end
	Button.PaintOver = function(me, w, h)
		draw.SimpleText("INVENTORY", "gRust.53px", w * 0.55, h * 0.5, Color(243, 243, 243, 150), 1, 1)
		
		local Padding = h * 0.15
		surface.SetDrawColor(243, 243, 243, 150)
		surface.SetMaterial(gRust.GetIcon("exit"))
		surface.DrawTexturedRect(Padding * 2, Padding, h - Padding * 2, h - Padding * 2)
	end
end

local function LeftPanel()
	local Frame = gRust.CraftingMenu
	local pl = LocalPlayer()
	
	local Panel = Frame:Add("Panel")
	Panel:Dock(LEFT)
	Panel:SetWide(LeftWidth)
	Panel:DockMargin(0, 0, Spacing, 0)

	local CraftQueue = Panel:Add("Panel")
	CraftQueue:Dock(BOTTOM)
	CraftQueue:SetTall(ScrH() * 0.1)
	CraftQueue:DockMargin(0, Spacing, 0, 0)
	CraftQueue.Paint = function(me, w, h)
		DrawPanel(me, w, h)
		draw.SimpleText("CRAFTING QUEUE", "gRust.130px", w * 0.015, h *0.5, Color(255, 255, 255, 7), 0, 1)
	end
	CraftQueue.Queue = {}
	local function UpdateQueue()
		for k, v in ipairs(CraftQueue.Queue) do
			v:Remove()
		end

		local Queue = LocalPlayer().CraftQueue
		for i = 1, #Queue do
			local Panel = CraftQueue:Add("DPanel")
			Panel:Dock(RIGHT)
			Panel:SetWide(ScrH() * 0.1)

			CraftQueue.Queue[#CraftQueue.Queue + 1] = Panel
		end
	end

	local Categories = Panel:Add("Panel")
	Categories:Dock(LEFT)
	Categories:SetWide(ScrW() * 0.1085)
	Categories:DockMargin(0, 0, Spacing, 0)
	Categories:InvalidateLayout()
	Categories.Paint = DrawPanel

	local Items = Panel:Add("gRust.Grid")
	Items:Dock(FILL)
	Items:SetCols((ScrW() / ScrH()) < 1.5 and 4 or 5)
	--Items:SetRows(math.ceil())
	Items:SetRowTall(ScrH() * 0.1)
	Items:SetMargin(ScrH() * 0.01)
	Items:DockPadding(ScrH() * 0.015, ScrH() * 0.033, ScrH() * 0.015, 0)
	Items:NoClipping(true)
	Items.Paint = function(me, w, h)
		local AddSize = Anim.Bounce(Lerp((SysTime() - LastChange) / 0.1, 1, 0) - 2) * ScrH() * 0.004

		surface.SetDrawColor(80, 76, 70, 175)
		surface.DrawRect(-AddSize, -AddSize, w + AddSize * 2, h + AddSize * 2)
	end

	local function UpdateItems()
		local CraftItems = {}
		for k, v in pairs(gRust.Items) do
			if (v:GetCategory() ~= SelectedCategory) then continue end
			if (!v:GetCraft()) then continue end
	
			CraftItems[#CraftItems + 1] = v
		end
		
		table.sort(CraftItems, function(a, b)
			return pl:CanCraft(a, 1) and !pl:CanCraft(b, 1)
		end)

		for k, v in ipairs(CraftItems) do
			local Panel = Items:Add("gRust.Button")
			local IconMargin = ScrH() * 0.005
			Panel:SetDefaultColor(Color(0, 0, 0, 0))
			Panel:SetHoveredColor(Color(225, 225, 225, 10))
			Panel:SetActiveColor(Color(255, 255, 255, 10))
			Panel.PaintOver = function(me, w, h)
				surface.SetDrawColor(255, 255, 255, pl:CanCraft(v, 1) and 255 or 100)
				surface.SetMaterial(Material(v:GetIcon(), "smooth"))
				surface.DrawTexturedRect(IconMargin, IconMargin, w - IconMargin * 2, h - IconMargin * 2)
			
				local LockMargin = ScrH() * 0.015
				if (v:GetBlueprint() and !pl:HasBlueprint(v:GetClass())) then
					surface.SetDrawColor(255, 255, 255, 150)
					surface.SetMaterial(LockIcon)
					surface.DrawTexturedRect(LockMargin, LockMargin, w - LockMargin * 2, h - LockMargin * 2)
				end
				
				if (v:GetPurchasable()) then
					surface.SetDrawColor(255, 174, 0)
					draw.NoTexture()
					surface.DrawTexturedRectRotated(0, 0, w, ScrH() * 0.05, 45)
	
					surface.SetDrawColor(255, 255, 255)
					surface.SetMaterial(gRust.GetIcon("star"))
					surface.DrawTexturedRect(ScrH() * 0.001, ScrH() * 0.001, ScrH() * 0.0205, ScrH() * 0.0205)
				end
			end
			Panel.DoClick = function(me)
				SelectedItem = v
				CraftAmount = 1
				UpdateSkins()
			end
		end
	end
	UpdateItems()

	local Cats = gRust.Categories
	local n = #Cats

	for i = 1, n do
		local Cat = Cats[i]

		local Button = Categories:Add("gRust.Button")
		Button:Dock(TOP)
		Button:SetTall(ScrH() * 0.06)
		Button:SetDefaultColor(Color(155, 149, 141))
		Button:SetHoveredColor(Color(222, 212, 202))
		Button:SetActiveColor(Color(245, 245, 245))
		Button:NoClipping(true)
		local IconPadding = ScrH() * 0.0125
		local SelectedMarginW = ScrH() * 0.01
		local SelectedMarginH = ScrH() * 0.0025
		Button.Paint = function(me, w, h)
			local UseColor = me:GetColor()

			if (SelectedCategory == Cat.name) then
				UseColor = me:GetActiveColor()
				surface.SetDrawColor(58, 131, 188, 200)
				surface.DrawRect(-SelectedMarginW, -SelectedMarginH, Lerp((SysTime() - LastChange) / 0.075, 0, w + (SelectedMarginW * 2)), h + (SelectedMarginH * 2))
			end

			draw.SimpleText(string.upper(Cat.name), "gRust.32px", h, h * 0.5, UseColor, 0, 1)

			surface.SetDrawColor(Color(UseColor.r - 55, UseColor.g - 55, UseColor.b - 55))
			surface.SetMaterial(Cat.icon)
			surface.DrawTexturedRect(IconPadding, IconPadding, h - IconPadding * 2, h - IconPadding * 2)
		end
		Button.DoClick = function(me)
			if (SelectedCategory == Cat.name) then return end 
			SelectedCategory = Cat.name
			LastChange = SysTime()

			LocalPlayer():EmitSound("ui.piemenu.select")
			UpdateItems()
			UpdateSkins()
		end
	end

	local Search = Panel:Add("Panel")
	Search:Dock(BOTTOM)
	Search:SetTall(ScrH() * 0.044)
	Search:DockMargin(0, Spacing, 0, 0)
	Search.Paint = DrawPanel
end

local TextFields = {
	[1] = "AMOUNT",
	[2] = "ITEM TYPE",
	[3] = "TOTAL",
	[4] = "HAVE"
}

local function RightPanel()
	local Frame = gRust.CraftingMenu
	
	local Panel = Frame:Add("Panel")
	Panel:Dock(FILL)
	Panel.Item = SelectedItem

	local Craft = Panel:Add("Panel")
	Craft:Dock(BOTTOM)
	Craft:SetTall(ScrH() * 0.2175)
	Craft:DockMargin(0, Spacing, 0, 0)
	Craft.Paint = DrawPanel

	local Ingredients = Craft:Add("gRust.Table")
	Ingredients:Dock(FILL)
	Ingredients:SetCols(4)
	Ingredients:SetRows(5)
	Ingredients:SetMargin(2)
	Ingredients:SetColWide(nil, ScrW() * 0.175, nil, nil)
	Ingredients:DockPadding(Spacing, 0, Spacing, 0)
	for x = 1, 5 do
		for y = 1, 4 do
			local Panel = Ingredients:Add("Panel")
			Panel.Paint = function(me, w, h)
				local CD = SelectedItem:GetCraft()
				if (!CD) then return end

				if (x == 1) then
					draw.SimpleText(TextFields[y], "gRust.28px", w * 0.5, h * 0.5, Color(200, 200, 200, 200), 1, 1)
				else
					local CID = CD[x - 1]
					if (x <= 5 and CID) then
						surface.SetDrawColor(15, 15, 15, 125)
						local NeedAmount = CID.amount * CraftAmount
						
						local Text = CID.amount
						if (y == 2) then
							Text = gRust.Items[CID.item]:GetName()
						end

						if (y == 3) then
							Text = NeedAmount
						end

						if (y == 4) then
							Text = LocalPlayer():ItemCount(CID.item)
						end

						local Col = LocalPlayer():HasItem(CID.item, NeedAmount) and Color(255, 255, 255) or Color(218, 215, 77)
						draw.SimpleText(Text, "gRust.30px", w * 0.5, h * 0.5, Col, 1, 1)
					else
						surface.SetDrawColor(15, 15, 15, 75)
					end

					surface.DrawRect(0, 0, w, h)
				end
			end
		end
	end
	
	local ButtonPadding = ScrH() * 0.006
	local CraftButtons = Craft:Add("Panel")
	CraftButtons:Dock(BOTTOM)
	CraftButtons:SetTall(ScrH() * 0.0549)
	CraftButtons:DockPadding(ButtonPadding, ButtonPadding, ButtonPadding, ButtonPadding)

	local CraftButton = CraftButtons:Add("gRust.Button")
	CraftButton:Dock(RIGHT)
	CraftButton:SetWide(ScrW() * 0.075)
	CraftButton:SetText("CRAFT")
	CraftButton:SetFont("gRust.36px")
	CraftButton:SetTextColor(Color(225, 225, 225, 255))
	CraftButton.DoClick = function(me)
		if (LocalPlayer():GetWorkbenchTier() < (SelectedItem:GetTier() or -1)) then
			TierAnimStart = CurTime()
			return
		end

		gRust.RequestCraft(SelectedItem:GetClass(), CraftAmount, SelectedSkin)
	end

	local NegateAmount = CraftButtons:Add("gRust.Button")
	NegateAmount:Dock(LEFT)
	NegateAmount:SetWide(ScrW() * 0.03)
	NegateAmount:SetText("-")
	NegateAmount:SetFont("gRust.46px")
	NegateAmount:SetTextColor(Color(225, 225, 225, 255))
	NegateAmount.DoClick = function(me)
		CraftAmount = math.Clamp(CraftAmount - 1, 1, 10)
	end

	local SideMargin = ScrH() * 0.005
	local Amount = CraftButtons:Add("gRust.Label")
	Amount:Dock(LEFT)
	Amount:SetWide(ScrW() * 0.04)
	Amount:SetText(CraftAmount)
	Amount:SetTextSize(30)
	Amount:SetColor(Color(0, 0, 0, 150))
	Amount:SetTextColor(Color(225, 225, 225, 255))
	Amount:DockMargin(SideMargin, 0, SideMargin, 0)
	Amount.Think = function(me)
		me:SetText(CraftAmount)
	end
	Amount.PerformLayout = function(me)
	end

	local AddAmount = CraftButtons:Add("gRust.Button")
	AddAmount:Dock(LEFT)
	AddAmount:SetWide(ScrW() * 0.03)
	AddAmount:SetText("+")
	AddAmount:SetFont("gRust.46px")
	AddAmount:SetTextColor(Color(225, 225, 225, 255))
	AddAmount.DoClick = function(me)
		CraftAmount = math.Clamp(CraftAmount + 1, 1, math.min(SelectedItem:GetStack(), 10))
	end
	
	local Tall = ScrH() * 0.2035
	local Padding = ScrH() * 0.03
	local Skins = Panel:Add("Panel")
	Skins:Dock(BOTTOM)
	Skins:SetTall(Tall)
	Skins:DockPadding(Padding, Padding, Padding, Padding)
	Skins:DockMargin(0, Spacing, 0, 0)
	Skins.Paint = DrawPanel

	local SkinButtons = {}
	UpdateSkins = function()
		for k, v in ipairs(SkinButtons) do
			v:Remove()
		end

		if (!LocalPlayer().Skins) then return end
		for k, v in pairs(LocalPlayer().Skins) do
			local SkinData = gRust.Skins[k]
			if (!SkinData) then continue end
			if (SkinData.ent ~= SelectedItem:GetClass()) then continue end

			local Button = Skins:Add("gRust.Button")
			Button:Dock(LEFT)
			local NoColor = Color(0, 0,0 ,0)
			Button:SetDefaultColor(NoColor)
			Button:SetHoveredColor(Color(255, 255, 255, 5))
			Button:SetActiveColor(NoColor)
			Button:SetWide(Tall - Padding * 2)
			Button:DockMargin(0, 0, Padding, 0)
			Button.DoClick = function()
				SelectedSkin = k
				for k, v in ipairs(SkinButtons) do
					if (!IsValid(v)) then continue end
					v:SetColor(NoColor)
				end
			end
			Button.Think = function()
				if (SelectedSkin == k) then
					Button:SetColor(Color(255, 255, 255, 15))
				end
			end

			SkinButtons[#SkinButtons + 1] = Button
		end
	end
	UpdateSkins()

	local Info = Panel:Add("Panel")
	Info:Dock(FILL)
	Info.Paint = DrawPanel

	local TopPadding = ScrH() * 0.005
	local Top = Info:Add("Panel")
	Top:Dock(TOP)
	Top:SetTall(ScrH() * 0.085)
	Top:DockPadding(TopPadding * 3.5, TopPadding, TopPadding, TopPadding)

	local Icon = Top:Add("DImage")
	Icon:Dock(LEFT)
	Icon:SetWide(Top:GetTall() - TopPadding * 2)
	Icon:SetImage(SelectedItem:GetIcon())

	local Text = Top:Add("DLabel")
	Text:Dock(FILL)
	Text:SetText(string.upper(SelectedItem:GetName()))
	Text:SetFont("gRust.56px")
	Text:SetColor(Color(255, 255, 255))
	Text:SetContentAlignment(5)

	local Stats = Top:Add("Panel")
	Stats:Dock(RIGHT)
	Stats:SetWide(ScrW() * 0.055)

	local Margin = ScrH() * 0.004
	
	local BgColor = ColorAlpha(gRust.Colors.Background, 150)

	local Time = Stats:Add("gRust.Label")
	Time:Dock(TOP)
	Time:SetColor(BgColor)
	Time:SetText(string.format("%.1f", SelectedItem:GetCraftTime()))
	Time:SetTextSize(30)

	local Amount = Stats:Add("gRust.Label")
	Amount:Dock(TOP)
	Amount:SetColor(BgColor)
	Amount:SetText("x" .. SelectedItem:GetCraftAmount())
	Amount:SetTextSize(30)

	Stats.PerformLayout = function()
		Time:SetTall(Stats:GetTall() * 0.5 - Margin)
		Time:DockMargin(0, 0, 0, Margin * 0.5)
		Amount:SetTall(Stats:GetTall() * 0.5)
		Amount:DockMargin(0, Margin, 0, 0)
	end

	local Tier = Info:Add("gRust.Label")
	Tier:SetTall(ScrH() * 0.035)
	Tier:Dock(TOP)
	Tier:SetRounding(8)
	Tier:SetText("WORKBENCH LEVEL _ REQUIRED")
	Tier:SetTextSize(40)
	local OldPerformLayout = Tier.PerformLayout
	Tier.PerformLayout = function(...)
		OldPerformLayout(...)
		Tier:DockMargin((Top:GetWide() * 0.5) - Tier:GetWide() * 0.5, 0, 0, 0)
	end
	local OldPaint = Tier.Paint
	Tier.Paint = function(me, w, h)
		local Text
		local TierN = SelectedItem:GetTier()
		if (TierN) then
			Text = "WORKBENCH LEVEL %i REQUIRED"
		elseif (SelectedItem:GetPurchasable()) then
			Text = "PURCHASABLE ITEM [STORE.GRUST.CO]"
		end

		if (!Text) then return end
		local Colors = TierColors[TierN or 4]
		Tier:SetText(string.format(Text, TierN))
		Tier:SetTextColor(Colors.Text)
		Tier:SetColor(Colors.Background)
		OldPaint(me, w, h)

		local Anim = (CurTime() - TierAnimStart) < 0.35 and math.sin((CurTime() - TierAnimStart) * math.pi * 12) * 10 or 0
		Tier:DockMargin((Top:GetWide() * 0.5) - Tier:GetWide() * 0.5 + Anim, 0, 0, 0)
	end
		
	Panel.Think = function(me)
		if (SelectedItem == me.Item) then return end
		Icon:SetImage(SelectedItem:GetIcon())
		Text:SetText(string.upper(SelectedItem:GetName()))
		me.Item = SelectedItem
	end
end

local MoveTime = 0.125
function gRust.OpenCrafting()
	if (IsValid(gRust.CraftingMenu)) then return end
	if (IsValid(gRust.Inventory)) then
		gRust.CloseInventory()
	end

	local scrw, scrh = ScrW(), ScrH()

	local Frame = vgui.Create("Panel")
	Frame:SetSize(scrw, scrh)
	Frame:SetAlpha(0)
	Frame:SetX(InitialPos)
	Frame:DockPadding(LeftMargin, TopMargin, RightMargin, BottomMargin)
	Frame:AlphaTo(255, MoveTime, 0)
	Frame:MoveTo(0, 0, MoveTime, 0, 0.5)
	Frame.Paint = function(me, w, h)
		surface.SetDrawColor(26, 25, 22, 245)
		surface.DrawRect(0, 0, w, h)

		me:DrawBlur(6)
	end

	gui.EnableScreenClicker(true)
	gRust.CraftingMenu = Frame
	LeftPanel()
	RightPanel()

	InventoryButton()
end

function gRust.CloseCrafting()
	local Frame = gRust.CraftingMenu
	if (!IsValid(Frame)) then return end

	gui.EnableScreenClicker(false)
	Frame:AlphaTo(0, MoveTime, 0)
	Frame:MoveTo(InitialPos, 0, MoveTime, 0, 0.5, function()
		Frame:Remove()
	end)
end

gRust.AddBind("+menu", function(pl)
	if (IsValid(gRust.CraftingMenu)) then
		gRust.CloseCrafting()
	else
		gRust.OpenCrafting()
	end
end)

