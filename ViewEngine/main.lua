local ViewController = require "ViewController"
local ViewTransitions = require "ViewTransitions"
local RedScene = require "RedScene"
local Layout = require "Layout"

local topMargin = 40
local bottomMargin = 20
local leftMargin = 10
local rightMargin = 10

ViewController.init(RedScene, ViewTransitions.slideIn)
local mask = display.newGroup()
local maskPieces = {}
maskPieces[1] = display.newRect(-10, -10, display.getCurrentStage().width + 20, 10 + (Layout.getScale() * topMargin))
maskPieces[2] = display.newRect(display.getCurrentStage().width - (rightMargin * Layout.getScale()), -10, (rightMargin * Layout.getScale()) + 10, display.getCurrentStage().height + 20)
maskPieces[3] = display.newRect(-10, display.getCurrentStage().height - (bottomMargin * Layout.getScale()), display.getCurrentStage().width + 20, 10 + (Layout.getScale() * bottomMargin))
maskPieces[4] = display.newRect(-10, -10, (leftMargin * Layout.getScale()) + 10, display.getCurrentStage().height + 20)
for _,v in pairs(maskPieces) do
	v:setFillColor(0)
	mask:insert(v)
end
ViewController.setMask(mask)