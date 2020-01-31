module (..., package.seeall)
local Scene = require "Scene"
local Layout = require "Layout"
local ViewController = require "ViewController"
local ViewTransitions = require "ViewTransitions"
local RedScene = require "RedScene"

function new(parent)
	local redStripeScene = display.newGroup()
	Scene.decorate(redStripeScene, parent)
	
	local backBox = display.newRect(Layout.leftBorder(), Layout.topBorder(), Layout.screenWidth(), Layout.screenHeight())
	backBox:setFillColor(0,0)
	redStripeScene:insert(backBox)
	
	local redStripe = display.newRect(Layout.toRealX(0), Layout.toRealY(225), Layout.screenWidth(), Layout.getScale() * 50)
	redStripe:setFillColor(200,50,50,100)
	redStripe.strokeWidth = 0
	redStripeScene:insert(redStripe)
	local function switchToRedScene(e)
		if redStripeScene.canRespondToTouch then
			ViewController.getInstance().switchScene(RedScene, ViewTransitions.slideIn)
		end
	end
	redStripe:addEventListener("touch", switchToRedScene)
	
	local redCircle = display.newCircle(Layout.toRealX(160), Layout.toRealY(175), Layout.getScale() * 40)
	redCircle:setFillColor(200,50,50,100)
	redCircle.strokeWidth = 0
	redStripeScene:insert(redCircle)
	local function backUpALevel(e)
		if redStripeScene.canRespondToTouch then
			redStripeScene.returnToParent(ViewTransitions.slideOut)
		end
	end
	redCircle:addEventListener("touch", backUpALevel)
	
	local redSquare = display.newRect(Layout.toRealX(125), Layout.toRealY(285), Layout.getScale() * 70, Layout.getScale() * 70)
	redSquare:setFillColor(200,50,50,100)
	redSquare.strokeWidth = 0
	redStripeScene:insert(redSquare)
	local function backUpTwoLevels(e)
		if redStripeScene.canRespondToTouch then
			redStripeScene.returnToParent(ViewTransitions.slideOut, 2)
		end
	end
	redSquare:addEventListener("touch", backUpTwoLevels)
	
	redStripeScene.willTransitionOut = function()
		redStripeScene.canRespondToTouch = false
	end
	
	redStripeScene.willTransitionIn = function()
		redStripeScene.canRespondToTouch = false
	end
	
	redStripeScene.didTransitionIn = function()
		redStripeScene.canRespondToTouch = true
	end
	
	redStripeScene.willBeRemoved = function()
		redStripe:removeEventListener("touch", switchToRedScene)
		redCircle:removeEventListener("touch", backUpALevel)
		redCircle:removeEventListener("touch", backUpTwoLevels)
	end
	
	return redStripeScene
end