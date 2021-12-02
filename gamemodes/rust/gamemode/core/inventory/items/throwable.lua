-- "gamemodes\\rust\\gamemode\\core\\inventory\\items\\throwable.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local Item

--
-- Beancan Grenade
--

Item = gRust.ItemRegister("beancan_grenade")
Item:SetName("Beancan Grenade")
Item:SetCategory("Explosives")
Item:SetStack(10)
Item:SetIcon("materials/items/throwable/beancan.png")
Item:SetWeapon("rust_beancan")
Item:SetDurability(false)
Item:SetClip(false)
Item:SetTier(1)
Item:SetBlueprint(75)
Item:SetCraft({
    {
        item = "gunpowder",
        amount = 60
    },
    {
        item = "metal_fragments",
        amount = 20
    }
})
gRust.RegisterItem(Item)

--
-- Supply Signal
--

Item = gRust.ItemRegister("supply_signal")
Item:SetName("Supply Signal")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/throwable/supply_signal.png")
Item:SetWeapon("rust_supplysignal")
Item:SetDurability(false)
Item:SetClip(false)
gRust.RegisterItem(Item)

--
-- Satchel Charge
--

Item = gRust.ItemRegister("satchel_charge")
Item:SetName("Satchel Charge")
Item:SetCategory("Explosives")
Item:SetStack(10)
Item:SetIcon("materials/items/throwable/satchel.png")
Item:SetWeapon("rust_satchel")
Item:SetDurability(false)
Item:SetClip(false)
Item:SetTier(1)
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "beancan_grenade",
        amount = 4
    },
    {
        item = "rope",
        amount = 1
    }
})
gRust.RegisterItem(Item)

--
-- Timed Explosive CHarge
--

Item = gRust.ItemRegister("c4")
Item:SetName("Timed Explosive Charge")
Item:SetCategory("Explosives")
Item:SetStack(10)
Item:SetIcon("materials/items/throwable/c4.png")
Item:SetWeapon("rust_c4")
Item:SetDurability(false)
Item:SetClip(false)
Item:SetTier(3)
Item:SetBlueprint(500)
Item:SetCraft({
    {
        item = "explosives",
        amount = 20
    },
    {
        item = "cloth",
        amount = 5
    },
    {
        item = "tech_trash",
        amount = 2
    }
})
gRust.RegisterItem(Item)

