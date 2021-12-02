-- "gamemodes\\rust\\entities\\weapons\\rust_buildingplan\\cl_init.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
include("shared.lua")

function SWEP:Initialize()
	self.SelectedModel = "models/building/twig_foundation.mdl"
end

function SWEP:UpdatePlacement()
	if (!IsValid(self.PreviewEnt)) then
		self.PreviewEnt = ClientsideModel(self.SelectedModel)
		self.PreviewEnt:SetMoveType(MOVETYPE_NONE)
		self.PreviewEnt:Spawn()
	end
	
	local pos, ang = self:GetBuildPos()
	
	local pl = self:GetOwner()
	self.PreviewEnt:SetPos(pos)
	self.PreviewEnt:SetAngles(ang)
	self.PreviewEnt:SetParent(pl)
	self.PreviewEnt:SetModel(self.SelectedModel)

	if (self:CanBuild(pos)) then
		self.PreviewEnt:SetMaterial("models/darky_m/rust_building/build_ghost")
	else
		self.PreviewEnt:SetMaterial("models/darky_m/rust_building/build_ghost_disallow")
	end
end

function SWEP:SecondaryAttack()
	self.PieOpen = true
	gRust.OpenPieMenu(self.PieMenu, function(SelectionIndex)
		self.SelectedModel = self.PieMenu[SelectionIndex].Model

		net.Start("gRust.Build.Select")
		net.WriteUInt(SelectionIndex, 4)
		net.SendToServer()
	end)
end

function SWEP:Holster()
	if (IsValid(self.PreviewEnt)) then
		self.PreviewEnt:Remove()
	end
end

function SWEP:DrawHUD()
	local pl = self:GetOwner()

	self:UpdatePlacement()
	
	if (!pl:KeyDown(IN_ATTACK2) and self.PieOpen) then
		gRust.ClosePieMenu()
		self.PieOpen = false
	end
end

