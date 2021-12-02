-- "gamemodes\\rust\\gamemode\\core\\inventory\\items\\_categories.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
gRust.Categories = {}
function gRust.CreateCategory(name, icon)
    gRust.Categories[#gRust.Categories + 1] = {name = name, icon = Material(icon)}
end

--gRust.CreateCategory("Common", "icons/servers.png")
gRust.CreateCategory("Construction", "icons/servers.png")
gRust.CreateCategory("Items", "icons/servers.png")
gRust.CreateCategory("Resources", "icons/servers.png")
gRust.CreateCategory("Clothing", "icons/servers.png")
gRust.CreateCategory("Tools", "icons/servers.png")
gRust.CreateCategory("Medical", "icons/servers.png")
gRust.CreateCategory("Weapons", "icons/servers.png")
gRust.CreateCategory("Ammo", "icons/servers.png")
gRust.CreateCategory("Explosives", "icons/servers.png")
--gRust.CreateCategory("Other", "icons/dots.png")


