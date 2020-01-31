module(...,package.seeall)
local Rack = require "Rack"
local LuaTest = require "LuaTest"
local Layout = require "Layout"
local Layers = require "Layers"
local testSuite = {}

local function setUp()

end

local function tearDown()

end

function runAllTests()
	local i
	for i = 1, #testSuite, 1 do
		setUp()
		testSuite[i]()
		tearDown()
	end
end

testSuite[#testSuite+1] = function()
local testLabel = ""
	local mockDC = {}
	mockDC.get = {}
	mockDC.get.naturallyAvailableSets = function() return 30 end
	local gameLayers = Layers.new()
	local selectedContainers = {}
	local ContentToAddFinder = require "ContentToAddFinder_Waves"
	local rack = Rack.new(55, 30, Layout.rackOriginX(), Layout.rackOriginY(), Layout.rackWidth(), Layout.rackHeight(), ContentToAddFinder)
	
	local function touchHandler(element, index, id)
		if rack.getContainerContent(index) == 0 then return end
		if selectedContainers[index] then
			selectedContainers[index] = false
			rack.containerWasDeselected(index)
		else
			selectedContainers[index] = true
			rack.containerWasSelected(index)
		end
	end
	
	local function printContentsContainers()
		local contents = rack.getContentContainers();
		for k,v in pairs(contents) do print(k,v) end
	end
	
	rack.assignTouchHandler(touchHandler) --IMPORTANT: TOUCH HANDLER IS ASSIGNED IMMEDIATELY AFTER RACK CREATION
	rack.addContainers(3, Rack.ADDITION_REASON_TURNS, nil, mockDC)
	timer.performWithDelay(1500, function() rack.addContainers(4, Rack.ADDITION_REASON_MIN_LIMIT, nil, mockDC) end)
	timer.performWithDelay(3000, function() rack.addContainers(5, Rack.ADDITION_REASON_TIME, nil, mockDC) end)
	timer.performWithDelay(4500, function() rack.addContainers(6, Rack.ADDITION_REASON_START, nil, mockDC) end)
	timer.performWithDelay(6000, function() rack.addContainers(60, Rack.ADDITION_REASON_TURNS, 99, mockDC) end)
	timer.performWithDelay(7500, function() --rack.forceRemoveContainer(12)
											rack.revealContainerPattern(12);
											rack.revealContainerPattern(24);
											rack.revealContainerPattern(36);
											rack.hideContainerPatterns();
											rack.collapseContainers({12, 24, 36, 48}, true, true, 5, 4, true, 35);
											--timer.performWithDelay(150, rack.hideContainerPatterns)
											end)
	timer.performWithDelay(10000, function()	rack.revealContainerPattern(1);
												rack.forceRemoveContainer(1);
												rack.forceRemoveContainer(2);
												end)
	timer.performWithDelay(11500, function()	rack.revealContainerPattern(3);
												timer.performWithDelay(150, function() rack.hideContainerPatterns(); rack.hideContainerPatterns() end)
												end)
end