module(...,package.seeall)

function decorate(obj)
	if obj.subscribe then
		error("Object already contains a value with key \"subscribe\". Unable to decorate as subscription subject.", 2)
	elseif obj.unsubscribe then
		error("Object already contains a value with key \"unsubscribe\". Unable to decorate as subscription subject.", 2)
	elseif obj.shouldNotify then
		error("Object already contains a value with key \"shouldNotify\". Unable to decorate as subscription subject.", 2)
	elseif obj.deliverNotifications then
		error("Object already contains a value with key \"deliverNotifications\". Unable to decorate as subscription subject.", 2)
	end
	
	local subscribers = {}
	local shouldNotify = false
	
	obj.subscribe = function(observer)
		if not observer.didChange or type(observer.didChange) ~= "function" then
			error("Observer has no didChange() method", 2)
		end
		subscribers[observer] = true
	end
	
	obj.unsubscribe = function(observer)
		subscribers[observer] = nil
	end
	
	obj.shouldNotify = function()
		shouldNotify = true
	end
	
	obj.deliverNotifications = function()
		for k,_ in pairs (subscribers) do
			if not pcall(k.didChange) then error("An observer's didChange() method has been removed", 2) end
		end
		shouldNotify = false
	end
end