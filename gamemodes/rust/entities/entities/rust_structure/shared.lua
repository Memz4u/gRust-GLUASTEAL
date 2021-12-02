-- "gamemodes\\rust\\entities\\entities\\rust_structure\\shared.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
ENT.Type    = "anim"
ENT.Base    = "rust_base"

gRust.BuildingBlocks =
{
    -- STRUCTURE_FLOOR
    ["models/building/twig_foundation.mdl"] =
    {
        Offset = Vector(64, 0, 0),
        Angle = Angle(0, 0, 0),
        Sockets =
        {
            {pos = Vector(65, 0, 0), ang = Angle(0, 90, 0)},
            {pos = Vector(0, 65, 0), ang = Angle(0, 180, 0)},
            {pos = Vector(-65, 0, 0), ang = Angle(0, -90, 0)},
            {pos = Vector(0, -65, 0), ang = Angle(0, 0, 0)}
        }
    },
    ["models/building/twig_foundation_trig.mdl"] =
    {
        Offset = Vector(55, 0, 0),
        Angle = Angle(0, -90, 0),
        Sockets =
        {
            {pos = Vector(0, 32.5, 0), ang = Angle(0, 150, 0)},
            {pos = Vector(0, -32.5, 0), ang = Angle(0, 30, 0)},
            {pos = Vector(-57.5, 0, 0), ang = Angle(0, -90, 0)}
        }
    },
    ["models/building/twig_floor.mdl"] =
    {
        Offset = Vector(64, 0, 0),
        Angle = Angle(0, 0, 0),
        Sockets =
        {
            {pos = Vector(65, 0, 0), ang = Angle(0, 90, 0)},
            {pos = Vector(0, 65, 0), ang = Angle(0, 180, 0)},
            {pos = Vector(-65, 0, 0), ang = Angle(0, -90, 0)},
            {pos = Vector(0, -65, 0), ang = Angle(0, 0, 0)}
        }
    },
    ["models/building/twig_fframe.mdl"] =
    {
        Offset = Vector(64, 0, 0),
        Angle = Angle(0, 0, 0),
        Sockets =
        {
            {pos = Vector(65, 0, 0), ang = Angle(0, 90, 0)},
            {pos = Vector(0, 65, 0), ang = Angle(0, 180, 0)},
            {pos = Vector(-65, 0, 0), ang = Angle(0, -90, 0)},
            {pos = Vector(0, -65, 0), ang = Angle(0, 0, 0)}
        }
    },
    ["models/building/twig_floor_trig.mdl"] =
    {
        Offset = Vector(55, 0, 0),
        Angle = Angle(0, -90, 0),
        Sockets =
        {
            {pos = Vector(0, 32.5, 0), ang = Angle(0, 150, 0)},
            {pos = Vector(0, -32.5, 0), ang = Angle(0, 30, 0)},
            {pos = Vector(-57.5, 0, 0), ang = Angle(0, -90, 0)}
        }
    },
    ["models/building/twig_steps.mdl"] =
    {
        Offset = Vector(65, 0, -61),
        Angle = Angle(0, 180, 0),
        Sockets =
        {
            {pos = Vector(0, 0, 0), ang = Angle(0, 0, 0)}
        }
    },

    -- STRUCTURE_WALL
    ["models/building/twig_wall.mdl"] =
    {
        Offset = Vector(0, 0, 0),
        Angle = Angle(0, 0, 0),
        Sockets =
        {
            {pos = Vector(0, 0, 125), ang = Angle(0, 180, 0)}
        }
    },
    ["models/building/twig_dframe.mdl"] =
    {
        Offset = Vector(0, 0, 0),
        Angle = Angle(0, 0, 0),
        Sockets =
        {
            {pos = Vector(0, 0, 125), ang = Angle(0, 180, 0)},
            ["door"] =
            {
                {pos = Vector(25, 0, 7.5), ang = Angle(0, 180, 0)},
                {pos = Vector(-25, 0, 7.5), ang = Angle(0, 0, 0)}
            }
        }
    },
    ["models/building/twig_gframe.mdl"] =
    {
        Offset = Vector(0, 0, 0),
        Angle = Angle(0, 0, 0),
        Sockets =
        {
            {pos = Vector(0, 0, 125), ang = Angle(0, 180, 0)},
            ["garage"] =
            {
                {pos = Vector(0, -5, 125), ang = Angle(0, 0, 0)}
            }
        }
    },
    ["models/building/twig_wind.mdl"] =
    {
        Offset = Vector(0, 0, 0),
        Angle = Angle(0, 0, 0),
        Sockets =
        {
            {pos = Vector(0, 0, 125), ang = Angle(0, 180, 0)}
        }
    },
    ["models/building/twig_hwall.mdl"] =
    {
        Offset = Vector(0, 0, 0),
        Angle = Angle(0, 0, 0),
        Sockets =
        {
            {pos = Vector(0, 0, 62.35), ang = Angle(0, 180, 0)}
        }
    },
    ["models/building/twig_twall.mdl"] =
    {
        Offset = Vector(0, 0, 0),
        Angle = Angle(0, 0, 0),
        Sockets =
        {
            {pos = Vector(0, 0, 40.725), ang = Angle(0, 180, 0)}
        }
    },
    ["models/building/twig_lst.mdl"] =
    {
        Offset = Vector(-65, 0, 0),
        Angle = Angle(0, 0, 0),
        Sockets =
        {

        }
    },
    ["models/building/twig_ust.mdl"] =
    {
        Offset = Vector(-65, 0, 0),
        Angle = Angle(0, 0, 0),
        Sockets =
        {

        }
    }
}

function ENT:GetOriginalModel()
    local mdl = string.sub(self:GetModel(), 16)
    mdl = string.sub(self:GetModel(), 1, 16) .. string.gsub(mdl, "/(.-)_", "twig_")
    
    return mdl
end

