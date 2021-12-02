-- "gamemodes\\rust\\gamemode\\core\\inventory\\inventory_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
--
-- Inventory
--

local PLAYER = FindMetaTable("Player")
function PLAYER:MoveSlot(from, to, old, new, amount)
    net.Start("gRust.Inventory.Move")
    net.WriteEntity(from)
    net.WriteEntity(to)
    net.WriteUInt(old, 6)
    net.WriteUInt(new, 6)
    net.WriteUInt(amount, 20)
    net.SendToServer()
end

--
-- Syncing
--

function PLAYER:RequestInventory(ent)
    net.Start("gRust.Inventory.Request")
    net.WriteEntity(ent)
    net.SendToServer()
end

function gRust.UpdateInventory()
    if (IsValid(gRust.Hotbar)) then
        gRust.Hotbar:SetEntity(LocalPlayer())
        gRust.Hotbar:Update() -- Update the Hotbar
    end

    if (IsValid(gRust.Inventory) && IsValid(gRust.Inventory.Slots)) then
        gRust.Inventory.Slots:Update() -- Update the inventory panel
        gRust.Inventory.Attire:Update()

        if (gRust.Inventory.Container) then
            gRust.Inventory.UpdateContainer()
        end
    end
end

local function SyncSlot()
    local ent = net.ReadEntity()
    if (!IsValid(ent)) then return end
    local pos = net.ReadUInt(6)
    local item = net.ReadItem()
    if (!ent.Inventory) then return end
    ent.Inventory[pos] = item

    gRust.UpdateInventory()
end

local function RemoveSlot()
    net.ReadEntity().Inventory[net.ReadUInt(6)] = nil

    gRust.UpdateInventory()
end
net.Receive("gRust.Inventory.SyncSlot", SyncSlot)
net.Receive("gRust.Inventory.Remove", RemoveSlot)

-- TODO: Deprecated, use gRust.Inventory.Request
local function SyncAll()
    local pl = LocalPlayer()

    pl.Inventory = {}
    
    for i = 1, net.ReadUInt(6) do
        pl.Inventory[net.ReadUInt(6)] = net.ReadItem()
    end

    pl.InventorySlots = net.ReadUInt(6)
    
    timer.Simple(0, function()
        gRust.UpdateInventory()
        gRust.UpdateHotbar()
    end)
end
net.Receive("gRust.Inventory.SyncAll", SyncAll)

local function CreateInventory()
    local pl = LocalPlayer()
    pl.Inventory = {}
    pl.InventorySlots = net.ReadUInt(6)
end
net.Receive("gRust.Inventory.Create", CreateInventory)

local function SyncEntityContainer()
    local pl = LocalPlayer()

    local ent = net.ReadEntity()
    ent.Inventory = {}

    for i = 1, net.ReadUInt(6) do
        ent.Inventory[net.ReadUInt(6)] = net.ReadItem()
    end
    
    ent.InventorySlots = net.ReadUInt(6)

    timer.Simple(0, function()
        gRust.UpdateInventory()
    end)
end
net.Receive("gRust.Inventory.Request", SyncEntityContainer)

