-- "gamemodes\\rust\\entities\\entities\\rust_doorarmored.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

ENT.Base = "rust_door"

ENT.Model       = "models/deployable/armored_door.mdl"
ENT.MaxHealth   = 800

ENT.MeleeDamage     = 0
ENT.BulletDamage    = 0
ENT.ExplosiveDamage = 0.25

ENT.DoorSound   = "metal"

ENT.Deploy          = {}
ENT.Deploy.Rotation = -10
ENT.Deploy.Model    = "models/deployable/armored_door.mdl"
ENT.Deploy.Socket   = "door"

ENT.HQUpkeep = 7

