module (..., package.seeall)
local easingx = require "easingx"

function flash(obj, time, finish)
	if finish == nil then finish = {false} end 
	if finish[1] == false and obj then
		local function flashBack()
			if finish[1] == false and obj then
				transition.to(obj, {time = time, alpha = 1, transition = easing.linear, onComplete = function() flash(obj, time, finish) end})
			end
		end	
		transition.to(obj, {time = time, alpha = 0, transition = easing.linear, onComplete = flashBack})
	end
	local stop = function()
		finish[1] = true
	end
	return stop
end

function bulge(obj, time, factor, finish)
	local finish = {false}
	if finish[1] == false and obj then
		local a = obj.xScale
		local b = obj.yScale
		local function bulgeBack()
			if finish[1] == false and obj then
				transition.to(obj, {time = time, xScale = a, yScale = b, transition = easing.linear, onComplete = function() bulge(obj, time, factor, finish) end})
			end
		end	
		transition.to(obj, {time = time, xScale = a * factor, yScale = b * factor, transition = easing.linear, onComplete = bulgeBack})
	end
	local stop = function() --snaps the object back to position
		finish[1] = true
		if obj and a and b then
			obj.xScale = a
			obj.yScale = b
		end
	end
	return stop
end

function flip(obj1, obj2, time, verticalBool, onComplete)
	obj1:setReferencePoint(display.CenterReferencePoint)
	obj2:setReferencePoint(display.CenterReferencePoint)
	obj2.xScale = (obj1.width * obj1.xScale) / obj2.width
	obj2.yScale = (obj1.height * obj1.yScale) / obj2.height
	obj2.x = obj1.x
	obj2.y = obj1.y
	obj2.isVisible = false
	obj1.isVisible = true
	local function secondHalfH()
		obj1.isVisible = false
		obj2.isVisible = true
		transition.from(obj2, {time = time/2, xScale = 0.01, transition = easingx._easeIn, onComplete = onComplete})
	end
	local function secondHalfV()
		obj1.isVisible = false
		obj2.isVisible = true
		transition.from(obj2, {time = time/2, yScale = 0.01, transition = easingx._easeIn, onComplete = onComplete})
	end
	if verticalBool then
		transition.to(obj1, {time = time/2, yScale = 0.01, transition = easingx._easeOut, onComplete = secondHalfV})
	else
		transition.to(obj1, {time = time/2, xScale = 0.01, transition = easingx._easeOut, onComplete = secondHalfH})
	end
end

function bringOutPopBack(obj, time, scale, onComplete)
	obj:setReferencePoint(display.CenterReferencePoint)
	local oldYScale = obj.yScale
	local oldXScale = obj.xScale
	local function popBack()
		transition.to(obj, {time = time * 0.35, yScale = oldYScale, xScale = oldXScale, transition = easingx._easeOut, onComplete = onComplete})
	end
	transition.to(obj, {time = time * 0.35, yScale = obj.yScale * scale, xScale = obj.xScale * scale, transition = easingx._easeOut, onComplete = popBack})
end

function jiggle(obj, time)
	local shouldContinue = true
	local function goLeft()
		local function goRight()
			if shouldContinue then transition.to(obj, {time = time, rotation = 10, transition = easingx._easeInOut, onComplete = goLeft})
			else transition.to(obj, {time = time/2, rotation = 0, transition = easingx._easeIn}) end
		end
		if shouldContinue then transition.to(obj, {time = time, rotation = -10, transition = easingx._easeInOut, onComplete = goRight})
		else transition.to(obj, {time = time/2, rotation = 0, transition = easingx._easeIn}) end
	end
	local function startJiggle()
		transition.to(obj, {time = time/2, rotation = 10, transition = easingx._easeOut, onComplete = goLeft})
	end
	startJiggle()
	local stop = function() shouldContinue = false end
	return stop
end