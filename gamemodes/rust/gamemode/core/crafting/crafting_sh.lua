-- "gamemodes\\rust\\gamemode\\core\\crafting\\crafting_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local PLAYER = FindMetaTable("Player")

function PLAYER:CanCraft(itemdata, amount)
    amount = amount or 1
    local CanCraft = true

    for k, v in ipairs(itemdata:GetCraft()) do
        if (!self:HasItem(v.item, v.amount * amount)) then
            CanCraft = false
        end
    end

    return CanCraft and self:HasBlueprint(itemdata:GetClass()) and self:HasPurchasableItem(itemdata:GetClass())
end

