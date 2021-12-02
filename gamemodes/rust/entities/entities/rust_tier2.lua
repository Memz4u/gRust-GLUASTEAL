-- "gamemodes\\rust\\entities\\entities\\rust_tier2.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

ENT.Base = "rust_tier1"

ENT.Deploy = {}
ENT.Deploy.Model = "models/deployable/workbench_tier2.mdl"

ENT.MaxHealth		= 500

ENT.Pickup			= "tier2"

ENT.TechTree =
{
	{
		Item = "hazmat_suit",
		Direction = -1,
        Scrap = 125,
		Branch =
		{
            {
                Item = "medical_syringe",
                Scrap = 75,
                Branch =
                {
                    {
                        Item = "shotgun_ammo",
                        Scrap = 75,
                        Branch =
                        {
                            {
                                Item = "pump_shotgun",
                                Scrap = 125,
                                Branch =
                                {
                                    {
                                        Item = "sap",
                                        Scrap = 125,
                                        Branch =
                                        {
                                            {
                                                Item = "python",
                                                Scrap = 125,
                                                Branch =
                                                {
                                                    {
                                                        Item = "custom_smg",
                                                        Scrap = 150,
                                                        Branch =
                                                        {

                                                        }
                                                    },
                                                    {
                                                        Item = "thompson",
                                                        Scrap = 150,
                                                        Branch =
                                                        {
                                                            Item = "rifle_ammo",
                                                            Scrap = 125,
                                                            Branch =
                                                            {
                                                                {
                                                                    Item = "sar",
                                                                    Scrap = 150,
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    },
                },
            }
        }
	},
}

