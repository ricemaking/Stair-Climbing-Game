for i, v in pairs(game.Workspace:GetChildren()) do
	if v.Name:match("Border") then
		v.Transparency = 1
	end
end
