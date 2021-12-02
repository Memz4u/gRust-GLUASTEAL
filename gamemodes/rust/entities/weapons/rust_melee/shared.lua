-- "gamemodes\\rust\\entities\\weapons\\rust_melee\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
DEFINE_BASECLASS("rust_base")

SWEP.Base       = "rust_base"
SWEP.Author     = "Down"

SWEP.Primary.Automatic  = true

SWEP.Range				= 65
SWEP.SwingDelay			= 0.5
SWEP.SwingInterval      = 1.6
SWEP.SwingSound         = "tools/rock_swing.mp3"
SWEP.StrikeSound        = "tools/rock_strike_%i.mp3"

SWEP.ThrowAngle 		= Angle(12, 0, 0)

SWEP.HarvestAmount =
{
	["rust_ore"] = 1,
	["tree"] = 1,
}

function SWEP:SetupDataTables(...)
	BaseClass.SetupDataTables(self)
	self:NetworkVar("Float", 0, "NextStrike")
end

function SWEP:Throw()
	if (self.Thrown) then return end

	local pl = self:GetOwner()
	local ang = pl:GetAimVector():Angle()

	self:PlayAnimation("Throw")

	self.Thrown = true

	if (CLIENT) then return end
	timer.Simple(0.1, function()
		local ent = ents.Create("rust_projectile")
		ent:SetOwner(pl)
		ent:SetPos(pl:GetShootPos())
		ent:SetAngles(ang + self.ThrowAngle)
		ent:SetItem(self:GetInventorySlot():Copy())
		pl:RemoveItem(self:GetInventorySlot():GetItem(), 1, self.InventorySlot)
		ent:SetInteractable(true)
		ent:Spawn()
		local phys = ent:GetPhysicsObject()
		phys:SetMass(0.75)
		ent:SetModel(self.WorldModel)
		ent:Activate()
		ent:Throw(ang:Forward(), 4000)
	
		local Damage = self.Damage * 1.25
		local Stick = self.Stick
		local HitSound = string.format(self.StrikeSound, math.random(1, 4))
        ent.PhysicsCollide = function(me, collider)
			if (ent.Damaged) then return end
			ent.Damaged = true
			
            local other = collider.HitEntity
			if (Stick) then
				ent.Damaged = true
				ent:SetMoveType(MOVETYPE_NONE)
			end

			ent:EmitSound(HitSound)
            if (other:IsPlayer() or (other.gRust and other:GetDamageable())) then
				
				local dmg = DamageInfo()
				dmg:SetDamage(Damage)
				dmg:SetAttacker(pl)
				dmg:SetDamageType(DMG_CLUB)
				dmg:SetInflictor(self)
				
				other:TakeDamageInfo(dmg)
                if (other:IsPlayer() or other:GetDamageSound()) then
                    pl:EmitSound("hit.default")
                end
            end
        end
		
		self.Thrown = false
	end)
end

function SWEP:PrimaryAttack()
	if (self:GetNextPrimaryFire() > CurTime()) then return end
	if (self.Thrown) then return end

	if (self.Throwing) then
		self:Throw()
		return
	end

	local pl = self:GetOwner()

	pl:SetAnimation(PLAYER_ATTACK1)

	self:EmitSound(self.SwingSound)
	self:PlayAnimation("SwingMiss")
	
	self:SetNextStrike(CurTime() + self.SwingDelay)
	self:SetNextPrimaryFire(CurTime() + self.SwingInterval)
end

function SWEP:SecondaryAttack()
end

local Mins = Vector(-4, -4, -4)
local Maxs = Vector(4, 4, 4)
function SWEP:Think()
	BaseClass.Think(self)

	local pl = self:GetOwner()

	local NextStrike = self:GetNextStrike()
	if (NextStrike ~= 0 and CurTime() >= NextStrike) then
		self:SetNextStrike(0)

		local tr = {}
		tr.start = pl:EyePos()
		tr.endpos = pl:EyePos() + pl:GetAimVector() * self.Range
		tr.filter = pl
		tr.mins = Mins
		tr.maxs = Maxs
		tr = util.TraceHull(tr)

		if (tr.Hit) then
			self:EmitSound(string.format(self.StrikeSound, math.random(1, 4)))
			self:PlayAnimation("SwingHit")

			if (CLIENT) then				
				if (tr.HitWorld) then
					self.WorldHits = self.WorldHits or 0
					if (self.WorldHits == 3) then
						pl:Hint("no_gather", "YOU CANNOT GATHER ANYTHING HERE", 0)
						self.WorldHits = 0
					else
						self.WorldHits = self.WorldHits + 1
					end
				else
					self.WorldHits = 0
				end
			end
			
			if (SERVER) then
				local dmg = DamageInfo()
				dmg:SetDamage(self.Damage)
				dmg:SetAttacker(pl)
				dmg:SetDamageType(DMG_CLUB)
				dmg:SetInflictor(self)
				dmg:SetDamagePosition(tr.HitPos)
				if (tr.Entity:IsPlayer()) then
					pl:LagCompensation(true)
					local eyetr = pl:GetEyeTraceNoCursor()
					pl:LagCompensation(false)

					GAMEMODE:ScalePlayerDamage(tr.Entity, eyetr.HitGroup, dmg)
				end
				tr.Entity:TakeDamageInfo(dmg)

				self:GetInventorySlot():SetWear(self:GetInventorySlot():GetWear() - 8)
				pl:SyncSlot(self.InventorySlot)

				local Harvest = self.HarvestAmount[tr.Entity:GetClass()]
				if (Harvest and Harvest > 0) then
					tr.Entity:Harvest(dmg, Harvest)
				end
			end
		end

		if (SERVER) then
			pl:HaltSprint(0.6)
		end
	end

	if (pl:KeyDown(IN_ATTACK2)) then
		if (!self.Throwing) then
			self:PlayAnimation("PullPin")
			self.Throwing = true
		end
	else
		if (self.Throwing) then
			self:PlayAnimation("SecondaryAttack")
			self.Throwing = false
		end
	end
end

function SWEP:Deploy()
	BaseClass.Deploy(self)
	self.Throwing 	= false
	self.Thrown		= false

	self:SetHoldType("melee2")
end

