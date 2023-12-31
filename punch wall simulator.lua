Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
-- Variables
lp = game.Players.LocalPlayer
chara = lp.Character
hrd = chara.HumanoidRootPart
humanoid = chara.Humanoid
playern = lp.Name
speedofthefly = 2
speedofthevfly = 2
noclipping = false
infinijump = false
walkspeedenabled = false
stop = false
shiftspeed = 32
autorebirthenabled = false

-- Functions
function openegg(egg)
	local ohNumber1 = 0
	local ohString2 = egg

	game:GetService("ReplicatedStorage")["functions-shared/network@GlobalFunctions"]["s:openEgg"]:FireServer(ohNumber1, ohString2)
end

function craftpets()
	local ohNumber1 = 0

	game:GetService("ReplicatedStorage")["functions-shared/network@GlobalFunctions"]["s:craftAllPets"]:FireServer(ohNumber1)
end

function equipbest()
	local ohNumber1 = 0

	game:GetService("ReplicatedStorage")["functions-shared/network@GlobalFunctions"]["s:equipBestPets"]:FireServer(ohNumber1)
end

function rebirth()
	local ohNumber1 = 0
	
	game:GetService("ReplicatedStorage")["functions-shared/network@GlobalFunctions"]["s:rebirth"]:FireServer(ohNumber1)
end

function notify(text, duration)
	Rayfield:Notify({
		Title = "Ruby Hub",
		Content = text,
		Duration = duration,
		Image = 4483362458,
	})
end

function gp()
	hrd = chara.HumanoidRootPart
	p = hrd.Position
	px = p.x
	py = p.y
	pz = p.z
end
	
function tp(x, y, z)
	hrd.CFrame = CFrame.new(x, y, z)
end

if game.Players.LocalPlayer.PlayerGui:FindFirstChild("OpenerGui") then game.Players.LocalPlayer.PlayerGui.OpenerGui:Destroy() end
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Notifications") then game.Players.LocalPlayer.PlayerGui.Notifications:Destroy() end
local Window = Rayfield:CreateWindow({
Name = "Ruby Hub",
LoadingTitle = "Ruby Hub",
LoadingSubtitle = 'by ! "Deni210#8309 & Nordbergdk#1684',
ConfigurationSaving = {
	Enabled = false,
	FolderName = nil, -- Create a custom folder for your hub/game
	FileName = "Ruby Hub"
},
	Discord = {
		Enabled = true,
		Invite = "ehDD8gsFBS", -- The Discord invite code, do not include discord.gg/
		RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = false
})

notify("Thanks for using Ruby Hub and shoutout to Flixer :D - Flixer = W", 14)
notify("And also thank you so much Doom, for letting me use Synapse and for testing.", 14)
local MainTab = Window:CreateTab("Main")
--farmvariables
farm1 = false
farm2 = false
farm3 = false
farm4 = false
farm5 = false
farm6 = false
farm7 = false
farm8 = false
farm9 = false
farm10 = false
farm11 = false
farm12 = false
local DestroyUI = MainTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
		Rayfield:Destroy()
   end,
})
local lvl1 = MainTab:CreateButton({
   Name = "Toggle Farm Level 1 Strength",
   Callback = function()
		farm1 = not farm1
		foundbox = nil
		if farm1 then
			notify("Farming started.")
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.044") then 
					foundbox = v
					break
				end
			end
		else
			notify("Farming stopped.")
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if farm1 then
				local ohInstance1 = foundbox["Meshes/Axel_Cylinder.044"]

				game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
			end
		end)
   end,
})

local lvl2 = MainTab:CreateButton({
   Name = "Toggle Farm Level 2 Strength",
   Callback = function()
		farm2 = not farm2
		foundbox2 = nil
		if farm2 then
			notify("Farming started.")
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.061") then 
					foundbox2 = v
					break
				end
			end
		else
			notify("Farming stopped.")
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if farm2 then
				local ohInstance1 = foundbox2["Meshes/Axel_Cylinder.061"]

				game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
			end
		end)
   end,
})

local lvl3 = MainTab:CreateButton({
   Name = "Toggle Farm Level 3 Strength",
   Callback = function()
		farm3 = not farm3
		foundbox3 = nil
		if farm3 then
			notify("Farming started.")
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.031") then 
					foundbox3 = v
					break
				end
			end
		else
			notify("Farming stopped.")
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if farm3 then
				local ohInstance1 = foundbox3["Meshes/Axel_Cylinder.031"]

				game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
			end
		end)
   end,
})

local lvl4 = MainTab:CreateButton({
   Name = "Toggle Farm Level 4 Strength",
   Callback = function()
		farm4 = not farm4
		foundbox4 = nil
		if farm4 then
			notify("Farming started.")
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.070") then 
					foundbox4 = v
					break
				end
			end
		else
			notify("Farming stopped.")
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if farm4 then
				local ohInstance1 = foundbox4["Meshes/Axel_Cylinder.070"]

				game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
			end
		end)
   end,
})

local lvl5 = MainTab:CreateButton({
   Name = "Toggle Farm Level 5 Strength",
   Callback = function()
		farm5 = not farm5
		foundbox5 = nil
		if farm5 then
			notify("Farming started.")
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.035") then 
					foundbox5 = v
					break
				end
			end
		else
			notify("Farming stopped.")
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if farm5 then
				local ohInstance1 = foundbox5["Meshes/Axel_Cylinder.035"]

				game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
			end
		end)
   end,
})

local lvl6 = MainTab:CreateButton({
   Name = "Toggle Farm Level 6 Strength",
   Callback = function()
		farm6 = not farm6
		foundbox6 = nil
		if farm6 then
			notify("Farming started.")
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.043") then 
					foundbox6 = v
					break
				end
			end
		else
			notify("Farming stopped.")
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if farm6 then
				local ohInstance1 = foundbox6["Meshes/Axel_Cylinder.043"]

				game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
			end
		end)
   end,
})

local lvl7 = MainTab:CreateButton({
   Name = "Toggle Farm Level 7 Strength",
   Callback = function()
		farm7 = not farm7
		foundbox7 = nil
		if farm7 then
			notify("Farming started.")
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.029") then 
					foundbox7 = v
					break
				end
			end
		else
			notify("Farming stopped.")
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if farm7 then
				local ohInstance1 = foundbox7["Meshes/Axel_Cylinder.029"]

				game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
			end
		end)
   end,
})

local lvl8 = MainTab:CreateButton({
   Name = "Toggle Farm Level 8 Strength",
   Callback = function()
		farm8 = not farm8
		foundbox8 = nil
		if farm8 then
			notify("Farming started.")
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.069") then 
					foundbox8 = v
					break
				end
			end
		else
			notify("Farming stopped.")
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if farm8 then
				local ohInstance1 = foundbox8["Meshes/Axel_Cylinder.069"]

				game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
			end
		end)
   end,
})

local lvl9 = MainTab:CreateButton({
   Name = "Toggle Farm Level 9 Strength",
   Callback = function()
		farm9 = not farm9
		foundbox9 = nil
		if farm9 then
			notify("Farming started.")
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "Model" and v:FindFirstChild("Meshes/Axel_Cylinder.052 (1)") then 
					foundbox9 = v
					break
				end
			end
		else
			notify("Farming stopped.")
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if farm9 then
				local ohInstance1 = foundbox9["Meshes/Axel_Cylinder.052 (1)"]

				game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
			end
		end)
   end,
})

local lvl10 = MainTab:CreateButton({
   Name = "Toggle Farm Level 10 Strength",
   Callback = function()
		farm10 = not farm10
		foundbox10 = nil
		if farm10 then
			notify("Farming started.")
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "Model" and v:FindFirstChild("Meshes/Axel_Cylinder.051 (1)") then 
					foundbox10 = v
					break
				end
			end
		else
			notify("Farming stopped.")
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if farm10 then
				local ohInstance1 = foundbox10["Meshes/Axel_Cylinder.051 (1)"]

				game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
			end
		end)
   end,
})

local lvl11 = MainTab:CreateButton({
   Name = "Toggle Farm Level 11 Strength",
   Callback = function()
		farm11 = not farm11
		foundbox11 = nil
		if farm11 then
			notify("Farming started.")
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.060") then 
					foundbox11 = v
					break
				end
			end
		else
			notify("Farming stopped.")
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if farm11 then
				local ohInstance1 = foundbox11["Meshes/Axel_Cylinder.060"]

				game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
			end
		end)
   end,
})

local lvl12 = MainTab:CreateButton({
   Name = "Toggle Farm Level 12 Strength",
   Callback = function()
		farm12 = not farm12
		foundbox12 = nil
		if farm12 then
			notify("Farming started.")
			for i, v in pairs(game.Workspace:GetChildren()) do
				if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.062") then 
					foundbox12 = v
					break
				end
			end
		else
			notify("Farming stopped.")
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if farm12 then
				local ohInstance1 = foundbox12["Meshes/Axel_Cylinder.062"]

				game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
			end
		end)
   end,
})


local Farmx = MainTab:CreateSection("Farm Strength x1000")
local readthis = MainTab:CreateLabel("Read Announcement to prevent your game from being laggy/unresponsive ui")

local lvl1x = MainTab:CreateButton({
   Name = "Farm Level 1 Strength x1000",
   Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.044") then 
				for i = 1, 1000 do
					local ohInstance1 = v["Meshes/Axel_Cylinder.044"]

					game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
				end
				break
			end
		end
   end,
})

local lvl2x = MainTab:CreateButton({
   Name = "Farm Level 2 Strength x1000",
   Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.061") then 
				for i = 1, 1000 do
					local ohInstance1 = v["Meshes/Axel_Cylinder.061"]

					game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
				end
				break
			end
		end
   end,
})

local lvl3x = MainTab:CreateButton({
   Name = "Farm Level 3 Strength x1000",
   Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.031") then 
				for i = 1, 1000 do
					local ohInstance1 = v["Meshes/Axel_Cylinder.031"]

					game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
				end
				break
			end
		end
   end,
})

local lvl4x = MainTab:CreateButton({
   Name = "Farm Level 4 Strength x1000",
   Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.070") then 
				for i = 1, 1000 do
					local ohInstance1 = v["Meshes/Axel_Cylinder.070"]

					game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
				end
				break
			end
		end
   end,
})

local lvl5x = MainTab:CreateButton({
   Name = "Farm Level 5 Strength x1000",
   Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.035") then 
				for i = 1, 1000 do
					local ohInstance1 = v["Meshes/Axel_Cylinder.035"]

					game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
				end
				break
			end
		end
   end,
})

local lvl6x = MainTab:CreateButton({
   Name = "Farm Level 6 Strength x1000",
   Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.043") then 
				for i = 1, 1000 do
					local ohInstance1 = v["Meshes/Axel_Cylinder.043"]

					game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
				end
				break
			end
		end
   end,
})

local lvl7x = MainTab:CreateButton({
   Name = "Farm Level 7 Strength x1000",
   Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.029") then 
				for i = 1, 1000 do
					local ohInstance1 = v["Meshes/Axel_Cylinder.029"]

					game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
				end
				break
			end
		end
   end,
})

local lvl8x = MainTab:CreateButton({
   Name = "Farm Level 8 Strength x1000",
   Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.069") then 
				for i = 1, 1000 do
					local ohInstance1 = v["Meshes/Axel_Cylinder.069"]

					game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
				end
				break
			end
		end
   end,
})

local lvl9x = MainTab:CreateButton({
   Name = "Farm Level 9 Strength x1000",
   Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "Model" and v:FindFirstChild("Meshes/Axel_Cylinder.052 (1)") then 
				for i = 1, 1000 do
					local ohInstance1 = v["Meshes/Axel_Cylinder.052 (1)"]

					game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
				end
				break
			end
		end
   end,
})

local lvl10x = MainTab:CreateButton({
   Name = "Farm Level 10 Strength x1000",
   Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "Model" and v:FindFirstChild("Meshes/Axel_Cylinder.051 (1)") then 
				for i = 1, 1000 do
					local ohInstance1 = v["Meshes/Axel_Cylinder.051 (1)"]

					game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
				end
				break
			end
		end
   end,
})
local lvl11x = MainTab:CreateButton({
   Name = "Farm Level 11 Strength x1000",
   Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.060") then 
				for i = 1, 1000 do
					local ohInstance1 = v["Meshes/Axel_Cylinder.060"]

					game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
				end
				break
			end
		end
   end,
})

local lvl12x = MainTab:CreateButton({
   Name = "Farm Level 12 Strength x1000",
   Callback = function()
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name == "BoxingBag" and v:FindFirstChild("Meshes/Axel_Cylinder.062") then 
				for i = 1, 1000 do
					local ohInstance1 = v["Meshes/Axel_Cylinder.062"]

					game:GetService("ReplicatedStorage")["events-shared/network@GlobalEvents"].train:FireServer(ohInstance1)
				end
				break
			end
		end
   end,
})

--EggFarm

local EggTab = Window:CreateTab("Eggs")
local EggSection = EggTab:CreateSection("Eggs")
eggfarm1 = false
eggfarm2 = false
eggfarm3 = false
eggfarm4 = false
eggfarm5 = false
eggfarm6 = false
eggfarm7 = false
eggfarm8 = false
eggfarm9 = false
eggfarm10 = false
eggfarm11 = false
eggfarm12 = false
eggfarm13 = false
eggfarm14 = false
eggfarm15 = false
local OpenEggDropdown = EggTab:CreateDropdown({
	Name = "Open Egg",
	Options = {"Farm Egg (1 Win)", "Forest Egg (5 Wins)", "Jungle Egg (15 Wins)", "Water Egg (30 Wins)", "Midas Egg (50 Wins)", "Cave Egg (150 Wins)", "Flame Egg (250 Wins)", "Celestial Egg (1.25K Wins)", "Temple Egg (2K Wins)", "Ice Egg (9K Wins)", "Alien Egg (15K Wins)", "Swamp Egg (25K Wins)", "Candy Egg (50K Wins)", "Striped Egg (150K Wins)", "Chocolate Egg (450K Wins)"},
	CurrentOption = "Ruby Hub ontop",
	MultiSelection = false,
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
		for i, v in pairs(Option) do
			Optionc = v
		end
		if Optionc == "Farm Egg (1 Win)" then
			openegg("Farm Egg")
		elseif Optionc == "Forest Egg (5 Wins)" then
			openegg("Forest Egg")
		elseif Optionc == "Jungle Egg (15 Wins)" then
			openegg("Jungle Egg")
		elseif Optionc == "Water Egg (30 Wins)" then
			openegg("Water Egg")
		elseif Optionc == "Midas Egg (50 Wins)" then
			openegg("Midas Egg")
		elseif Optionc == "Cave Egg (150 Wins)" then
			openegg("Cave Egg")
		elseif Optionc == "Flame Egg (250 Wins)" then
			openegg("Flame Egg")
		elseif Optionc == "Celestial Egg (1.25K Wins)" then
			openegg("Celestial Egg")
		elseif Optionc == "Temple Egg (2K Wins)" then
			openegg("Temple Egg")
		elseif Optionc == "Ice Egg (9K Wins)" then
			openegg("Ice Egg")
		elseif Optionc == "Alien Egg (15K Wins)" then
			openegg("Alien Egg")
		elseif Optionc == "Swamp Egg (25K Wins)" then
			openegg("Swamp Egg")
		elseif Optionc == "Candy Egg (50K Wins)" then
			openegg("Candy Egg")
		elseif Optionc == "Striped Egg (150K Wins)" then
			openegg("Striped Egg")
		elseif Optionc == "Chocolate Egg (450K Wins)" then
			openegg("Chocolate Egg")
		end
	end,
})

local EggautoSection = EggTab:CreateSection("AutoFarm Eggs")

local egg1 = EggTab:CreateButton({
   Name = "Toggle Farm Farm Egg (1 Win)",
   Callback = function()
		eggfarm1 = not eggfarm1
		if eggfarm1 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm1 then
				openegg("Farm Egg")
			end
		end)
   end,
})

local egg2 = EggTab:CreateButton({
   Name = "Toggle Farm Forest Egg (5 Wins)",
   Callback = function()
		eggfarm2 = not eggfarm2
		if eggfarm2 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm2 then
				openegg("Forest Egg")
			end
		end)
   end,
})

local egg3 = EggTab:CreateButton({
   Name = "Toggle Farm Jungle Egg (15 Wins)",
   Callback = function()
		eggfarm3 = not eggfarm3
		if eggfarm3 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm3 then
				openegg("Jungle Egg")
			end
		end)
   end,
})

local egg4 = EggTab:CreateButton({
   Name = "Toggle Farm Water Egg (30 Wins)",
   Callback = function()
		eggfarm4 = not eggfarm4
		if eggfarm4 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm4 then
				openegg("Water Egg")
			end
		end)
   end,
})

local egg5 = EggTab:CreateButton({
   Name = "Toggle Farm Midas Egg (50 Wins)",
   Callback = function()
		eggfarm5 = not eggfarm5
		if eggfarm5 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm5 then
				openegg("Midas Egg")
			end
		end)
   end,
})

local egg6 = EggTab:CreateButton({
   Name = "Toggle Farm Cave Egg (150 Wins)",
   Callback = function()
		eggfarm6 = not eggfarm6
		if eggfarm6 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm6 then
				openegg("Cave Egg")
			end
		end)
   end,
})

local egg7 = EggTab:CreateButton({
   Name = "Toggle Farm Flame Egg (250 Wins)",
   Callback = function()
		eggfarm7 = not eggfarm7
		if eggfarm7 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm7 then
				openegg("Flame Egg")
			end
		end)
   end,
})

local egg8 = EggTab:CreateButton({
   Name = "Toggle Farm Celestial Egg (1.25K Wins)",
   Callback = function()
		eggfarm8 = not eggfarm8
		if eggfarm8 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm8 then
				openegg("Celestial Egg")
			end
		end)
   end,
})

local egg9 = EggTab:CreateButton({
   Name = "Toggle Farm Temple Egg (2K Wins)",
   Callback = function()
		eggfarm9 = not eggfarm9
		if eggfarm9 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm9 then
				openegg("Temple Egg")
			end
		end)
   end,
})

local egg10 = EggTab:CreateButton({
   Name = "Toggle Farm Ice Egg (9K Wins)",
   Callback = function()
		eggfarm10 = not eggfarm10
		if eggfarm10 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm10 then
				openegg("Ice Egg")
			end
		end)
   end,
})

local egg11 = EggTab:CreateButton({
   Name = "Toggle Farm Alien Egg (15K Wins)",
   Callback = function()
		eggfarm11 = not eggfarm11
		if eggfarm11 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm11 then
				openegg("Alien Egg")
			end
		end)
   end,
})

local egg12 = EggTab:CreateButton({
   Name = "Toggle Farm Swamp Egg (25K Wins)",
   Callback = function()
		eggfarm12 = not eggfarm12
		if eggfarm12 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm12 then
				openegg("Swamp Egg")
			end
		end)
   end,
})

local egg13 = EggTab:CreateButton({
   Name = "Toggle Farm Candy Egg (50K Wins)",
   Callback = function()
		eggfarm13 = not eggfarm13
		if eggfarm13 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm13 then
				openegg("Candy Egg")
			end
		end)
   end,
})

local egg14 = EggTab:CreateButton({
   Name = "Toggle Farm Striped Egg (150K Wins)",
   Callback = function()
		eggfarm14 = not eggfarm14
		if eggfarm14 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm14 then
				openegg("Striped Egg")
			end
		end)
   end,
})

local egg15 = EggTab:CreateButton({
   Name = "Toggle Farm Chocolate Egg (450K Wins)",
   Callback = function()
		eggfarm15 = not eggfarm15
		if eggfarm15 then notify("Farming Egg.", 2) else notify("Stopped farming Egg.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if eggfarm15 then
				openegg("Chocolate Egg")
			end
		end)
   end,
})

local PetsTab = Window:CreateTab("Pets")
local PetSection = PetsTab:CreateSection("Pets")

--Auto Pet Variables
autoequip = false
autocraft = false

local craftall = PetsTab:CreateButton({
   Name = "Craft All Pets",
   Callback = function()
		craftpets()
		notify("Success!", 1)
   end,
})

local equipb = PetsTab:CreateButton({
   Name = "Equip Best Pets",
   Callback = function()
		equipbest()
		notify("Success!", 1)
   end,
})

local autoequipb = PetsTab:CreateButton({
   Name = "Toggle Auto Equip Best Pets",
   Callback = function()
		autoequip = not autoequip
		if autoequip then notify("Started.", 2) else notify("Stopped.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if autoequip then
				equipbest()
			end
		end)
   end,
})

local autocraftall = PetsTab:CreateButton({
   Name = "Toggle Auto Craft All Pets",
   Callback = function()
		autocraft = not autocraft
		if autocraft then notify("Started.", 2) else notify("Stopped.", 2) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if autocraft then
				craftpets()
			end
		end)
   end,
})

local RebirthsTab = Window:CreateTab("Rebirth")
local RebirthSection = RebirthsTab:CreateSection("Rebirth")


local rebirthbutton = RebirthsTab:CreateButton({
   Name = "Rebirth",
   Callback = function()
		local ohNumber1 = 1
		game:GetService("ReplicatedStorage")["functions-shared/network@GlobalFunctions"]["s:rebirth"]:FireServer(ohNumber1)
   end,
})

local autorebirth = RebirthsTab:CreateButton({
   Name = "Toggle Auto Rebirth",
   Callback = function()
		autorebirthenabled = not autorebirthenabled
		if autorebirthenabled then
			notify("Auto Rebirth enabled.", 2)
		else
			notify("Auto Rebirth disabled.", 2)
		end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if autorebirthenabled then
				local ohNumber1 = 1
				game:GetService("ReplicatedStorage")["functions-shared/network@GlobalFunctions"]["s:rebirth"]:FireServer(ohNumber1)
			end
		end)
   end,
})

local WinsTab = Window:CreateTab("Wins")
local WinSection = WinsTab:CreateSection("Wins")
-- Win farm Variables
f1 = false
f2 = false
f3 = false
f4 = false
f5 = false
f6 = false
f7 = false
f8 = false
f9 = false
f10 = false
f11 = false
f12 = false

local f1t = WinsTab:CreateButton({
   Name = "Toggle Farm Level 1 (+1 Wins)",
   Callback = function()
		f1 = not f1
		if f1 then notify("Farming started.", 2) else notify("Farming stopped.", 2) end
		while true do
			if f1 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 30, 0)
				task.wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-199, 1.3, -28)
			end
			task.wait(0.1)
		end
   end,
})

local f2t = WinsTab:CreateButton({
   Name = "Toggle Farm Level 2 (+10 Wins)",
   Callback = function()
		f2 = not f2
		if f2 then notify("Farming started.", 2) else notify("Farming stopped.", 2) end
		while true do
			if f2 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 30, 0)
				task.wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-199, 1.3, -97)
			end
			task.wait(0.1)
		end
   end,
})

local f3t = WinsTab:CreateButton({
   Name = "Toggle Farm Level 3 (+50 Wins)",
   Callback = function()
		f3 = not f3
		if f3 then notify("Farming started.", 2) else notify("Farming stopped.", 2) end
		while true do
			if f3 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 30, 0)
				task.wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-198, 1.3, -166)
			end
			task.wait(0.1)
		end
   end,
})

local f4t = WinsTab:CreateButton({
   Name = "Toggle Farm Level 4 (+250 Wins)",
   Callback = function()
		f4 = not f4
		if f4 then notify("Farming started.", 2) else notify("Farming stopped.", 2) end
		while true do
			if f4 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 30, 0)
				task.wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-217, 55.5, -239)
			end
			task.wait(0.1)
		end
   end,
})

local f5t = WinsTab:CreateButton({
   Name = "Toggle Farm Level 5 (+750 Wins)",
   Callback = function()
		f5 = not f5
		if f5 then notify("Farming started.", 2) else notify("Farming stopped.", 2) end
		while true do
			if f5 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 30, 0)
				task.wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 1.3, -1214)
			end
			task.wait(0.1)
		end
   end,
})

local f6t = WinsTab:CreateButton({
   Name = "Toggle Farm Level 6 (+1.5K Wins)",
   Callback = function()
		f6 = not f6
		if f6 then notify("Farming started.", 2) else notify("Farming stopped.", 2) end
		while true do
			if f6 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 30, 0)
				task.wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78, 1.3, -1360)
			end
			task.wait(0.1)
		end
   end,
})

local f7t = WinsTab:CreateButton({
   Name = "Toggle Farm Level 7 (+3K Wins)",
   Callback = function()
		f7 = not f7
		if f7 then notify("Farming started.", 2) else notify("Farming stopped.", 2) end
		while true do
			if f7 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 30, 0)
				task.wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-235, 1.3, -1310)
			end
			task.wait(0.1)
		end
   end,
})

local f8t = WinsTab:CreateButton({
   Name = "Toggle Farm Level 8 (+15K Wins)",
   Callback = function()
		f8 = not f8
		if f8 then notify("Farming started.", 2) else notify("Farming stopped.", 2) end
		while true do
			if f8 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 30, 0)
				task.wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-185, 1.3, -1607)
			end
			task.wait(0.1)
		end
   end,
})

local f9t = WinsTab:CreateButton({
   Name = "Toggle Farm Level 9 (+25K Wins)",
   Callback = function()
		f9 = not f9
		if f9 then notify("Farming started.", 2) else notify("Farming stopped.", 2) end
		while true do
			if f9 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 30, 0)
				task.wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-270, 1.3, -1586)
			end
			task.wait(0.1)
		end
   end,
})

local f10t = WinsTab:CreateButton({
   Name = "Toggle Farm Level 10 (+50K Wins)",
   Callback = function()
		f10 = not f10
		if f10 then notify("Farming started.", 2) else notify("Farming stopped.", 2) end
		while true do
			if f10 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 30, 0)
				task.wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-341, 1.3, -1295)
			end
			task.wait(0.1)
		end
   end,
})

local f11t = WinsTab:CreateButton({
   Name = "Toggle Farm Level 11 (+150K Wins)",
   Callback = function()
		f11 = not f11
		if f11 then notify("Farming started.", 2) else notify("Farming stopped.", 2) end
		while true do
			if f11 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 30, 0)
				task.wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1087, 1.3, -29)
			end
			task.wait(0.1)
		end
   end,
})

local f12t = WinsTab:CreateButton({
   Name = "Toggle Farm Level 12 (+450K Wins)",
   Callback = function()
		f12 = not f12
		if f12 then notify("Farming started.", 2) else notify("Farming stopped.", 2) end
		while true do
			if f12 then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 30, 0)
				task.wait(0.1)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1087, 1.3, -99)
			end
			task.wait(0.1)
		end
   end,
})


local PlayerTab = Window:CreateTab("Player")
local PlayerSection = PlayerTab:CreateSection("Player")
local Fly = PlayerTab:CreateButton({
   Name = "Fly (F)",
   Callback = function()
		uis = game:GetService("UserInputService")
		local cmdp = game:GetService("Players")
		local cmdlp = cmdp.LocalPlayer
		local player = cmdlp
		local cmdl = game:GetService("Lighting")
		local cmdrs = game:GetService("ReplicatedStorage")
		local cmdrs2 = game:GetService("RunService")
		local cmdts = game:GetService("TweenService")
		local cmdvu = game:GetService("VirtualUser")
		local cmduis = game:GetService("UserInputService")
		local Mouses = cmdlp:GetMouse()
		cmdm = Mouses
		
		cmdm.KeyDown:connect(function(key)
			if key:lower() == "f" then
				FLYING = not FLYING
				while not cmdlp or not cmdlp.Character or not cmdlp.Character:FindFirstChild('HumanoidRootPart') or not cmdlp.Character:FindFirstChild('Humanoid') or not cmdm do
						wait()
				end 
				local T = cmdlp.Character.HumanoidRootPart
				local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
				local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
				local SPEED = 0
				function FLY()
					local BG = Instance.new('BodyGyro', T)
					local BV = Instance.new('BodyVelocity', T)
					BG.P = 9e4
					BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
					BG.cframe = T.CFrame
					BV.velocity = Vector3.new(0, 0, 0)
					BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
					spawn(function()
						while FLYING do
							if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
								SPEED = 50
							elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
								SPEED = 0
							end
							if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
								BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
								lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
							elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
								BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
							else
								BV.velocity = Vector3.new(0, 0, 0)
							end
							BG.cframe = workspace.CurrentCamera.CoordinateFrame
							wait()
						end
						CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
						lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
						SPEED = 0
						BG:destroy()
						BV:destroy()
						cmdlp.Character.Humanoid.PlatformStand = false
					end)
				end
				cmdm.KeyDown:connect(function(KEY)
					if KEY:lower() == 'w' then
						if vfly then
							CONTROL.F = speedofthevfly
						else
							CONTROL.F = speedofthefly
						end
					elseif KEY:lower() == 's' then
						if vfly then
							CONTROL.B = - speedofthevfly
						else
							CONTROL.B = - speedofthefly
						end
					elseif KEY:lower() == 'a' then
						if vfly then
							CONTROL.L = - speedofthevfly
						else
							CONTROL.L = - speedofthefly
						end
					elseif KEY:lower() == 'd' then
						if vfly then
							CONTROL.R = speedofthevfly
						else
							CONTROL.R = speedofthefly
						end
					elseif KEY:lower() == 'y' then
						if vfly then
							CONTROL.Q = speedofthevfly*2
						else
							CONTROL.Q = speedofthefly*2
						end
					elseif KEY:lower() == 't' then
						if vfly then
							CONTROL.E = -speedofthevfly*2
						else
							CONTROL.E = -speedofthefly*2
						end
					end
				end)
				cmdm.KeyUp:connect(function(KEY)
					if KEY:lower() == 'w' then
						CONTROL.F = 0
					elseif KEY:lower() == 's' then
						CONTROL.B = 0
					elseif KEY:lower() == 'a' then
						CONTROL.L = 0
					elseif KEY:lower() == 'd' then
						CONTROL.R = 0
					elseif KEY:lower() == 'y' then
						CONTROL.Q = 0
					elseif KEY:lower() == 't' then
						CONTROL.E = 0
					end
				end)
				FLY()
			end
		end)
   end,
})

local noclipbutton = PlayerTab:CreateButton({
   Name = "Toggle Noclip",
   Callback = function()
		noclipping = not noclipping
		if noclipping then
			notify("Noclip enabled.")
			Clip = true
			wait(0.1)
			local function NoclipLoop()
				if Clip == true and lp.Character ~= nil then
					for _, child in pairs(lp.Character:GetDescendants()) do
						if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
							child.CanCollide = false
						end
					end
				end
			end
			game:GetService('RunService').Stepped:Connect(NoclipLoop)
		else
			notify("Noclip disabled.")
			Clip = false
		end
   end,
})

infinitejump = PlayerTab:CreateButton({
   Name = "Toggle Infinite Jump",
   Callback = function()
		infinijump = not infinijump
		if infinijump then
			notify("Infinite Jump enabled.")
			infj = uis.JumpRequest:Connect(function()
				game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
			end)
		else
			notify("Infinite Jump disabled.")
			infj:Disconnect()
		end
   end,
})

local shiftwalkspeed = PlayerTab:CreateButton({
   Name = "Toggle Shift WalkSpeed",
   Callback = function()
		shiftwalkspeed = not shiftwalkspeed
		if shiftwalkspeed then
			notify("Shift Walkspeed enabled.")
		else
			notify("Shift Walkspeed disabled.")
		end
		local ContextActionService = game:GetService("ContextActionService")
		local mouse = game.Players.LocalPlayer:GetMouse()
		ContextActionService:UnbindAction("MouseLockSwitchAction")
		mouse.KeyDown:Connect(function(key)
			if key == "0" then
				stop = false
				while true do
					if not stop and shiftwalkspeed then
						game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = shiftspeed
					end
					wait()
				end
			end
		end)
		mouse.KeyUp:Connect(function(key)
			if key == "0" then
				stop = true
			end
		end)
   end,
})

forcefieldbody = PlayerTab:CreateButton({
   Name = "ForceField Body",
   Callback = function()
		for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("MeshPart") or v:IsA("Part") then
				v.Material = Enum.Material.ForceField
			end
		end
   end,
})

local FlySpeed = PlayerTab:CreateSlider({
   Name = "Fly Speed",
   Range = {1, 50},
   Increment = 1,
   CurrentValue = 2,
   Flag = "FlySpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		speedofthefly = Value
		speedofthevfly = Value
   end,
})

local WalkSpeed = PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 500},
   Increment = 2,
   CurrentValue = 16,
   Flag = "WalkSpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})
local UserInputService = game:GetService("UserInputService")
WalkSpeed = PlayerTab:CreateSlider({
   Name = "Shift WalkSpeed",
   Range = {0, 500},
   Increment = 2,
   CurrentValue = 16,
   Flag = "WalkSpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		shiftspeed = Value
   end,
})
