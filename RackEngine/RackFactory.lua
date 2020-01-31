module (..., package.seeall)
local RackFactoryData = require "RackFactoryData"

local function areEqual(numbers)
	local expected = numbers[1]
	for k, v in pairs(numbers) do
		if v ~= expected then return false end
	end
	return true
end

local function areSequential(numbers)
	table.sort(numbers)
	local previous = numbers[1]
	for i = 2, #numbers do
		if numbers[i] > previous + 1 then
			return false
		else
			previous = numbers[i]
		end
	end
	return true
end

local function tilePriority(a,b)
	local variationLengthsA = {}
	for _,v in pairs(a) do
		table.insert(variationLengthsA, #v)
	end
	local variationLengthsB = {}
	for _,v in pairs(b) do
		table.insert(variationLengthsB, #v)
	end
	local aValue = 3
	if areEqual(variationLengthsA) then aValue = 1 end
	if areSequential(variationLengthsA) then aValue = 2 end
	local bValue = 3
	if areEqual(variationLengthsB) then bValue = 1 end
	if areSequential(variationLengthsB) then bValue = 2 end
	return aValue < bValue
end

local function dfs(tiles, target)
	local function getRandomOrder(max)
		local standardOrder = {}
		for i = 1, max do
			standardOrder[i] = i
		end
		local randomOrder = {}
		for i = 1, #standardOrder do
			local rand = math.random(#standardOrder)
			randomOrder[i] = standardOrder[rand]
			table.remove(standardOrder, rand)
		end
		return randomOrder
	end

	local function search(depth, variation, total)
		total = total + #tiles[depth][variation]
		if depth == #tiles and total == target then return {variation} end
		if depth == #tiles or total > target then return end
		local randomOrder = getRandomOrder(#tiles[depth + 1])
		for i = 1, #randomOrder do
			local result = search(depth + 1, randomOrder[i], total)
			if result then
				table.insert(result, 1, variation)
				return result
			end
		end
		return
	end
	
	local randomOrder = getRandomOrder(#tiles[1])
	local result = false
	for i = 1, #randomOrder do
		result = search(1, randomOrder[i], 0)
		if result then break end
	end
	
	local containers = {}
	for i = 1, #result do
		for j = 1, #tiles[i][result[i]] do
			table.insert(containers, tiles[i][result[i]][j])
		end
	end
	local rack = {}
	for k,v in pairs(containers) do
		local containerCopy = {x = v.x, y = v.y, sizeX = v.sizeX, sizeY = v.sizeY}
		table.insert(rack, containerCopy)
	end
	return rack
end

local function checkIfTargetIsAcceptable(targetSize)
	local acceptableSize = false
	for _,v in pairs(RackFactoryData.ACCEPTABLE_RACK_SIZES) do
		if targetSize == v then acceptableSize = true end 
	end
	if not acceptableSize then error(targetSize.." is not an acceptable rack size. Acceptable sizes for this data set are "..table.concat(RackFactoryData.ACCEPTABLE_RACK_SIZES, ","), 4) end
end

function getRandomRackArrangement(targetSize)
	checkIfTargetIsAcceptable(targetSize)
	local set = RackFactoryData.getRandomSet()
	local tilesInSet = RackFactoryData.getTilesInSet(set)
	table.sort(tilesInSet, tilePriority)
	local rackData = dfs(tilesInSet, targetSize)
	return rackData
end