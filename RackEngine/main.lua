local LuaTest = require "LuaTest"
local testModules = {}
table.insert(testModules, require "Container_Tests")
table.insert(testModules, require "RackFactory_Tests")
table.insert(testModules, require "Rack_Tests")
table.insert(testModules, require "ContentToAddFinder_Waves_Tests")

for _,T in pairs(testModules) do
	T.runAllTests()
end

print("Tests run:", LuaTest.testCount)
print("Tests failed:", LuaTest.failCount)