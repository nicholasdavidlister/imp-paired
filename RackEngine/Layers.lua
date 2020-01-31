module(...,package.seeall)

BACKGROUND_LAYER = "background layer"
SURROUNDS_LAYER = "surrounds layer"
CONTAINERS_LAYER = "containers layer"
PATTERNED_CONTAINERS_LAYER = "patterned containers layer"
CONTAINERS_DROP_IN_LAYER = "containers drop in layer"
DIAL_POP_OUTS_LAYER = "dial pop outs layer"
DIALS_LAYER = "dials layer"
DANGER_LIGHTS_LAYER = "danger lights layer"
COLLAPSING_CONTAINERS_LAYER = "collapsing containers layer"
HIGHLIGHTS_LAYER = "highlights layer"
FLYOFFS_LAYER = "flyoffs layer"
CHAIN_LAYER = "chain layer"
INTER_LEVEL_LAYER = "inter level layer"
IN_GAME_MENU_LAYER = "in game menu layer"
HIT_LAYER = "hit layer"

local allLayers = false

local function newLayer(layerConst, mainObj)
	local layer = display.newGroup()
	mainObj[layerConst] = layer
	mainObj:insert(layer)
end

function new()
	allLayers = display.newGroup()
	newLayer(BACKGROUND_LAYER, allLayers)
	newLayer(SURROUNDS_LAYER, allLayers)
	newLayer(CONTAINERS_LAYER, allLayers)
	newLayer(PATTERNED_CONTAINERS_LAYER, allLayers)
	newLayer(CONTAINERS_DROP_IN_LAYER, allLayers)
	newLayer(DIAL_POP_OUTS_LAYER, allLayers)
	newLayer(DIALS_LAYER, allLayers)
	newLayer(DANGER_LIGHTS_LAYER, allLayers)
	newLayer(COLLAPSING_CONTAINERS_LAYER, allLayers)
	newLayer(HIGHLIGHTS_LAYER, allLayers)
	newLayer(FLYOFFS_LAYER, allLayers)
	newLayer(CHAIN_LAYER, allLayers)
	newLayer(INTER_LEVEL_LAYER, allLayers)
	newLayer(IN_GAME_MENU_LAYER, allLayers)
	newLayer(HIT_LAYER, allLayers)
	return allLayers
end

function addToLayer(obj, layerConst)
	if not layerConst then error("Unrecognised layer constant provided", 2) end
	allLayers[layerConst]:insert(obj)
end