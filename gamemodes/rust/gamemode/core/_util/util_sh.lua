-- "gamemodes\\rust\\gamemode\\core\\_util\\util_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
function util.AvatarURL(id64, cback)
    http.Fetch("https://steamcommunity.com/profiles/" .. id64 .. "?xml=1", function(body, size, headers, code)
        if (size == 0 or code < 200 or code > 299) then cback() return end
        
        local url, filetype = body:match("<avatarFull>.-(https?://%S+%f[%.]%.)(%w+).-</avatarFull>")
        cback(url .. filetype)
    end, function() cback() end)
end

