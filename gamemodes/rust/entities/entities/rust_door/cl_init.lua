-- "gamemodes\\rust\\entities\\entities\\rust_door\\cl_init.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
include("shared.lua")

ENT.ShowHealth = true

function ENT:Draw()
    self:DrawModel()
end

