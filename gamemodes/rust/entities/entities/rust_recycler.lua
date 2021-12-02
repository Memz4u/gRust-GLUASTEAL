-- "gamemodes\\rust\\entities\\entities\\rust_recycler.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
AddCSLuaFile()

ENT.Base = "rust_process"

ENT.ProcessItems =
{
	["rock"] =
	{
		{
			item = "stone",
			amount = 5,
		}
	},
	["assault_rifle"] =
	{
		{
			item = "hq_metal",
			amount = 25,
		},
		{
			item = "wood",
			amount = 100,
		},
		{
			item = "metal_spring",
			amount = 2,
		},
		{
			item = "rifle_body",
			amount = 1,
		}
	},
	["bandage"] =
	{
		{
			item = "cloth",
			amount = 2
		}
	},
	["bolt_rifle"] =
	{
		{
			item = "hq_metal",
			amount = 10,
		},
		{
			item = "metal_pipe",
			amount = 2,
		},
		{
			item = "rifle_body",
			amount = 1,
		},
		{
			item = "metal_spring",
			amount = 1,
		}
	},
	["custom_smg"] =
	{
		{
			item = "hq_metal",
			amount = 4,
		},
		{
			item = "smg_body",
			amount = 1,
		},
		{
			item = "metal_spring",
			amount = 1,
		},
	},
	["crossbow"] =
	{
		{
			item = "wood",
			amount = 100,
		},
		{
			item = "metal_fragments",
			amount = 38,
		},
		{
			item = "rope",
			amount = 1,
		}
	},
	["propane_tank"] =
	{
		{
			item = "scrap",
			amount = 1
		},
		{
			item = "metal_fragments",
			amount = 50
		}
	},
	["gears"] =
	{
		{
			item = "scrap",
			amount = 10
		},
		{
			item = "metal_fragments",
			amount = 13
		}
	},
	["rope"] =
	{
		{
			item = "cloth",
			amount = 15
		}
	},
	["hammer"] =
	{
		{
			item = "wood",
			amount = 50
		}
	},
	["hatchet"] =
	{
		{
			item = "wood",
			amount = 50
		},
		{
			item = "metal_fragments",
			amount = 38
		}
	},
	["hazmat_suit"] =
	{
		{
			item = "tarp",
			amount = 3
		},
		{
			item = "sewing_kit",
			amount = 1
		},
		{
			item = "hq_metal",
			amount = 4
		}
	},
	["hunting_bow"] =
	{
		{
			item = "wood",
			amount = 100
		},
		{
			item = "cloth",
			amount = 25
		}
	},
	["l96"] =
	{
		{
			item = "hq_metal",
			amount = 20
		},
		{
			item = "metal_pipe",
			amount = 3
		},
		{
			item = "metal_spring",
			amount = 3
		},
		{
			item = "rifle_body",
			amount = 1
		}
	},
	["lr300"] =
	{
		{
			item = "hq_metal",
			amount = 20
		},
		{
			item = "metal_spring",
			amount = 1
		},
		{
			item = "rifle_body",
			amount = 1
		}
	},
	["m249"] =
	{
		{
			item = "hq_metal",
			amount = 20
		},
		{
			item = "metal_spring",
			amount = 3
		},
		{
			item = "gears",
			amount = 3
		},
		{
			item = "rifle_body",
			amount = 1
		}
	},
	["mp5a4"] =
	{
		{
			item = "hq_metal",
			amount = 8
		},
		{
			item = "metal_spring",
			amount = 1
		},
		{
			item = "smg_body",
			amount = 1
		}
	},
	["metal_pipe"] =
	{
		{
			item = "scrap",
			amount = 5
		},
		{
			item = "hq_metal",
			amount = 1
		}
	},
	["pickaxe"] =
	{
		{
			item = "wood",
			amount = 50
		},
		{
			item = "metal_fragments",
			amount = 63
		}
	},
	["pistol_bullet"] =
	{
		{
			item = "metal_fragments",
			amount = 2
		},
		{
			item = "gun_powder",
			amount = 1
		}
	},
	["python"] =
	{
		{
			item = "metal_pipe",
			amount = 2
		},
		{
			item = "hq_metal",
			amount = 5
		},
		{
			item = "metal_spring",
			amount = 1
		}
	},
	["revolver"] =
	{
		{
			item = "cloth",
			amount = 13
		},
		{
			item = "metal_fragments",
			amount = 63
		},
		{
			item = "metal_pipe",
			amount = 1
		}
	},
	["rifle_body"] =
	{
		{
			item = "scrap",
			amount = 25
		},
		{
			item = "hq_metal",
			amount = 2
		}
	},
	["tech_trash"] =
	{
		{
			item = "scrap",
			amount = 20
		},
		{
			item = "hq_metal",
			amount = 1
		}
	},
	["road_signs"] =
	{
		{
			item = "scrap",
			amount = 10
		},
		{
			item = "hq_metal",
			amount = 2
		}
	},
	["metal_blade"] =
	{
		{
			item = "scrap",
			amount = 2
		},
		{
			item = "metal_fragments",
			amount = 15
		}
	},
	["gears"] =
	{
		{
			item = "scrap",
			amount = 10
		},
		{
			item = "metal_fragments",
			amount = 13
		}
	},
	["smg_body"] =
	{
		{
			item = "scrap",
			amount = 15
		},
		{
			item = "hq_metal",
			amount = 2
		}
	},
	["satchel"] =
	{
		{
			item = "beancan_grenade",
			amount = 2
		},
		{
			item = "rope",
			amount = 1
		}
	},
	["sar"] =
	{
		{
			item = "metal_fragments",
			amount = 225
		},
		{
			item = "hq_metal",
			amount = 2
		},
		{
			item = "semi_auto_body",
			amount = 1
		},
		{
			item = "metal_spring",
			amount = 1
		}
	},
	["sewing_kit"] =
	{
		{
			item = "cloth",
			amount = 10
		},
		{
			item = "rope",
			amount = 2
		}
	},
	["sheet_metal"] =
	{
		{
			item = "scrap",
			amount = 8
		},
		{
			item = "metal_fragments",
			amount = 100
		},
		{
			item = "hq_metal",
			amount = 1
		}
	},
	["metal_door"] =
	{
		{
			item = "metal_fragments",
			amount = 75
		}
	},
	["stone_hatchet"] =
	{
		{
			item = "wood",
			amount = 100
		},
		{
			item = "stone",
			amount = 50
		}
	},
	["stone_pickaxe"] =
	{
		{
			item = "wood",
			amount = 100
		},
		{
			item = "stone",
			amount = 50
		}
	},
	["tarp"] =
	{
		{
			item = "cloth",
			amount = 50
		}
	},
	["thompson"] =
	{
		{
			item = "hq_metal",
			amount = 5
		},
		{
			item = "wood",
			amount = 50
		},
		{
			item = "smg_body",
			amount = 1
		},
		{
			item = "metal_spring",
			amount = 1
		}
	},
	["tool_cupboard"] =
	{
		{
			item = "wood",
			amount = 50
		}
	},
	["wooden_door"] =
	{
		{
			item = "wood",
			amount = 150
		}
	},
	["rust_tier1"] =
	{
		{
			item = "wood",
			amount = 250
		},
		{
			item = "metal_fragments",
			amount = 50
		}
	},
	["rust_tier2"] =
	{
		{
			item = "metal_fragments",
			amount = 250
		},
		{
			item = "hq_metal",
			amount = 10
		}
	},
	["rust_tier3"] =
	{
		{
			item = "metal_fragments",
			amount = 500
		},
		{
			item = "hq_metal",
			amount = 50
		}
	},
}

ENT.StopOnEmpty = true

function ENT:Initialize()
	if (CLIENT) then return end
	
	self:SetModel("models/environment/utility/recycler.mdl")
	self:PhysicsInitStatic(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	self:SetInteractable(true)
	self:CreateInventory(12)
end

local Container
function ENT:ConstructInventory(panel, data, rows)
	if (IsValid(Container)) then
		Container:Remove()
	end

	Container = panel:Add("Panel")
	Container:Dock(FILL)

	local LeftMargin = ScrW() * 0.02
	local RightMargin = ScrW() * 0.05

	local Controls = Container:Add("Panel")
	Controls:Dock(BOTTOM)
	Controls:SetTall(ScrH() * 0.13)
	Controls:DockMargin(LeftMargin, 0, RightMargin, ScrH() * 0.15)

	local Title = Controls:Add("Panel")
	Title:Dock(TOP)
	Title:SetTall(ScrH() * 0.03)
	Title:DockMargin(0, 0, 0, ScrH() * 0.003)
	Title.Paint = function(me, w, h)
		surface.SetDrawColor(80, 76, 70, 175)
		surface.DrawRect(0, 0, w, h)
	end

	local ButtonPanel = Controls:Add("Panel")
	ButtonPanel:Dock(FILL)
	ButtonPanel.Paint = function(me, w, h)
		surface.SetDrawColor(80, 76, 70, 175)
		surface.DrawRect(0, 0, w, h)
	end

	local Margin = ScrH() * 0.01
	local ToggleButton = ButtonPanel:Add("gRust.Button")
	ToggleButton:Dock(LEFT)
	ToggleButton:SetText("Turn On")
	ToggleButton:DockMargin(Margin, Margin, Margin, Margin)
	ToggleButton:SetWide(ScrW() * 0.11)

	ToggleButton:SetDefaultColor(Color(39, 102, 65))
	ToggleButton:SetHoveredColor(Color(47, 136, 47))
	ToggleButton:SetActiveColor(Color(106, 177, 49))

	ToggleButton.Think = function(me)
		local On = self:GetNW2Bool("gRust.Enabled", false)
		if (On) then
			if (!me.On) then
				me.On = true
				me:SetText("Turn Off")

				ToggleButton:SetDefaultColor(Color(102, 59, 39))
				ToggleButton:SetHoveredColor(Color(136, 87, 47))
				ToggleButton:SetActiveColor(Color(177, 68, 49))
			end
		else
			if (me.On) then
				me.On = false
				me:SetText("Turn On")

				ToggleButton:SetDefaultColor(Color(39, 102, 65))
				ToggleButton:SetHoveredColor(Color(47, 136, 47))
				ToggleButton:SetActiveColor(Color(106, 177, 49))
			end
		end
	end
	ToggleButton.DoClick = function(me)
		self:Toggle()
	end

	local i = 1
	local function CreateRow(name)
		local Grid = Container:Add("gRust.Inventory.SlotGrid")
		Grid:Dock(BOTTOM)
		Grid:SetCols(6)
		Grid:SetRows(1)
		Grid:SetInventoryOffset((i - 1) * 6)
		Grid:SetEntity(self)
		Grid:SetMargin(data.margin)
		Grid:DockMargin(LeftMargin, 0, RightMargin, ScrH() * 0.01)
		Grid:SetTall(((data.wide / 8) + data.margin))
	
		local Name = Container:Add("Panel")
		Name:Dock(BOTTOM)
		Name:SetTall(ScrH() * 0.03)
		Name:DockMargin(LeftMargin - ScrW() *0.005, 0, RightMargin, ScrH() * 0.008)
		Name.Paint = function(me, w, h)
			surface.SetDrawColor(80, 76, 70, 175)
			surface.DrawRect(0, 0, w, h)
			draw.SimpleText(name, "gRust.38px", w * 0.01, h * 0.5, Color(255, 255, 255, 200), 0, 1)
		end

		i = i + 1
	end

	CreateRow("OUTPUT")
	CreateRow("INPUT")
end

