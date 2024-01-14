local RunService = game:GetService("RunService")
local StatChangeEvent = game:GetService("ReplicatedStorage").RemoteEvents["StatChange Event"]
local Players = game:GetService("Players")

local yOffSet = 52
local altitude

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

RunService.Stepped:Connect(function()
	local root
	pcall(function()
		root = char.HumanoidRootPart
	end)
	if root ~= nil then
		altitude = root.Position.Y - yOffSet
		StatChangeEvent:FireServer(altitude)
	end
end)
