module(...,package.seeall)
local RackFactory = require "RackFactory"
local Container = require "Container"
local SubscriptionSubject = require "SubscriptionSubject"
local Flyoffs = require "Flyoffs"
local Layers = require "Layers"

ADDITION_REASON_TURNS = "TURNS"
ADDITION_REASON_TIME = "TIME"
ADDITION_REASON_MIN_LIMIT = "MIN_LIMIT"
ADDITION_REASON_START = "START"

function new(rackSize, numOfContentTypes, x, y, width, height, ContentToAddFinder)
	Container.assignContentImages(numOfContentTypes) --PCALL THIS?
	local containers = {}
	local lastContainersRemoved = {}
	local rack = display.newGroup()
	SubscriptionSubject.decorate(rack) --RACK DOES NOT DELIVER ITS OWN NOTIFICATIONS, DO THAT IN THE UPDATE MODULE
	local rackWidth = 0
	local rackHeight = 0
	local rackData = RackFactory.getRandomRackArrangement(rackSize)
	for k,v in pairs(rackData) do
		rackWidth = math.max(rackWidth, v.x + v.sizeX)
		rackHeight = math.max(rackHeight, v.y + v.sizeY)
	end
	local xScale = width / rackWidth
	local yScale = height / rackHeight
	for i,v in pairs(rackData) do
		local c = Container.new((v.x * xScale + x), (v.y * yScale + y), (v.sizeX * xScale), (v.sizeY * yScale), v.sizeX, v.sizeY, i)
		table.insert(containers, c)
		rack:insert(c)
	end
	
	rack.getContainersOnBoard = function()
		local total = 0
		for _,c in pairs(containers) do
			if c.getContent() > 0 then total = total + 1 end
		end
		return total
	end
	
	rack.getSize = function()
		return #containers
	end
	
	rack.getNumberOfContentTypes = function()
		return numOfContentTypes
	end
	
	rack.getContentContainers = function(includeBlanks)
		local contentContainers = {}
		for _,c in pairs(containers) do
			local content = c.getContent()
			if content ~= 0 then
				if contentContainers[content] == nil then contentContainers[content] = 0 end
				contentContainers[content] = contentContainers[content] + 1
			end
		end
		if not includeBlanks then contentContainers[99] = nil end
		return contentContainers
	end
	
	rack.getContainerContent = function(index)
		return containers[index].getContent()
	end
	
	rack.containerWasSelected = function(index)
		containers[index].select()
	end
	
	rack.containerWasDeselected = function(index)
		containers[index].deselect()
	end
	
	rack.revealContainerPattern = function(index)
		containers[index].revealContent()
	end
	
	rack.hideContainerPatterns = function()
		for i = 1, #containers do
			containers[i].hideContent()
		end
	end
	
	rack.collapseContainers = function(indices, removeStack, showCompletion, numerator, denominator, showTotals, firstTotal)
		--BONUS FLYOFFS ARE TO BE CONTROLLED FURTHER DOWN THE CALL STACK
		local DELAY = 450
		local to = rackData[indices[1]]
		local toX = to.x * xScale + x + (to.sizeX * xScale) / 2
		local toY = to.y * yScale + y + (to.sizeY * yScale) / 2
		for i = 2, #indices do
			local transitionTime = 650 + (300 * i-2)
			local graphic = containers[indices[i]].getAnimationGraphic()
			Layers.addToLayer(graphic, Layers.COLLAPSING_CONTAINERS_LAYER)
			containers[indices[i]].removeFromBoard(Container.REMOVAL_ANIMATION_SNAP)
			lastContainersRemoved[indices[i]] = true
			local onComplete = function()
				graphic:removeSelf()
				if i == 2 and showCompletion then
					Flyoffs.displayFlyingFraction(toX, toY, numerator, denominator, 600)
				elseif showTotals then
					Flyoffs.displayFlyingNumber(toX, toY, firstTotal + (i-2), 600)
				end
				if removeStack and i == #indices then
					containers[indices[1]].removeFromBoard(Container.REMOVAL_ANIMATION_SCALE_DOWN)
					lastContainersRemoved[indices[1]] = true
					if showTotals then
						timer.performWithDelay(300, function() Flyoffs.displayFlyingNumber(toX, toY, firstTotal + (i-1), 600) end)
					end
				end
			end
			timer.performWithDelay(DELAY, function()
				transition.to(graphic, {time = transitionTime/3, xScale = graphic.xScale * 1.5, yScale = graphic.yScale * 1.5, transition = easing.outQuad, onComplete = function()
				transition.to(graphic, {time = transitionTime*2/3, xScale = 0.1, yScale = 0.1, transition = easing.inQuad}) end})
				transition.to(graphic, {time = transitionTime, x = toX, y = toY, transition = easing.inOutQuad, onComplete = onComplete}) end)
		end
		rack.shouldNotify()
	end
	
	rack.addContainers = function(numberOfContainers, additionReason, givenContent, DC)
		local additionAnimation
		if additionReason == ADDITION_REASON_TURNS then
			additionAnimation = Container.ADDITION_ANIMATION_DROP_IN_FROM_TOP
		elseif additionReason == ADDITION_REASON_TIME then
			additionAnimation = Container.ADDITION_ANIMATION_SLIDE_IN_FROM_LEFT
		elseif additionReason == ADDITION_REASON_MIN_LIMIT then
			additionAnimation = Container.ADDITION_ANIMATION_SCALE_UP
		else
			additionAnimation = Container.ADDITION_ANIMATION_SNAP
		end
		local function findEmptyContainer()
			local allEmptyContainers = {}
			for i,c in pairs(containers) do
				if c.getContent() == 0 and not lastContainersRemoved[i] then table.insert(allEmptyContainers, i) end
			end
			if #allEmptyContainers == 0 then
				for i,v in pairs(lastContainersRemoved) do
					if v then table.insert(allEmptyContainers, i) end
				end
			end
			if #allEmptyContainers == 0 then
				return 
			end
			return allEmptyContainers[math.random(#allEmptyContainers)]
		end
		for i = 1, numberOfContainers do
			local index = findEmptyContainer()
			if not index then return end --RETURNS IF NO EMPTY CONTAINERS ARE FOUND
			local content = givenContent or ContentToAddFinder.generateContentID(DC, rack)
			containers[index].addToBoard(content, additionAnimation)
		end
		rack.shouldNotify()
	end
	
	rack.forceRemoveContainer = function(index, DC)
		if not index then
			if not DC then error("If no index argument is supplied to forceRemoveContainer() then a DC argument MUST be supplied") end
			local contentList = {}
			for i,c in pairs(containers) do contentList[i] = c.getContent() end
			index = ContentToAddFinder.generateContentIDToRemove(contentList, DC)
		end
		containers[index].removeFromBoard(Container.REMOVAL_ANIMATION_SCALE_DOWN)
		rack.shouldNotify()
	end
	
	rack.clearLastContainersRemoved = function()
		lastContainersRemoved = {}
	end
	
	rack.assignTouchHandler = function(touchHandler)
		for _,c in pairs(containers) do
			c.assignTouchHandler(touchHandler)
		end
	end
	
	return rack
end