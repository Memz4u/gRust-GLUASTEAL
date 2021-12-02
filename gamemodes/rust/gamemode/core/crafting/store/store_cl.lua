-- "gamemodes\\rust\\gamemode\\core\\crafting\\store\\store_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local function GiveItem()
    local pl = LocalPlayer()
    pl.PurchasedItems[net.ReadString()] = true
end
net.Receive("gRust.GivePurchasableItem", GiveItem)

local function SyncItems()
    local pl = LocalPlayer()

    pl.PurchasedItems = {}
    for i = 1, net.ReadUInt(14) do
        pl.PurchasedItems[net.ReadString()] = true
    end
end
net.Receive("gRust.SyncPurchasableItems", SyncItems)

