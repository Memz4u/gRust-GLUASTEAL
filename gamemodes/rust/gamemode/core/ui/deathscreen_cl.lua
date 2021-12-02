-- "gamemodes\\rust\\gamemode\\core\\ui\\deathscreen_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
gRust.LastDeath = SysTime()
local Colors = gRust.Colors

local view = {}
hook.Add("CalcView", "gRust.FPDeath", function(pl, origin, ang, fov, znear, zfar)
	if (pl:Health() > 0) then return end

	local Ragdoll = pl:GetRagdollEntity()
	if (!IsValid(Ragdoll)) then return end

	local Head = Ragdoll:GetAttachment(Ragdoll:LookupAttachment("eyes"))
	if (!Head.Pos) then return end

	view.origin = Head.Pos
	view.angles = Head.Ang

	return view
end)

local SleepingBagColors =
{
	{
		Default = Color(104, 54, 39),
		Hovered = Color(116, 59, 42),
		Active	= Color(136, 71, 51),
	},
	{
		Default = Color(58, 66, 42),
		Hovered = Color(71, 82, 49),
		Active	= Color(76, 90, 50),
	},
	{
		Default = Color(48, 83, 110),
		Hovered = Color(52, 92, 122),
		Active	= Color(51, 110, 155),
	}
}

local function ShowDeathScreen()
	gRust.CloseInventory()
	gRust.CloseCrafting()

	local Killer = net.ReadEntity()
	local pl = LocalPlayer()
	if (!IsValid(Killer)) then
		Killer = pl
	end

	local scrw, scrh = ScrW(), ScrH()

	local Frame = vgui.Create("Panel")
	Frame:Dock(FILL)
	Frame:SetAlpha(0)
	Frame:MakePopup()
	Frame:AlphaTo(255, 1, 1, function()
	
	end)

	local TopPanel = Frame:Add("DPanel")
	TopPanel:Dock(TOP)
	TopPanel:SetTall(scrh * 0.14)
	TopPanel.Paint = function(me, w, h)
		surface.SetDrawColor(Colors.Background)
		surface.DrawRect(0, 0, w, h)
		
		draw.SimpleText("DEAD", "gRust.96px", w * 0.093, h * 0.5, Color(255, 255, 255, 200), 0, 1)
	end

	do -- Stats
		local BoxCount = 0
		local function CreateBox(x, col, text1, text2)
			BoxCount = BoxCount + 1
			local Height = scrh * 0.045
			local YOffset = -scrh * 0.1
			local AnimTime = 0.75

			local Text = Frame:Add("DLabel")
			Text:SetX(x)
			Text:SetFont("gRust.24px")
			Text:SetText(text1)
			Text:SetWide(scrw * 0.1)
			Text:SetY(-scrh * 0.1)
			Text:SetTall(Height)
			Text.Start = SysTime() + 1.75 + (BoxCount * 0.5)
			Text.Think = function(me)
				local Lerped = Lerp((SysTime() - me.Start) / AnimTime, 0, 1)
				me:SetY(Anim.EaseOutBack(Lerped) * (math.abs(YOffset - (scrh * 0.02))) + YOffset)
			end

			local Panel = Frame:Add("gRust.Label")
			Panel:SetX(x)
			Panel:SetTextSize(35)
			Panel:SetText(text2)
			Panel:SetY(scrh * 0.07 - (Height * 0.5))
			Panel:SetTall(Height)
			Panel:SetColor(col)
			Panel.Start = SysTime() + 1.75 + (BoxCount * 0.5)
			Panel.Think = function(me)
				local Lerped = Lerp((SysTime() - me.Start) / AnimTime, 0, 1)
				me:SetY(Anim.EaseOutBack(Lerped) * (math.abs(YOffset - (scrh * 0.075 - (Height * 0.5)))) + YOffset)
			end
		end

		CreateBox(scrw * 0.315, gRust.Colors.Secondary, "ALIVE FOR", string.FormattedTime(SysTime() - gRust.LastDeath, "%01im %01is"))
		CreateBox(scrw * 0.45, gRust.Colors.Primary, "KILLED BY", Killer == pl and "Suicide" or Killer:Name())
		CreateBox(scrw * 0.575, gRust.Colors.Primary, "WITH A", IsValid(Killer:GetActiveWeapon()) and string.sub(Killer:GetActiveWeapon():GetClass(), 6) or "Nothing")
		CreateBox(scrw * 0.71, gRust.Colors.Surface, "AT A DISTANCE OF", string.format("%.1fm", math.Round(pl:GetPos():Distance(Killer:GetPos()) * 0.05, 1)))
	end

	local BottomPanel = Frame:Add("DPanel")
	BottomPanel:Dock(BOTTOM)
	BottomPanel:SetTall(scrh * 0.12)
	BottomPanel.Paint = function(me, w, h)
		surface.SetDrawColor(Colors.Background)
		surface.DrawRect(0, 0, w, h)
	end
	local VerticalPadding = ScrH() * 0.0235
	local HorizontalPadding = ScrW() * 0.052
	BottomPanel:DockPadding(HorizontalPadding, VerticalPadding, HorizontalPadding, VerticalPadding)

	local RespawnButton = BottomPanel:Add("gRust.Button")
	RespawnButton:Dock(RIGHT)
	RespawnButton:SetWide(scrw * 0.124)
	RespawnButton:SetText("RESPAWN >>")
	RespawnButton:SetFont("gRust.55px")
	RespawnButton:SetDefaultColor(Color(46, 53, 36))
	RespawnButton:SetHoveredColor(Color(65, 74, 40))
	RespawnButton:SetActiveColor(Color(81, 94, 51))
	RespawnButton:SetTextColor(Color(105, 122, 57, 255))
	RespawnButton.DoClick = function(me)
		net.Start("gRust.Respawn")
		net.SendToServer()
		Frame:Remove()
	end

	if (pl.SleepingBags) then
		for i, v in ipairs(pl.SleepingBags) do
			local Bag = ents.GetByIndex(v)
			local Colors = SleepingBagColors[1 + (i % 3)]

			local SleepingBag = BottomPanel:Add("gRust.Button")
			SleepingBag:Dock(LEFT)
			SleepingBag:SetWide(scrw * 0.11)
			SleepingBag:SetText("RESPAWN >>")
			SleepingBag:SetFont("gRust.45px")
			SleepingBag:DockMargin(i == 1 and 0 or scrw * 0.01, 0, 0, 0)
			local Name = Bag.GetBagName and Bag:GetBagName() or ""
			if (string.len(Name) > 10) then
				Name = string.sub(Name, 1, 10) .. "..."
			end
			SleepingBag.Think = function()
				if (!Bag.GetLastRespawn) then return end
				local LastRespawn = Bag:GetLastRespawn()
				if (LastRespawn + Bag.RespawnDelay > CurTime()) then
					SleepingBag:SetText(string.format("%s [%i]", Name, (LastRespawn + Bag.RespawnDelay) - CurTime()))
					SleepingBag:SetWide(scrw * 0.14)
				else
					SleepingBag:SetText(Name)
					SleepingBag:SetWide(scrw * 0.11)
				end
			end

			SleepingBag:SetText(Name)
			
			SleepingBag:SetDefaultColor(Colors.Default)
			SleepingBag:SetHoveredColor(Colors.Hovered)
			SleepingBag:SetActiveColor(Colors.Active)
			SleepingBag.DoClick = function()
				local LastRespawn = Bag:GetLastRespawn()
				if (LastRespawn + Bag.RespawnDelay > CurTime()) then
					return
				end

				net.Start("gRust.BagRespawn")
				net.WriteUInt(v, 13)
				net.SendToServer()
				
				Frame:Remove()
			end
		end
	end

	gRust.LastDeath = SysTime()
end

net.Receive("gRust.DeathScreen", ShowDeathScreen)

