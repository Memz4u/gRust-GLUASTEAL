-- "gamemodes\\rust\\gamemode\\modules\\testing\\feedback_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
if (!gRust.Testing) then return end

timer.Create("gRust.FeedbackAlert", 180, 0, function()
    chat.AddText(Color(17,148,240), "[gRust] ", Color(255, 255, 255), "This is a pre-release testing server, please use the /feedback command to post any bugs or missing features you come across")
end)

