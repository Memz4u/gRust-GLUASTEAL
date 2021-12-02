-- "gamemodes\\rust\\gamemode\\cl_init.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
include("shared.lua")

local Size = 512
local graph = {}

for i = 1, Size do
	graph[i] = 0
end

local function GraphPush(val)
	table.remove(graph, 1)
	graph[Size] = -val
end

do
	RunConsoleCommand("cl_interp", 0)
end

--[[local DefaultZ = 0
hook.Add("HUDPaint", "Rust.UpdateMouseGraph", function(pl)
	--[[
	GraphPush(
		SysTime() - 26720
	)
end)

local Step = 5
local Y = ScrH() * 0.5
local Mul = 100
gui.EnableScreenClicker(true)
hook.Add("HUDPaint", "Rust.DrawGraph", function()
	surface.SetDrawColor(10, 10, 10)
	surface.DrawRect(0, 0, ScrW(), ScrH())

	surface.SetDrawColor(255, 255, 255, 200)
	surface.DrawLine(0, Y + (Mul * 0.5), ScrW(), Y + (Mul * 0.5))
	surface.DrawLine(0, Y - (Mul * 0.5), ScrW(), Y - (Mul * 0.5))
	
	for i = 1, Size do
		local Next = graph[i + 1]
		if (!Next) then return end
		surface.SetDrawColor(i / Size * 255, (Size - i) / Size * 255, 0)

		for j = 1, 4 do
			surface.DrawLine(i * Step + j, (graph[i] * Mul) + Y + j, (i + 1) * Step + j, (Next * Mul) + Y + j)
		end
	end
end)

local Count = 200
local Spacing = 10
local SortsPerSecond = 1
local Data = {}
for i = 1, Count do
	Data[i] = i
end
CorrectSort = table.Copy(Data)
for j = 1, 10 do
	for i, v in ipairs(Data) do
		math.randomseed(i + FrameNumber() * FrameTime())
		if (!Data[i - j]) then continue end
		if (math.random(1, 2) == 1) then
			Data[i - j], Data[i] = Data[i], Data[i - j]
		end
	end
end

local Interval = 0
local Iter = 1
local IterCount = 0
local Padding = 20

local Start = SysTime()
local Time = 0

local Algorithm = "BubbleSort"

local Ignores = {}
local LastIgnore

hook.Add("PostRenderVGUI", "gRust.DrawSort", function()
	local scrw, scrh = ScrW(), ScrH()
	surface.SetDrawColor(0, 0, 0)
	surface.DrawRect(0, 0, scrw, scrh)

	draw.SimpleText(string.format("Algorithm: %s", Algorithm), "gRust.32px", Padding, Padding, color_white, 0, 0)
	draw.SimpleText(string.format("Iteration: %i", IterCount), "gRust.32px", Padding, Padding * 2.5, color_white, 0, 0)
	draw.SimpleText(string.format("Time: %f", Time), "gRust.32px", Padding, Padding * 4, color_white, 0, 0)

	local DidSort = false
	local Sorted = {}
	for i = 1, SortsPerSecond do
		Iter = ((Iter + 1) % (Count + 1))

		if (Algorithm == "BubbleSort") then
			
			local Recursions = 0
			::redo::
			Recursions = Recursions + 1

			local Old = Iter
			local New = Iter + 1
			if (!Data[New] or !Data[Old]) then goto con end

			if (Recursions >= Count) then goto con end

			if (Data[Old] > Data[New]) then
				DidSort = true
				Sorted[New] = true
				Sorted[Old] = true
				Data[Old], Data[New] = Data[New], Data[Old]
			else
				Iter = Iter + 1
				goto redo
			end
		elseif (Algorithm == "BogoSort") then
			for j = 1, Count do
				local Old = math.random(1, Count)
				local New = math.random(1, Count)
				Data[Old], Data[New] = Data[New], Data[Old]
				DidSort = true
			end
		elseif (Algorithm == "Down's BogoSort") then
			local Old = math.random(1, Count)
			local New = math.random(1, Count)
			if (New < Old and Data[New] > Data[Old]) then
				Data[Old], Data[New] = Data[New], Data[Old]
				DidSort = true
			end
		end

		if (DidSort) then
			IterCount = IterCount + 1
			Time = SysTime() - Start
		end
	end

	::con::

	local Wide = (scrw / Count)
	for i = 1, Count do
		if (Ignores[i]) then return end
		if (i == (Count or LastIgnore)) then
			LastIgnore = i
			Ignores[i] = true
		end

		local num = Data[i]
		local Tall = (num / Count) * scrh
		if (Sorted[i]) then
			surface.SetDrawColor(255, 0, 0)
		elseif (CorrectSort[i] ~= num) then
			surface.SetDrawColor(255, 255, 255)
		else
			surface.SetDrawColor(0, 50, 0)
		end
		surface.DrawRect((i - 1) * Wide, scrh - Tall, Wide - Spacing, Tall)
	end
end)]]
--[[
local CellSize = 5
local Start = CurTime() + 0.3
hook.Add("HUDPaint", "Bezier", function()
	local Graph = {}
	for i = 1, (CurTime() - Start) / 0.01 do
		table.insert(Graph, math.EaseInOut(i) * 20)
	end

	surface.SetDrawColor(6, 6, 6)
	surface.DrawRect(0, 0, ScrW(), ScrH())

	local Cols = ScrW() / CellSize
	local Rows = ScrH() / CellSize
	for x = 1, Cols do
		local x1 = x * CellSize

		if (x == math.floor(Cols * 0.5)) then
			surface.SetDrawColor(255, 255, 255)
		else
			surface.SetDrawColor(255, 255, 255, 10)
		end
		surface.DrawLine(x1, 0, x1, ScrH())
		
		surface.SetDrawColor(255, 255, 255)
		surface.DrawLine(x1, ScrH() * 0.5 - CellSize * 0.5, x1, ScrH() * 0.5 + CellSize * 0.5)
	end

	for y = 1, Rows do
		local y1 = y * CellSize
		if (y == math.floor(Rows * 0.5)) then
			surface.SetDrawColor(255, 255, 255)
		else
			surface.SetDrawColor(255, 255, 255, 10)
		end
		surface.DrawLine(0, y1, ScrW(), y1)

		surface.SetDrawColor(255, 255, 255)
		surface.DrawLine(ScrW() * 0.5 - CellSize * 0.5, y1, ScrW() * 0.5 + CellSize * 0.5, y1)
	end

	surface.SetDrawColor(255, 255, 255)
	for k, v in ipairs(Graph) do
		if (!Graph[k - 1]) then continue end
		surface.DrawLine((ScrW() * 0.5) + (k - 1) * CellSize, (ScrH() * 0.5) + Graph[k - 1] * CellSize, (ScrW() * 0.5) + k * CellSize, (ScrH() * 0.5) + v * CellSize)
	end
end)]]

