-- "gamemodes\\rust\\gamemode\\modules\\admin\\spectate\\spectate_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local Binds = {}

local Speed = 1000

local SpectatePos = Vector(0, 0, 0)
local SpectateAng = Angle(0, 0, 0)

local UpdateInterval = 0.25

local Spectating = false
local SpectateEnt
local LookingEnt
local function StartSpectate()
    Spectating = true
    SpectateEnt = net.ReadEntity()

    if (!IsValid(SpectateEnt)) then
        SpectatePos = LocalPlayer():EyePos()
        SpectateAng = LocalPlayer():EyeAngles()
    end
end

local function StopSpectate()
    if (IsValid(SpectateEnt)) then
        SpectateEnt:SetNoDraw(false)
    end

    Spectating = false
    SpectateEnt = nil
end

local function ToggleSpectate()
    if (Spectating) then
        StopSpectate()
    else
        StartSpectate()
    end
end

local function SpectateMove(pl)
    local MoveSpeed = Speed * FrameTime()

    SpectateAng = pl:EyeAngles()

    if (!IsValid(SpectateEnt)) then
        if (Binds["speed"]) then
            MoveSpeed = MoveSpeed * 2.5
        end
    
        if (Binds["forward"]) then
            SpectatePos = SpectatePos + SpectateAng:Forward() * MoveSpeed
        end
    
        if (Binds["back"]) then
            SpectatePos = SpectatePos + SpectateAng:Forward() * -MoveSpeed
        end
        
        if (Binds["moveright"]) then
            SpectatePos = SpectatePos + SpectateAng:Right() * MoveSpeed
        end
    
        if (Binds["moveleft"]) then
            SpectatePos = SpectatePos + SpectateAng:Right() * -MoveSpeed
        end
    end

    if (Binds["reload"]) then
        if (IsValid(SpectateEnt)) then
            SpectateEnt:SetNoDraw(false)
        end

        SpectateEnt = nil
    end
end

local LastUpdate = 0

local view = {}
view.drawviewer = true
local function SpectateUpdate(pl, pos, ang, fov, near, far)
    if (!Spectating) then return end

    if (CurTime() > LastUpdate) then
        net.Start("gRust.UpdateSpectate")
        net.WriteVector(SpectatePos)
        net.SendToServer()

        LastUpdate = CurTime() + UpdateInterval
    end

    local tr = {}
    tr.start = SpectatePos
    tr.endpos = SpectatePos + SpectateAng:Forward() * 2000
    tr.filter = pl
    tr = util.TraceLine(tr)

    LookingEnt = tr.Entity

    SpectateMove(pl)

    if (IsValid(SpectateEnt)) then
        if (SpectateEnt:IsPlayer()) then
            view.origin = SpectateEnt:EyePos()
            view.angles = SpectateEnt:EyeAngles()
        else
            local Radius = 200
            view.origin = (SpectateEnt:GetPos() + SpectateEnt:OBBCenter()) + pl:EyeAngles():Forward() * - Radius
            view.angles = pl:EyeAngles()
        end
    else
        view.origin = SpectatePos
        view.angles = SpectateAng
    end

    if (IsValid(SpectateEnt) and SpectateEnt:IsPlayer()) then
        SpectateEnt:SetNoDraw(true)
    end

    return view
end

--
-- Binds
--

local CancelBinds =
{
	["forward"] = true,
	["back"] = true,
	["moveright"] = true,
	["moveleft"] = true,
	["duck"] = true,
	["attack"] = true,
	["attack2"] = true,
	["speed"] = true,
	["jump"] = true,
    ["reload"] = true,
}

local function ControlBinds(pl, bind, pressed)
    if (!Spectating) then return end

    bind = string.lower(string.match(bind, "+([a-z A-Z 0-9]+)") or "")
		
    if (CancelBinds[bind]) then
        Binds[bind] = pressed
        return true
    end
end

hook.Add("PlayerBindPress", "gRust.Spectate.Binds", ControlBinds)
hook.Add("CalcView", "gRust.Spectate.CalcView", SpectateUpdate)
net.Receive("gRust.Spectate", ToggleSpectate)

--
-- Spectate ESP
--

local BeamMaterial = Material("trails/laser")
local function SpectateESP()
    if (!Spectating) then return end

    cam.Start3D()
        render.SuppressEngineLighting(true)

        if (IsValid(LookingEnt) and LookingEnt:IsPlayer() or LookingEnt.gRust) then
            if (LookingEnt == SpectateEnt) then return end
            render.SetColorMaterial()
            render.SetColorModulation(0, 0.718, 1)
            LookingEnt:DrawModel()
            if (input.IsMouseDown(107) and !IsValid(SpectateEnt)) then
                SpectateEnt = LookingEnt
                print(SpectateEnt)
            end
        end
        
        for k, v in ipairs(player.GetAll()) do
            if (v == SpectateEnt) then continue end
            local eyetr = v:GetEyeTraceNoCursor()
            render.SetMaterial(BeamMaterial)
            render.DrawBeam(v:EyePos(), eyetr.HitPos, 5, 0, 0, eyetr.Entity:IsPlayer() and gRust.Colors.Primary or color_white)
            
            local tr = {}
            tr.start = SpectatePos
            tr.endpos = v:GetPos() + v:OBBCenter()
            tr.filter = v
            tr = util.TraceLine(tr)
            if (!tr.Hit) then continue end

            render.SetColorModulation(255, 0, 0)
            render.SetColorMaterial()
            v:DrawModel()
        end

        render.SuppressEngineLighting(false)
    cam.End3D()
end
hook.Add("HUDPaint", "gRust.Spectate.ESP", SpectateESP)

