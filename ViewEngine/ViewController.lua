module (..., package.seeall)

local viewControllerSingleton = nil

local function new()
	local currentScene = nil
	viewControllerSingleton = display.newGroup()
	viewControllerSingleton.mainScene = display.newGroup()
	viewControllerSingleton:insert(viewControllerSingleton.mainScene)
	viewControllerSingleton.mask = nil --This will hold a reference to the mask group if it is added
	
	viewControllerSingleton.init = function(LaunchSceneModule, transition, params)
		if currentScene then
			print("ERROR: ViewController has already been initialised")
			return
		end
		local scene = LaunchSceneModule.new(viewControllerSingleton.mainScene, params)
		scene.didLoad()
		local dummyScene = display.newGroup()
		scene.willTransitionIn()
		local onComplete = function()
			scene.didTransitionIn()
			currentScene = scene
			dummyScene:removeSelf()
		end
		transition(dummyScene, scene, viewControllerSingleton.mainScene, onComplete)
		return scene
	end
	
	--==================================================================--
	--	Switches from the current scene to a scene of SceneModule type  --
	--==================================================================--
	viewControllerSingleton.switchScene = function(SceneModule, transition, params)
		local scene = SceneModule.new(viewControllerSingleton.mainScene, params)
		scene.didLoad()
		if currentScene then currentScene.willTransitionOut() end
		scene.willTransitionIn()
		local onComplete = function()
			if currentScene then currentScene.didTransitionOut() end
			scene.didTransitionIn()
			if currentScene then currentScene.willBeRemoved(); currentScene:removeSelf() end
			currentScene = scene
			viewControllerSingleton.mainScene:insert(scene)
		end
		if not currentScene then currentScene = display.newGroup() end
		transition(currentScene, scene, viewControllerSingleton.mainScene, onComplete)
		return scene
	end
end

function init(LaunchSceneModule, transition, params)
	new()
	return viewControllerSingleton.init(LaunchSceneModule, transition, params)
end

function getInstance()
	if viewControllerSingleton == nil then
		print("ERROR: ViewController has not been initialised. Call init(LaunchSceneModule, transition) before attempting to get instance")
	end
	return viewControllerSingleton
end

function setMask(maskGroup)
	if viewControllerSingleton == nil then
		print("ERROR: ViewController has not been initialised. Call init(LaunchSceneModule, transition) before attempting to set mask")
	end
	if maskGroup.removeSelf ~= nil then
		if viewControllerSingleton.mask ~= nil and viewControllerSingleton.mask.removeSelf ~= nil then
			viewControllerSingleton.mask:removeSelf()
		end
		viewControllerSingleton.mask = maskGroup
		viewControllerSingleton:insert(maskGroup)
	end
end

function removeMask()
	if viewControllerSingleton == nil then
		print("ERROR: ViewController has not been initialised. Call init(LaunchSceneModule, transition) before attempting to remove mask")
	end
	if viewControllerSingleton.mask and viewControllerSingleton.mask.removeSelf ~= nil then
		viewControllerSingleton.mask:removeSelf()
	end
	viewControllerSingleton.mask = nil
end