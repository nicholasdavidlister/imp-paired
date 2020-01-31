module (..., package.seeall)

local numberOfContainers = {}
	numberOfContainers[23] = 8
	numberOfContainers[24] = 4
	numberOfContainers[25] = 1
	numberOfContainers[26] = 1
	numberOfContainers[32] = 8
	numberOfContainers[33] = 5
	numberOfContainers[34] = 2
	numberOfContainers[35] = 1
	numberOfContainers[42] = 5
	numberOfContainers[43] = 2
	numberOfContainers[52] = 1
	numberOfContainers[53] = 1
	numberOfContainers[62] = 1
	
function randomContainerGraphic(sizeX, sizeY)
	local imageSet = {}
	local imageNo = math.random(numberOfContainers[sizeX*10 + sizeY])
	imageSet.graphic = "graphics/containers/"..sizeX.."_"..sizeY.."_"..imageNo..".png"
	imageSet.highlight = "graphics/containers/"..sizeX.."_"..sizeY.."_h.png"
	imageSet.patternPrefix = "graphics/containers/"..sizeX.."_"..sizeY.."_"..imageNo.."_"
	return imageSet
end