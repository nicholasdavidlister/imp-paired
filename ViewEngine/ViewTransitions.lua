module (..., package.seeall)
local Layout = require "Layout" --DEPENDENCY!

--=======================================================================================================--
-- The group is where the transition will take place. The function pulls the oldView and newView into it --
--=======================================================================================================--

function slideIn(oldView, newView, group, onComplete)
	group:insert(oldView)
	group:insert(newView)
	transition.from(newView, {time = 1000, y = Layout.topBorder() - Layout.screenHeight(), transition = easing.inExpo, onComplete = onComplete})
end

function slideOut(oldView, newView, group, onComplete)
	group:insert(newView)
	group:insert(oldView)
	transition.to(oldView, {time = 500, y = Layout.topBorder() - Layout.screenHeight(), transition = easing.linear, onComplete = onComplete})
end

function slideOutWithDelay(oldView, newView, group, onComplete)
	group:insert(newView)
	group:insert(oldView)
	timer.performWithDelay(700, function()
		transition.to(oldView, {time = 500, y = Layout.topBorder() - Layout.screenHeight(), transition = easing.linear, onComplete = onComplete})
	end)
end

function slideOut_Slow(oldView, newView, group, onComplete)
	group:insert(newView)
	group:insert(oldView)
	transition.to(oldView, {time = 1500, y = Layout.topBorder() - Layout.screenHeight(), transition = easing.linear, onComplete = onComplete})
end

function trackRight(oldView, newView, group, onComplete)
	group:insert(oldView)
	group:insert(newView)
	oldView:setReferencePoint(display.TopLeftReferencePoint)
	transition.to(oldView, {time = 500, x = Layout.leftBorder() - Layout.screenWidth(), transition = easing.linear})
	newView:setReferencePoint(display.TopLeftReferencePoint)
	transition.from(newView, {time = 500, x = Layout.leftBorder() + Layout.screenWidth(), transition = easing.linear, onComplete = onComplete})
end

function cut(oldView, newView, group, onComplete)
	group:insert(oldView)
	group:insert(newView)
end