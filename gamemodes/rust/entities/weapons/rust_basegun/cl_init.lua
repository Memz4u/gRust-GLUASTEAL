-- "gamemodes\\rust\\entities\\weapons\\rust_basegun\\cl_init.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
DEFINE_BASECLASS("base_rust")
include("shared.lua")

SWEP.VMPos          = Vector(0, 0, 0)
SWEP.DownPos        = Vector(-2.5, 0, 0)
SWEP.DownAng        = Angle(-10, 0, -4)

SWEP.IronSightPos   = Vector(-6.115, -6.896, 3.68)
SWEP.IronSightAng   = Vector(-0.21, 0.029, 0)
SWEP.IronSightTime  = 0.05
SWEP.IronSightFOV   = 20

SWEP.RecoilLerp     = 0.1

function SWEP:ModifyViewModel(pos, ang)
    local pl = self:GetOwner()
    local IronPos = self.IronSightPos
    if (!IronPos) then return end
    local IronAng = self.IronSightAng
    if (pl.FreeLooking) then return end

    if (pl:KeyDown(IN_ATTACK2) && !self.WeaponDown && !self:GetReloading()) then
        self.ISProgress = self.ISProgress and
            Lerp(FrameTime() / self.IronSightTime, self.ISProgress, 1) or
            0

        self.SwayScale = 0
        self.WeaponBobScale = 0.5
    else
        self.ISProgress = self.ISProgress and
            Lerp(FrameTime() / self.IronSightTime, self.ISProgress, 0) or
            0

        self.SwayScale = -0.75
        self.WeaponBobScale = 1
    end

    pos = pos + ang:Right() * IronPos.x * self.ISProgress
    pos = pos + ang:Forward() * IronPos.y * self.ISProgress
    pos = pos + ang:Up() * IronPos.z * self.ISProgress

    ang:RotateAroundAxis(ang:Right(), IronAng.x * self.ISProgress)
    ang:RotateAroundAxis(ang:Forward(), IronAng.y * self.ISProgress)
    ang:RotateAroundAxis(ang:Up(), IronAng.z * self.ISProgress)

    return pos, ang
end

local view = {}
function SWEP:CalcView(pl, origin, angles, fov, znear, zfar)
    view.origin = origin
    view.angles = angles
    view.fov = fov - 20

    return origin, angles, fov - ((self.ISProgress or 0) * self.IronSightFOV)
end

SWEP.RecoilTable = {}
SWEP.RecoilReturnTime = 0.2

SWEP.LastRec = 0
SWEP.RecoilAng = Angle()
SWEP.Rec = 0

-- Recoil
function SWEP:Recoil()
    local owner = self:GetOwner()

    if self:GetOwner():IsPlayer() then
        if CLIENT and IsFirstTimePredicted() or CLIENT and game.SinglePlayer() then
            self.Rec = self.Rec + 1
            self.LastRec = CurTime()+0.1
            
            local rectable = self.RecoilTable

            self.RecoilAng = rectable[self.Rec%#rectable+1]*self.RecoilAmount -- cool?
        end
    end
end

function SWEP:DrawHUD()
    local ply = self:GetOwner()

    if ply:IsPlayer() then
        if CLIENT then
            if not self.RecoilAng:IsZero() then 
                local eyeang = ply:EyeAngles()
                local withRecoil = eyeang + (self.RecoilAng * 100 * FrameTime())
                local withRecoilLimited = Angle(math.max(withRecoil.p, -89), withRecoil.y, 0) -- math max to prevent spinning while looking stright up
                
                eyeang = LerpAngle(self.RecoilLerp, eyeang, withRecoilLimited)
                eyeang.r = 0

                ply:SetEyeAngles(eyeang)
            end

            if CurTime() > self.LastRec and self.Rec>0 then
                self.RecoilAng = Angle(0, 0, 0)
                self.Rec = self.Rec - 1
                self.LastRec = CurTime()+self.RecoilReturnTime
            end
        end
    end
end

