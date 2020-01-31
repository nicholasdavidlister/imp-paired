local LuaTest = require "LuaTest"
local SubscriptionSubject_Tests = require "SubscriptionSubject_Tests"
SubscriptionSubject_Tests.runAllTests()

print("Tests run:", LuaTest.testCount)
print("Tests failed:", LuaTest.failCount)