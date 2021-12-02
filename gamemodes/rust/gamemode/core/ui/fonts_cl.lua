-- "gamemodes\\rust\\gamemode\\core\\ui\\fonts_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
for i = 1, 150 do
    surface.CreateFont("gRust." .. i .. "px", {
        font = "Roboto Condensed",
        size = (ScrH() * 0.0007) * i,
        weight = i * 21,
    })
end

