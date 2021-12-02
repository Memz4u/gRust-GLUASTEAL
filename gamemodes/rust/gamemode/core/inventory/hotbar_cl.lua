-- "gamemodes\\rust\\gamemode\\core\\inventory\\hotbar_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local SelectedSlot = 0

local function CheckSlots(desc)
    if (SelectedSlot == nil) then
        gRust.ResetDeploy()

        net.Start("gRust.SelectWeapon")
        net.WriteUInt(0, 3)
        net.SendToServer()
        
        gRust.Hotbar:SetSelection(nil)
        return
    end

    if (SelectedSlot > 6) then
        SelectedSlot = 1
    elseif (SelectedSlot < 1) then
        SelectedSlot = 6
    end

    LocalPlayer().SelectedSlot = LocalPlayer().Inventory[SelectedSlot]
    
    gRust.ResetDeploy()

    net.Start("gRust.SelectWeapon")
    net.WriteUInt(SelectedSlot, 3)
    net.SendToServer()

    local Item = LocalPlayer().Inventory[SelectedSlot]
    if (!Item) then
        for i = desc and 5 or 1, desc and 1 or 5, desc and -1 or 1 do
            i = (i + SelectedSlot) % 7
            if (LocalPlayer().Inventory[i]) then
                SelectedSlot = i
                CheckSlots()

                return
            end
        end

        input.SelectWeapon(LocalPlayer():GetWeapons()[1])

        SelectedSlot = 0
        gRust.Hotbar:SetSelection(nil)

        return
    end
    
    gRust.Hotbar:SetSelection(SelectedSlot)

    if (gRust.Items[Item:GetItem()]:GetEntity()) then
        gRust.RequestDeploy(SelectedSlot)
    end
end

hook.Add("PlayerBindPress", "gRust.SelectSlot", function(pl, bind, pressed, code)
    if (string.sub(bind, 1, 4) ~= "slot") then return end

    if (SelectedSlot == tonumber(string.sub(bind, 5))) then
        SelectedSlot = nil
    else
        SelectedSlot = tonumber(string.sub(bind, 5))
    end
    CheckSlots()
end)

gRust.AddBind("invnext", function(pl)
    SelectedSlot = SelectedSlot + 1
    CheckSlots()
end)

gRust.AddBind("invprev", function(pl)
    SelectedSlot = SelectedSlot - 1
    CheckSlots(true)
end)

