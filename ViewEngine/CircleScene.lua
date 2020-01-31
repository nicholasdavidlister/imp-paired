module (..., package.seeall)
local Scene = require "Scene"
local Layout = require "Layout"
local ViewController = require "ViewController"
local RedStripeScene = require "RedStripeScene"

function new(parent)
	local circleScene = display.newGroup()
	Scene.decorate(circleScene, parent)
	
	circleScene.willTransitionOut = function()
		circleScene.canRespondToTouch = false
	end
	
	circleScene.willTransitionIn = function()
		circleScene.canRespondToTouch = false
	end
	
	circleScene.didTransitionIn = function()
		circleScene.canRespondToTouch = true
	end
	
	local backBox = display.newRect(Layout.leftBorder(), Layout.topBorder(), Layout.screenWidth(), Layout.screenHeight())
	backBox:setFillColor(0,0)
	circleScene:insert(backBox)
	
	local grayCircle = display.newCircle(Layout.toRealX(160), Layout.toRealY(240), 120 * Layout.getScale())
	grayCircle:setFillColor(15,17,20, 100)
	grayCircle.strokeWidth = 0
	circleScene:insert(grayCircle)
	local function returnToParent(e)
		if circleScene.canRespondToTouch then
			circleScene.returnToParent(ViewTransitions.slideOut)
		end
	end
	grayCircle:addEventListener("touch", returnToParent)
	
	local squareLink = display.newRect(Layout.toRealX(125), Layout.toRealY(35), 70 * Layout.getScale(), 70 * Layout.getScale())
	squareLink:setFillColor(0,100)
	circleScene:insert(squareLink)
	local function goToSquare(e)
		if circleScene.canRespondToTouch then
			circleScene.switchToSibling(SquareScene, ViewTransitions.trackRight)
		end
	end
	squareLink:addEventListener("touch", goToSquare)
	
	local redStripeLink = display.newRect(Layout.toRealX(110), Layout.toRealY(405), 100 * Layout.getScale(), 50 * Layout.getScale())
	redStripeLink:setFillColor(200,50,50,100)
	redStripeLink.strokeWidth = 0
	circleScene:insert(redStripeLink)
	local function addRedStripe(e)
		if circleScene.canRespondToTouch then
			circleScene.addChild(RedStripeScene, ViewTransitions.slideIn)
		end
	end
	redStripeLink:addEventListener("touch", addRedStripe)
	
	circleScene.willBeRemoved = function()
		grayCircle:removeEventListener("touch", returnToParent)
	end
	
	return circleScene
end