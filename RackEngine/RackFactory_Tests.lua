module(...,package.seeall)
local RackFactory = require "RackFactory"
local LuaTest = require "LuaTest"
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
local testLabel = "Passing 55 into getRandomArrangement() returns a table of length 55"
	local rackData = RackFactory.getRandomRackArrangement(55)
	LuaTest.assertEquals(55, #rackData, testLabel)
end

testSuite[#testSuite+1] = function()
local testLabel = "Elements of table returned from getRandomArrangement() have x, y, sizeX and sizeY number values"
	local rackData = RackFactory.getRandomRackArrangement(55)
	local pass = true
	for i = 1, 5 do
		local randomElement = rackData[math.random(#rackData)]
		if type(randomElement.x) ~= "number" then pass = false end
		if type(randomElement.y) ~= "number" then pass = false end
		if type(randomElement.sizeX) ~= "number" then pass = false end
		if type(randomElement.sizeY) ~= "number" then pass = false end
	end
	LuaTest.assertEquals(true, pass, testLabel)
end