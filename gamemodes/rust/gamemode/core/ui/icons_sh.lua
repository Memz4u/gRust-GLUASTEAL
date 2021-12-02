-- "gamemodes\\rust\\gamemode\\core\\ui\\icons_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local Icons = {}

function gRust.CreateIcon(name, dir)
    Icons[name] = Material(dir, "smooth")
end

function gRust.GetIcon(name)
    return Icons[name]
end

gRust.CreateIcon("health", "icons/health.png")
gRust.CreateIcon("cup", "icons/cup.png")
gRust.CreateIcon("food", "icons/food.png")
gRust.CreateIcon("circle", "icons/circle.png")
gRust.CreateIcon("open", "icons/open.png")
gRust.CreateIcon("loot", "icons/player_loot.png")
gRust.CreateIcon("give", "icons/give.png")
gRust.CreateIcon("construction", "icons/construction.png")
gRust.CreateIcon("enter", "icons/enter.png")
gRust.CreateIcon("exit", "icons/exit.png")
gRust.CreateIcon("x", "icons/close.png")
gRust.CreateIcon("sleeping", "icons/sleeping.png")
gRust.CreateIcon("sleepingbag", "icons/sleepingbag.png")
gRust.CreateIcon("power", "icons/power.png")
gRust.CreateIcon("servers", "icons/power.png")
gRust.CreateIcon("voice", "icons/voice.png")
gRust.CreateIcon("pickup", "icons/pickup.png")
gRust.CreateIcon("dots", "icons/dots.png")
gRust.CreateIcon("lock", "icons/lock.png")
gRust.CreateIcon("unlock", "icons/unlock.png")
gRust.CreateIcon("door", "icons/open_door.png")
gRust.CreateIcon("gear", "icons/gear.png")
gRust.CreateIcon("add", "icons/add.png")
gRust.CreateIcon("deauthorize", "icons/deauthorize.png")
gRust.CreateIcon("clearlist", "icons/clear_list.png")
gRust.CreateIcon("changecode", "icons/change_code.png")
gRust.CreateIcon("knock", "icons/knock.png")
gRust.CreateIcon("info", "icons/info.png")
gRust.CreateIcon("star", "icons/star.png")

gRust.CreateIcon("player_marker", "icons/player_marker.png")
gRust.CreateIcon("death_marker", "icons/death_marker.png")
gRust.CreateIcon("waypoint", "icons/waypoint.png")

