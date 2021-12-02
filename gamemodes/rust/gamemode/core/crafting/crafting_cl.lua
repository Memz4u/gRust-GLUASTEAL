-- "gamemodes\\rust\\gamemode\\core\\crafting\\crafting_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
function gRust.RequestCraft(item, amount, skin)
    net.Start("gRust.Craft")
        net.WriteString(item)
        net.WriteUInt(amount, 7)
        net.WriteString(skin)
    net.SendToServer()
end

