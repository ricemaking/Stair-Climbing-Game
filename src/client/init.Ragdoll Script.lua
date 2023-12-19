local Players = game:GetService("Players")

local char = script.Parent
local hum = script.Parent:WaitForChild("Humanoid")

hum.BreakJointsOnDeath = false

--local died
--died = hum.Died:Connect(function() 
--	print("dead")
--	local d = char:GetDescendants()
--	for i=1,#d do
--		local desc = d[i]
--		if desc:IsA("Motor6D") then
--			local socket = Instance.new("BallSocketConstraint")
--			local part0 = desc.Part0
--			local joint_name = desc.Name
--			local attachment0 = desc.Parent:FindFirstChild(joint_name.."Attachment") or desc.Parent:FindFirstChild(joint_name.."RigAttachment")
--			local attachment1 = part0:FindFirstChild(joint_name.."Attachment") or part0:FindFirstChild(joint_name.."RigAttachment")
--			if attachment0 and attachment1 then
--				socket.Attachment0, socket.Attachment1 = attachment0, attachment1
--				socket.Parent = desc.Parent
--				desc:Destroy()
--			end	
--		end
--	end
--end)
