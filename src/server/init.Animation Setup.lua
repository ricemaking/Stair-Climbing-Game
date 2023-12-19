local idleAnimationId = "rbxassetid://15680878481"
local jumpAnimationId = "rbxassetid://15680943986"
local walkAnimationId = "rbxassetid://15681146000"


local players = game:GetService("Players")

players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		plr.CharacterAppearanceLoaded:Connect(function()
			local animateScript = char:WaitForChild("Animate")

			animateScript.idle.Animation1.AnimationId = idleAnimationId
			animateScript.idle.Animation2.AnimationId = idleAnimationId
			animateScript.jump.JumpAnim.AnimationId = jumpAnimationId
			animateScript.walk.WalkAnim.AnimationId = walkAnimationId
		end)
	end)
end)
