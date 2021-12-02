-- "gamemodes\\rust\\gamemode\\core\\inventory\\blueprints\\blueprint_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local PLAYER = FindMetaTable("Player")
function PLAYER:HasBlueprint(class)
    local Item = gRust.Items[class]
    if (!Item:GetBlueprint()) then return true end

    return self.Blueprints[class] == true
end

local function LoadBlueprintActions()
    for k, v in pairs(gRust.Items) do
        if (v:GetBlueprint() ~= true) then continue end
    
        v.Actions = v.Actions or {}
        v.Actions[#v.Actions + 1] =
        {
            Name = "Learn",
            Func = function(ent, i)
                net.Start("gRust.LearnBlueprint")
                net.WriteEntity(ent)
                net.WriteUInt(i, 8)
                net.SendToServer()
            end
        }
    end
end

timer.Simple(0, LoadBlueprintActions)

