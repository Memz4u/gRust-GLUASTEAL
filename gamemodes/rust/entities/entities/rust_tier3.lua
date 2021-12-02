-- "gamemodes\\rust\\entities\\entities\\rust_tier3.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

ENT.Base = "rust_tier1"

ENT.Deploy = {}
ENT.Deploy.Model = "models/deployable/workbench_tier3.mdl"

ENT.MaxHealth		= 750

ENT.Pickup			= "tier3"

ENT.TechTree =
{
	{
		Item = "armored_door",
		Direction = 1,
        Scrap = 500,
		Branch =
		{
            {
                Item = "mp5",
                Scrap = 250,
                Branch =
                {
                    {
                        Item = "assault_rifle",
                        Scrap = 500,
                        Branch =
                        {
                            {
                                Item = "bolt_rifle",
                                Scrap = 500,
                            }
                        }
                    },
                    {
                        Item = "explosives",
                        Scrap = 500,
                        Direction = -1,
                        Branch =
                        {
                            {
                                Item = "c4",
                                Scrap = 500
                            }
                        }
                    }
                }
            }
        }
	},
}

