-- "gamemodes\\rust\\gamemode\\core\\player\\gestures_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local PieMenu =
{
    {
		Name = "Wave",
		Desc = "Upgrades to Stone",
		Icon = "icons/gestures/wave.png",
        Act  = "wave",
	},
	{
		Name = "Thumbs Up",
		Desc = "Rotate the structure in place",
		Icon = "icons/gestures/thumbs_up.png",
        Act  = "agree",
	},
	{
		Name = "Thumbs Down",
		Desc = "Rotate the structure in place",
		Icon = "icons/gestures/thumbs_down.png",
        Act  = "disagree",
	},
	{
		Name = "Bow",
		Desc = "Upgrades to wood",
		Icon = "icons/gestures/dance.png",
        Act  = "bow",
	},
	{
		Name = "Laugh",
		Desc = "Upgrades to Stone",
		Icon = "icons/gestures/sexy_dance.png",
        Act  = "laugh",
	},
	{
		Name = "Salute",
		Desc = "Upgrades to Metal",
		Icon = "icons/gestures/hold_position.png",
        Act  = "salute",
	},
	{
		Name = "Beckon",
		Desc = "Upgrades to Metal",
		Icon = "icons/gestures/wave.png",
        Act  = "becon",
	},
	{
		Name = "Hold Position",
		Desc = "Raise a hand up",
		Icon = "icons/gestures/hold_position.png",
        Act  = "halt",
	},
	{
		Name = "Dance",
		Desc = "Groovin",
		Icon = "icons/gestures/dance.png",
        Act  = "dance",
	},
	{
		Name = "Sexy Dance",
		Desc = "Lure in your enimies",
		Icon = "icons/gestures/sexy_dance.png",
        Act  = "muscle",
	},
}

gRust.AddKeyBind(KEY_B, function(pl, down)
    if (down) then
        gRust.OpenPieMenu(PieMenu, function(i)
            RunConsoleCommand("act", PieMenu[i].Act)
        end)
    else
        gRust.ClosePieMenu()
    end
end)

