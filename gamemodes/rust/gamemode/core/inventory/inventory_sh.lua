-- "gamemodes\\rust\\gamemode\\core\\inventory\\inventory_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local ENTITY = FindMetaTable("Entity")
function ENTITY:SetSlot(item, slot)
    if (!self.Inventory) then return end
    self.Inventory[slot] = item

    if (SERVER) then
        self:SyncSlot(slot)
    end
end

function ENTITY:ItemCount(item)
    if (!self.Inventory) then return 0 end
    
    local Count = 0
    for i = 1, self.InventorySlots do
        local v = self.Inventory[i]
        if (item and (!v or v:GetItem() ~= item)) then continue end

        Count = Count + (v and v:GetQuantity() or 0)
    end

    return Count
end

function ENTITY:OccupiedSlots()
    if (!self.Inventory) then return 0 end
    
    local Count = 0
    for i = 1, self.InventorySlots do
        if (self.Inventory[i]) then
            Count = Count + 1
        end
    end

    return Count
end

function ENTITY:HasItem(item, amount)
    if (!self.Inventory) then return end
    amount = amount or 1

    return self:ItemCount(item) >= amount
end

function ENTITY:FindEmptySlot(from, to, item)
    if (!self.Inventory) then return end

    from = from or 1
    to = to or self.InventorySlots

    if (item) then
        local FreeSlot
        for i = from, to do
            if (!self.Inventory[i]) then
                if (FreeSlot) then continue end
                FreeSlot = i
            elseif (self.Inventory[i]:GetItem() == item:GetItem()) then
                if (self.Inventory[i]:CanStack(item)) then
                    return i
                end
            end
        end

        return FreeSlot
    else
        for i = from, to do
            if (!self.Inventory[i]) then return i end
        end
    end
end

