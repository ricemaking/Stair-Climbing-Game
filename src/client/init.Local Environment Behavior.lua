local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvents = ReplicatedStorage.RemoteEvents
local LocalEnvironmentEvent = RemoteEvents["LocalEnvironment Event"]

local lighting = game:GetService("Lighting")

LocalEnvironmentEvent.OnClientEvent:Connect(function(environmentChange)
	if environmentChange == "Normal" then
		lighting.Brightness = 1.35
		lighting.ColorShift_Top = Color3.new(0,0,0)
		lighting.ColorShift_Bottom = Color3.new(0,0,0)
		lighting.EnvironmentSpecularScale = 1
		lighting.EnvironmentDiffuseScale = 1
		lighting.GlobalShadows = true
		lighting.OutdoorAmbient = Color3.new(.275,.275,.275)
		lighting.ClockTime = 14.05
		
		lighting.Atmosphere.Density = 0.3
		lighting.Atmosphere.Offset = 0.25
		lighting.Atmosphere.Color = Color3.new(0.78,0.78,0.78)
		lighting.Atmosphere.Decay = Color3.new(0.416,.439,.49)
		lighting.Atmosphere.Glare = 0
		lighting.Atmosphere.Haze = 0
	end
	if environmentChange == "Fog" then
		lighting.Ambient = Color3.new(.247,.251,.251) --.247,.251,.251
		lighting.Brightness = 0
		lighting.ColorShift_Top = Color3.new(0.74403, 0.719417, 0.0295872) --.39, .38, 0.03
		lighting.EnvironmentSpecularScale = 0
		lighting.EnvironmentDiffuseScale = 0
		lighting.OutdoorAmbient = Color3.new(.247,.251,.251)
		
		lighting.Atmosphere.Haze = 5
		
		--lighting.ColorCorrection.TintColor = Color3.new(0.427451, 0.427451, 0.427451)
	end
end)
