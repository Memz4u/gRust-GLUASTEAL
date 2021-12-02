-- "gamemodes\\rust\\gamemode\\core\\inventory\\items\\weapons.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local Item

--
-- Assault Rifle
--

Item = gRust.ItemRegister("assault_rifle")
Item:SetName("Assault Rifle")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/assault_rifle.png")
Item:SetWeapon("rust_ak47")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(3)
Item:SetBlueprint(500)
Item:SetModel("models/weapons/darky_m/rust/w_ak47u.mdl")
Item:SetCraft({
    {
        item = "wood",
        amount = 200
    },
    {
        item = "hq_metal",
        amount = 50
    },
    {
        item = "rifle_body",
        amount = 1
    },
    {
        item = "metal_spring",
        amount = 4
    }
})
gRust.RegisterItem(Item)

--
-- Bolt Action Rifle
--

Item = gRust.ItemRegister("bolt_rifle")
Item:SetName("Bolt Action Rifle")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/bolt_rifle.png")
Item:SetWeapon("rust_boltrifle")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(3)
Item:SetBlueprint(500)
Item:SetCraft({
    {
        item = "hq_metal",
        amount = 20
    },
    {
        item = "rifle_body",
        amount = 1
    },
    {
        item = "metal_pipe",
        amount = 3
    },
    {
        item = "metal_spring",
        amount = 1
    }
})
gRust.RegisterItem(Item)

--
-- Pump Shotgun
--

Item = gRust.ItemRegister("pump_shotgun")
Item:SetName("Pump Action Shotgun")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/pump_shotgun.png")
Item:SetWeapon("rust_pump")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(2)
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "hq_metal",
        amount = 20
    },
    {
        item = "rifle_body",
        amount = 1
    },
    {
        item = "metal_pipe",
        amount = 3
    },
    {
        item = "metal_spring",
        amount = 1
    }
})
gRust.RegisterItem(Item)

--
-- LR300
--

Item = gRust.ItemRegister("lr300")
Item:SetName("LR300")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/lr300.png")
Item:SetWeapon("rust_lr300")
Item:SetDurability(true)
Item:SetClip(true)
gRust.RegisterItem(Item)

--
-- M92
--

Item = gRust.ItemRegister("m92")
Item:SetName("M92 Pistol")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/m92.png")
Item:SetWeapon("rust_m92")
Item:SetDurability(true)
Item:SetClip(true)
gRust.RegisterItem(Item)

--
-- SPAS-12
--

Item = gRust.ItemRegister("spas12")
Item:SetName("SPAS-12 Shotgun")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/spas12.png")
Item:SetWeapon("rust_spas12")
Item:SetDurability(true)
Item:SetClip(true)
gRust.RegisterItem(Item)

--
-- M249
--

Item = gRust.ItemRegister("m249")
Item:SetName("M249")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/m249.png")
Item:SetWeapon("rust_m249")
Item:SetDurability(true)
Item:SetClip(true)
gRust.RegisterItem(Item)

--
-- Custom SMG
--

Item = gRust.ItemRegister("custom_smg")
Item:SetName("Custom SMG")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/custom_smg.png")
Item:SetWeapon("rust_customsmg")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(2)
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "hq_metal",
        amount = 8
    },
    {
        item = "smg_body",
        amount = 1
    },
    {
        item = "metal_spring",
        amount = 1
    }
})
gRust.RegisterItem(Item)

--
-- Thompson
--

Item = gRust.ItemRegister("thompson")
Item:SetName("Thompson")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/thompson.png")
Item:SetWeapon("rust_thompson")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(2)
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "hq_metal",
        amount = 10
    },
    {
        item = "wood",
        amount = 100
    },
    {
        item = "smg_body",
        amount = 1
    },
    {
        item = "metal_spring",
        amount = 1
    }
})
gRust.RegisterItem(Item)

--
-- MP5A4
--

Item = gRust.ItemRegister("mp5")
Item:SetName("MP5A4")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/mp5.png")
Item:SetWeapon("rust_mp5")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(2)
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "hq_metal",
        amount = 10
    },
    {
        item = "wood",
        amount = 100
    },
    {
        item = "smg_body",
        amount = 1
    },
    {
        item = "metal_spring",
        amount = 1
    }
})
gRust.RegisterItem(Item)

--
-- Revolver
--

Item = gRust.ItemRegister("revolver")
Item:SetName("Revolver")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/revolver.png")
Item:SetWeapon("rust_revolver")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(1)
Item:SetBlueprint(75)
Item:SetCraft({
    {
        item = "metal_pipe",
        amount = 1
    },
    {
        item = "cloth",
        amount = 75
    },
    {
        item = "metal_fragments",
        amount = 125
    }
})
gRust.RegisterItem(Item)

--
-- HL2 Revolver
--

Item = gRust.ItemRegister("hl2revolver")
Item:SetName("HL2 Revolver")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/revolver.png")
Item:SetWeapon("rust_hl2revolver")
Item:SetDurability(true)
Item:SetClip(true)
gRust.RegisterItem(Item)

--
-- Python
--

Item = gRust.ItemRegister("python")
Item:SetName("Python Revolver")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/python.png")
Item:SetWeapon("rust_python")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(2)
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "metal_pipe",
        amount = 1
    },
    {
        item = "cloth",
        amount = 25
    },
    {
        item = "metal_fragments",
        amount = 125
    }
})
gRust.RegisterItem(Item)

--
-- Semi-Auto Pistol
--

Item = gRust.ItemRegister("sap")
Item:SetName("Semi-Automatic Pistol")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/sap.png")
Item:SetWeapon("rust_sap")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(2)
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "semi_auto_body",
        amount = 1
    },
    {
        item = "hq_metal",
        amount = 4
    },
    {
        item = "metal_pipe",
        amount = 1
    }
})
gRust.RegisterItem(Item)

--
-- Semi-Automatic Rifle
--

Item = gRust.ItemRegister("sar")
Item:SetName("Semi-Automatic Rifle")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/sar.png")
Item:SetWeapon("rust_sar")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(2)
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "semi_auto_body",
        amount = 1
    },
    {
        item = "metal_spring",
        amount = 1
    },
    {
        item = "metal_fragments",
        amount = 450
    },
    {
        item = "hq_metal",
        amount = 4
    }
})
gRust.RegisterItem(Item)

--
-- Double Barrel Shotgun
--

Item = gRust.ItemRegister("dbarrel")
Item:SetName("Double-Barrel Shotgun")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/dbarrel.png")
Item:SetWeapon("rust_dbarrel")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(1)
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 175,
    },
    {
        item = "metal_pipe",
        amount = 2,
    }
})
gRust.RegisterItem(Item)

--
-- Combat Knife
--

Item = gRust.ItemRegister("combat_knife")
Item:SetName("Combat Knife")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/combat_knife.png")
Item:SetWeapon("rust_combatknife")
Item:SetDurability(true)
Item:SetTier(1)
Item:SetBlueprint(125)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 25,
    },
    {
        item = "hq_metal",
        amount = 1
    }
})
gRust.RegisterItem(Item)

--
-- Nailgun
--

Item = gRust.ItemRegister("nailgun")
Item:SetName("Nailgun")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/nailgun.png")
Item:SetWeapon("rust_nailgun")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetCraft({
    {
        item = "metal_fragments",
        amount = 75
    },
    {
        item = "scrap",
        amount = 15
    }
})
gRust.RegisterItem(Item)

--
-- Waterpipe Shotgun
--

Item = gRust.ItemRegister("waterpipe_shotgun")
Item:SetName("Waterpipe Shotgun")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/waterpipe.png")
Item:SetWeapon("rust_waterpipe")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(1)
Item:SetBlueprint(75)
Item:SetCraft({
    {
        item = "wood",
        amount = 150
    },
    {
        item = "metal_fragments",
        amount = 75
    }
})
gRust.RegisterItem(Item)

--
-- Eoka Pistol
--

Item = gRust.ItemRegister("eoka")
Item:SetName("Eoka Pistol")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/eoka.png")
Item:SetWeapon("rust_eoka")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetCraft({
    {
        item = "wood",
        amount = 75
    },
    {
        item = "metal_fragments",
        amount = 30
    }
})
gRust.RegisterItem(Item)

--
-- Hunting Bow
--

Item = gRust.ItemRegister("hunting_bow")
Item:SetName("Hunting Bow")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/bow.png")
Item:SetWeapon("rust_bow")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetCraft({
    {
        item = "wood",
        amount = 200
    },
    {
        item = "cloth",
        amount = 50
    }
})
gRust.RegisterItem(Item)

--
-- Crossbow
--

Item = gRust.ItemRegister("crossbow")
Item:SetName("Crossbow")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/crossbow.png")
Item:SetWeapon("rust_crossbow")
Item:SetDurability(true)
Item:SetClip(true)
Item:SetTier(1)
Item:SetCraft({
    {
        item = "wood",
        amount = 200
    },
    {
        item = "metal_fragments",
        amount = 75
    },
    {
        item = "rope",
        amount = 2
    }
})
gRust.RegisterItem(Item)

--
-- Wooden Spear
--

Item = gRust.ItemRegister("wooden_spear")
Item:SetName("Wooden Spear")
Item:SetCategory("Weapons")
Item:SetStack(1)
Item:SetIcon("materials/items/weapons/wooden_spear.png")
Item:SetWeapon("rust_spear")
Item:SetDurability(true)
Item:SetCraft({
    {
        item = "wood",
        amount = 300
    }
})
gRust.RegisterItem(Item)

