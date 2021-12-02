-- "gamemodes\\rust\\gamemode\\modules\\admin\\commands\\screengrab_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local Grabbing = false
net.Receive("gRust.SGrab", function()
    Grabbing = true
end)

hook.Add("PostRender", "gRust.SGrab", function()
    if (!Grabbing) then return end
    Grabbing = false

    local data = render.Capture({
        format = "jpeg",
        x = 0,
        y = 0,
        w = ScrW(),
        h = ScrH(),
    })

    http.Post("https://api.imgur.com/3/upload", {
        image = util.Base64Encode(data),
        type = "base64",
        title = LocalPlayer():SteamID64(),
    }, function(body, len, headers, code)
        body = util.JSONToTable(body)
        if (!body["data"]) then return end
        
        net.Start("gRust.RGrab")
        net.WriteString(body["data"]["link"])
        net.SendToServer()
    end)
end)

