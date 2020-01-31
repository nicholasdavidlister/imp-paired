module(...,package.seeall)

local currentWave = {}

local function populateWave(DC)
	currentWave = {}
	local waveLength = DC.get.naturallyAvailableSets()
	local waveContents = {}
	for i = 1, waveLength do
		table.insert(waveContents, i)
	end
	for i = 1, waveLength do
		table.insert(currentWave, table.remove(waveContents, math.random(#waveContents)))
	end
end

local function getLargestUnmatchableID(allContentContainers, DC)
	local temp = {}
	for k,v in pairs(allContentContainers) do
		table.insert(temp, {ID = k, containers = v})
	end
	for i,v in ipairs(temp) do
		if v.containers >= DC.minMatch then
			table.remove(temp, i)
		end
	end
	table.sort(temp, function(a,b) return a.containers > b.containers end)
	return temp[1].ID
end
	
local function getLargestIDLeavingAMatch(allContentContainers, DC)
	local temp = {}
	for k,v in pairs(allContentContainers) do
		table.insert(temp, {ID = k, containers = v})
	end
	table.sort(temp, function(a,b) return a.containers > b.containers end)
	if #temp == 1 then
		return temp[1].ID
	end
	if temp[1].containers > DC.minMatch then
		return temp[1].ID
	else
		return temp[2].ID
	end
end
	
function generateContentID(DC)
	if currentWave[1] == nil then populateWave(DC) end
	return table.remove(currentWave, 1)
end

function generateContentIDToRemove(allContentContainers, DC)
	return getLargestIDLeavingAMatch(allContentContainers, DC)
end

function generateContentIDToMakeMatchAvailable(allContentContainers, DC) --RETURNS nil IF A MATCH IS ALREADY AVAILABLE
	for k,v in pairs(allContentContainers) do
		if v >= DC.minMatch then return nil end
	end
	return getLargestUnmatchableID(allContentContainers, DC)
end