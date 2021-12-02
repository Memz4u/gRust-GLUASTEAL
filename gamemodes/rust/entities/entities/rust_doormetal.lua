-- "gamemodes\\rust\\entities\\entities\\rust_doormetal.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

ENT.Base = "rust_door"

ENT.Model       = "models/deployable/metal_door.mdl"
ENT.MaxHealth   = 250

ENT.MeleeDamage     = 0
ENT.BulletDamage    = 0.01
ENT.ExplosiveDamage = 0.25

ENT.DoorSound   = "metal"

ENT.Deploy          = {}
ENT.Deploy.Rotation = -10
ENT.Deploy.Model    = "models/deployable/metal_door.mdl"
ENT.Deploy.Socket   = "door"

ENT.metalupkeep = 50

ENT.Pickup = "metal_door"

