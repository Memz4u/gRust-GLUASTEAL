-- "gamemodes\\rust\\gamemode\\core\\inventory\\items\\deployable.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local Item

--
-- Large Wood Box
--

Item = gRust.ItemRegister("large_wood_box")
Item:SetName("Large Wood Box")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_largewoodbox")
Item:SetIcon("materials/items/deployable/large_wood_box.png")
Item:SetCraft({
    {
        item = "wood",
        amount = 250,
    },
    {
        item = "metal_fragments",
        amount = 50,
    }
})
gRust.RegisterItem(Item)

--
-- Wooden Door
--

Item = gRust.ItemRegister("wooden_door")
Item:SetName("Wooden Door")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_doorwood")
Item:SetIcon("materials/items/deployable/wooden_door.png")
Item:SetCraft({
    {
        item = "wood",
        amount = 300,
    }
})
gRust.RegisterItem(Item)

--
-- Sheet Metal Door
--

Item = gRust.ItemRegister("metal_door")
Item:SetName("Sheet Metal Door")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_doormetal")
Item:SetIcon("materials/items/deployable/metal_door.png")
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 150,
    }
})
gRust.RegisterItem(Item)

--
-- Armored Door
--

Item = gRust.ItemRegister("armored_door")
Item:SetName("Armored Door")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_doorarmored")
Item:SetIcon("materials/items/deployable/armored_door.png")
Item:SetTier(3)
Item:SetBlueprint(500)
Item:SetCraft({
    {
        item = "hq_metal",
        amount = 20,
    },
    {
        item = "gears",
        amount = 5,
    }
})
gRust.RegisterItem(Item)

--
-- Key Lock
--

Item = gRust.ItemRegister("key_lock")
Item:SetName("Key Lock")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_keylock")
Item:SetIcon("materials/items/deployable/keylock.png")
Item:SetCraft({
    {
        item = "wood",
        amount = 75,
    }
})
gRust.RegisterItem(Item)

--
-- Keypad
--

Item = gRust.ItemRegister("keypad")
Item:SetName("Code Lock")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_keypad")
Item:SetIcon("materials/items/deployable/keypad.png")
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 100,
    }
})
gRust.RegisterItem(Item)

--
-- Furnace
--

Item = gRust.ItemRegister("furnace")
Item:SetName("Furnace")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_furnace")
Item:SetIcon("materials/items/deployable/furnace.png")
Item:SetCraft({
    {
        item = "stone",
        amount = 200,
    },
    {
        item = "wood",
        amount = 100,
    }
})
gRust.RegisterItem(Item)

--
-- Tool Cupboard
--

Item = gRust.ItemRegister("tool_cupboard")
Item:SetName("Tool Cupboard")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_toolcupboard")
Item:SetIcon("materials/items/deployable/tool_cupboard.png")
Item:SetCraft({
    {
        item = "wood",
        amount = 1000,
    }
})
gRust.RegisterItem(Item)

--
-- Sleeping Bag
--

Item = gRust.ItemRegister("sleeping_bag")
Item:SetName("Sleeping Bag")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_sleepingbag")
Item:SetIcon("materials/items/deployable/sleeping_bag.png")
Item:SetCraft({
    {
        item = "cloth",
        amount = 30,
    }
})
gRust.RegisterItem(Item)

--
-- Garage Door
--

Item = gRust.ItemRegister("garage_door")
Item:SetName("Garage Door")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_garagedoor")
Item:SetIcon("materials/items/deployable/garage_door.png")
Item:SetTier(2)
Item:SetBlueprint(75)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 300
    },
    {
        item = "gears",
        amount = 2
    }
})
gRust.RegisterItem(Item)

--
-- Research Table
--

Item = gRust.ItemRegister("research_table")
Item:SetName("Research Table")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_researchtable")
Item:SetIcon("materials/items/deployable/research_table.png")
Item:SetTier(1)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 200
    },
    {
        item = "scrap",
        amount = 20
    }
})
gRust.RegisterItem(Item)

--
-- Repair Bench
--

Item = gRust.ItemRegister("repair_bench")
Item:SetName("Repair Bench")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_repairbench")
Item:SetIcon("materials/items/deployable/repair_bench.png")
Item:SetTier(1)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 125
    }
})
gRust.RegisterItem(Item)

--
-- Workbench Level 1
--

Item = gRust.ItemRegister("tier1")
Item:SetName("Workbench Level 1")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_tier1")
Item:SetIcon("materials/items/deployable/tier1.png")
Item:SetCraft({
    {
        item = "wood",
        amount = 500,
    },
    {
        item = "metal_fragments",
        amount = 100
    },
    {
        item = "scrap",
        amount = 50
    }
})
gRust.RegisterItem(Item)

--
-- Workbench Level 2
--

Item = gRust.ItemRegister("tier2")
Item:SetName("Workbench Level 2")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_tier2")
Item:SetIcon("materials/items/deployable/tier2.png")
Item:SetTier(1)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 500
    },
    {
        item = "hq_metal",
        amount = 20,
    },
    {
        item = "scrap",
        amount = 500
    }
})
gRust.RegisterItem(Item)

--
-- Workbench Level 3
--

Item = gRust.ItemRegister("tier3")
Item:SetName("Workbench Level 3")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_tier3")
Item:SetIcon("materials/items/deployable/tier3.png")
Item:SetTier(2)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 1000
    },
    {
        item = "hq_metal",
        amount = 100,
    },
    {
        item = "scrap",
        amount = 1250
    }
})
gRust.RegisterItem(Item)

--
-- Hemp Seed
--

Item = gRust.ItemRegister("hemp_seed")
Item:SetName("Hemp Seed")
Item:SetCategory("Items")
Item:SetStack(50)
Item:SetEntity("rust_hemp")
Item:SetIcon("materials/items/deployable/hemp_seed.png")
gRust.RegisterItem(Item)

--
-- Concrete Barricade
--

Item = gRust.ItemRegister("concrete_barricade")
Item:SetName("Concrete Barricade")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_concretebarricade")
Item:SetIcon("materials/items/deployable/concrete_barricade.png")
Item:SetTier(2)
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "stone",
        amount = 200
    }
})
gRust.RegisterItem(Item)

--
-- Stone Barricade
--

Item = gRust.ItemRegister("stone_barricade")
Item:SetName("Stone Barricade")
Item:SetCategory("Items")
Item:SetStack(10)
Item:SetEntity("rust_stonebarricade")
Item:SetIcon("materials/items/deployable/stone_barricade.png")
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "stone",
        amount = 100
    }
})
gRust.RegisterItem(Item)

--
-- Stone Barricade
--

Item = gRust.ItemRegister("tv")
Item:SetName("YouTube TV")
Item:SetCategory("Items")
Item:SetStack(1)
Item:SetEntity("rust_tv")
Item:SetIcon("materials/items/deployable/tv.png")
Item:SetPurchasable(true)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 200
    },
    {
        item = "hq_metal",
        amount = 5
    },
    {
        item = "tech_trash",
        amount = 1
    }
})
gRust.RegisterItem(Item)

