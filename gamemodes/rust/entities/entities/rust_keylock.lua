-- "gamemodes\\rust\\entities\\entities\\rust_keylock.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

ENT.Base = "rust_authorizer"

ENT.Bodygroup = 2
ENT.AuthorizeOnDeploy = true

ENT.Deploy          = {}
ENT.Deploy.Model    = "models/deployable/key_lock.mdl"
ENT.Deploy.Sound    = "keypad.deploy"

function ENT:Initialize()
    self:SetModel("models/deployable/key_lock.mdl")

    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_NONE)
end

