-- "gamemodes\\rust\\gamemode\\core\\ui\\notifications\\notifications_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local function AddNotify()
    gRust.AddNotification(net.ReadString(), net.ReadUInt(4), net.ReadString(), net.ReadString())
end
net.Receive("gRust.Notify", AddNotify)

