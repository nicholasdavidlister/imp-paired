module (..., package.seeall)
local OVERLAP = 9
local FRACTION_STROKE_OFFSET_X = -5
local FRACTION_STROKE_OFFSET_Y = 15
local DENOMINATOR_OFFSET_X = -5
local DENOMINATOR_OFFSET_Y = 30

function new(number, color, signed)
	local customNumber = display.newGroup()
	local t = {}
	if signed then
		if number > 0 then t[1] = "plus"
		elseif number < 0 then t[1] = "minus"
		end
	end
	for digit in string.gmatch(tostring(number), "%d") do
		table.insert(t, digit)
	end
	local background = display.newGroup()
	for i,v in ipairs(t) do
		local img = display.newImage("graphics/numbers/"..v.."_bg.png")
		img:setReferencePoint(display.TopLeftReferencePoint)
		if background.numChildren > 0 then
			img.x = background[i-1].x + background[i-1].width - OVERLAP
		end
		background:insert(img)
	end
	local foreground = display.newGroup()
	for i,v in ipairs(t) do
		local img = display.newImage("graphics/numbers/"..v.."_"..color..".png")
		img:setReferencePoint(display.TopLeftReferencePoint)
		if foreground.numChildren > 0 then
			img.x = foreground[i-1].x + foreground[i-1].width - OVERLAP
		end
		foreground:insert(img)
	end
	customNumber:insert(background)
	customNumber:insert(foreground)
	return customNumber
end

function newCustomFraction(numerator, denominator, color)
	local customFraction = display.newGroup()
	local t = {}
	for digit in string.gmatch(tostring(numerator), "%d") do
		table.insert(t, digit)
	end
	table.insert(t, "stroke")
	for digit in string.gmatch(tostring(denominator), "%d") do
		table.insert(t, digit)
	end
	local background = display.newGroup()
	for i,v in ipairs(t) do
		local img = display.newImage("graphics/numbers/"..v.."_bg.png")
		img:setReferencePoint(display.TopLeftReferencePoint)
		if background.numChildren > 0 then
			img.x = background[i-1].x + background[i-1].width - OVERLAP
			if v == "stroke" then img.x = img.x + FRACTION_STROKE_OFFSET_X; img.y = img.y + FRACTION_STROKE_OFFSET_Y
			elseif t[i-1] == "stroke" then img.x = img.x + DENOMINATOR_OFFSET_X; img.y = img.y + DENOMINATOR_OFFSET_Y end
		end
		background:insert(img)
	end
	local foreground = display.newGroup()
	for i,v in ipairs(t) do
		local img = display.newImage("graphics/numbers/"..v.."_"..color..".png")
		img:setReferencePoint(display.TopLeftReferencePoint)
		if foreground.numChildren > 0 then
			img.x = foreground[i-1].x + foreground[i-1].width - OVERLAP
			if v == "stroke" then img.x = img.x + FRACTION_STROKE_OFFSET_X; img.y = img.y + FRACTION_STROKE_OFFSET_Y
			elseif t[i-1] == "stroke" then img.x = img.x + DENOMINATOR_OFFSET_X; img.y = img.y + DENOMINATOR_OFFSET_Y end
		end
		foreground:insert(img)
	end
	customFraction:insert(background)
	customFraction:insert(foreground)
	return customFraction
end