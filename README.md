# roblox-tweener
Module made for tweening multiple instances in parallel or individually.
Made by captivater.

# Installation
Create new ModuleScript with content of `Tweener.lua`.
In the older versions it also needed `Signal.lua`, but now it got removed for easier installation.

# Usage
Here is an example of how you can tween multiple instances at once:
```lua
local Tweener = require(game:GetService("ReplicatedStorage").Tweener)

local Title = script.Parent.Title
local Button = script.Parent.Button

local tweens = Tweener.fromInstances({ Title, Button }, TweenInfo.new(1), { Transparency = 1 )
tweens:PlayInParallel()
tweens.Completed.Event:Once(function()
    print("Tween is complete!")
end)
```

# API

## Constructors
### Tweener.new(tweens: {Tween})
Creates a new `Tweens` instance out of table with tweens.
Useful when you wanna use the methods this module provides with regular tweens.

### Tweener.fromInstances(instances: {Instance}, tweenInfo: TweenInfo, goal: {any})
Creates a new `Tweens` instance out of table with instances, tween info and goal for every instance.
Useful when you wanna tween multiple instances to same goal.

### Tweener.fromGoals(instance: Instance, tweenInfo: TweenInfo, goals: {{any}})
Creates a new `Tweens` instance out of table with goals, tween info and instance.
Useful when you wanna tween same instance with multiple goals.

### Tweener.fromTweenInfos(instance: Instance, tweenInfos: {TweenInfo}, goal: {any})
Creates a new `Tweens` instance out of table with tween infos, goal and instance.
Useful when you wanna tween same instance with multiple tween infos.
If you wanna tween multiple instances with different goals and tween infos, use method `Tweener.new()` instead.

## Methods
### Tweens:PlayInParallel()
Plays every tween in parrarel. After it's done, it fires `Tweens.Completed` event.

### Tweens:PlayInQueue(delayTime: number)
Plays every tween in queue. After it's done, it fires `Tweens.Completed` event.
You can also add delay between each tween.

### Tweens:Pause()
Pauses every single tween. Similar to `Tween:Pause`.

### Tweens:Cancel()
Cancel every single tween. Similar to `Tween:Cancel`.

## Bindable Events
### Tweens.Completed
This event fires when all of the tweens were completed.
Keep in mind that the RBXScriptSignal is inside the Completed.Event.

