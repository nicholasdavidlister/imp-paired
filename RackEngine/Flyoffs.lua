module(...,package.seeall)
local Layers = require "Layers"
local Layout = require "Layout"
local UICustomNumber = require "UICustomNumber"

BONUS_2_2 = "2_2"
BONUS_3 = "3"
BONUS_4 = "4"

function displayFlyingFraction(x, y, numerator, denominator, time)
	local number = UICustomNumber.newCustomFraction(numerator, denominator, "blue")
	number:setReferencePoint(display.CenterReferencePoint)
	local proportion = numerator/denominator
	number.yScale = (30 + proportion * 10) * Layout.getScale() / number.height
	number.xScale = number.yScale
	number.x = x
	number.y = y
	Layers.addToLayer(number, Layers.FLYOFFS_LAYER)
	transition.to(number, {time = time, y = number.y - 50 * Layout.getScale(), alpha = 0.3, onComplete = function() number:removeSelf() end})
	return number
end

function displayFlyingNumber(x, y, value, time)
	local number = UICustomNumber.new(value, "yellow", false)
	number:setReferencePoint(display.CenterReferencePoint)
	number.yScale = 30 * Layout.getScale() / number.height
	number.xScale = number.yScale
	number.x = x
	number.y = y
	Layers.addToLayer(number, Layers.FLYOFFS_LAYER)
	transition.to(number, {time = time, y = number.y - 50 * Layout.getScale(), alpha = 0.3, onComplete = function() number:removeSelf() end})
	return number
end

function displayBonus(name)
	local flyoff = display.newImage("graphics/matchSigns/"..name..".png")
	flyoff:setReferencePoint(display.BottomCenterReferencePoint)
	local startX = Layout.rackOriginX() + (Layout.rackWidth() / 2)
	local startY =  Layout.rackOriginY() + (Layout.rackHeight() / 2)
	flyoff.x = startX
	flyoff.y = startY
	flyoff.xScale = (192 * Layout.getScale()) / flyoff.width
	flyoff.yScale = (112 * Layout.getScale()) / flyoff.height
	transition.to(flyoff, {time = 1200, y = flyoff.y - 50 * Layout.getScale(), xScale = flyoff.xScale * 1.1, yScale = flyoff.yScale * 1.1, onComplete = function() flyoff:removeSelf() end})
	transition.to(flyoff, {time = 500, delay = 200, alpha = 0.4})
--	if name == BONUS_2_2 then Audio.play2_2MatchSound()
--	elseif name == BONUS_3 then Audio.play3MatchSound()
--	elseif name == BONUS_4 then Audio.play4MatchSound() end
	Layers.addToLayer(flyoff, Layers.FLYOFFS_LAYER)
end