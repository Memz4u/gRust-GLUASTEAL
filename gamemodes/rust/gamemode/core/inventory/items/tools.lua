-- "gamemodes\\rust\\gamemode\\core\\inventory\\items\\tools.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local Item

--
-- Rock
--

Item = gRust.ItemRegister("rock")
Item:SetName("Rock")
Item:SetCategory("Tools")
Item:SetStack(1)
Item:SetIcon("materials/items/tools/rock.png")
Item:SetWeapon("rust_rock")
Item:SetCraft({
    {
        item = "stone",
        amount = 10
    }
})
gRust.RegisterItem(Item)

--
-- Stone hatchet
--

Item = gRust.ItemRegister("stone_hatchet")
Item:SetName("Stone Hatchet")
Item:SetCategory("Tools")
Item:SetStack(1)
Item:SetIcon("materials/items/tools/stone_hatchet.png")
Item:SetWeapon("rust_stonehatchet")
Item:SetCraft({
    {
        item = "wood",
        amount = 200,
    },
    {
        item = "stone",
        amount = 100
    }
})
gRust.RegisterItem(Item)

--
-- Stone pickaxe
--

Item = gRust.ItemRegister("stone_pickaxe")
Item:SetName("Stone Pickaxe")
Item:SetCategory("Tools")
Item:SetStack(1)
Item:SetIcon("materials/items/tools/stone_pickaxe.png")
Item:SetWeapon("rust_stonepickaxe")
Item:SetCraft({
    {
        item = "wood",
        amount = 200,
    },
    {
        item = "stone",
        amount = 100
    }
})
gRust.RegisterItem(Item)

--
-- Building Plan
--

Item = gRust.ItemRegister("building_plan")
Item:SetName("Building Plan")
Item:SetCategory("Construction")
Item:SetStack(1)
Item:SetIcon("materials/items/tools/building_plan.png")
Item:SetWeapon("rust_buildingplan")
Item:SetDurability(false)
Item:SetCraft({
    {
        item = "wood",
        amount = 20,
    },
})
gRust.RegisterItem(Item)

--
-- Hammer
--

Item = gRust.ItemRegister("hammer")
Item:SetName("Hammer")
Item:SetCategory("Construction")
Item:SetStack(1)
Item:SetIcon("materials/items/tools/hammer.png")
Item:SetWeapon("rust_hammer")
Item:SetDurability(false)
Item:SetModel("models/weapons/darky_m/rust/w_hammer.mdl")
Item:SetCraft({
    {
        item = "wood",
        amount = 200,
    },
})
gRust.RegisterItem(Item)

--
-- Hatchet
--

Item = gRust.ItemRegister("hatchet")
Item:SetName("Hatchet")
Item:SetCategory("Tools")
Item:SetStack(1)
Item:SetIcon("materials/items/tools/hatchet.png")
Item:SetWeapon("rust_hatchet")
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "wood",
        amount = 200,
    },
    {
        item = "metal_fragments",
        amount = 100
    }
})
gRust.RegisterItem(Item)

--
-- Pickaxe
--

Item = gRust.ItemRegister("pickaxe")
Item:SetName("Pickaxe")
Item:SetCategory("Tools")
Item:SetStack(1)
Item:SetIcon("materials/items/tools/pickaxe.png")
Item:SetWeapon("rust_pickaxe")
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "wood",
        amount = 200,
    },
    {
        item = "metal_fragments",
        amount = 100
    }
})
gRust.RegisterItem(Item)

--
-- Green Keycard
--

Item = gRust.ItemRegister("green_keycard")
Item:SetName("Green Keycard")
Item:SetCategory("Tools")
Item:SetStack(1)
Item:SetIcon("materials/items/keycards/green_keycard.png")
Item:SetWeapon("rust_card")
gRust.RegisterItem(Item)

--
-- SCard
--

Item = gRust.ItemRegister("scard")
Item:SetName("???")
Item:SetCategory("Tools")
Item:SetStack(1)
Item:SetIcon("materials/items/keycards/scard.png")
Item:SetWeapon("rust_scard")
Item:SetDurability(false)
gRust.RegisterItem(Item)

