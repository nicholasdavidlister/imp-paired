module(...,package.seeall)
local Animation = require "Animation"
local Layers = require "Layers"

function new(containerGraphic, centerX, centerY, width, height, contentNumber)
	local obj = display.newGroup()
	obj.c = display.newImage(containerGraphic.graphic)
	obj.p = display.newImage(containerGraphic.patternPrefix..contentNumber..".png")
	Layout.positionObject(obj.c, centerX, centerY, width, height, display.CenterReferencePoint, true)
	Layout.positionObject(obj.p, centerX, centerY, width, height, display.CenterReferencePoint, true)
	obj:insert(obj.c)
	obj:insert(obj.p)
	obj.p.isVisible = false
	obj:setReferencePoint(display.CenterReferencePoint)
	
	obj.cleanUp = function()
		obj:removeSelf()
	end
	
	local shouldFlipBack = false
	local isFlipping = false
	local NULL_FUNCTION = function() end
	local endOfFlip = NULL_FUNCTION
	
	local function performFlip(onCompleteClosure)
		local shouldFlipVertical = height > width
		if obj.p.isVisible then
			Animation.flip(obj.p, obj.c, 350, shouldFlipVertical, onCompleteClosure)
		else
			Animation.flip(obj.c, obj.p, 350, shouldFlipVertical, onCompleteClosure)
		end
		Animation.bringOutPopBack(obj, 350, 1.2, function() end)
	end
	
	obj.flip = function(onComplete)
		endOfFlip = onComplete or NULL_FUNCTION
		if isFlipping == true then
			shouldFlipBack = true
			return
		end
		local onCompleteClosure = function()
			if shouldFlipBack then
				performFlip(endOfFlip)
				shouldFlipBack = false
			else
				isFlipping = false
				endOfFlip()
			end
		end
		isFlipping = true
		performFlip(onCompleteClosure)
	end
	
	Layers.addToLayer(obj, Layers.COLLAPSING_CONTAINERS_LAYER)
	return obj
end