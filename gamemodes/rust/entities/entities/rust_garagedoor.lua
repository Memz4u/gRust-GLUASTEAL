-- "gamemodes\\rust\\entities\\entities\\rust_garagedoor.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

DEFINE_BASECLASS("rust_base")
ENT.Base = "rust_base"

ENT.Deploy          = {}
ENT.Deploy.Model    = "models/building/garage_door.mdl"
ENT.Deploy.Socket   = "garage"

ENT.Mins = Vector(-58, 2, 0)
ENT.Maxs = Vector(58,  5,  -132)

ENT.ShowHealth = true
ENT.DisplayIcon 	= gRust.GetIcon("gear")

ENT.AutomaticFrameAdvance = true

-- STATUS:
-- 0: Closed
-- 1: Open
-- 2: Opening/Closing

function ENT:SetupDataTables()
    BaseClass.SetupDataTables(self)
    self:NetworkVar("Float", 0, "CloseProgress")
    self:NetworkVar("Int", 1, "Status")

    self:SetCloseProgress(100)
    self:SetStatus(0)
end

function ENT:Initialize()
    self.ColBox = CreatePhysCollideBox(self.Mins, self.Maxs)
    self:PhysicsInitBox(self.Mins, self.Maxs)
    self:SetMoveType(MOVETYPE_NONE)
    
    if (CLIENT) then return end

    self:SetModel("models/building/garage_door.mdl")
    self:SetSolid(SOLID_VPHYSICS)

    self:SetHealth(600)
    self:SetMaxHealth(600)

    self:EnableCustomCollisions(true)
    
    self:SetDisplayName("OPEN")
    self:SetInteractable(true)

    self:SetMeleeDamage(0)
    self:SetBulletDamage(0.1)
    self:SetExplosiveDamage(0.3)

    self:SetCloseProgress(100)
end

function ENT:TestCollision(start, delta, isbox, extend)
    if (!self.ColBox) then return end

    local mins, maxs = -extend, extend
    maxs.z = maxs.z - mins.z
    mins.z = 0

    local hit, norm, frac = self.ColBox:TraceBox(self:GetPos(), self:GetAngles(), start, start + delta, mins, maxs)
	if (!hit) then return end

	return {
		HitPos = hit,
		Normal  = norm,
		Fraction = frac,
	}
end

ENT.Open = true
function ENT:Interact()
    if (CLIENT) then return end

    self.ToggleStart = CurTime()
    self.Open = !self.Open
    self:ResetSequence(self.Open and "close" or "open")

    self:SetStatus(self.Open and 0 or 1)
    self:SetInteractable(false)
    timer.Create("gRust.GDoor."..self:EntIndex(), 2.5, 0, function()
        self:SetInteractable(true)
    end)
end

function ENT:Think()
    local Status = self:GetStatus()
    if (Status == 1 and self.LastStatus ~= 1) then
        self.Maxs.z = -10
        self:PhysicsInitBox(self.Mins, self.Maxs)
    elseif (Status == 0 and self.LastStatus ~= 0) then
        self.Maxs.z = -132
        self:PhysicsInitBox(self.Mins, self.Maxs)
    end

    self.LastStatus = Status
end

function ENT:Draw()
    self:DrawModel()
end

