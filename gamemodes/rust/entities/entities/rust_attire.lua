-- "gamemodes\\rust\\entities\\entities\\rust_attire.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

ENT.Base = "base_anim"
ENT.Type = "anim"

function ENT:Initialize()
end

function ENT:Draw()
    local pl = LocalPlayer()
    if (self:GetParent() ~= pl or pl:ShouldDrawLocalPlayer()) then
        self:DrawModel()
    end
end

