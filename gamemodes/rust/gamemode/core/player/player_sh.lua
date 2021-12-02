-- "gamemodes\\rust\\gamemode\\core\\player\\player_sh.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
function GM:Move(pl, mv)
	if (mv:KeyDown(IN_BACK) or mv:KeyDown(IN_MOVERIGHT) or mv:KeyDown(IN_MOVELEFT)) then
		if (!pl:Crouching()) then
			mv:SetMaxSpeed(pl:GetWalkSpeed())
			
			pl.CanSprint = false
		end
	else
		pl.CanSprint = true
	end

	if (mv:KeyPressed(IN_JUMP) && pl:IsOnGround()) then
		pl:ViewPunch(Angle(-3, 0, 0))
		mv:SetVelocity(mv:GetVelocity() * 0.8)
	end
end

function GM:OnPlayerHitGround(pl, inwater, onfloater, speed)
	pl:ViewPunch(Angle(speed * 0.022, 0, 0))
end

local SprintAmount = gRust.Config.RunSpeed - 80
local PLAYER = FindMetaTable("Player")
function PLAYER:IsSprinting()
	return  self:KeyDown(IN_SPEED) and
			self:GetVelocity():LengthSqr() > SprintAmount^2
end

do
	if (SERVER) then
		util.AddNetworkString("gRust.ChatPrint")
	end

	function PLAYER:ChatPrint(txt)
		if (SERVER) then
			net.Start("gRust.ChatPrint")
			net.WriteString(txt)
			net.Send(self)
		else
			chat.AddText(Color(255, 255, 255), txt)
		end
	end

	if (CLIENT) then
		net.Receive("gRust.ChatPrint", function()
			LocalPlayer():ChatPrint(net.ReadString())
		end)
	end
end

function gRust.FindPlayer(id, requester)
	if (id == "^") then
		return requester
	end

	if (id == "@" and IsValid(requester) and requester:IsPlayer()) then
		return requester:GetEyeTrace().Entity
	end

	id = string.lower(id)

	local Players = player.GetAll()
	for i = 1, #Players do
		local pl = Players[i]
		if (string.find(string.lower(pl:Name()), id)) then
			return pl
		end
	end
end

PLAYER.gRust = true
timer.Simple(0, function() -- Just incase GetIcon isn't registered yet
	PLAYER.DisplayIcon = gRust.GetIcon("add")
end)
function PLAYER:GetDisplayName()
	return "INVITE TO TEAM"
end

function GM:PlayerFootstep(pl, pos, foot, sound, volume, filter)
	return pl:Crouching()
end

local ColEnts = {
    ["rust_droppeditem"] = "rust_droppeditem",
    ["rust_hemp"] = "*",
    ["rust_sleepingplayer"] = "player",
    ["rust_storage"] = "player",
}

function GM:ShouldCollide(ent1, ent2)
    ent1 = ent1:GetClass()
    ent2 = ent2:GetClass()
    local ent = ColEnts[ent1]
    
    if (ent && ent == ent2 || ent == "*") then
        return false
    end
    
    return true
end

