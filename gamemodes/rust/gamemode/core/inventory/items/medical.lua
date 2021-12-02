-- "gamemodes\\rust\\gamemode\\core\\inventory\\items\\medical.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local Item

--
-- Bandages
--

Item = gRust.ItemRegister("bandages")
Item:SetName("Bandages")
Item:SetCategory("Medical")
Item:SetStack(3)
Item:SetIcon("materials/items/medical/bandages.png")
Item:SetWeapon("rust_bandages")
Item:SetCraftTime(3)
Item:SetCraft({
    {
        item = "cloth",
        amount = 5
    },
})
gRust.RegisterItem(Item)

--
-- Medical Syringe
--

Item = gRust.ItemRegister("medical_syringe")
Item:SetName("Medical Syringe")
Item:SetCategory("Medical")
Item:SetStack(3)
Item:SetIcon("materials/items/medical/syringe.png")
Item:SetWeapon("rust_medicalsyringe")
Item:SetBlueprint(75)
Item:SetCraft({
    {
        item = "cloth",
        amount = 15
    },
    {
        item = "metal_fragments",
        amount = 10
    }
})
gRust.RegisterItem(Item)

