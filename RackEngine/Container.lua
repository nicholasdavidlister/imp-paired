module(...,package.seeall)
local UIContainer = require "UIContainer"

REMOVAL_ANIMATION_SCALE_DOWN = "scaleDownRemovalAnimation"
REMOVAL_ANIMATION_SNAP = "snapRemovalAnimation"

ADDITION_ANIMATION_DROP_IN_FROM_TOP = "dropInFromTopAdditionAnimation"
ADDITION_ANIMATION_SLIDE_IN_FROM_LEFT = "slideInFromLeftAdditionAnimation"
ADDITION_ANIMATION_SLIDE_IN_FROM_RIGHT = "slideInFromRightAdditionAnimation"
ADDITION_ANIMATION_SCALE_UP = "scaleUpAdditionAnimation"
ADDITION_ANIMATION_SNAP = "snapAdditionAnimation"

function assignContentImages(numOfContentTypes)
	UIContainer.assignContentImages(numOfContentTypes)
end

function new(x, y, width, height, sizeX, sizeY, index)
	local container = display.newGroup()
	local uiContainer = UIContainer.new(x, y, width, height, sizeX, sizeY)
	container:insert(uiContainer)
	local content = 0
	local touchHandler
	
	container.getContent = function()
		return content
	end
	
	container.setContent = function(contentNumber)
		content = contentNumber
	end
	
	container.getCenter = function()
		return {x = x + (width / 2), y = y + (height / 2)}
	end
	
	--==================================--
	-- METHODS FORWARDED TO UICONTAINER --
	--==================================--
	container.addToBoard = function(contentNumber, animation)
		--RAISE AN ERROR IF THE CONTAINER IS ALREADY ON THE BOARD
		--RAISE AN ERROR IF NO CONTENT NUMBER IS GIVEN
		--ACCOUNT FOR NO ANIMATION CONSTANT
		--RAISE ERROR IN CASE OF INVALID ANIMATION CONSTANT
		container.setContent(contentNumber)
		uiContainer.addToBoard(contentNumber, animation)
	end
	
	container.removeFromBoard = function(animation)
		--RAISE AN ERROR IF THE CONTAINER IS ALREADY OFF THE BOARD
		--ACCOUNT FOR NO ANIMATION CONSTANT
		--RAISE ERROR IN CASE OF INVALID ANIMATION CONSTANT
		uiContainer.removeFromBoard(container.getContent(), animation)
		container.setContent(0)
	end
	
	container.select = function()
		uiContainer.select()
	end
	
	container.deselect = function()
		uiContainer.deselect()
	end
	
	container.revealContent = function()
		uiContainer.revealContent(content)
	end
	
	container.hideContent = function()
		uiContainer.hideContent()
	end
	
	container.getAnimationGraphic = function()
		local graphic = uiContainer.getAnimationGraphic(content)
		return graphic
	end
	--=====--
	-- END --
	--=====--
	
	container.assignTouchHandler = function(touchHandlerClosure)
		touchHandler = touchHandlerClosure
	end
	
	local function tap(e)
		if e.phase == "ended" and container.getContent() ~= 0 then
			if not touchHandler then error("Please ensure the function touchHandler(element, index, id) is assigned immediately after creation of Rack", 2) end
			touchHandler("container", index, e.id)
		end
	end
	local hitBox = display.newRect(x, y, width, height)
	hitBox:setFillColor(0,0)
	hitBox.strokeWidth = 0
	container:insert(hitBox)
	hitBox:addEventListener("touch", tap)
	
	return container
end