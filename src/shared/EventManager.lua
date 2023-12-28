local EventManager = {}

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local events = ReplicatedStorage.Events

local remoteEvents = ReplicatedStorage.RemoteEvents
local eventEndedEvent = remoteEvents["EventEnded Event"]



-- LOCAL VARIABLES --
local summonedObjectAmount = 100 --adjust depending on how much objects wished to summon

-- LOCAL FUNCTIONS --
local function findRandomPlayerCharacter(returnRoot)
	local plrList = Players:GetPlayers()
	local randomSelection = math.random(#plrList)
	local plr = plrList[randomSelection]
	local char = plr.Character or plr.CharacterAdded:Wait()
	local root = char:FindFirstChild("HumanoidRootPart")
	if returnRoot then
		return root
	else
		return char
	end
end

local function getAllCharacters()
	local charList = {}
	local plrList = Players:GetPlayers()
	for _,plr in plrList do
		local char
		pcall(function()
			char = plr.Character
		end)
		if char ~= nil then
			table.insert(charList, char)
		end
	end
	return charList
end

local function findRandomStair()
	local levelIndex = math.random(#game.Workspace.Levels:GetChildren()) --get level
	local level = game.Workspace.Levels:GetChildren()[levelIndex]
	--print(level)
	
	local storyIndex = math.random(#level:GetChildren()) --get story
	local story = level:GetChildren()[storyIndex]
	--print(story)
	
	local stairIndex = math.random(#story:GetChildren()) --get stair
	local stair = story:GetChildren()[stairIndex]
	
	if stair.Name ~= "Stair" then
		return nil
	end
	
	--print(stair)
	return stair
end

local function findRandomStairArr(numStairs)
	local arr = {}
	
	for i = 0, numStairs do
		local levelIndex = math.random(#game.Workspace.Levels:GetChildren()) --get level
		local level = game.Workspace.Levels:GetChildren()[levelIndex]
		--print(level)

		local storyIndex = math.random(#level:GetChildren()) --get story
		local story = level:GetChildren()[storyIndex]
		--print(story)

		local stairIndex = math.random(#story:GetChildren()) --get stair
		local stair = story:GetChildren()[stairIndex]

		--print(stair)
		table.insert(arr, stair)
	end
end

local function getAllStairs()
	local arr = {}
	for i, level in game.Workspace.Levels:GetChildren() do --get all levels
		for j, story in level:GetChildren() do --get all stories
			for k, stair in story:GetChildren() do
				table.insert(arr, stair)
				print(stair)
			end
		end
	end
	
	return arr
end

-- EVENT FUNCTIONS --

-- 80% CHANCE EVENTS --
function EventManager.BananaEvent() --bananas!!
	
	local bananaArray = {}
	local banana = events.BananaEvent.Banana
	local sound = banana["Banana Slip Sound Effect"]
	local replicatedSound = sound:Clone()
	replicatedSound.Parent = game.Workspace["Game Sounds"]
	replicatedSound:Play()
	
	for i = 1, summonedObjectAmount do
		local stair = findRandomStair()
		if stair == nil then i-=1; continue end
		local newBanana = banana:Clone()
		table.insert(bananaArray, newBanana)
		newBanana.Transparency = 1
		newBanana.CanTouch = false
		newBanana.Anchored = true
		
		local tween = TweenService:Create(
			newBanana,
			TweenInfo.new(1,Enum.EasingStyle.Linear),
			{Transparency = 0}
		)
		
		--newBanana.Anchored = true --TEST
		newBanana.Parent = game.Workspace["Summoned Event Objects"].Obstacles
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
		tween:Play()
	end
	
	task.wait(1.1)
	for _,v in pairs(bananaArray) do
		v.CanTouch = true
		v.Anchored = false
	end
	
	task.wait(3)
	replicatedSound:Destroy()
	
	eventEndedEvent:FireAllClients() --end event
end

function EventManager.RainingTacos()
	eventEndedEvent:FireAllClients() --end event
end

--40% CHANCE EVENTS
function EventManager.LandMineEvent()
	
	local landMineArray = {}
	local landmine = events.LandmineEvent.Landmine
	local beep = landmine["Beep Sound"]
	local replicatedSound = beep:Clone()
	replicatedSound.Parent = game.Workspace["Game Sounds"]
	replicatedSound:Play()
	for i = 1, summonedObjectAmount do
		local stair = findRandomStair()
		if stair == nil then i-=1; continue end
		local newLandmine = landmine:Clone()
		table.insert(landMineArray, newLandmine)
		newLandmine["Landmine Button"].CanTouch = false
		newLandmine["Landmine Button"].Transparency = 1
		newLandmine["Landmine Base"].Transparency = 1
		
		local tween1 = TweenService:Create(
			newLandmine["Landmine Button"],
			TweenInfo.new(1,Enum.EasingStyle.Linear),
			{Transparency = 0}
		)
		local tween2 = TweenService:Create(
			newLandmine["Landmine Base"],
			TweenInfo.new(1,Enum.EasingStyle.Linear),
			{Transparency = 0}
		)
		
		--newBanana.Anchored = true --TEST
		newLandmine.Parent = game.Workspace["Summoned Event Objects"].Obstacles
		
		--print(newLandmine:GetPivot())
		
		if math.abs(stair.Orientation.Y) == 0 or math.abs(stair.Orientation.Y) == 180 then
			
			if math.abs(stair.Orientation.Y) == 0 then
				newLandmine:PivotTo(newLandmine:GetPivot() * CFrame.Angles(math.rad(-45),0,math.rad(90)))
				newLandmine:MoveTo(stair.Position + Vector3.new(
					math.random(-stair.Size.X + 13, stair.Size.X - 13),
					0,
					-1 --math.random(-stair.Size.Z, stair.Size.Z)
					)
				)
				
			elseif math.abs(stair.Orientation.Y) == 180 then
				newLandmine:PivotTo(newLandmine:GetPivot() * CFrame.Angles(math.rad(45),0,math.rad(90)))
				newLandmine:MoveTo(stair.Position + Vector3.new(
					math.random(-stair.Size.X + 13, stair.Size.X - 13),
					0,
					1 --math.random(-stair.Size.Z, stair.Size.Z)
					)
				)
			end
			
		elseif math.abs(stair.Orientation.Y) == 90 then
			newLandmine:MoveTo(stair.Position + Vector3.new(
				0, --math.random(-stair.Size.X, stair.Size.X),
				1,
				math.random((-stair.Size.Z - 10), (stair.Size.Z + 10))
				)
			)
			if stair.Orientation.Y == 90 then
				newLandmine:PivotTo(newLandmine:GetPivot() * CFrame.Angles(0,0,math.rad(135)))
			elseif stair.Orientation.Y == -90 then
				newLandmine:PivotTo(newLandmine:GetPivot() * CFrame.Angles(0,0,math.rad(45)))
			end
			
		end
		tween1:Play()
		tween2:Play()
		
		--print(newLandmine:GetPivot())
		
	end
	task.wait(1.1)
	for _,v in pairs(landMineArray) do
		v["Landmine Button"].CanTouch = true
	end
	task.wait(3)
	replicatedSound:Destroy()
	eventEndedEvent:FireAllClients() --end event
end

--20% CHANCE EVENTS
function EventManager.StatBoostEvent() 
	local players = Players:GetPlayers()
	
	local StatDisplayEvent = ReplicatedStorage.RemoteEvents["StatDisplay Event"]
	local StatUpgradeEvent = ReplicatedStorage.RemoteEvents["StatUpgrade Event"]
	
	local statTable = {
		"Health", "Jump", "Speed"
	}
	
	local statChooser = math.random(#statTable)
	local chosenStat = statTable[statChooser]
	--local chosenStat = "Jump" --change
	
	StatDisplayEvent:FireAllClients(chosenStat)
	
	for _,v in ipairs(players) do
		StatUpgradeEvent:FireAllClients(chosenStat)
		
		--local char = v.Character or v.CharacterAdded:Wait()
		--local hum = char:FindFirstChild("Humanoid")
		--local root = char:FindFirstChild("HumanoidRootPart")
		--weird case here idefk why
		--if chosenStat == "Jump" then
		--	local density = 0.3 --Change
		--	local elasticity = 0.5 --Change
		--	local elasticityWeight = 1 --Change
		--	local friction = 1 --Change
		--	local frictionWeight = 3 --Change

		--	root.CustomPhysicalProperties = PhysicalProperties.new(density, friction, elasticity, frictionWeight, elasticityWeight)
		--end
	end
	
	task.wait(2)
	eventEndedEvent:FireAllClients() --end event

end

function EventManager.TiktokSlideshowEvent()
	
	local players = Players:GetPlayers()
	
	local TiktokSlideshowFolder = events.TiktokSlideshowEvent
	
	for _, plr in ipairs(players) do
		local slideShowGui = TiktokSlideshowFolder.SlideshowGui:Clone()
		local slides = slideShowGui.ImageFrame:GetChildren()
		local zIndexArr = {}
		
		for i = 1, #slides do
			table.insert(zIndexArr, i)
		end
		
		for _,v in pairs(slides) do
			local assignedZIndex = math.random(#zIndexArr)
			v.ZIndex = assignedZIndex
			table.remove(zIndexArr, assignedZIndex)
		end
		slideShowGui.Parent = plr.PlayerGui
		
		local tiktokSound = TiktokSlideshowFolder.WhyAreTheOranges:Clone()
		tiktokSound.Parent = slideShowGui
		tiktokSound:Play()
	end
	
	task.wait(3)
	eventEndedEvent:FireAllClients() --end event
end

function EventManager.ShoopDaWhoopEvent()
	
	--local target = findRandomStair() --get random stair
	local target = findRandomPlayerCharacter(true)--get random player
	
	local ShoopDaWhoopFolder = events.ShoopDaWhoopEvent
	
	local shoopDaWhoop = ShoopDaWhoopFolder.ShoopDaWhoopPart:Clone()
	shoopDaWhoop.Parent = game.Workspace["Summoned Event Objects"].Structures
	shoopDaWhoop.CFrame = CFrame.new(
		target.Position + Vector3.new(math.random(20,100),math.random(20,100),math.random(20,100)),
		target.Position
	)
	
	local laser = shoopDaWhoop.Laser
	
	--local laser = Instance.new("Part")
	--laser.Parent = shoopDaWhoop
	--laser.Position = shoopDaWhoop.PrimaryPart.Position
	--laser.Orientation = shoopDaWhoop.PrimaryPart.Orientation
	laser.Position = shoopDaWhoop.Position
	laser.CFrame = CFrame.lookAt(laser.Position, target.Position) * CFrame.Angles(0, math.pi/2, 0)
	laser.Transparency = 1
	
	local fireLaser = TweenService:Create(
		laser,
		TweenInfo.new(.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false),
		{Size = laser.Size + Vector3.new(1000,0,0), CFrame = laser.CFrame * CFrame.new(500,0,0)}
	)
	
	local dissapateLaster = TweenService:Create(
		laser,
		TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false),
		{Transparency = 1}
	)
	
	local laserSound = ShoopDaWhoopFolder["Ima Firen Mah Lazor!"]:Clone()
	--laserSound.Parent = game.Workspace["Game Sounds"]
	laserSound.Parent = shoopDaWhoop
	laserSound:Play()
	
	task.wait(2.8)
	remoteEvents["ShakeCamDistance Event"]:FireAllClients(100, shoopDaWhoop)
	laser.Transparency = 0
	fireLaser:Play()
	
	task.wait(5)
	laser.CanTouch = false
	dissapateLaster:Play()
	
	laserSound.Ended:Wait()
	shoopDaWhoop:Destroy()
	eventEndedEvent:FireAllClients() --end event
end

--10% CHANCE EVENTS

function EventManager.CleanStairsEvent() --clean stairs
	--local objWhiteList = {"pos", "Backrooms"}
	for _, object in pairs(game.Workspace["Summoned Event Objects"].Obstacles:GetChildren()) do
		object:Destroy()
	end
	
	task.wait(3)
	eventEndedEvent:FireAllClients() --end event
end

--5% CHANCE EVENTS
function EventManager.FusRoDahEvent() --fus ro dah!!

	local players = Players:GetPlayers()

	local lightingColor = Lighting.ColorCorrection

	local fusRoDahSound = events.FusRoDahEvent["Fus Ro Dah Sound"]
	local replicatedFusRoDahSound = fusRoDahSound:Clone()
	replicatedFusRoDahSound.Parent = game.Workspace["Game Sounds"]


	local vikingSound = events.FusRoDahEvent["Dragons and Vikings (30 Second Version)"]
	local replicatedVikingSound = vikingSound:Clone()
	replicatedVikingSound.Parent = game.Workspace["Game Sounds"]
	replicatedVikingSound:Play()

	task.wait(3) --event intermission

	replicatedFusRoDahSound:Play()
	task.wait(.5)

	local tweenToBlue = TweenService:Create(
		lightingColor,
		TweenInfo.new(.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true),
		{TintColor = Color3.new(0.056321, 0.659113, 1)}
	)
	
	local prevJumpPower

	tweenToBlue:Play()
	print("FUSRODAH!")
	remoteEvents["ShakeCam Event"]:FireAllClients(20)
	for _, plr in ipairs(players) do
		local char = plr.Character or plr.CharacterAdded:Wait()
		local hum = char:WaitForChild("Humanoid")
		hum.PlatformStand = true
		hum.UseJumpPower = true
		
		prevJumpPower = hum.JumpPower
		hum.JumpPower = 0
		hum.Parent.PrimaryPart.Velocity = Vector3.new(0,200,1000)
		hum.CameraOffset = Vector3.new(0,0,0)
	end

	replicatedVikingSound:Stop()
	replicatedVikingSound:Destroy()

	task.wait(3)
	
	eventEndedEvent:FireAllClients() --end event

	replicatedFusRoDahSound:Stop()
	replicatedFusRoDahSound:Destroy()

	for _, plr in ipairs(players) do
		local char = plr.Character or plr.CharacterAdded:Wait()
		local hum = char:WaitForChild("Humanoid")
		hum.PlatformStand = false
		hum.UseJumpPower = false
		hum.JumpPower = prevJumpPower
	end
end

--1% CHANCE EVENTS
function EventManager.BackRoomsEvent()
	local charList = getAllCharacters()
	--local plrsInBackroomsList = {}
	--local posList = {}
	
	local backrooms
	--check if theres already a backrooms instance
	if game.Workspace["Summoned Event Objects"].Structures:FindFirstChild("Backrooms") then --if backrooms does exist
		backrooms = game.Workspace["Summoned Event Objects"].Structures:FindFirstChild("Backrooms")
	else --if not
		backrooms = events.BackroomsEvent.Backrooms:Clone()
		backrooms.Parent = game.Workspace["Summoned Event Objects"].Structures
	end
	
	local exits = backrooms.Exits:GetChildren()
	local floors = backrooms.Floors:GetChildren()
	
	--choose random exit
	local randomExitIndex = math.random(#exits)
	local chosenExit = exits[randomExitIndex]
	
	--local shift = 0
	for i, exit in pairs(exits) do
		if #exits == 1 then
			--print("there exists only one exit")
			break
		end
		if exit == chosenExit then
			--print("exit found")
			continue
		else
			--print("removing exit")
			exit:Destroy()
			--table.remove(exits, i-shift)
			--shift += 1
		end
	end
	
	task.wait(2) -- intermission
		
	--get all players and teleport to backrooms
	for i, char in pairs(charList) do
		local plr = Players:GetPlayerFromCharacter(char)
		
		local root = char:FindFirstChild("HumanoidRootPart")
		local rootPos = root.CFrame
		
		local prevPlrPos = Instance.new("Part")
		prevPlrPos.Parent = game.Workspace["Summoned Event Objects"]["Player Positions"]
		prevPlrPos.Name = tostring(plr).."Pos"
		prevPlrPos.Anchored = true
		prevPlrPos.CFrame = rootPos
		prevPlrPos.CanCollide = false
		prevPlrPos.Transparency = 1

		--posList[tostring(plr)] = tostring(rootPos)
		
		--choose random floor
		local randomFloorIndex = math.random(#floors)
		local chosenFloor = floors[randomFloorIndex]
		
		local updateEventGui = remoteEvents["UpdateEventGui Event"]
		updateEventGui:FireClient(plr, "Backrooms")
		
		task.wait(1)
		
		remoteEvents["LocalEnvironment Event"]:FireClient(plr, "Fog")

		char:MoveTo(chosenFloor.Position + Vector3.new(0, 5, 0))
		
	
	end
	
	task.wait(3)
	eventEndedEvent:FireAllClients()
end

return EventManager
