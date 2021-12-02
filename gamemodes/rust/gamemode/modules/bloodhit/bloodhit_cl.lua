-- "gamemodes\\rust\\gamemode\\modules\\bloodhit\\bloodhit_cl.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local enableBlood = GetConVar("violence_hblood") -- no blood convar

local sW, sH = ScrW(), ScrH()
local bloodSize = sH/1.5 -- blood stain size based on screen size
local bloodSpots = {} -- spots on screen table

local math = math -- some cool guys doing it too also i have a lot of math here

local bloodMat = Material("effects/rust_blood/bloodhit.png", "noclamp smooth")
local overlayBleeding = Material("effects/rust_blood/overlay_bleeding") -- caching materials

local nextHPCheck = CurTime() -- i don't want to check hp every frame so i will check it every 0.2 sec
local HP = 0

local lowHPpp = { -- color correction table
	[ "$pp_colour_addr" ] = 0,
	[ "$pp_colour_addg" ] = 0,
	[ "$pp_colour_addb" ] = 0,
	[ "$pp_colour_brightness" ] = 0,
	[ "$pp_colour_contrast" ] = 1,
	[ "$pp_colour_colour" ] = 1,
	[ "$pp_colour_mulr" ] = 0,
	[ "$pp_colour_mulg" ] = 0,
	[ "$pp_colour_mulb" ] = 0
}

local function addBloodSpot(attacker) -- calculating and placing bloodstain in table
    local hitVec =  attacker:GetPos() - LocalPlayer():GetPos()
    local bloodAng = math.atan2(hitVec.x, hitVec.y) + math.rad(LocalPlayer():EyeAngles().y) + 3.14 -- mathe
    local clampedX, clampedY = math.Clamp((math.cos(bloodAng) * sW/1.5) + sW/2, 0, sW), math.Clamp((math.sin(bloodAng) * sH/1.5) + sH/2, 0, sH)

    table.insert(bloodSpots, {
        x = clampedX+ math.random(-50, 50),
        y = clampedY+ math.random(-50, 50),
        time = CurTime() + 5,
        size = bloodSize + math.random(-50, 50),
        ang = math.random(0, 360)
    })

    HP = 1 - math.min(LocalPlayer():Health()/50, 1) -- updating hp and saturation no matter timer
    lowHPpp[ "$pp_colour_colour" ] = 1 - 0.55*HP
end

net.Receive("gRust.BloodHit", function() addBloodSpot(net.ReadEntity()) end) -- if we got hit do function

hook.Add("HUDPaint", "RustBloodHit", function() -- draw this shit
    local CT = CurTime()
    surface.SetMaterial(bloodMat)

    for k, v in ipairs(bloodSpots) do
        local decay = math.max(0, (v.time - CT)) *45
        if decay <= 0 then 
            table.remove(bloodSpots, k) -- removing old stains
        end

        if enableBlood:GetBool() then -- if blood enabled make it red else white
            surface.SetDrawColor(109,0,0, decay) 
        else
            surface.SetDrawColor(231,231,231, decay)
        end

        surface.DrawTexturedRectRotated(v.x, v.y, v.size, v.size, v.ang)  
    end

    if HP<0 and enableBlood:GetBool() then -- blood overlay
        surface.SetDrawColor(255, 255, 255, 150 *HP)
        surface.SetMaterial(overlayBleeding)
        surface.DrawTexturedRect(0, 0, sW, sH)
    end

    draw.NoTexture()

    if CT>=nextHPCheck then -- hp checking
        nextHPCheck = CT+0.25
        HP = 1 - math.min(LocalPlayer():Health()/50, 1)
        lowHPpp[ "$pp_colour_colour" ] = 1 - 0.55*HP
    end
end)

hook.Add("RenderScreenspaceEffects", "RustBloodEffects", function() -- color modifing and drawing distortion overlay
    if enableBlood:GetBool() and HP<0 then
        DrawColorModify(lowHPpp)
        --DrawMaterialOverlay("effects/rust_blood/overlay", -0.07*HP)
    end
end)

hook.Add("OnScreenSizeChanged", "RustBloodResChange", function()
    sW, sH = ScrW(), ScrH()
end)

