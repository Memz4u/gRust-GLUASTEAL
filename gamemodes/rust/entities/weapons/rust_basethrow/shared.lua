-- "gamemodes\\rust\\entities\\weapons\\rust_basethrow\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
-- COPYRIGHT DOWN 2021, ALL RIGHTS RESERVED

SWEP.Base = "rust_base"

SWEP.ThrowDelay = 0.25
SWEP.ThrowForce = 2000
SWEP.FuseTime	= 3
SWEP.Stick		= false
SWEP.Damage     = 115

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + 1)

	self:PlayAnimation("Throw")
	self.NextThrow = CurTime() + self.ThrowDelay
end

function SWEP:Think()
	if (self.NextThrow and CurTime() > self.NextThrow) then
		self.NextThrow = nil

		local pl = self:GetOwner()
		
		if (SERVER) then
			local ang = pl:GetAimVector():Angle()

			pl:RemoveItem(self:GetInventorySlot():GetItem(), 1, self.InventorySlot)

			local ent = ents.Create("rust_projectile")
			ent:SetOwner(pl)
			ent:SetPos(pl:GetShootPos() + pl:EyeAngles():Forward() * 25)
			ent:SetAngles(ang)
			ent:Spawn()
			ent:SetModel(self.WorldModel)
			ent:Activate()
			ent:SetFuse(CurTime() + self.FuseTime)
			ent:Throw(ang:Forward(), self.ThrowForce)
			ent:SetStick(self.Stick)

			local CBack = self.FuseCallback
			local Damage = self.Damage
			ent.FuseCallback = function(ent)
				CBack(self, ent, Damage)
			end
		end
	end
end

function SWEP:FuseCallback(ent, damage)
	util.ScreenShake(ent:GetPos(), 5, 1, 2, 1000)
	util.BlastDamage(ent, ent:GetOwner(), ent:GetPos(), 256, damage)

	ent:EmitSound("darky_rust.beancan-grenade-explosion")
	ParticleEffect("rust_big_explosion", ent:GetPos(), ent:GetAngles())
end

