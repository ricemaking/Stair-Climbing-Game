local RunService = game:GetService("RunService")
--local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local UpdateAltitudeEvent = ReplicatedStorage.RemoteEvents.PlayerEvents.UpdateAltitude
local PlayerStatUpdater = require(game:GetService("ReplicatedStorage").Shared.PlayerStatUpdater)
local Players = game:GetService("Players")

local yOffSet = 52
local altitude

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
--local hum = char.Humanoid or char:WaitForChild("Humanoid")

RunService.Stepped:Connect(function()
	--print(math.floor(char.HumanoidRootPart.Position.Y - yOffSet))
	local root
	pcall(function()
		root = char.HumanoidRootPart
	end)
	if root ~= nil then
		altitude = root.Position.Y - yOffSet
		PlayerStatUpdater.updateAltitude(altitude, player)
	end
end)
