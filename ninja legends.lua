repeat task.wait() until game:IsLoaded()
Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
-- Variables
lp = game.Players.LocalPlayer
chara = lp.Character
hrd = chara.HumanoidRootPart
humanoid = chara.Humanoid
playern = lp.Name

--Variables
autoswing = false
autosell = false
autobuysword = false
autobuybelt = false
autoclaimchestsbutbad = false
autoclaimchestsbutgood = false
speedofthefly = 16
speedofthevfly = 16
shiftwalkspeed = false
infinijump = false
noclipping = false
--End Variables

--Functions

function swing()
	game:GetService("Players").LocalPlayer.ninjaEvent:FireServer("swingKatana")
end

function collecthoops()
	for i,v in pairs(game.Workspace.Hoops:GetChildren()) do
		local ohString1 = "useHoop"
		local ohInstance2 = v
		
		game:GetService("ReplicatedStorage").rEvents.hoopEvent:FireServer(ohString1, ohInstance2)
	end
end

function redeemcode(code)
	game.ReplicatedStorage.rEvents.codeRemote:InvokeServer(code)
end

function unlockislands()
	for _,v in pairs(workspace.islandUnlockParts:GetDescendants()) do
		if v:IsA("TouchTransmitter") then
			firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
			wait()
			firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
		end
	end
end

function buyallsword()
	local ohString1 = "buyAllSwords"
	local ohString2 = "Blazing Vortex Island"

	game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(ohString1, ohString2)
end

function buyallbelt()
	local ohString1 = "buyAllBelts"
	local ohString2 = "Blazing Vortex Island"

	game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(ohString1, ohString2)
end

function notify(text, duration)
	Rayfield:Notify({
		Title = "Ruby Hub",
		Content = text,
		Duration = duration,
		Image = 4483362458,
	})
end

function tp(x, y, z)
	hrd.CFrame = CFrame.new(x, y, z)
end

--End Functions

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

local DestroyUI = MainTab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
		Rayfield:Destroy()
   end,
})

local autokatana = MainTab:CreateButton({
   Name = "Toggle Auto Swing",
   Callback = function()
		autoswing = not autoswing
		if  autoswing then notify("AutoSwing started.", 1) else notify("AutoSwing stopped.", 1) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if autoswing then swing() end
		end)
   end,
})

local togautosell = MainTab:CreateButton({
   Name = "Toggle Autosell (best area x35)",
   Callback = function()
		autosell = not autosell
		if autosell then notify("Autosell started.") else notify("Autosell stopped.") end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if autosell then firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.sellAreaCircles.sellAreaCircle16.circleInner, 0); task.wait(); firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.sellAreaCircles.sellAreaCircle16.circleInner, 1); end
		end)
   end,
})

local togbuysword = MainTab:CreateButton({
   Name = "Toggle Auto buy all Swords",
   Callback = function()
		autobuysword = not autobuysword
		if autobuysword then notify("Autobuy sword started.") else notify("Autobuy sword stopped.") end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if autobuysword then buyallsword() end
		end)
   end,
})

local togbuybelt = MainTab:CreateButton({
   Name = "Toggle Auto buy all Belts",
   Callback = function()
		autobuybelt = not autobuybelt
		if autobuybelt then notify("Autobuy belt started.") else notify("Autobuy belt stopped.") end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if autobuybelt then buyallbelt() end
		end)
   end,
})
if not workspace:FindFirstChild("ChestsCombined") then
	chestscombinedfolder = Instance.new("Folder")
	chestscombinedfolder.Name = "ChestsCombined"
	chestscombinedfolder.Parent = workspace
	workspace.ultraNinjitsuChest.Parent = chestscombinedfolder
	workspace.mythicalChest.Parent = chestscombinedfolder
	workspace.goldenChest.Parent = chestscombinedfolder
	workspace.enchantedChest.Parent = chestscombinedfolder
	workspace.magmaChest.Parent = chestscombinedfolder
	workspace.legendsChest.Parent = chestscombinedfolder
	workspace.eternalChest.Parent = chestscombinedfolder
	workspace.thunderChest.Parent = chestscombinedfolder
	workspace.ancientChest.Parent = chestscombinedfolder
	workspace.midnightShadowChest.Parent = chestscombinedfolder
	workspace.lightKarmaChest.Parent = chestscombinedfolder
	workspace.evilKarmaChest.Parent = chestscombinedfolder
	workspace.wonderChest.Parent = chestscombinedfolder
	workspace.goldenZenChest.Parent = chestscombinedfolder
	workspace.skystormMastersChest.Parent = chestscombinedfolder
	workspace.chaosLegendsChest.Parent = chestscombinedfolder
	workspace.soulFusionChest.Parent = chestscombinedfolder
	workspace.saharaChest.Parent = chestscombinedfolder
end
local togchestbutbad = MainTab:CreateButton({
   Name = "Toggle Auto claim all Chests but bad karma",
   Callback = function()
		autoclaimchestsbutbad = not autoclaimchestsbutbad
		if autoclaimchestsbutbad then notify("Enabled.", 1) else notify("Disabled", 1) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if autoclaimchestsbutbad then
				for _,v in pairs(workspace.ChestsCombined:GetDescendants()) do
					if v:IsA("TouchTransmitter") then
						if v.Parent.Parent.Name ~= "evilKarmaChest" then
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
							wait()
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
						end
					end
				end
			end
		end)
   end,
})

local togchestbutgood = MainTab:CreateButton({
   Name = "Toggle Auto claim all Chests but good garma",
   Callback = function()
		autoclaimchestsbutgood = not autoclaimchestsbutgood
		if autoclaimchestsbutgood then notify("Enabled.", 1) else notify("Disabled", 1) end
		local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if autoclaimchestsbutgood then
				for _,v in pairs(workspace.ChestsCombined:GetDescendants()) do
					if v:IsA("TouchTransmitter") then
						if v.Parent.Parent.Name ~= "lightKarmaChest" then
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
							wait()
							firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
						end
					end
				end
			end
		end)
   end,
})

local collecthoopsbutton = MainTab:CreateButton({
   Name = "Collect Hoops",
   Callback = function()
	collecthoops()
   end,
})

local unlockisland = MainTab:CreateButton({
   Name = "Unlock all Islands",
   Callback = function()
	unlockislands()
   end,
})

local redeemcodes = MainTab:CreateButton({
   Name = "Redeem all Codes",
   Callback = function()
	redeemcode(soulninja1000)
	redeemcode(epictrain15)
	redeemcode(roboninja15)
	redeemcode(christmasninja500)
	redeemcode(zenmaster15K)
	redeemcode(darkelements2000)
	redeemcode(omegasecrets5000)
	redeemcode(ultrasecrets10k)
	redeemcode(elementmaster750)
	redeemcode(secretcrystal1000)
	redeemcode(skymaster750)
	redeemcode(legends700m)
	redeemcode(dojomasters500)
	redeemcode(dragonlegend750)
	redeemcode(zenmaster500)
	redeemcode(epicelements500)
	redeemcode(goldupdate500)
	redeemcode(legends500m)
	redeemcode(senseisanta500)
	redeemcode(blizzardninja500)
	redeemcode(mythicalninja500)
	redeemcode(legendaryninja500)
	redeemcode(shadowninja500)
	redeemcode(legends200M)
	redeemcode(epicflyingninja500)
	redeemcode(flyingninja500)
	redeemcode(dragonwarrior500)
	redeemcode(swiftblade300)
	redeemcode(DesertNinja250)
	redeemcode(fastninja100)
	redeemcode(epicninja250)
	redeemcode(masterninja750)
	redeemcode(sparkninja20)
	redeemcode(soulhunter5)
   end,
})

local togglepopups = MainTab:CreateButton({
   Name = "Toggle Popups",
   Callback = function()
		game.Players.LocalPlayer.PlayerGui.statEffectsGui.Enabled = not game.Players.LocalPlayer.PlayerGui.statEffectsGui.Enabled
		if game.Players.LocalPlayer.PlayerGui.statEffectsGui.Enabled then notify("Popups enabled.") else notify("Popups disabled.") end
   end,
})

local TeleportsTab = Window:CreateTab("Teleports")

local TeleportsTabDropdown = TeleportsTab:CreateDropdown({
	Name = "Teleport To",
	Options = {"Enchanted Island", "Astral Island", "Mystical Island", "Space Island", "Thundra Island", "Eternal Island", "Sandstorm Island", "Thunderstorm Island", "Ancient Inferno Island", "Midnight Shadow Island", "Mythical Souls Island", "Winter Wonder Island", "Golden Master Island", "Dragon Legend Island", "Cybernetic Legends Island", "Skystorm Ultraus Island", "Chaos Legends Island", "Soul Fusion Island", "Dark Elements Island", "Inner Peace Island", "Blazing Vortex Island"},
	CurrentOption = "Ruby Hub ontop",
	MultiSelection = false,
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
		for i, v in pairs(Option) do
			Optionc = v
		end
		if Optionc == "Blazing Vortex Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 91246, 63)
		elseif Optionc == "Inner Peace Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 87051, 63)
		elseif Optionc == "Dark Elements Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 83199, 63)
		elseif Optionc == "Soul Fusion Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 79747, 63)
		elseif Optionc == "Chaos Legends Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 74443, 63)
		elseif Optionc == "Skystorm Ultraus Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 70271, 63)
		elseif Optionc == "Cybernetic Legends Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 66669, 63)
		elseif Optionc == "Dragon Legend Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 59595, 63)
		elseif Optionc == "Golden Master Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 52608, 63)
		elseif Optionc == "Winter Wonder Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 46011, 63)
		elseif Optionc == "Mythical Souls Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 39318, 63)
		elseif Optionc == "Midnight Shadow Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 33207, 63)
		elseif Optionc == "Ancient Inferno Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 28257, 63)
		elseif Optionc == "Thunderstorm Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 24070, 63)
		elseif Optionc == "Sandstorm Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 17687, 63)
		elseif Optionc == "Eternal Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 13680, 63)
		elseif Optionc == "Thundra Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 9285, 63)
		elseif Optionc == "Space Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(140, 5657, 63)
		elseif Optionc == "Mystical Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(165, 4048, 51)
		elseif Optionc == "Astral Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(225, 2014, 266)
		elseif Optionc == "Enchanted Island" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(70, 766, -150)
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
