-- "lua\\includes\\extensions\\client\\globals.lua"
-- Retrieved by https://github.com/c4fe/glua-steal


if ( SERVER ) then return end


function ScreenScale( size )
	return size * ( ScrW() / 640.0 )	
end

SScale = ScreenScale


