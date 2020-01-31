module (..., package.seeall)
local Scene = require "Scene"
local Layout = require "Layout"
local ViewController = require "ViewController"
local WhiteScene = require "WhiteScene"
local BlackScene = require "BlackScene"


function new(parent)
	local redScene = display.newGroup()
	Scene.decorate(redScene, parent)
	
	redScene.willTransitionOut = function()
		redScene.canRespondToTouch = false
	end
	
	redScene.willTransitionIn = function()
		redScene.canRespondToTouch = false
	end
	
	redScene.didTransitionIn = function()
		redScene.canRespondToTouch = true
	end
	
	local redBox = display.newRect(Layout.leftBorder(), Layout.topBorder(), Layout.screenWidth(), Layout.screenHeight())
	redBox:setFillColor(200,50,50)
	redBox.strokeWidth = 0
	redScene:insert(redBox)
	
	local whiteLink = display.newRect(Layout.leftBorder(), Layout.toRealY(380), Layout.getScale()*100, Layout.getScale()*100)
	redScene:insert(whiteLink)
	local function slideInWhite(e)
		if redScene.canRespondToTouch then
			ViewController.getInstance().switchScene(WhiteScene, ViewTransitions.slideIn)
		end
	end
	whiteLink:addEventListener("touch", slideInWhite)
	
	local blackLink = display.newRect(Layout.toRealX(220), Layout.toRealY(380), Layout.getScale()*100, Layout.getScale()*100)
	blackLink:setFillColor(10,12,17)
	redScene:insert(blackLink)
	local function slideOutToBlack(e)
		if redScene.canRespondToTouch then
			ViewController.getInstance().switchScene(BlackScene, ViewTransitions.slideOut)
		end
	end
	blackLink:addEventListener("touch", slideOutToBlack)
	
	redScene.willBeRemoved = function()
		whiteLink:removeEventListener("touch", slideInWhite)
		blackLink:removeEventListener("touch", slideOutToBlack)
	end
	
	return redScene
end