-- "gamemodes\\rust\\entities\\entities\\rust_tier1.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

ENT.Base = "rust_base"

ENT.Deploy = {}
ENT.Deploy.Model 	= "models/deployable/workbench_tier1.mdl"

ENT.DisplayIcon 	= gRust.GetIcon("gear")

ENT.MaxHealth		= 250
ENT.ShowHealth		= true

ENT.Pickup			= "tier1"

function ENT:Initialize()
	if (CLIENT) then return end

	self:SetModel(self.Deploy.Model)
	self:SetSolid(SOLID_VPHYSICS)

	self:SetHealth(self.MaxHealth)
	self:SetMaxHealth(self.MaxHealth)

	self:SetDamageable(true)
	
	self:SetMeleeDamage(0.1)
	self:SetBulletDamage(0.1)
	self:SetExplosiveDamage(0.5)

	self:SetInteractable(true)
	self:SetDisplayName("USE")
end

ENT.TechTree =
{
	{
		Item = "pickaxe",
		Direction = -1,
		Scrap = 125,
		Branch =
		{
			{
				Item = "waterpipe_shotgun",
				Scrap = 75,
				Branch =
				{
					{
						Item = "pistol_ammo",
						Scrap = 75,
						Branch =
						{
							{
								Item = "revolver",
								Scrap = 125,
								Branch =
								{
									{
										Item = "beancan_grenade",
										Scrap = 125,
										Branch =
										{
											{
												Item = "satchel_charge",
												Scrap = 125,
											}
										}
									}
								}
							}
						}
					},
					{
						Item = "dbarrel",
						Scrap = 125,
						Branch =
						{
							
						}
					},
					{
						Item = "combat_knife",
						Scrap = 125,
					}
				}
			}
		}
	},
	{
		Item 	= "hatchet",
		Direction = 2,
		Scrap = 125,
		Branch	=
		{
			{
				Item = "stone_barricade",
				Scrap = 75,
			}
		}
	}
}

function ENT:Interact(pl)
	if (SERVER) then return end
	gRust.ToggleTechTree(self)
end

