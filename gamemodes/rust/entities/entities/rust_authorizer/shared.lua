-- "gamemodes\\rust\\entities\\entities\\rust_authorizer\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
DEFINE_BASECLASS("rust_base")
ENT.Base = "rust_base"

ENT.Bodygroup = 2

local LockPos = Vector(45, 2, 37)
local LockAng = Angle(0, 0, 0)
ENT.Deploy = {}
ENT.Deploy.Position = function(pl, tr)
    if (tr.Entity:IsValid() and string.find(tr.Entity:GetClass(), "door")) then
        return tr.Entity:LocalToWorld(LockPos), tr.Entity:GetAngles() + LockAng
    else
        return pl:EyePos() + pl:GetAimVector() * 75, pl:GetAngles()
    end
end
ENT.Deploy.OnDeploy = function(pl, ent, tr)
    tr.Entity:SetBodygroup(2, ent.Bodygroup)
    if (ent.AuthorizeOnDeploy) then
        tr.Entity:Authorize(pl)
    else
        tr.Entity.Authorized[0] = 0 -- Workaround for empty table check
    end

    ent:Remove()
    --[[ent:Authorize(pl)
    tr.Entity:SetAuthorizeEntity(ent)

    ent:SetParent(tr.Entity)]]
end

