module (..., package.seeall)
local Scene = require "Scene"
local Layout = require "Layout"
local ViewController = require "ViewController"
local RedScene = require "RedScene"
local CircleScene = require "CircleScene"
local SquareScene = require "SquareScene"

function new(parent)
	local whiteScene = display.newGroup()
	Scene.decorate(whiteScene, parent)
	
	local whiteBox = display.newRect(Layout.leftBorder(), Layout.topBorder(), Layout.screenWidth(), Layout.screenHeight())
	whiteBox:setFillColor(255)
	whiteBox.strokeWidth = 0
	whiteScene:insert(whiteBox)
	local offWhiteStripes = display.newGroup()
	for i = 1, 6 do
		local offWhiteStripe = display.newRect(Layout.leftBorder(), Layout.toRealY(80*(i-1)), Layout.screenWidth(), Layout.getScale() * 40)
		offWhiteStripe:setFillColor(230, 220, 190)
		offWhiteStripe.strokeWidth = 0
		offWhiteStripes:insert(offWhiteStripe)
	end
	whiteScene:insert(offWhiteStripes)
	local redLink = display.newRect(Layout.toRealX(0), Layout.toRealY(380), Layout.getScale()*100, Layout.getScale()*100)
	redLink:setFillColor(200,50,50)
	redLink.strokeWidth = 0
	whiteScene:insert(redLink)
	
	local function slideOutToRed(e)
		if whiteScene.canRespondToTouch then
			ViewController.getInstance().switchScene(RedScene, ViewTransitions.slideOut)
		end
	end
	redLink:addEventListener("touch", slideOutToRed)
	
	local circleLink = display.newCircle(Layout.toRealX(50), Layout.toRealY(70), Layout.getScale() * 40)
	circleLink:setFillColor(0,100)
	whiteScene:insert(circleLink)
	local function slideInCircle(e)
		if whiteScene.canRespondToTouch then
			whiteScene.addChild(CircleScene, ViewTransitions.slideIn)
		end
	end
	circleLink:addEventListener("touch", slideInCircle)
	
	local squareLink = display.newRect(Layout.toRealX(235), Layout.toRealY(35), 70 * Layout.getScale(), 70 * Layout.getScale())
	squareLink:setFillColor(0,100)
	whiteScene:insert(squareLink)
	local function slideInSquare(e)
		if whiteScene.canRespondToTouch then
			whiteScene.addChild(SquareScene, ViewTransitions.slideIn)
		end
	end
	squareLink:addEventListener("touch", slideInSquare)
	
	whiteScene.willTransitionOut = function()
		whiteScene.canRespondToTouch = false
	end
	
	whiteScene.didTransitionOut = function()
		squareLink.isVisible = false
		circleLink.isVisible = false
		redLink.isVisible = false
	end
	
	whiteScene.willTransitionIn = function()
		squareLink.isVisible = true
		circleLink.isVisible = true
		redLink.isVisible = true
		whiteScene.canRespondToTouch = false
	end
	
	whiteScene.didTransitionIn = function()
		whiteScene.canRespondToTouch = true
	end
	
	whiteScene.willBeRemoved = function()
		redLink:removeEventListener("touch", slideOutToRed)
		circleLink:removeEventListener("touch", slideInCircle)
		squareLink:removeEventListener("touch", slideInSquare)
	end
	
	return whiteScene
end