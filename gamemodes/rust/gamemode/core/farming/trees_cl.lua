-- "gamemodes\\rust\\gamemode\\core\\farming\\trees_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
net.Receive("gRust.TreeEffects", function()
    local Pos = net.ReadVector()
    local pl = LocalPlayer()

    local ED = EffectData()
    ED:SetOrigin(Pos)
    util.Effect("GlassImpact", ED)
end)

