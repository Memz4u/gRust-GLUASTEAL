-- "gamemodes\\rust\\gamemode\\core\\crafting\\store\\store_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local PLAYER = FindMetaTable("Player")
function PLAYER:HasPurchasableItem(class)
    if (!gRust.Items[class]:GetPurchasable()) then
        return true
    end

    return self.PurchasedItems and self.PurchasedItems[class]
end

