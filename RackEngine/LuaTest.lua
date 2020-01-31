module (..., package.seeall)

failCount = 0
testCount = 0

function fail(label)
	label = "FAILED!..."..label
	print("\n"..label)
	failCount = failCount + 1
	testCount = testCount + 1
end

function assertEquals(a,b,label)
	if a ~= b then
		label = "FAILED!..."..label
		print("\n"..label)
		failCount = failCount + 1
	end
	testCount = testCount + 1
end

function assertNotEquals(a,b,label)
	if a == b then
		label = "FAILED!..."..label
		print("\n"..label)
		failCount = failCount + 1
	end
	testCount = testCount + 1
end

function assertClose(a,b,range,label)
	if type(a) ~= "number" then
		label = "FAILED!..."..label.."(argument 1 is not a number)"
		print("\n"..label)
		failCount = failCount + 1
	end
	if type(b) ~= "number" then
		label = "FAILED!..."..label.."(argument 2 is not a number)"
		print("\n"..label)
		failCount = failCount + 1
	end
	if b < a and b + range < a then
		label = "FAILED!..."..label
		print("\n"..label)
		failCount = failCount + 1
	end
	if b > a and b - range > a then
		label = "FAILED!..."..label
		print("\n"..label)
		failCount = failCount + 1
	end
	testCount = testCount + 1
end

function assertLessThan(a,b,label)
	if b >= a then
		label = "FAILED!..."..label
		print("\n"..label)
		failCount = failCount + 1
	end
end

function assertGreaterThan(a,b,label)
	if b <= a then
		label = "FAILED!..."..label
		print("\n"..label)
		failCount = failCount + 1
	end
end