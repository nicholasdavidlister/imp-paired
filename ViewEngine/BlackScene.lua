module (..., package.seeall)
local Scene = require "Scene"
local Layout = require "Layout"
local ViewController = require "ViewController"
local RedScene = require "RedScene"
local WhiteScene = require "WhiteScene"

function new(parent)
	local blackScene = display.newGroup()
	Scene.decorate(blackScene, parent)
	
	blackScene.willTransitionOut = function()
		blackScene.canRespondToTouch = false
	end
	
	blackScene.willTransitionIn = function()
		blackScene.canRespondToTouch = false
	end
	
	blackScene.didTransitionIn = function()
		blackScene.canRespondToTouch = true
	end
	
	local blackBox = display.newRect(Layout.leftBorder(), Layout.topBorder(), Layout.screenWidth(), Layout.screenHeight())
	blackBox:setFillColor(255)
	blackBox.strokeWidth = 0
	blackScene:insert(blackBox)
	local graySquares = display.newGroup()
	for i = 1, 8 do
		for j = 1, 12 do
			local graySquare = display.newRect(Layout.toRealX(40*(i-1)), Layout.toRealY(40*(j-1)), Layout.getScale() * 40, Layout.getScale() * 40)
			graySquare:setFillColor(math.random(20), math.random(20), math.random(20))
			graySquare.strokeWidth = 0
			graySquares:insert(graySquare)
		end
	end
	blackScene:insert(graySquares)
	local redLink = display.newRect(Layout.toRealX(0), Layout.toRealY(380), Layout.getScale()*100, Layout.getScale()*100)
	redLink:setFillColor(200,50,50)
	redLink.strokeWidth = 0
	blackScene:insert(redLink)
	
	local function slideOutToRed(e)
		if blackScene.canRespondToTouch then
			ViewController.removeMask()
			ViewController.getInstance().switchScene(RedScene, ViewTransitions.slideOut)
		end
	end
	redLink:addEventListener("touch", slideOutToRed)
	
	return blackScene
end