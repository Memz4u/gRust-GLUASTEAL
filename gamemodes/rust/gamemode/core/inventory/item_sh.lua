-- "gamemodes\\rust\\gamemode\\core\\inventory\\item_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
--
-- Networking
--

local gRust     = gRust
local net       = net

function net.WriteItem(item)
	net.WriteString(item:GetItem())
	net.WriteUInt(item:GetQuantity(), 20)
	net.WriteUInt(item:GetWear() or 0, 10)
	net.WriteUInt(item:GetClip() or 0, 7)
end

function net.ReadItem()
	local Item = gRust.CreateItem(net.ReadString())
	Item:SetQuantity(net.ReadUInt(20))
	Item:SetWear(net.ReadUInt(10))
	Item:SetClip(net.ReadUInt(7))

	return Item
end

--
-- Item Object
--

local ITEM = { -- Default values
	Item = "wood",
	Quantity = 1,
	Wear = 1000,
	Clip = 0,
}
gRust.__ITEM = ITEM
ITEM.__index = ITEM

AccessorFunc(ITEM, "Item", "Item", FORCE_STRING)
AccessorFunc(ITEM, "Quantity", "Quantity", FORCE_NUMBER)
AccessorFunc(ITEM, "Wear", "Wear", FORCE_NUMBER)
AccessorFunc(ITEM, "Clip", "Clip", FORCE_NUMBER)
AccessorFunc(ITEM, "Skin", "Skin", FORCE_STRING)

function ITEM:SetQuantity(n)
	self.Quantity = math.min(n, gRust.Items[self.Item]:GetStack())
end

function ITEM:SetWear(n)
	self.Wear = math.max(n, 0)
end

function ITEM:CanStack(otheritem, amount)
	if (self:GetItem() ~= otheritem:GetItem()) then return false end
	
	local ItemData = gRust.Items[self:GetItem()]
	local Total = (amount or self:GetQuantity()) + otheritem:GetQuantity()
	if (Total > ItemData:GetStack()) then return false end

	return true
end

function ITEM:GetRepairCost()
	local Craft = gRust.Items[self:GetItem()]:GetCraft()
	if (!Craft) then return end

	local WearFrac = self:GetWear() / 1000

	local Repair = {}
	for k, v in ipairs(Craft) do
		local Amount = math.floor(v.amount * (1 - WearFrac))
		if (Amount <= 0) then continue end
		
		Repair[#Repair + 1] = {Class = v.item, Amount = Amount}
	end

	return Repair
end

function ITEM:Copy()
	return table.Copy(self)
end

function gRust.CreateItem(class)
	if (!gRust.Items[class]) then
		ErrorNoHalt("Attempted to create an unknown item class ", class, "\n")
		return
	end

	return setmetatable({Item = class}, ITEM)
end

--
-- Item Registry
--

gRust.Items = gRust.Items or {}

local ITEM_R = {
	Name = "wood",
	Stack = 1000,
	Category = "Resources",
	Durability = true,
	CraftTime = 30,
	CraftAmount = 1,
	Sound = "stone",

	CraftAmount = 1,

	Healing = 0,
	Calories = 0,
	Hydration = 0
}
ITEM_R.__index = ITEM_R

AccessorFunc(ITEM_R, "Class", "Class", FORCE_STRING)
AccessorFunc(ITEM_R, "Name", "Name", FORCE_STRING)
AccessorFunc(ITEM_R, "Category", "Category", FORCE_STRING)
AccessorFunc(ITEM_R, "Stack", "Stack", FORCE_NUMBER)
AccessorFunc(ITEM_R, "Icon", "Icon", FORCE_STRING)
AccessorFunc(ITEM_R, "Sound", "Sound", FORCE_STRING)

AccessorFunc(ITEM_R, "Durability", "Durability", FORCE_BOOL)

AccessorFunc(ITEM_R, "Blueprint", "Blueprint")
AccessorFunc(ITEM_R, "Craft", "Craft")
AccessorFunc(ITEM_R, "CraftTime", "CraftTime", FORCE_NUMBER)
AccessorFunc(ITEM_R, "CraftAmount", "CraftAmount", FORCE_NUMBER)
AccessorFunc(ITEM_R, "Tier", "Tier", FORCE_NUMBER)

AccessorFunc(ITEM_R, "Blueprint", "Blueprint")

AccessorFunc(ITEM_R, "Entity", "Entity")
AccessorFunc(ITEM_R, "Weapon", "Weapon")
AccessorFunc(ITEM_R, "Clip", "Clip")
AccessorFunc(ITEM_R, "Model", "Model", FORCE_STRING)

AccessorFunc(ITEM_R, "Purchasable", "Purchasable", FORCE_BOOL)

--
-- Consume
--

AccessorFunc(ITEM_R, "Healing", "Healing", FORCE_NUMBER)
AccessorFunc(ITEM_R, "Calories", "Calories", FORCE_NUMBER)
AccessorFunc(ITEM_R, "Hydration", "Hydration", FORCE_NUMBER)

function ITEM_R:Copy()
	return table.Copy(self)
end

function gRust.ItemRegister(class)
	local meta = setmetatable({}, ITEM_R)
	meta:SetClass(class)

	return meta
end

function gRust.RegisterItem(item)
	gRust.Items[item.Class] = item

	if (isnumber(item.Blueprint)) then
		local Blueprint = gRust.ItemRegister()
		Blueprint:SetClass(string.format("%s.BP", item:GetClass()))
		Blueprint:SetName(string.format("%s Blueprint", item:GetName()))
		Blueprint:SetIcon(item:GetIcon())
		Blueprint:SetBlueprint(true)

		gRust.RegisterItem(Blueprint)
	end

	if (item.Model) then
		util.PrecacheModel(item.Model)
	end
end

