-- "gamemodes\\rust\\entities\\entities\\rust_structure\\cl_init.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
include("shared.lua")

ENT.ShowHealth = true

function ENT:Draw()
    self:DrawModel()

    local Block = gRust.BuildingBlocks[self:GetModel()]
    if (!Block) then return end
    
    for k, v in ipairs(Block) do
        debugoverlay.Text(self:LocalToWorld(v.pos), k, 1)
    end
end

