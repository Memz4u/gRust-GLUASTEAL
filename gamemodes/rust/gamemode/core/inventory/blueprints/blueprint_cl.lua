-- "gamemodes\\rust\\gamemode\\core\\inventory\\blueprints\\blueprint_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local PLAYER = FindMetaTable("Player")

net.Receive("gRust.SyncBlueprints", function()
    local pl = LocalPlayer()
    pl.Blueprints = {}
    
    for i = 1, net.ReadUInt(16) do
        pl.Blueprints[net.ReadString()] = true
    end
end)

net.Receive("gRust.AddBlueprint", function()
    local pl = LocalPlayer()
    
    pl.Blueprints[net.ReadString()] = true
end)

