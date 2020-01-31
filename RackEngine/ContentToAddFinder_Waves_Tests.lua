module(...,package.seeall)
local ContentToAddFinder_Waves = require "ContentToAddFinder_Waves"
local LuaTest = require "LuaTest"
local testSuite = {}

local function setUp()
	mockDC = {}
	mockDC.minMatch = 3
end

local function tearDown()
	mockDC = nil
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
local testLabel = "generateContentIDToRemove(listOfContents, DC) RETURNS EXPECTED RESULT"
	local contentContainers = {}
	contentContainers[3] = 2
	contentContainers[4] = 4
	contentContainers[5] = 2
	contentContainers[99] = 2
	local result = ContentToAddFinder_Waves.generateContentIDToRemove(contentContainers, mockDC)
	LuaTest.assertEquals(4, result, testLabel)
end

testSuite[#testSuite+1] = function()
local testLabel = "generateContentIDToMakeMatchAvailable(listOfContents, DC) RETURNS EXPECTED RESULT"
	local contentContainers = {}
	contentContainers[3] = 2
	contentContainers[5] = 1
	contentContainers[99] = 2
	local result = ContentToAddFinder_Waves.generateContentIDToMakeMatchAvailable(contentContainers, mockDC)
	LuaTest.assertEquals(3, result, testLabel)
end