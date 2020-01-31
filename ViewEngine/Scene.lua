module (..., package.seeall)

function decorate(obj, parent)
	--local obj = display.newGroup
	obj.canRespondToTouch = true
	obj.didLoad = function() end
	obj.willTransitionOut = function() end
	obj.willTransitionIn = function() end
	obj.didTransitionOut = function() end
	obj.didTransitionIn = function() end
	obj.willBeRemoved = function() end
	
	obj.addChild = function(SceneModule, transition, params)
		local child = SceneModule.new(obj, params)
		child.didLoad()
		obj.willTransitionOut()
		child.willTransitionIn()
		local onComplete = function()
			obj.didTransitionOut()
			obj:insert(child)
			child.didTransitionIn()
		end
		transition(obj, child, parent, onComplete)
	end
	
	obj.returnFromChild = function(child, transition)
		child.willTransitionOut()
		obj.willTransitionIn()
		local onComplete = function()
			child.didTransitionOut()
			obj.didTransitionIn()
			child.willBeRemoved()
			child:removeSelf()
		end
		transition(child, obj, parent, onComplete)
	end
	
	obj.returnToParent = function(transition, levels)
		if levels and levels > 1 then
			levels = levels - 1
			obj:willBeRemoved()
			parent.returnToParent(transition, levels)
		else
			parent.returnFromChild(obj, transition)
		end
	end
	
	obj.switchToSibling = function(SceneModule, transition)
		local sibling = SceneModule.new(parent, params)
		sibling.didLoad()
		obj.willTransitionOut()
		sibling.willTransitionIn()
		local onComplete = function()
			obj.didTransitionOut()
			parent:insert(sibling)
			sibling.didTransitionIn()
			obj.willBeRemoved()
			obj:removeSelf()
		end
		transition(obj, sibling, parent, onComplete)
	end
	
	return obj
end