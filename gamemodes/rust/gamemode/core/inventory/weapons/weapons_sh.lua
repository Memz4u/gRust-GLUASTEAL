-- "gamemodes\\rust\\gamemode\\core\\inventory\\weapons\\weapons_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
hook.Add("gRust.LoadedCore", "gRust.LoadBlueprints", function()
	for k, v in pairs(gRust.Items) do
		if (!v:GetWeapon()) then continue end
		if (!v:GetClip()) then continue end
	
		v.Actions = v.Actions or {}
		v.Actions[#v.Actions + 1] =
		{
			Name = "Unload Ammo",
			Func = function(ent, i)
				net.Start("gRust.UnloadAmmo")
				net.WriteEntity(ent)
				net.WriteUInt(i, 8)
				net.SendToServer()
			end
		}
	end
end)

