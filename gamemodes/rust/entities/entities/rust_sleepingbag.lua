-- "gamemodes\\rust\\entities\\entities\\rust_sleepingbag.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
DEFINE_BASECLASS("rust_base")

AddCSLuaFile()

ENT.Base = "rust_base"

ENT.Deploy          = {}
ENT.Deploy.Model    = "models/deployable/sleeping_bag.mdl"

ENT.DisplayIcon 	= gRust.GetIcon("sleepingbag")
ENT.ShowHealth      = true

ENT.RespawnDelay = 300

ENT.Pickup          = "sleeping_bag"

if (SERVER) then
    util.AddNetworkString("gRust.AddSleepingBag")
    gRust.SleepingBags = gRust.SleepingBags or {}
    gRust.SleepingBagCache = gRust.SleepingBagCache or {}
    
    ENT.Deploy.OnDeploy = function(pl, ent, tr)
        net.Start("gRust.AddSleepingBag")
        net.WriteUInt(ent:EntIndex(), 13)
        net.Send(pl)

        ent.Owner = pl:SteamID()
    end
else
    net.Receive("gRust.AddSleepingBag", function()
        local pl = LocalPlayer()
        local entid = net.ReadUInt(13)

        pl.SleepingBags = pl.SleepingBags or {}
        pl.SleepingBags[#pl.SleepingBags + 1] = entid
    end)
end

function ENT:SetupDataTables()
    BaseClass.SetupDataTables(self)
    self:NetworkVar("String", 1, "BagName")
    self:SetBagName("Unnamed Bag")
    self:NetworkVar("Int", 1, "LastRespawn")
    self:SetLastRespawn(CurTime())
end

function ENT:Initialize()
    self:SetInteractable(true)
    self:SetModel("models/deployable/sleeping_bag.mdl")

    if (CLIENT) then return end

    self:SetMoveType(MOVETYPE_NONE)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetDisplayName("Rename Sleeping Bag")

    self:SetDamageable(true)
    self:SetHealth(200)
    self:SetMaxHealth(200)

    self:SetMeleeDamage(0.2)
    self:SetBulletDamage(0.05)
    self:SetExplosiveDamage(0.4)

    if (!self.BagIndex) then
        self.BagIndex = self:EntIndex()
    end
end

function ENT:Interact(pl)
    if (SERVER) then return end

    gRust.StringQuery("RENAME SLEEPING BAG", "CANCEL", "Change Name", function(txt)
        if (!IsValid(self)) then return end

        net.Start("gRust.RenameBag")
        net.WriteString(txt)
        net.WriteEntity(self)
        net.SendToServer()
    end)
end

if (SERVER) then
    util.AddNetworkString("gRust.RenameBag")
    net.Receive("gRust.RenameBag", function(len, pl)
        local Text = net.ReadString()
        local ent = net.ReadEntity()

        -- AC: This should never happen
        if (ent:GetClass() ~= "rust_sleepingbag") then
            DAC:ExploitAlert(pl, 0)
            return
        end

        if (string.match(Text, "%W")) then
            pl:ChatPrint("Sleeping bag names should only contain alphanumeric characters")
            return
        end

        if (string.len(Text) < 3) then
            pl:ChatPrint("Bag name must be more than 2 characters")
            return
        end

        if (string.len(Text) > 20) then
            pl:ChatPrint("Bag name must be 20 characters or less")
            return
        end

        if (pl:GetPos():DistToSqr(ent:GetPos()) > 25000) then return end
        
        local tr = {}
        tr.start = pl:EyePos()
        tr.endpos = ent:GetPos() + ent:OBBCenter()
        tr.filter = {pl, ent}
        tr = util.TraceLine(tr)

        if (tr.Hit) then
            pl:ChatPrint("You must be looking at this sleeping bag")
            return
        end
        
        ent:SetBagName(Text)
    end)
end

function ENT:Save(data)
	data.pos 	= self:GetPos()
	data.ang 	= self:GetAngles()
    
    data.owner  = self.Owner
    data.bagindex = self.BagIndex

    data.name   = self:GetBagName()
end

function ENT:Load(data)
	self:SetPos(data.pos)
	self:SetAngles(data.ang)
    
    self.Owner = data.owner
    self.BagIndex = data.bagindex

    self:SetBagName(data.name)
end

