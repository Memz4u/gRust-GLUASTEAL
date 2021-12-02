-- "gamemodes\\rust\\gamemode\\vgui\\button_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local PANEL = {}

AccessorFunc(PANEL, "TextColor", "TextColor")

AccessorFunc(PANEL, "DefaultColor", "DefaultColor")
AccessorFunc(PANEL, "HoveredColor", "HoveredColor")
AccessorFunc(PANEL, "ActiveColor", "ActiveColor")

function PANEL:Init()
    self.DefaultColor = Color(211, 211, 205, 25)
    self.HoveredColor = Color(255, 255, 255, 25)
    self.ActiveColor = Color(228, 228, 228, 25)
    self:SetColor(self.DefaultColor)

    self:SetText("")
    self:SetTextColor(Color(255, 255, 255))
    self:SetFont("gRust.32px")
end

function PANEL:PerformLayout()
    self:SetColor(self.DefaultColor)
end

function PANEL:OnMousePressed(code)
    DButton.OnMousePressed(self, code)
    self:ColorTo(self.ActiveColor, 0.1, 0)
end

function PANEL:OnMouseReleased(code)
    DButton.OnMouseReleased(self, code)
    self:ColorTo(self.HoveredColor, 0.1, 0)
end

function PANEL:OnCursorEntered()
    self:ColorTo(self.HoveredColor, 0.1, 0)
end

function PANEL:OnCursorExited()
    self:ColorTo(self.DefaultColor, 0.1, 0)
end

function PANEL:Paint(w, h)
    surface.SetDrawColor(self:GetColor())
    surface.DrawRect(0, 0, w, h)

    draw.SimpleText(self:GetText(), self:GetFont(), w * 0.5, h * 0.5, self.TextColor, 1, 1)

    return true
end

vgui.Register("gRust.Button", PANEL, "DButton")

