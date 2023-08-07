local Tweener = {}

-- Module made for tweening multiple instances in parallel or individually.
-- Made by captivater
-- https://github.com/qaptivator/roblox-tweener

local TweenService = game:GetService("TweenService")

local Tweens = {}
Tweens.__index = Tweens
Tweens.Completed = Instance.new("BindableEvent")
 
function Tweener.new(tweens: {Tween})
	return setmetatable(tweens, Tweens)
end

function Tweener.fromInstances(instances: {Instance}, tweenInfo: TweenInfo, goal: {any})
	local tweens = {}
	for _, instance in ipairs(instances) do
		table.insert(tweens, TweenService:Create(instance, tweenInfo, goal))
	end
	return setmetatable(tweens, Tweens)
end

function Tweener.fromGoals(instance: Instance, tweenInfo: TweenInfo, goals: {{any}})
	local tweens = {}
	for _, goal in ipairs(goals) do
		table.insert(tweens, TweenService:Create(instance, tweenInfo, goal))
	end
	return setmetatable(tweens, Tweens)
end

function Tweener.fromTweenInfos(instance: Instance, tweenInfos: {TweenInfo}, goal: {any})
	local tweens = {}
	for _, tweenInfo in ipairs(tweenInfos) do
		table.insert(tweens, TweenService:Create(instance, tweenInfo, goal))
	end
	return setmetatable(tweens, Tweens)
end

function Tweens:PlayInParallel()
	for _, tween in ipairs(self) do
		tween:Play()
	end
	Tweens.Completed:Fire()
end

function Tweens:PlayInQueue(delayTime: number)
	for _, tween in ipairs(self) do
		tween:Play()
		tween.Completed:Wait()
		if delayTime then
			task.wait(delayTime)
		end
	end
	Tweens.Completed:Fire()
end

function Tweens:Pause()
	for _, tween in ipairs(self) do
		tween:Pause()
	end
end

function Tweens:Cancel()
	for _, tween in ipairs(self) do
		tween:Cancel()
	end
end

return Tweener
