-- "gamemodes\\rust\\gamemode\\core\\ui\\notifications\\notifications_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
NOTIFICATION_PICKUP     = 0
NOTIFICATION_CRAFT      = 1
NOTIFICATION_REMOVE     = 2
NOTIFICATION_BUILDBLOCK = 3

gRust.NotificationHandles = {}
function gRust.AddNotificationHandle(name, func)
    gRust.NotificationHandles[name] = func
end

gRust.AddNotificationHandle(NOTIFICATION_BUILDBLOCK, function(index)
    if (!LocalPlayer():GetNW2Bool("gRust.BuildingBlocked")) then
        gRust.RemoveNotification(index)
    end
end)

--[[
gRust.AddNotificationType(NOTIFICATION_PICKUP, {
    Color = Color(87, 114, 56), -- The background color of the notification
    Icon = gRust.GetIcon("pickup"), -- The left icon
    IconColor = Color(195, 255, 0), -- The solid color of the icon
    Time = 2, -- The amount of time the notification will stay on your screen
})

gRust.AddNotificationType(NOTIFICATION_REMOVE, {
    Color = Color(95, 16, 16), -- The background color of the notification
    Icon = gRust.GetIcon("exit"), -- The left icon
    IconColor = Color(180, 0, 0), -- The solid color of the icon
    Time = 2, -- The amount of time the notification will stay on your screen
})

gRust.AddNotificationType(NOTIFICATION_CRAFT, {
    Color = Color(21, 76, 122),
    Icon = gRust.GetIcon("gear"),
    IconColor = Color(39, 104, 158),
    Think = function(panel)
        if (!panel.CraftTime) then
            panel.CraftTime = panel.Side
        end

        panel.Side = math.abs(math.ceil(panel.CraftTime - (SysTime() - panel.Start)))
        if (panel.Side <= 0) then
            panel:Close()
        end
    end,
})

gRust.AddNotificationType(NOTIFICATION_BUILDBLOCK, {
    Color = Color(95, 16, 16),
    Icon = gRust.GetIcon("construction"),
    IconColor = Color(180, 0, 0),
    Think = function(panel)
        if (!LocalPlayer():GetNW2Bool("gRust.BuildingBlocked")) then
            panel:Close()
        end
    end,
})]]

