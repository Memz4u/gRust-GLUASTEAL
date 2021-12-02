-- "gamemodes\\rust\\gamemode\\core\\ui\\notifications\\ui_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local TypeClasses =
{
	[NOTIFICATION_PICKUP] = "pickup",
	[NOTIFICATION_BUILDBLOCK] = "disallow",
	[NOTIFICATION_REMOVE] = "remove"
}

local NotifCSS =
[[
	<style>

	@import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@700&display=swap');

	*
	{
		margin: 0;
		padding: 0;
		overflow: hidden;
	}

	.notifications
	{
		position: relative;
	}

	ul
	{
		position: absolute;
		bottom: 0;
		left: 0;
		width: 100%;
	}

	li
	{
		list-style: none;
		background: #d1703c;
		color: #fff;
		height: 0;
		line-height: 3.25rem;
		width: 100%;
		font-family: "Roboto Condensed";
		font-size: 1.625rem;
		font-weight: 600;

		margin: 2px 0;

		-webkit-transition: 0.25s;
		opacity: 0
	}

	li p
	{
		float: right;
		margin-right: 1rem;
		font-weight: 800;
	}

	li h1
	{
		margin-left: 0.5rem;
		font-size: 1.625rem;
		float:left;
	}

	li img
	{
		float:left;
		width: 2.75rem;
		height: 2.75rem;
		margin-left: 0.25rem;
		margin-top: 0.25rem;
	}

	li.show
	{
		height: 3.25rem;
		opacity: 1;
	}

	li.hide
	{
		height: 0px;
		-webkit-transition: all 0.35s ease-out;

		opacity: 0;
	}

	li.pickup
	{
		background: #577238;
		color: #fff;
	}

	li.pickup img
	{
		
	}

	li.disallow
	{
		background: #C13D27;
	}

	li.remove
	{
		background: #5D1D11;
		color: #d6a098;
	}

	li.remove p
	{
		text-color;
	}
	
	</style>
]]

local NotifHTML =
[[
	<html>

	<div id="notifications">
		<ul id="list"></ul>
	</div>

	</html>
]]

local NotifJS =
[[
	<script>

	if (!('remove' in Element.prototype)) {
		Element.prototype.remove = function() {
			this.parentNode.removeChild(this);
		};
	}

	var Notifications = [];
	function AddNotification(text, type, image, side)
	{
		var list = document.getElementById("list");
		var notif = document.createElement("li");

		notif.innerHTML = "<h1>" + text + "</h1>";
		list.appendChild(notif);

		if (image)
		{
			notif.innerHTML = "<img src='" + image + "'>" + notif.innerHTML + "<p>" + side + "</p>";
		}

		notif.className = notif.className + " " + type
		
		setTimeout(function() {
			notif.className = notif.className + " show";
		}, 10)

		Notifications.push(notif);
	}

	function RemoveNotification(index)
	{
		var notif = Notifications[index];
		notif.className = notif.className + " hide";

		setTimeout(function()
		{
			notif.remove();
		}, 1000);
	}

	</script>
]]

local Notifications = 0
local scrw, scrh = ScrW(), ScrH()
local Spacing = 1
local Padding = scrh * 0.0035

local Width, Height = scrh * 0.266, (scrh * 0.1125 - Spacing) / 3
local Margin = scrh * 0.0225
local Tall = scrh * 0.6

function gRust.ReloadNotifications()
	if (IsValid(gRust.NotificationPanel)) then
		gRust.NotificationPanel:Remove()
	end

	local Panel = vgui.Create("DHTML")
	Panel:SetPos(scrw - Width - Margin, scrh - Margin - Tall - ((Height + Spacing / 3) * 3) - Spacing)
	Panel:SetSize(Width, Tall)
	Panel:NoClipping(true)
	Panel:SetHTML(NotifCSS..NotifJS..NotifHTML)
	
	gRust.NotificationPanel = Panel
end

function gRust.AddNotification(txt, class, icon, side)
	icon = string.format("https://grust.co/new/icons/%s.svg", icon)

	txt = string.upper(txt)
	Notifications = Notifications + 1

	gRust.NotificationPanel:RunJavascript(string.format([[AddNotification("%s", "%s", "%s", "%s");]], txt, TypeClasses[class], icon, side))
	local Index = Notifications - 1

	if (!gRust.NotificationHandles[class]) then
		timer.Simple(4, function()
			gRust.RemoveNotification(Index)
		end)
	else
		local Func = gRust.NotificationHandles[class]
		hook.Add("Think", "gRust.Notifications." .. Index, function()
			Func(Index)
		end)
	end
end

function gRust.RemoveNotification(index)
	gRust.NotificationPanel:RunJavascript(string.format([[RemoveNotification(%i);]], index))
	hook.Remove("Think", "gRust.Notifications." .. index)
end

gRust.ReloadNotifications()

--[[

local scrw, scrh = ScrW(), ScrH()
local Spacing = scrh * 0.002
local Padding = scrh * 0.0035

local Width, Height = scrh * 0.266, (scrh * 0.1125 - Spacing) / 3
local Margin = scrh * 0.0225
local Tall = scrh * 0.6

local NotificationTime = 2

function gRust.ReloadNotifications()
	if (IsValid(gRust.NotificationPanel)) then
		gRust.NotificationPanel:Remove()
	end

	local Panel = vgui.Create("Panel")
	Panel:SetPos(scrw - Width - Margin, scrh - (Height * 3) - Padding * 2 - Margin - Tall)
	Panel:SetSize(Width, Tall)
	Panel:NoClipping(true)
	
	gRust.NotificationPanel = Panel
end

local InAnimTime = 0.175
local OutAnimTime = 0.25
function gRust.AddNotification(value, type, side)
	if (isfunction(side)) then
		side = side()
	end

	local Type = gRust.NotificationTypes[type]
	if (!Type) then
		error("Tried to create unknown notification type: " .. type)
		return
	end

	local Panel = gRust.NotificationPanel:Add("Panel")
	Panel:SetTall(Height)
	Panel:SetWide(Width)

	local NotifCount = #gRust.NotificationPanel:GetChildren()
	Panel.StartY = Tall - ((Height + Spacing) * (NotifCount - 1))
	Panel:SetZPos(100 - NotifCount)
	Panel:SetAlpha(0)
	Panel:SetPos(0, Panel.StartY)
	Panel:MoveTo(0, Panel.StartY - Height, InAnimTime, 0)
	Panel:AlphaTo(255, InAnimTime, 0)

	Panel.Start = SysTime()

	Panel.Value = string.upper(value)
	Panel.Side = side
	
	Panel.Close = function(me)
		me:AlphaTo(0, OutAnimTime, 0)
		me:MoveTo(0, me.StartY, OutAnimTime, 0, -1, function()
			me:Remove()
		end)
	end
	Panel.Paint = function(me, w, h)
		surface.SetDrawColor(Type.Color)
		surface.DrawRect(0, 0, w, h)

		surface.SetDrawColor(Type.IconColor)
		surface.SetMaterial(Type.Icon)
		surface.DrawTexturedRect(0, 0, h, h)

		draw.SimpleText(me.Value, "gRust.35px", h + Spacing, h * 0.5, Color(255, 255, 255, 255), 0, 1)
		draw.SimpleText(me.Side, "gRust.30px", w - Padding * 3, h * 0.5, Color(255, 255, 255, 255), 2, 1)
	end
	Panel.Think = function(me)
		if (Type.Think) then
			Type.Think(me)
		end

		if (Type.Time and me.Start + Type.Time < SysTime()) then
			me:Close()
		end
	end
end

gRust.ReloadNotifications()]]

