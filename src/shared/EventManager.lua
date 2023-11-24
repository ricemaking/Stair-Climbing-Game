local EventManager = {}

local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local events = ReplicatedStorage.Events
local remoteEvents = ReplicatedStorage.RemoteEvents

local Players = game:GetService("Players")

local function findRandomStair()
	local levelIndex = math.random(#game.Workspace.Levels:GetChildren()) --get level
	local level = game.Workspace.Levels:GetChildren()[levelIndex]
	--print(level)
	
	local storyIndex = math.random(#level:GetChildren()) --get story
	local story = level:GetChildren()[storyIndex]
	--print(story)
	
	local stairIndex = math.random(#story:GetChildren()) --get stair
	local stair = story:GetChildren()[stairIndex]
	
	--print(stair)
	return stair
end

-- 60% CHANCE EVENTS --
function EventManager.BananaEvent()
	local banana = events.BananaEvent.Banana
	for i = 1, 50 do
		local stair = findRandomStair()
		local newBanana = banana:Clone()
		--newBanana.Anchored = true --TEST
		newBanana.Parent = game.Workspace["Summoned Event Objects"]
		if math.abs(stair.Orientation.Y) == 0 or math.abs(stair.Orientation.Y) == 180 then
			newBanana.Position = stair.Position + Vector3.new(
				math.random(-stair.Size.X + 13, stair.Size.X - 13),
				1,
				0 --math.random(-stair.Size.Z, stair.Size.Z)
			)
		else
			newBanana.Position = stair.Position + Vector3.new(
				0, --math.random(-stair.Size.X, stair.Size.X),
				1,
				math.random((-stair.Size.Z - 10), (stair.Size.Z + 10))
			)
		end
	end
end

function EventManager.RainingTacos()

end

--40% CHANCE EVENTS
function EventManager.LandMineEvent()
		
end

--20% CHANCE EVENTS
function EventManager.FusRoDahEvent()

	local lightingColor = Lighting.ColorCorrection

	local fusRoDahSound = events.FusRoDahEvent["Fus Ro Dah Sound"]
	print("FUS RO DAH!")
	local players = Players:GetPlayers()

	fusRoDahSound:Play()
	task.wait(.5)

	local tweenToBlue = TweenService:Create(
		lightingColor,
		TweenInfo.new(.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true),
		{TintColor = Color3.new(0.056321, 0.659113, 1)}
	)

	tweenToBlue:Play()
	remoteEvents["ShakeCam Event"]:FireAllClients()
	for _, plr in ipairs(players) do
		local char = plr.Character or plr.CharacterAdded:Wait()
		local hum = char:WaitForChild("Humanoid")
		hum.PlatformStand = true
		hum.Parent.PrimaryPart.Velocity = Vector3.new(0,200,1000)
		hum.CameraOffset = Vector3.new(0,0,0)
	end
	task.wait(3)
	for _, plr in ipairs(players) do
		local char = plr.Character or plr.CharacterAdded:Wait()
		local hum = char:WaitForChild("Humanoid")
		hum.PlatformStand = false
	end
end

--10% CHANCE EVENTS

--5% CHANCE EVENTS

--1% CHANCE EVENTS

return EventManager
