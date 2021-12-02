-- "gamemodes\\rust\\gamemode\\core\\ui\\players_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local MaxDist   = 200^2
local TeamMaxDist = 500^2
local FadeDist  = MaxDist * 0.8
local TeamFadeDist  = TeamMaxDist * 0.8

local FriendlyColor = Color(gRust.Colors.Secondary:Unpack())
local DefaultColor  = Color(gRust.Colors.Surface:Unpack())
local OutlineColor  = Color(0, 0, 0)

local PlayerFont = surface.CreateFont("gRust.PlayerFont", {font="Roboto Condensed Bold", size=50})

local Ang = Angle()
function GM:PostPlayerDraw(other)
    if (!IsValid(other)) then return end
    if (!gRust.TeamCache) then return end
    
    local pl = LocalPlayer()
    if (other == pl) then return end

    local InTeam = gRust.TeamCache[other:AccountID()] ~= nil
    local EndFade = InTeam and TeamMaxDist or MaxDist
    
    local Distance = pl:GetPos():DistToSqr(other:GetPos())
    if (Distance > EndFade) then return end

    local RelativePos = pl:GetPos() - other:GetPos()

    Ang.y = math.deg(math.atan2(RelativePos.y, RelativePos.x)) + 90
    Ang.z = 90

    local FadeAt = InTeam and TeamFadeDist or FadeDist

    local TextColor = InTeam and FriendlyColor or DefaultColor
    TextColor.a = math.Remap(Distance, FadeAt, EndFade, 255, 0)
    OutlineColor.a = TextColor.a

    cam.Start3D2D(other:EyePos(), Ang, 0.1)
        draw.SimpleTextOutlined(other:Name(), "gRust.PlayerFont", 0, -120, TextColor, 1, 1, 2, OutlineColor)
        draw.SimpleTextOutlined("•", "gRust.PlayerFont", 0, -85, TextColor, 1, 1, 2, OutlineColor)
    cam.End3D2D()
end

