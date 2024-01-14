local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvents = ReplicatedStorage.RemoteEvents
local StatUpgradeEvent = RemoteEvents["StatChange Event"]

local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:FindFirstChild("Humanoid")

StatUpgradeEvent.OnClientEvent:Connect(function(stat)
	if stat == "Health" then
		hum.MaxHealth += 20
		hum.Health = hum.MaxHealth
		if hum.MaxHealth >= 300 then
			hum.MaxHealth = 300
		end
	elseif stat == "Jump" then
		
		hum.JumpPower += 10
		if hum.JumpPower >= 100 then
			hum.JumpPower = 100
		end
		
		--local root = char:FindFirstChild("HumanoidRootPart")
		--root.CustomPhysicalProperties.Density = .3
		--game.Workspace.Gravity -= 50
		--if game.Workspace.Gravity <= 100 then
		--	game.Workspace.Gravity = 100
		--end
		
	elseif stat == "Speed" then
		hum.WalkSpeed += 5
		if hum.WalkSpeed >= 30 then
			hum.WalkSpeed = 30
		end
	end
end)
