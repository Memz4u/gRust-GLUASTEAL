-- "gamemodes\\rust\\entities\\entities\\rust_doorwood.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

ENT.Base = "rust_door"

ENT.Model       = "models/deployable/wooden_door.mdl"
ENT.MaxHealth   = 200

ENT.DoorSound   = "wood"

ENT.Deploy          = {}
ENT.Deploy.Rotation = -10
ENT.Deploy.Model    = "models/deployable/wooden_door.mdl"
ENT.Deploy.Socket   = "door"

ENT.woodupkeep = 100

ENT.Pickup = "wooden_door"

