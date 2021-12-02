-- "gamemodes\\rust\\gamemode\\core\\kits\\kits_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
gRust.Kits = gRust.Kits or {}

local function RegisterKit(name, dat)
    gRust.Kits[name] = dat
end

RegisterKit("vip", {
    name = "VIP",
    order = 1,
    redemptions = 1,
    icon = "kits/vip.png",
    items = {
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "stone",
            amount = 1000,
        },
        {
            id = "stone",
            amount = 500,
        },
        {
            id = "metal_fragments",
            amount = 500,
        },
        {
            id = "hq_metal",
            amount = 20,
        },
        {
            id = "furnace",
            amount = 1,
        },
        {
            id = "large_wood_box",
            amount = 1,
        },
        {
            id = "revolver",
            amount = 1,
        },
        {
            id = "hunting_bow",
            amount = 1,
        },
        {
            id = "arrow",
            amount = 25,
        }
    }
})

RegisterKit("gold_vip", {
    name = "Gold VIP",
    redemptions = 1,
    order = 2,
    icon = "kits/gold_vip.png",
    items = {
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "stone",
            amount = 1000,
        },
        {
            id = "stone",
            amount = 1000,
        },
        {
            id = "stone",
            amount = 1000,
        },
        {
            id = "stone",
            amount = 500,
        },
        {
            id = "metal_fragments",
            amount = 1000,
        },
        {
            id = "metal_fragments",
            amount = 500,
        },
        {
            id = "hq_metal",
            amount = 75,
        },
        {
            id = "tier1",
            amount = 1,
        },
        {
            id = "large_wood_box",
            amount = 2,
        },
        {
            id = "scientist_suit",
            amount = 1,
        },
        {
            id = "sap",
            amount = 1,
        },
        {
            id = "dbarrel",
            amount = 1,
        },
        {
            id = "shotgun_ammo",
            amount = 6,
        },
        {
            id = "pistol_ammo",
            amount = 12,
        },
        {
            id = "crossbow",
            amount = 1,
        },
        {
            id = "arrow",
            amount = 25,
        },
        {
            id = "gunpowder",
            amount = 120,
        },
        {
            id = "doormetal",
            amount = 1,
        },
    }
})

RegisterKit("platinum_vip", {
    name = "Platinum VIP",
    redemptions = 1,
    order = 3,
    icon = "kits/platinum_vip.png",
    items = {
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "wood",
            amount = 1000,
        },
        {
            id = "stone",
            amount = 1000,
        },
        {
            id = "stone",
            amount = 1000,
        },
        {
            id = "stone",
            amount = 1000,
        },
        {
            id = "stone",
            amount = 1000,
        },
        {
            id = "stone",
            amount = 1000,
        },
        {
            id = "metal_fragments",
            amount = 1000,
        },
        {
            id = "metal_fragments",
            amount = 1000,
        },
        {
            id = "metal_fragments",
            amount = 1000,
        },
        {
            id = "hq_metal",
            amount = 150,
        },
        {
            id = "furnace",
            amount = 1,
        },
        {
            id = "large_wood_box",
            amount = 3,
        },
        {
            id = "pickaxe",
            amount = 1,
        },
        {
            id = "hatchet",
            amount = 1,
        },
        {
            id = "medical_syringe",
            amount = 1,
        },
        {
            id = "custom_smg",
            amount = 1,
        },
        {
            id = "thompson",
            amount = 1,
        },
        {
            id = "pistol_ammo",
            amount = 80,
        },
        {
            id = "satchel",
            amount = 1,
        }
    }
})

--[[for k, v in pairs(Kits) do
    print("\n\n" .. v.name)
    print("This kit contains the following items:")
    for k, v in ipairs(v.items) do
        if (!Rust.Items[v.id]) then continue end
        print(Rust.Items[v.id].name .. " x" .. v.amount)
    end
end]]

