module(...,package.seeall)
local Container = require "Container"
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
local testLabel = ""
	
end