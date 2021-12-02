-- "gamemodes\\rust\\gamemode\\core\\inventory\\items\\resources.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local Item

--
-- Wood
--

Item = gRust.ItemRegister("wood")
Item:SetName("Wood")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/wood.png")
Item:SetModel("models/items/wood.mdl")
Item:SetSound("wood")
gRust.RegisterItem(Item)

--
-- Stone
--

Item = gRust.ItemRegister("stone")
Item:SetName("Stone")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/stone.png")
Item:SetModel("models/items/stone.mdl")
gRust.RegisterItem(Item)

--
-- Metal Ore
--

Item = gRust.ItemRegister("metal_ore")
Item:SetName("Metal Ore")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/metal_ore.png")
Item:SetModel("models/items/metal_ore.mdl")
gRust.RegisterItem(Item)

--
-- HQ Metal Ore
--

Item = gRust.ItemRegister("hqmetal_ore")
Item:SetName("High Quality Metal Ore")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/hqmetal_ore.png")
gRust.RegisterItem(Item)

--
-- Sulfur Ore
--

Item = gRust.ItemRegister("sulfur_ore")
Item:SetName("Sulfur Ore")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/sulfur_ore.png")
Item:SetModel("models/items/sulfur_ore.mdl")
gRust.RegisterItem(Item)

--
-- Sulfur
--

Item = gRust.ItemRegister("sulfur")
Item:SetName("Sulfur")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/sulfur.png")
Item:SetModel("models/items/sulphur.mdl")
gRust.RegisterItem(Item)

--
-- Metal Fragments
--

Item = gRust.ItemRegister("metal_fragments")
Item:SetName("Metal Fragments")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/metal_fragments.png")
Item:SetModel("models/items/metalfragments.mdl")
gRust.RegisterItem(Item)

--
-- High Quality Metal
--

Item = gRust.ItemRegister("hq_metal")
Item:SetName("High Quality Metal")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/hqmetal.png")
Item:SetModel("models/items/hqmetal.mdl")
Item:SetSound("metal")
gRust.RegisterItem(Item)

--
-- Charcoal
--

Item = gRust.ItemRegister("charcoal")
Item:SetName("Charcoal")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/charcoal.png")
Item:SetModel("models/items/charcoal.mdl")
Item:SetSound("charcoal")
gRust.RegisterItem(Item)

--
-- Cloth
--

Item = gRust.ItemRegister("cloth")
Item:SetName("Cloth")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/cloth.png")
Item:SetModel("models/items/cloth.mdl")
Item:SetSound("cloth")
gRust.RegisterItem(Item)

--
-- Scrap
--

Item = gRust.ItemRegister("scrap")
Item:SetName("Scrap")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/scrap.png")
Item:SetModel("models/items/scrappile.mdl")
Item:SetSound("metal")
gRust.RegisterItem(Item)

--
-- Gears
--

Item = gRust.ItemRegister("gears")
Item:SetName("Gears")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/gears.png")
Item:SetModel("models/items/gears.mdl")
Item:SetSound("metal")
gRust.RegisterItem(Item)

--
-- Road Signs
--

Item = gRust.ItemRegister("road_signs")
Item:SetName("Road Signs")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/road_signs.png")
Item:SetModel("models/items/roadsigns.mdl")
Item:SetSound("metal")
gRust.RegisterItem(Item)

--
-- Metal Pipe
--

Item = gRust.ItemRegister("metal_pipe")
Item:SetName("Metal Pipe")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/metal_pipe.png")
Item:SetModel("models/items/metalpipe.mdl")
Item:SetSound("metal")
gRust.RegisterItem(Item)

--
-- Metal Spring
--

Item = gRust.ItemRegister("metal_spring")
Item:SetName("Metal Spring")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/metal_spring.png")
Item:SetModel("models/items/spring.mdl")
Item:SetSound("metal")
gRust.RegisterItem(Item)

--
-- Sheet Metal
--

Item = gRust.ItemRegister("sheet_metal")
Item:SetName("Sheet Metal")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/sheet_metal.png")
Item:SetModel("models/items/sheetmetal.mdl")
Item:SetSound("metal")
gRust.RegisterItem(Item)

--
-- Semi Auto Body
--

Item = gRust.ItemRegister("semi_auto_body")
Item:SetName("Semi-Automatic Body")
Item:SetCategory("Resources")
Item:SetStack(10)
Item:SetIcon("materials/items/resources/semi_auto_body.png")
Item:SetModel("models/items/semibody.mdl")
gRust.RegisterItem(Item)

--
-- Rifle Body
--

Item = gRust.ItemRegister("rifle_body")
Item:SetName("Rifle Body")
Item:SetCategory("Resources")
Item:SetStack(10)
Item:SetIcon("materials/items/resources/rifle_body.png")
Item:SetModel("models/items/rifle_body.mdl")
gRust.RegisterItem(Item)

--
-- SMG Body
--

Item = gRust.ItemRegister("smg_body")
Item:SetName("SMG Body")
Item:SetCategory("Resources")
Item:SetStack(10)
Item:SetIcon("materials/items/resources/smg_body.png")
Item:SetModel("models/items/smgbody.mdl")
Item:SetSound("metal")
gRust.RegisterItem(Item)

--
-- Tech Trash
--

Item = gRust.ItemRegister("tech_trash")
Item:SetName("Tech Trash")
Item:SetCategory("Resources")
Item:SetStack(50)
Item:SetIcon("materials/items/resources/tech_trash.png")
Item:SetModel("models/items/techtrash.mdl")
Item:SetSound("metal")
gRust.RegisterItem(Item)

--
-- Sewing Kit
--

Item = gRust.ItemRegister("sewing_kit")
Item:SetName("Sewing Kit")
Item:SetCategory("Resources")
Item:SetStack(50)
Item:SetIcon("materials/items/resources/sewing_kit.png")
Item:SetModel("models/items/sewingkit.mdl")
Item:SetSound("cloth")
gRust.RegisterItem(Item)

--
-- Rope
--

Item = gRust.ItemRegister("rope")
Item:SetName("Rope")
Item:SetCategory("Resources")
Item:SetStack(50)
Item:SetIcon("materials/items/resources/rope.png")
Item:SetModel("models/items/rope.mdl")
gRust.RegisterItem(Item)

--
-- Tarp
--

Item = gRust.ItemRegister("tarp")
Item:SetName("Tarp")
Item:SetCategory("Resources")
Item:SetStack(50)
Item:SetIcon("materials/items/resources/tarp.png")
Item:SetModel("models/items/tarp.mdl")
gRust.RegisterItem(Item)

--
-- Tarp
--

Item = gRust.ItemRegister("animal_fat")
Item:SetName("Animal Fat")
Item:SetCategory("Resources")
Item:SetStack(100)
Item:SetIcon("materials/items/resources/animal_fat.png")
--Item:SetModel("models/items/animal_fat.mdl")
gRust.RegisterItem(Item)

--
-- Metal Blade
--

Item = gRust.ItemRegister("metal_blade")
Item:SetName("Metal Blade")
Item:SetCategory("Resources")
Item:SetStack(50)
Item:SetIcon("materials/items/resources/metal_blade.png")
Item:SetModel("models/items/metalblade.mdl")
gRust.RegisterItem(Item)

--
-- Propane Tank
--

Item = gRust.ItemRegister("propane_tank")
Item:SetName("Propane Tank")
Item:SetCategory("Resources")
Item:SetStack(5)
Item:SetIcon("materials/items/resources/propane_tank.png")
Item:SetModel("models/items/propanetank.mdl")
gRust.RegisterItem(Item)

--
-- Electric Fuse
--

Item = gRust.ItemRegister("fuse")
Item:SetName("Electric Fuse")
Item:SetCategory("Resources")
Item:SetStack(10)
Item:SetIcon("materials/items/resources/fuse.png")
--Item:SetModel("models/items/propanetank.mdl")
gRust.RegisterItem(Item)

--
-- Gunpowder
--

Item = gRust.ItemRegister("gunpowder")
Item:SetName("Gunpowder")
Item:SetCategory("Resources")
Item:SetStack(1000)
Item:SetIcon("materials/items/resources/gunpowder.png")
Item:SetModel("models/items/gunpowder.mdl")
Item:SetCraftAmount(10)
Item:SetCraftTime(3)
Item:SetCraft({
    {
        item = "charcoal",
        amount = 30
    },
    {
        item = "sulfur",
        amount = 20
    }
})
gRust.RegisterItem(Item)

--
-- Explosives
--

Item = gRust.ItemRegister("explosives")
Item:SetName("Explosives")
Item:SetCategory("Explosives")
Item:SetStack(10)
Item:SetIcon("materials/items/resources/explosives.png")
Item:SetTier(3)
Item:SetModel("models/items/explosives.mdl")
Item:SetCraft({
    {
        item = "gunpowder",
        amount = 50
    },
    {
        item = "sulfur",
        amount = 10
    },
    {
        item = "metal_fragments",
        amount = 20
    }
})
gRust.RegisterItem(Item)

