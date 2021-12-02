-- "gamemodes\\rust\\gamemode\\core\\deploy\\deploy_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local DeployIndex
function gRust.RequestDeploy(index)
    local Item = LocalPlayer().Inventory[index]
    if (!Item) then return end
    local Class = gRust.Items[Item:GetItem()]:GetEntity()
    local DeployData = scripted_ents.Get(Class).Deploy

    DeployIndex = index

    if (!IsValid(gRust.DeployEntity)) then
        gRust.DeployEntity = ClientsideModel(DeployData.Model)
        if (DeployData.ModelScale) then
            gRust.DeployEntity:SetModelScale(DeployData.ModelScale)
        end
        gRust.DeployEntity:SetParent(LocalPlayer())
    end

    gRust.DeployEntity.Data = DeployData
end

function gRust.ResetDeploy()
    if (!IsValid(gRust.DeployEntity)) then return end
    gRust.DeployEntity:Remove()
    DeployIndex = nil
end

local function UpdateDeploy()
    if (!IsValid(gRust.DeployEntity)) then return end
    local Data = gRust.DeployEntity.Data
    local pos, ang = LocalPlayer():GetDeployPosition(Data)

    gRust.DeployEntity:SetPos(pos)
    gRust.DeployEntity:SetAngles(ang)

    if (LocalPlayer():CanDeploy(Data, gRust.DeployEntity)) then
        gRust.DeployEntity:SetMaterial("models/darky_m/rust_building/build_ghost")
    else
        gRust.DeployEntity:SetMaterial("models/darky_m/rust_building/build_ghost_disallow")
    end
end
hook.Add("Think", "gRust.DeployUpdate", UpdateDeploy)

local function CheckPlace(pl, key)
    if (!IsFirstTimePredicted()) then return end
    if (!IsValid(gRust.DeployEntity)) then return end
    if (key == IN_ATTACK) then
        if (!pl:CanDeploy(gRust.DeployEntity.Data, gRust.DeployEntity) or !DeployIndex) then return end
    
        net.Start("gRust.Deploy")
        net.WriteUInt(DeployIndex, 3)
        net.SendToServer()
    
        if (pl.Inventory[DeployIndex]:GetQuantity() <= 1) then
            gRust.ResetDeploy()
        end
    elseif (key == IN_RELOAD) then
        
    end
end
hook.Add("KeyPress", "gRust.DeployKey", CheckPlace)

