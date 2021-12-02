-- "gamemodes\\rust\\gamemode\\modules\\admin\\ranks_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local function SyncRanks()
    gRust.Ranks = {}
    for i = 1, net.ReadUInt(8) do
        gRust.Ranks[net.ReadString()] = net.ReadColor()
    end
end
net.Receive("gRust.SyncRanks", SyncRanks)

chat.O_AddText = chat.O_AddText or chat.AddText
function chat.AddText(...)
    local args = {...}
    local pl = args[1]
    if (IsEntity(pl) and pl:IsPlayer() and gRust.Ranks) then
        local Rank = gRust.Ranks[pl:GetNW2String("rank")]
        if (Rank) then
            chat.O_AddText(Rank, string.format("[%s] ", pl:GetNW2String("rank")), ...)
            return
        end
    end

    chat.O_AddText(...)
end

