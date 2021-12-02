-- "gamemodes\\rust\\gamemode\\core\\player\\freelook_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local view = {}

local LookX, LookY = 0, 0
local InitialAng, CoolAng = Angle(), Angle()

hook.Add("CalcView", "Rust.FreeLook2", function(pl, pos, ang, fov, znear, zfar)
    CoolAng = LerpAngle(0.1, CoolAng, Angle(LookY, -LookX, 0))
    ang.z = 0
    
    if (!input.IsButtonDown(KEY_LALT) and math.abs(CoolAng.y) < 0.05) then
        InitialAng, LookX, LookY = ang, 0, 0 CoolAng = Angle()
        pl.AltLooking = false
        return
    else
        pl.AltLooking = true
    end

    view.origin = pos
    view.angles = ang + CoolAng
    view.fov = fov

    return view
end)

hook.Add("InputMouseApply", "Rust.AltLook", function(cmd, x, y, ang)
    if (!input.IsButtonDown(KEY_LALT)) then
        LookX, LookY = 0, 0
        return
    end

    cmd:SetViewAngles(InitialAng)

    LookX = math.Clamp(LookX + x * 0.02, -65, 65)
    LookY = math.Clamp(LookY + y * 0.02, -65, 65)
end)

local ISCALCVM = false

hook.Add("CalcViewModelView", "Rust.FreeLook3", function(wep, vm, oPos, oAng, pos, ang, ...)
    if ISCALCVM then return end
    ISCALCVM = true
    local tPos, tAng = hook.Run("CalcViewModelView", wep, vm, oPos, oAng, pos, ang, ...)
    ISCALCVM = false
    pos = tPos or pos
    ang = tAng+CoolAng/2 or ang

    return pos, ang
end)

