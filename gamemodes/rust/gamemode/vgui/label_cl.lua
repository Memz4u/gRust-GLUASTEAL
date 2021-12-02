-- "gamemodes\\rust\\gamemode\\vgui\\label_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local surface_SetDrawColor = surface.SetDrawColor
local surface_DrawRect = surface.DrawRect
local draw_SimpleText = draw.SimpleText
local string_format = string.format

local PANEL = {}

AccessorFunc(PANEL, "Text", "Text", FORCE_STRING)
AccessorFunc(PANEL, "TextSize", "TextSize", FORCE_STRING)
AccessorFunc(PANEL, "TextColor", "TextColor")
AccessorFunc(PANEL, "Rounding", "Rounding")
AccessorFunc(PANEL, "Color", "Color")

local Colors = gRust.Colors
function PANEL:Init()
    Colors = Colors or gRust.Colors

    self.Text = "Label"
    self.TextSize = 24
    self.TextColor = Colors.White
    self.Color = Colors.Primary
    self.Rounding = 0
end

function PANEL:Paint(w, h)
    if (self.Rounding > 0) then
        draw.RoundedBox(self.Rounding, 0, 0, w, h, self.Color)
    else
        surface_SetDrawColor(self.Color)
        surface_DrawRect(0, 0, w, h)
    end

    draw_SimpleText(self.Text, string_format("gRust.%ipx", self:GetTextSize()), w * 0.5, h * 0.5, self.TextColor, 1, 1)
end

function PANEL:PerformLayout()
    surface.SetFont(string_format("gRust.%ipx", self:GetTextSize()))
    local w, h = surface.GetTextSize(self:GetText())

    self:SetWide(w + ScrH() * 0.015)
end

vgui.Register("gRust.Label", PANEL, "Panel")

