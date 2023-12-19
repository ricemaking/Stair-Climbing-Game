local players = game:GetService("Players")

local dataStoreService = game:GetService("DataStoreService")
local dataStore = dataStoreService:GetDataStore("dataStore")

players.PlayerAdded:Connect(function(plr)
	
	-- PLAYER BOOL SETUP --
	local plrBools = Instance.new("Folder")
	plrBools.Name = "plrBools"
	plrBools.Parent = plr
	
	local tripStatus = Instance.new("BoolValue")
	tripStatus.Name = "tripStatus"
	tripStatus.Parent = plrBools
	tripStatus.Value = false
	
	local mineStatus = Instance.new("BoolValue")
	mineStatus.Name = "mineStatus"
	mineStatus.Parent = plrBools
	mineStatus.Value = false
	
	-- LEADERBOARD SETUP --
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = plr

	-- floor --
	local floor = Instance.new("IntValue")
	floor.Name = "Floor"
	floor.Parent = leaderstats
	
	-- alitude --
	local altitude = Instance.new("IntValue")
	altitude.Name = "Altitude"
	altitude.Parent = leaderstats
	
	-- get players data --
	local floorData
	
	local success, err = pcall(function()
		floorData = dataStore:GetAsync(plr.UserId.."-floor")
	end)
	if success then
		floor.Value = floorData
	else
		print("There was an error when saving data.")
		warn(err)
	end
end)

players.PlayerRemoving:Connect(function(plr)
	
	-- save data upon player leaving --
	local success, err = pcall(function()
		dataStore:SetAsync(plr.UserId.."-floor", plr.leaderstats.Floor.Value)
	end)
	
	if success then
		print("Data sucessfully saved.")
	else
		print("There was an error when saving data.")
		warn(err)
	end
	
end)
