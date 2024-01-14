local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvents = ReplicatedStorage.RemoteEvents
local camShakeEvent = remoteEvents["ShakeCam Event"]
local camShakeEventDistance = remoteEvents["ShakeCamDistance Event"]
local disableShiftlockEvent = remoteEvents["DisableShiftlock Event"]


local camUtils = require(script.Parent:WaitForChild("PlayerModule"):WaitForChild("CameraModule"):WaitForChild("CameraUtils"))
--local camUtils = require(cameraModule.CameraUtils)

plr = game.Players.LocalPlayer

camShakeEvent.OnClientEvent:Connect(function(shakes)
	local char = plr.Character or plr.CharacterAdded:Wait()
	local hum = char:FindFirstChild("Humanoid") 
	for i = 1, shakes do
		--print("offsetting cam")
		hum.CameraOffset = Vector3.new(math.random(-120,120)/120, math.random(-120,120)/120, math.random(-120,120)/120)
		wait(.05)
	end
	hum.CameraOffset = Vector3.new(0,0,0)
end)

camShakeEventDistance.OnClientEvent:Connect(function(shakes, obj)
	--print(shakes.." "..tostring(obj))
	local char = plr.Character or plr.CharacterAdded:Wait()
	local hum = char:FindFirstChild("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart")
	
	local rootPos = root.Position
	local objPos = obj.Position
	
	local distance = (rootPos - objPos).Magnitude / 100
	if distance < 0.1 then
		distance = 1
	elseif distance > 200 then
		return
	end
	print(distance)
	
	for i = 1, shakes do
		--print("offsetting cam")
		hum.CameraOffset = Vector3.new(math.random(-120,120)/(120 * distance), math.random(-120,120)/(120 * distance), math.random(-120,120)/(120 * distance))
		--print(hum.CameraOffset)
		wait(.05)
	end
	hum.CameraOffset = Vector3.new(0,0,0)
end)

--disableShiftlockEvent.OnClientEvent:Connect(function(t)
--	--print('yessah')
	
--	plr.DevEnableMouseLock = false
--	camUtils.setRotationTypeOverride(Enum.RotationType.MovementRelative)
	
--	task.wait(t)
	
--	plr.DevEnableMouseLock = true
--	camUtils.restoreRotationType()
--end)
