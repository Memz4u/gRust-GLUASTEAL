-- "gamemodes\\rust\\gamemode\\core\\skins\\skins_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local function SyncSkins()
    local pl = LocalPlayer()

    pl.Skins = {}
    for i = 1, net.ReadUInt(16) do
        pl.Skins[net.ReadString()] = true
    end
end
net.Receive("gRust.SyncSkins", SyncSkins)

