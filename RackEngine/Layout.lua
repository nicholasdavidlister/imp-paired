module (..., package.seeall)

local _H = display.getCurrentStage().height
local _W = display.getCurrentStage().width
local iH = 480
local iW = 320

function isNarrow()
	if _W/_H < iW/iH then
		return true
	else 
		return false 
	end
end

function getScale()
	if isNarrow() then
		return _W/iW
	else
		return _H/iH
	end
end

function rescaleImage(image, desiredX, desiredY)
	if desiredX ~= nil and (desiredX > 0 or desiredX < 0) then
		image.xScale = (desiredX / image.width) * getScale()
		if desiredY ~= nil and (desiredY > 0 or desiredY < 0) then 
			image.yScale = (desiredY / image.height) * getScale()
		else
			image.yScale = image.xScale
		end
	elseif desiredY ~= nil and (desiredY > 0 or desiredY < 0) then
		image.yScale = (desiredY / image.height) * getScale()
		image.xScale = image.yScale
	end
end

function leftBorder()
	if not isNarrow() then
		local boardWidth = iW * getScale()
		return (_W - boardWidth) / 2
	else
		return 0
	end
end

function topBorder()
	if isNarrow() then
		local boardHeight = iH * getScale()
		return (_H - boardHeight) / 2
	else
		return 0
	end
end

function bottomEdge()
	if isNarrow() then
		return math.ceil((iH * getScale()) + topBorder())
	else
		return _H
	end
end

function rightEdge()
	if isNarrow() then
		return _W
	else
		return math.ceil((iW * getScale()) + leftBorder())
	end
end

function screenWidth()
	if isNarrow() then
		return _W
	else
		return iW * getScale()
	end
end

function screenHeight()
	if isNarrow() then
		return iH * getScale()
	else
		return _H
	end
end

function rackWidth()
	return 284 * getScale()
end

function rackHeight()
	return 379 * getScale()
end

function rackOriginX()
	if isNarrow() then
		return (18 / iW) *_W
	else
		return (18 / iH) * _H + leftBorder()
	end
end

function rackOriginY()
	if isNarrow() then
		return (20 / iW) * _W + topBorder()
	else
		return (20 / iH) * _H
	end
end

function counterDialX()
	return (iW * (1/6) - (71/2)) * getScale() + leftBorder()
end

function timerDialX()
	return (iW * 0.5 - (71/2)) * getScale() + leftBorder()
end

function subDialX()
	return (iW * (5/6) - (71/2)) * getScale() + leftBorder()
end

function dialY()
	return (iH - 76) * getScale() + topBorder()
end

function labelRects(number)
	local Rectangle = require "Rectangle"
	local rectangles = {}
	local lH = 112
	local lW = 192
	local hOfLabelDisplay = lH * number + 10 * (number-1)
	for i = 1, number do
		local temp = Rectangle.new()
		temp.width = lW * getScale()
		temp.height = lH * getScale()
		local tempX = (iW - lW) / 2
		temp.origin.x = (tempX * getScale()) + leftBorder()
		local tempY = (iH - hOfLabelDisplay) / 2 + (lH + 10) * (i-1) 
		temp.origin.y = (tempY * getScale()) + topBorder()
		rectangles[i] = temp
	end
	return rectangles
end

function labelPoints(number)
	local points = {}
	local lH = 112
	local lW = 192
	local hOfLabelDisplay = lH * number + 10 * (number-1)
	for i = 1, number do
		points[i] = Point.new()
		local tempW = lW * getScale()
		local tempH = lH * getScale()
		local tempX = (iW - lW) / 2
		local tempOriginX = (tempX * getScale()) + leftBorder()
		local tempY = (iH - hOfLabelDisplay) / 2 + (lH + 10) * (i-1) 
		local tempOriginY = (tempY * getScale()) + topBorder()
		points[i].x = tempOriginX + (tempW / 2)
		points[i].y = tempOriginY + (tempH / 2)
	end
	return points
end

function dialBoardOriginX()
	return leftBorder()
end

function dialBoardOriginY()
	return (iH - 81) * getScale() + topBorder()
end

function sideBarY()
	return 20 * getScale() + topBorder()
end

function levelLabelStartRect()
	local rectArray = labelRects(1)
	return rectArray[1]
end

function impOriginX()
	return (iW / 3) * getScale() + leftBorder()
end

function foremanOriginX()
	return (iW / 3) * 2 * getScale() + leftBorder()
end

function impOriginY()
	return (iH - 135) * getScale() + topBorder()
end

function toRealX(val)
	return (val * getScale()) + leftBorder()
end

function toRealY(val)
	return (val * getScale()) + topBorder()
end

function positionObject(obj, x, y, width, height, referencePoint, valuesAreAbsolute)
	local scale = 1
	if not valuesAreAbsolute then scale = Layout.getScale() end
	if width ~= nil then
		obj.xScale = (width/obj.width) * scale
		obj.yScale = obj.xScale
	elseif height ~= nil then
		obj.yScale = (height/obj.height) * scale
		obj.xScale = obj.yScale
	end
	obj:setReferencePoint(referencePoint)
	if valuesAreAbsolute then
		obj.x = x
		obj.y = y
	else
		obj.x = toRealX(x)
		obj.y = toRealY(y)
	end
end