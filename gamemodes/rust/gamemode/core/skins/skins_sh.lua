-- "gamemodes\\rust\\gamemode\\core\\skins\\skins_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local PLAYER = FindMetaTable("Player")
function PLAYER:HasSkin(skinid)
    return self.Skins[skinid] == true
end

function PLAYER:GetSkins()
    return self.Skins
end

