-- "gamemodes\\rust\\gamemode\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
GM.Name     = "gRust | Rust in Garry's Mod"
GM.Author   = "Down"
GM.Email    = "down@grust.co"
GM.Website  = "grust.co"
gRust       = gRust or {
    Config = {},
}

IncludeSH("config.lua")

gRust.IncludeSV = SERVER and include or function() end
gRust.IncludeCL = SERVER and AddCSLuaFile or include
gRust.IncludeSH = function(dir)
    if (SERVER) then
        AddCSLuaFile(dir)
        return include(dir)
    else
        return include(dir)
    end
end

local smart_include = function(f)
    if string.find(f, "_sv.lua") then
        return IncludeSV(f)
    elseif string.find(f, "_cl.lua") then
        return IncludeCL(f)
    else
        return IncludeSH(f)
    end
end

gRust.IncludeDir = function(dir)
    local fol = dir .. '/'
    local files, folders = file.Find(fol .. '*', "LUA")
    
    for _, f in ipairs(files) do
        smart_include(fol .. f)
    end

    for _, f in ipairs(folders) do
        gRust.IncludeDir(dir .. '/' .. f)
    end
end

gRust.IncludeDir("rust/gamemode/libs")
gRust.IncludeDir("rust/gamemode/vgui")
gRust.IncludeDir("rust/gamemode/core")
hook.Run("gRust.LoadedCore")
gRust.IncludeDir("rust/gamemode/modules")

--[[
File.LoadDir("rust/gamemode/vgui")
File.LoadDir("rust/gamemode/core")
File.LoadDir("rust/gamemode/modules")]]

