-- "gamemodes\\rust\\gamemode\\core\\player\\player_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
hook.Add("InitPostEntity", "gRust.SendNetReady", function()
    net.Start("gRust.NetReady")
    net.SendToServer()
end)

local PLAYER = FindMetaTable("Player")
function PLAYER:Interact(ent)
    ent = ent or self:GetEyeTraceNoCursor().Entity

    net.Start("gRust.Interact")
    net.WriteEntity(ent)
    net.SendToServer()
end

