module (..., package.seeall)
local Scene = require "Scene"
local Layout = require "Layout"
local ViewController = require "ViewController"
local ViewTransitions = require "ViewTransitions"
local CircleScene = require "CircleScene"

function new(parent)
	local squareScene = display.newGroup()
	Scene.decorate(squareScene, parent)
	
	squareScene.willTransitionOut = function()
		squareScene.canRespondToTouch = false
	end
	
	squareScene.willTransitionIn = function()
		squareScene.canRespondToTouch = false
	end
	
	squareScene.didTransitionIn = function()
		squareScene.canRespondToTouch = true
	end
	
	local backBox = display.newRect(Layout.leftBorder(), Layout.topBorder(), Layout.screenWidth(), Layout.screenHeight())
	backBox:setFillColor(0,0)
	squareScene:insert(backBox)
	
	local graySquare = display.newRect(Layout.toRealX(40), Layout.toRealY(120), 240 * Layout.getScale(), 240 * Layout.getScale())
	graySquare:setFillColor(15,17,20, 100)
	graySquare.strokeWidth = 0
	squareScene:insert(graySquare)	
	local function returnToParent(e)
		if squareScene.canRespondToTouch then
			squareScene.returnToParent(ViewTransitions.slideOut)
		end
	end
	graySquare:addEventListener("touch", returnToParent)
	
	local circleLink = display.newCircle(Layout.toRealX(160), Layout.toRealY(70), Layout.getScale() * 40)
	circleLink:setFillColor(15,17,20, 100)
	circleLink.strokeWidth = 0
	squareScene:insert(circleLink)
	local function goToCircle(e)
		if squareScene.canRespondToTouch then
			squareScene.switchToSibling(CircleScene, ViewTransitions.trackRight)
		end
	end
	circleLink:addEventListener("touch", goToCircle)
	
	squareScene.willBeRemoved = function()
		graySquare:removeEventListener("touch", returnToParent)
		circleLink:removeEventListener("touch", goToCircle)
	end
	
	return squareScene
end