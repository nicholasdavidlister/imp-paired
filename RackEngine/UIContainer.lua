module(...,package.seeall)
local ContainerImages = require "ContainerImages"
local Container = require "Container"
local ContainerAnimationGraphic = require "ContainerAnimationGraphic"
local Layers = require "Layers"
local Animation = require "Animation"
local Layout = require "Layout"

local contentImages = {}
local MAX_CONTENT_TYPES = 30

local function newHighlightedContainer(x, y, scale, containerGraphic)
	local group = display.newGroup()
	local containerImage = display.newImage(containerGraphic.graphic)
	local highlightImage = display.newImage(containerGraphic.highlight)
	Layout.positionObject(containerImage, 0, 0, nil, nil, display.CenterReferencePoint)
	Layout.positionObject(highlightImage, 0, 0, nil, nil, display.CenterReferencePoint)
	group:insert(highlightImage)
	group:insert(containerImage)
	group.xScale = scale
	group.yScale = scale
	Layout.positionObject(group, x, y, nil, nil, display.CenterReferencePoint, true)
	return group
end

function assignContentImages(numOfContentTypes)
	if numOfContentTypes > MAX_CONTENT_TYPES then error("Too many content types requested; must be "..MAX_CONTENT_TYPES.." or fewer", 3) end
	contentImages = {}
	local patternNumbers = {}
	for i = 1, MAX_CONTENT_TYPES do patternNumbers[i] = i end
	for i = 1, numOfContentTypes do 
		local rand = table.remove(patternNumbers, math.random(#patternNumbers))
		table.insert(contentImages, rand)
	end
	contentImages[99] = 99
end

function new(x, y, width, height, sizeX, sizeY)
	local uiContainer = display.newGroup()
	local highlightedContainer
	local normalContainer
	local animationGraphic
	local isOnBoard = false
	local cancelAnimation
	local centerX = x + width / 2
	local centerY = y + height / 2
	local containerGraphic = ContainerImages.randomContainerGraphic(sizeX, sizeY)
	normalContainer = display.newImage(containerGraphic.graphic)
	Layout.positionObject(normalContainer, centerX, centerY, width, height, display.CenterReferencePoint, true)
	Layers.addToLayer(normalContainer, Layers.CONTAINERS_LAYER)
	normalContainer.isVisible = false
	highlightedContainer = newHighlightedContainer(centerX, centerY, normalContainer.xScale, containerGraphic)
	Layers.addToLayer(highlightedContainer, Layers.HIGHLIGHTS_LAYER)
	highlightedContainer.isVisible = false
	
	uiContainer.addToBoard = function(contentNumber, animation)
		isOnBoard = true
		animationGraphic = ContainerAnimationGraphic.new(containerGraphic, centerX, centerY, width, height, contentImages[contentNumber])
		local function onComplete()
			normalContainer.isVisible = true
			if animationGraphic then
				animationGraphic.cleanUp()
				animationGraphic = false
			end
		end
		if animation == Container.ADDITION_ANIMATION_DROP_IN_FROM_TOP then
			transition.from(animationGraphic, {	time = 650 + math.random(150),
												y = Layout.toRealY(-(animationGraphic.height*animationGraphic.xScale)),
												transition = easingx.easeOutElastic,
												onComplete = onComplete})
		elseif animation == Container.ADDITION_ANIMATION_SLIDE_IN_FROM_LEFT then
			transition.from(animationGraphic, {	time = 650 + math.random(150),
												x = Layout.toRealX(0 - (animationGraphic.width*animationGraphic.xScale*2)),
												xScale = animationGraphic.xScale*5,
												yScale = animationGraphic.yScale*5,
												transition = easingx.easeOutElastic,
												onComplete = onComplete})
		elseif animation == Container.ADDITION_ANIMATION_SLIDE_IN_FROM_RIGHT then
			transition.from(animationGraphic, {	time = 650 + math.random(150),
												x = Layout.toRealX(320 + (animationGraphic.width*animationGraphic.xScale*2)),
												xScale = animationGraphic.xScale*5,
												yScale = animationGraphic.yScale*5,
												transition = easingx.easeOutElastic,
												onComplete = onComplete})
		elseif animation == Container.ADDITION_ANIMATION_SCALE_UP then
			local transitionTime = 600
			local oldScaleX = animationGraphic.xScale
			local oldScaleY = animationGraphic.yScale
			animationGraphic.xScale = 0.1 * animationGraphic.xScale
			animationGraphic.yScale = 0.1 * animationGraphic.yScale
			transition.to(animationGraphic, {time = transitionTime * 2/3,
									xScale = oldScaleX * 1.5,
									yScale = oldScaleY * 1.5,
									transition = easing.outQuad,
									onComplete = function()
										transition.to(animationGraphic, {time = transitionTime * 1/3,
																xScale = oldScaleX,
																yScale = oldScaleY,
																transition = easing.inQuad,
																onComplete = onComplete})
									end})
		else
			onComplete()
		end
	end
	
	uiContainer.removeFromBoard = function(contentNumber, animation)
		isOnBoard = false
		normalContainer.isVisible = false
		highlightedContainer.isVisible = false
		if animation then
			if not animationGraphic then animationGraphic = ContainerAnimationGraphic.new(containerGraphic, centerX, centerY, width, height, contentImages[contentNumber]) end
			if animation == Container.REMOVAL_ANIMATION_SCALE_DOWN then
				local transitionTime = 600
				local oldScaleX = animationGraphic.xScale
				local oldScaleY = animationGraphic.yScale
				transition.to(animationGraphic, {time = transitionTime * 1/3,
												xScale = oldScaleX * 1.2,
												yScale = oldScaleY * 1.2,
												transition = easing.outQuad,
												onComplete = function()
												transition.to(animationGraphic, {time = transitionTime * 2/3,
																				xScale = oldScaleX * 0.1,
																				yScale = oldScaleY * 0.1,
																				transition = easing.inQuad,
																				onComplete = animationGraphic.cleanUp}) end})
			elseif animation == Container.REMOVAL_ANIMATION_SNAP then
				animationGraphic:removeSelf()
			end
		end
	end
	
	uiContainer.select = function()
		if cancelAnimation then cancelAnimation() end
		highlightedContainer.isVisible = true
		normalContainer.isVisible = false
		cancelAnimation = Animation.jiggle(highlightedContainer, 120)
	end
	
	uiContainer.deselect = function()
		if cancelAnimation then cancelAnimation() end
		normalContainer.isVisible = true
		highlightedContainer.isVisible = false
	end
	
	uiContainer.revealContent = function(contentNumber)
		normalContainer.isVisible = false
		highlightedContainer.isVisible = false
		animationGraphic = ContainerAnimationGraphic.new(containerGraphic, centerX, centerY, width, height, contentImages[contentNumber])
		animationGraphic.flip()
	end
	
	uiContainer.hideContent = function()
		if not animationGraphic or not animationGraphic.removeSelf then return end
		local onComplete = function()
			if isOnBoard then
				normalContainer.isVisible = true
				if animationGraphic and animationGraphic.removeSelf then animationGraphic.cleanUp() end
				animationGraphic = false
			end
		end
		animationGraphic.flip(onComplete)
	end

	uiContainer.getAnimationGraphic = function(contentNumber)
		if animationGraphic then
			local a = animationGraphic
			animationGraphic = false
			return a
		else
			return ContainerAnimationGraphic.new(containerGraphic, centerX, centerY, width, height, contentImages[contentNumber])
		end
	end
	
	return uiContainer
end