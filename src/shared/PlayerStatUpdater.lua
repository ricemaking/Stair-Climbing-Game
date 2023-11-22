local PlayerStatUpdater = {}

function PlayerStatUpdater.updateFloor(floor, plr)
	local playersFloor = plr.leaderstats.Floor.Value
	if playersFloor >= floor then
		return
	else
		print("updating Floor")
		plr.leaderstats.Floor.Value = floor
	end
end

function PlayerStatUpdater.updateAltitude(altitude, plr)
	--local playersAltitude = plr.leaderstats.Altitude.Value
	plr.leaderstats.Altitude.Value = altitude
end

return PlayerStatUpdater
