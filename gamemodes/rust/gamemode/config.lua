-- "gamemodes\\rust\\gamemode\\config.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
gRust.Testing               = false
gRust.InDev                 = true

--
-- Player Movement
--

gRust.Config.WalkSpeed      = 140
gRust.Config.RunSpeed       = 240
gRust.Config.CrouchSpeed    = 50
gRust.Config.JumpPower      = 190

--
-- Chat
--

gRust.Config.CmdPrefix      = "/"

--
-- Farming
--

gRust.Config.EntRespawnTime = 120
gRust.Config.WaterLevel     = -62

--
-- Interact
--

gRust.Config.InteractRange  = 10000
gRust.Config.MeleeRange     = 3000

--
-- Building
--

gRust.Config.TCRadius       = 500

--
-- Chat Messages
--

gRust.Config.ChatMessages   =
{
    {
        Text = "Want to contribute to the gRust.co project? Consider donating at <span class='link' link='https://store.grust.co/'>gRust.co/store</span> in exchange for in-game packages and skins!",
        Time = 300
    },
    {
        Text = "Be sure to join our Discord @ <span class='link' link='https://discord.gg/hrzUzMk5pw/'>discord.gg/hrzUzMk5pw</span>",
        Time = 450
    }
}

