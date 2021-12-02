-- "gamemodes\\rust\\gamemode\\core\\player\\freelook_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
hook.Add("PlayerButtonDown", "gRust.DisableAltShoot", function(pl, btn)
    if (btn ~= KEY_LALT) then return end
    pl.FreeLooking = true
end)

hook.Add("PlayerButtonUp", "gRust.DisableAltShoot", function(pl, btn)
    if (btn ~= KEY_LALT) then return end
    pl.FreeLooking = false
end)

