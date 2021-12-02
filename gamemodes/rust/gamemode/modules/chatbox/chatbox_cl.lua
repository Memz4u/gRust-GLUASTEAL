-- "gamemodes\\rust\\gamemode\\modules\\chatbox\\chatbox_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
function gRust.OpenChatbox()

end

function gRust.ReloadChat()
    local scrw, scrh = ScrW(), ScrH()

    if (IsValid(gRust.ChatList)) then
        gRust.ChatList:Remove()
    end

    local Frame = vgui.Create("Panel")
    Frame:SetTall(scrh * 0.7)
    Frame:SetWide(scrw * 0.25)
    Frame:SetX(scrw * 0.01)
    Frame:SetY(scrh * 0.5 - (scrh * 0.7) * 0.5)

    local Text = Frame:Add("RichText")
    Text.PerformLayout = function()
        Text:SetFontInternal("gRust.30px")
        Text:SetFGColor(0, 0, 255, 255)
    end
    Text:Dock(FILL)
    Text:SetContentAlignment(6)

    gRust.ChatList = Frame
    gRust.ChatList.Text = Text
end

local NameColor = gRust.Colors.Accent
_G.OldChatAddText = _G.OldChatAddText or chat.AddText

function chat.AddText(...)
    --[[local args = {...}
    local Chat = gRust.ChatList.Text

    for k, v in ipairs(args) do
        if (IsColor(v)) then
            gRust.ChatList.Text:InsertColorChange(v.r, v.g, v.b, 255)
        elseif (isstring(v)) then
            Chat:AppendText(v)
        elseif (v:IsPlayer()) then
            Chat:InsertColorChange(NameColor.r, NameColor.g, NameColor.b, 255)
            Chat:AppendText(v:Name())
        end
    end

    Chat:AppendText("\n")]]

    _G.OldChatAddText(...)
end

gRust.AddKeyBind(KEY_ENTER, function(pl, down)
    if (!down) then return end

    --pl:ChatPrint("Opened chatbox")
end)

