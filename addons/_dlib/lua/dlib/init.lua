-- "addons\\_dlib\\lua\\dlib\\init.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
IncludeSV = SERVER and include or function() end
IncludeCL = CLIENT and include or AddCSLuaFile
IncludeSH = CLIENT and include or function(dir)
	AddCSLuaFile(dir)
	return include(dir)
end

--
-- Libraries
--

File    = IncludeSH("libs/file.lua")
Draw    = IncludeSH("libs/draw.lua")
Circle  = IncludeSH("libs/circle.lua")
Markup	= IncludeSH("libs/markup.lua")
SVG		= IncludeSH("libs/svg.lua")

--
-- Extensions
--

File.LoadDir("dlib/extensions")

