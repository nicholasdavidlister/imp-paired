module(...,package.seeall)
local SubscriptionSubject = require "SubscriptionSubject"
local LuaTest = require "LuaTest"
local testSuite = {}

local function setUp()
	object = {}
	observer = {}
	observer.didChangeWasCalled = 0
	observer.didChange = function()
		observer.didChangeWasCalled = observer.didChangeWasCalled + 1
	end
end

local function tearDown()
	object = nil
	observer = nil
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
local testLabel = "A decorated object with a subscribed observer calls didChange() on the observer after a call to shouldNotify() and deliverNotifications()"
	SubscriptionSubject.decorate(object)
	object.subscribe(observer)
	object.shouldNotify()
	object.deliverNotifications()
	LuaTest.assertEquals(1, observer.didChangeWasCalled, testLabel)
end

testSuite[#testSuite+1] = function()
local testLabel = "An observer that unsubscribes from the subscription subject is no longer notified"
	SubscriptionSubject.decorate(object)
	object.subscribe(observer)
	object.unsubscribe(observer)
	object.shouldNotify()
	object.deliverNotifications()
	LuaTest.assertEquals(0, observer.didChangeWasCalled, testLabel)
end

testSuite[#testSuite+1] = function()
local testLabel = "Subscribing twice does not cause an observer to be notified twice"
	SubscriptionSubject.decorate(object)
	object.subscribe(observer)
	object.subscribe(observer)
	object.shouldNotify()
	object.deliverNotifications()
	LuaTest.assertEquals(1, observer.didChangeWasCalled, testLabel)
end

testSuite[#testSuite+1] = function()
local testLabel = "Multiple subscriptions require only one unsubscription"
	SubscriptionSubject.decorate(object)
	object.subscribe(observer)
	object.subscribe(observer)
	object.unsubscribe(observer)
	object.shouldNotify()
	object.deliverNotifications()
	LuaTest.assertEquals(0, observer.didChangeWasCalled, testLabel)
end

testSuite[#testSuite+1] = function()
local testLabel = "Unsubscribing amidst a number of notifications yields the correct results"
	SubscriptionSubject.decorate(object)
	for i = 1, 3 do
		object.shouldNotify()
		object.deliverNotifications()
	end
	object.subscribe(observer)
	for i = 1, 5 do
		object.shouldNotify()
		object.deliverNotifications()
	end
	object.unsubscribe(observer)
	for i = 1, 11 do
		object.shouldNotify()
		object.deliverNotifications()
	end
	LuaTest.assertEquals(5, observer.didChangeWasCalled, testLabel)
end

testSuite[#testSuite+1] = function()
local testLabel = "An object that already has a value at the \"subscribe\" key raises an error on attempting decoration"
	object.subscribe = true
	LuaTest.assertEquals(false, pcall(function() SubscriptionSubject.decorate(object) end), testLabel)
end

testSuite[#testSuite+1] = function()
local testLabel = "An object that already has a value at the \"unsubscribe\" key raises an error on attempting decoration"
	object.unsubscribe = true
	LuaTest.assertEquals(false, pcall(function() SubscriptionSubject.decorate(object) end), testLabel)
end

testSuite[#testSuite+1] = function()
local testLabel = "An object that already has a value at the \"shouldNotify\" key raises an error on attempting decoration"
	object.shouldNotify = true
	LuaTest.assertEquals(false, pcall(function() SubscriptionSubject.decorate(object) end), testLabel)
end

testSuite[#testSuite+1] = function()
local testLabel = "An object that already has a value at the \"deliverNotifications\" key raises an error on attempting decoration"
	object.deliverNotifications = true
	LuaTest.assertEquals(false, pcall(function() SubscriptionSubject.decorate(object) end), testLabel)
end

testSuite[#testSuite+1] = function()
local testLabel = "Attempting to register an observer that has no didChange method raises an error"
	SubscriptionSubject.decorate(object)
	observer.didChange = true
	LuaTest.assertEquals(false, pcall(function() object.subscribe(observer) end), testLabel)
end

testSuite[#testSuite+1] = function()
local testLabel = "Attempting to notify an observer whose didChange() method has been removed raises an error"
	SubscriptionSubject.decorate(object)
	object.subscribe(observer)
	object.shouldNotify()
	observer.didChange = true
	LuaTest.assertEquals(false, pcall(function() object.deliverNotifications() end), testLabel)
end