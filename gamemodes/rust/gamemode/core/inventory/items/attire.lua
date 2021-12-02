-- "gamemodes\\rust\\gamemode\\core\\inventory\\items\\attire.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local Item

--
-- Hazmat Suit
--

Item = gRust.ItemRegister("hazmat_suit")
Item:SetName("Hazmat Suit")
Item:SetCategory("Clothing")
Item:SetStack(1)
Item:SetIcon("materials/items/clothing/hazmat.png")
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "tarp",
        amount = 5
    },
    {
        item = "sewing_kit",
        amount = 2
    },
    {
        item = "hq_metal",
        amount = 8
    }
})
gRust.RegisterItem(Item)

--
-- Scientist Suit
--

Item = gRust.ItemRegister("scientist_suit")
Item:SetName("Scientist Suit")
Item:SetCategory("Clothing")
Item:SetStack(1)
Item:SetIcon("materials/items/clothing/scientist.png")
gRust.RegisterItem(Item)

--
-- Hats
--

--
-- Ushanka Hat
--

Item = gRust.ItemRegister("ushanka_hat")
Item:SetName("Ushanka Hat")
Item:SetCategory("Clothing")
Item:SetStack(1)
Item:SetIcon("materials/items/clothing/ushanka_hat.png")
Item:SetPurchasable(true)
Item:SetCraft({
    {
        item = "cloth",
        amount = 20
    },
})
gRust.RegisterItem(Item)

--
-- Batman Mask
--

Item = gRust.ItemRegister("batman_mask")
Item:SetName("Batman Mask")
Item:SetCategory("Clothing")
Item:SetStack(1)
Item:SetIcon("materials/items/clothing/hazmat.png")
Item:SetPurchasable(true)
gRust.RegisterItem(Item)

--
-- Jason Mask
--

Item = gRust.ItemRegister("jason_mask")
Item:SetName("Jason Mask")
Item:SetCategory("Clothing")
Item:SetStack(1)
Item:SetIcon("materials/items/clothing/jason_mask.png")
Item:SetPurchasable(true)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 125
    }
})
gRust.RegisterItem(Item)

--
-- Pumpkin Head
--

Item = gRust.ItemRegister("pumpkin_head")
Item:SetName("Pumpkin Head")
Item:SetCategory("Clothing")
Item:SetStack(1)
Item:SetIcon("materials/items/clothing/pumpkin_head.png")
Item:SetPurchasable(true)
Item:SetCraft({
    {
        item = "cloth",
        amount = 15
    }
})
gRust.RegisterItem(Item)

--
-- Headcrab Hat
--

Item = gRust.ItemRegister("headcrab_hat")
Item:SetName("Headcrab Hat")
Item:SetCategory("Clothing")
Item:SetStack(1)
Item:SetIcon("materials/items/clothing/headcrab_hat.png")
Item:SetPurchasable(true)
Item:SetCraft({
    {
        item = "animal_fat",
        amount = 20
    }
})
gRust.RegisterItem(Item)

--
-- Witch Hat
--

Item = gRust.ItemRegister("witch_hat")
Item:SetName("Witch Hat")
Item:SetCategory("Clothing")
Item:SetStack(1)
Item:SetIcon("materials/items/clothing/witch_hat.png")
Item:SetPurchasable(true)
Item:SetCraft({
    {
        item = "cloth",
        amount = 10
    }
})
gRust.RegisterItem(Item)

