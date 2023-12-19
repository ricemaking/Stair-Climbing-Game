for i,obj in pairs(game.Workspace:GetDescendants()) do
	if obj:IsA("BasePart") then
		obj.TopSurface = "Studs"
		obj.BackSurface = "Studs"
		obj.BottomSurface = "Studs"
		obj.FrontSurface = "Studs"
		obj.RightSurface = "Studs"
		obj.LeftSurface = "Studs"
	end
end
