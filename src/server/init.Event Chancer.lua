local EventManager = require(game:GetService("ReplicatedStorage").Shared.EventManager)
local UpdateTimerEvent = game:GetService("ReplicatedStorage").RemoteEvents["UpdateTimer Event"]
local ShowEvent = game:GetService("ReplicatedStorage").RemoteEvents["ShowEvent Event"]

local EventTable80Percent = {
	"Banana"
}

local EventTable40Percent = {
	"Landmine", "StatBoost"
}

local EventTable20Percent = {
	"TikTokSlideshow", "ShoopDaWhoop"
}

local EventTable10Percent = {
	"CleanStairs"
}

local EventTable5Percent = {
	"FUSRODAH"
}

local EventTable1Percent = {
	"1PercentFiller"
}

local EventTablePoint1Percent = {
	"Point1PercentFiller"
}

local chanceTable = {
	EventTable80Percent = 800,
	EventTable40Percent = 400,
	EventTable20Percent = 200,
	EventTable10Percent = 100,
	EventTable5Percent = 50,
	EventTable1Percent = 10,
	EventTablePoint1Percent = 1
}

while 1 == 1 do
	
	for i = 10, 0, -1 do
		task.wait(1)
		UpdateTimerEvent:FireAllClients(i)
	end
	
	local weight = 0
	for _, chance in pairs(chanceTable) do
		weight += (chance * 1)
	end
	
	local randNum = math.random(1,weight)
	
	local counter = 0
	for eventTable, chance in pairs(chanceTable) do
		counter += (chance * 1)
		
		if counter >= randNum then
			print("Weight: "..weight.." Counter: "..counter.." Random Number: "..randNum)
			print(eventTable)
			
			local chosenTable
			if eventTable == "EventTable80Percent" then
				chosenTable = EventTable80Percent
			elseif eventTable == "EventTable40Percent" then
				chosenTable = EventTable40Percent
			elseif eventTable == "EventTable20Percent" then
				chosenTable = EventTable20Percent
			elseif eventTable == "EventTable10Percent" then
				chosenTable = EventTable10Percent
			elseif eventTable == "EventTable5Percent" then
				chosenTable = EventTable5Percent
			elseif eventTable == "EventTable1Percent" then
				chosenTable = EventTable1Percent
			elseif eventTable == "EventTablePoint1Percent" then
				chosenTable = EventTablePoint1Percent
			end
			
			local eventChooser = math.random(#chosenTable)
			local chosenEvent = chosenTable[eventChooser]
			--print("CHOSEN TABLE LENGTH: "..#chosenTable)
			--print("EVENT CHOOSER: "..eventChooser)
			--print("CHOSEN TABLE: "..tostring(chosenTable))
			print("CHOSEN EVENT: "..chosenEvent)
			
			--0.1%
			
			
			--1%
			
			
			--5%
			if chosenEvent == "FUSRODAH" then --fus ro dah event
				ShowEvent:FireAllClients("FUSRODAH")
				EventManager.FusRoDahEvent()
			end
			
			--10%
			if chosenEvent == "CleanStairs" then --clean stairs event
				ShowEvent:FireAllClients("CleanStairs")
				EventManager.CleanStairsEvent()
			end
			
			if chosenEvent == "ShoopDaWhoop" then --ima firin mah lazah
				ShowEvent:FireAllClients("ShoopDaWhoop")
				EventManager.ShoopDaWhoopEvent()
			end
			
			--20%
			if chosenEvent == "TikTokSlideshow" then --tiktokSlideshow event
				ShowEvent:FireAllClients("TiktokSlideshow")
				EventManager.TiktokSlideshowEvent()
			end
			
			if chosenEvent == "StatBoost" then
				ShowEvent:FireAllClients("StatBoost")
				EventManager.StatBoostEvent()
			end
			
			--40%
			
			
			--80%
			
			if chosenEvent == "Banana" then --banana event
				ShowEvent:FireAllClients("Banana")
				EventManager.BananaEvent()
			end
			
			if chosenEvent == "Landmine" then
				ShowEvent:FireAllClients("Landmine")
				EventManager.LandMineEvent()
			end

			break
		end
	end
	
	
	--if chance <= 1 then --0.1%
		
	--elseif chance <= 10 then --1%
		
		
		
	--elseif chance <= 50 then --5%
		
		
		
	--elseif chance <= 100 then --10%
		
		
		
	--elseif chance <= 200 then --20%
	--	local eventChooser = math.random(#EventTable20Percent)
	--	print(EventTable20Percent[eventChooser])

	--	if EventTable20Percent[eventChooser] == "FUSRODAH" then
	--		ShowEvent:FireAllClients("FUSRODAH")
	--		EventManager.FusRoDahEvent()
	--	end
		
		
	--elseif chance <= 400 then --40%
		
		
		
	--else --60%
		
	--	local eventChooser = math.random(#EventTable60Percent)
	--	print(EventTable60Percent[eventChooser])
		
	--	if EventTable60Percent[eventChooser] == "Banana" then
	--		ShowEvent:FireAllClients("Banana")
	--		EventManager.BananaEvent()
	--	end
		
	--end
		
end
