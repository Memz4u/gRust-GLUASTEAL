-- "gamemodes\\rust\\entities\\weapons\\rust_eoka.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
DEFINE_BASECLASS("rust_basegun")

SWEP.Base       = "rust_basegun"
SWEP.WorldModel = "models/weapons/darky_m/rust/w_eoka.mdl"
SWEP.ViewModel  = "models/weapons/darky_m/rust/c_eoka.mdl"

--
-- Stats
--
SWEP.Damage     = 14
SWEP.RPM        = 30
SWEP.AimCone    = 0.5
SWEP.Capacity   = 1
SWEP.ReloadTime = 2
SWEP.DrawTime   = 0.5

SWEP.Bullets 	= 18

SWEP.Ammo       = "handmade_shells"

SWEP.IronSightPos = nil

--
-- Sounds
--
SWEP.ShootSound		= "darky_rust.eoka-pistol-attack"
SWEP.SilencedSound	= "darky_rust.eoka-pistol-attack-silenced"

--
-- Recoil
--
SWEP.RecoilAmount   = 0.1
SWEP.RecoilTable = {
	Angle(-140, -70, 0),
}

function SWEP:PrimaryAttack()
end

function SWEP:SetupDataTables()
    BaseClass.SetupDataTables(self)
    self:NetworkVar("Bool", 1, "Striked")
end

function SWEP:Strike()
	if (CLIENT) then
		local ED = EffectData()
		ED:SetEntity(self:GetOwner():GetViewModel())
		ED:SetAttachment(2)
		ED:SetScale(0.1)
		util.Effect("CrossbowLoad", ED)
	else
		self.Owner:ViewPunch(Angle(-1, 0, 0))
	
		if (math.random() > 0.75) then
			self:SetStriked(true)
		else
			--self:PlayAnimation("SecondaryAttack")
		end
	end
end

function SWEP:Think()
	BaseClass.Think(self)

	if (self:GetStriked() and IsFirstTimePredicted()) then
		self:PlayAnimation("PrimaryAttack")
		self:ShootBullet(self.Damage, self.AimCone)
		
		if (SERVER) then
			self:GetInventorySlot():SetClip(0)
			self:SetClip1(0)
			self:GetOwner():SyncSlot(self.InventorySlot)
			self:GetOwner():EmitSound(self.ShootSound)
		end

		self:SetStriked(false)
	end

	if (self:Clip1() <= 0) then return end
	local pl = self:GetOwner()

	if (pl:KeyDown(IN_ATTACK)) then
		if (self:GetStriked()) then return end
		if (self.NextStrike) then
			if (self.NextStrike > CurTime()) then return end
			self.NextStrike = nil
			self:Strike()
		else
			self.NextStrike = CurTime() + 0.4
			self:PlayAnimation("SecondaryAttack")
		end
	end
end

function SWEP:Holster()
	self.NextStrike = nil
	return BaseClass.Holster(self)
end

