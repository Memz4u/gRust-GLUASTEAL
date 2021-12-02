-- "gamemodes\\rust\\gamemode\\core\\inventory\\items\\ammo.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local Item

--
-- Pistol Ammo
--

Item = gRust.ItemRegister("pistol_ammo")
Item:SetName("Pistol Ammo")
Item:SetCategory("Ammo")
Item:SetStack(128)
Item:SetIcon("materials/items/ammo/pistol_ammo.png")
Item:SetTier(1)
Item:SetBlueprint(75)
Item:SetCraftTime(3)
Item:SetCraftAmount(4)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 10
    },
    {
        item = "gunpowder",
        amount = 5
    }
})
gRust.RegisterItem(Item)

--
-- Rifle Ammo
--

Item = gRust.ItemRegister("rifle_ammo")
Item:SetName("Rifle Ammo")
Item:SetCategory("Ammo")
Item:SetStack(128)
Item:SetIcon("materials/items/ammo/rifle_ammo.png")
Item:SetTier(2)
Item:SetBlueprint(125)
Item:SetCraftTime(3)
Item:SetCraftAmount(3)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 10
    },
    {
        item = "gunpowder",
        amount = 5
    }
})
gRust.RegisterItem(Item)

--
-- Shotgun Ammo
--

Item = gRust.ItemRegister("shotgun_ammo")
Item:SetName("Shotgun Ammo")
Item:SetCategory("Ammo")
Item:SetStack(128)
Item:SetIcon("materials/items/ammo/shotgun_ammo.png")
Item:SetTier(2)
Item:SetBlueprint(75)
Item:SetCraftTime(3)
Item:SetCraftAmount(2)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 5
    },
    {
        item = "gunpowder",
        amount = 10
    }
})
gRust.RegisterItem(Item)

--
-- Arrow
--

Item = gRust.ItemRegister("arrow")
Item:SetName("Arrow")
Item:SetCategory("Ammo")
Item:SetStack(64)
Item:SetIcon("materials/items/ammo/arrow.png")
Item:SetCraftTime(3)
Item:SetCraftAmount(2)
Item:SetCraft({
    {
        item = "wood",
        amount = 25
    },
    {
        item = "stone",
        amount = 10
    }
})
gRust.RegisterItem(Item)

--
-- Nailgun Nails
--

Item = gRust.ItemRegister("nailgun_nails")
Item:SetName("Nailgun Nails")
Item:SetCategory("Ammo")
Item:SetStack(64)
Item:SetIcon("materials/items/ammo/nailgun_nails.png")
Item:SetCraftTime(3)
Item:SetCraftAmount(5)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 8
    }
})
gRust.RegisterItem(Item)

--
-- Handmade Shells
--

Item = gRust.ItemRegister("handmade_shells")
Item:SetName("Handmade Shells")
Item:SetCategory("Ammo")
Item:SetStack(64)
Item:SetIcon("materials/items/ammo/handmade_shell.png")
Item:SetCraftTime(3)
Item:SetCraftAmount(2)
Item:SetCraft({
    {
        item = "stone",
        amount = 5
    },
    {
        item = "gunpowder",
        amount = 5
    }
})
gRust.RegisterItem(Item)

