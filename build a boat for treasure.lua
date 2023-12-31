local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Ruby Hub",
    SubTitle = "by Deni210",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
	Player = Window:AddTab({ Title = "LocalPlayer", Icon = "" }),
	asettings = Window:AddTab({ Title = "AutoFarm Settings", Icon = "settings" }),
    Settings = Window:AddTab({ Title = "UI Settings", Icon = "settings" })
}
function notify(title, content)
	if title and not content then content = title; title = "Ruby Hub" end
	Fluent:Notify({
		Title = title,
		Content = content,
		Duration = 5
	})
end
notify("Thanks for using Ruby Hub!")
local Options = Fluent.Options
local rubyhub = {
	autofarming = false,
	stayatyvalue = 55,
	aspeed = 1000,
	antireport = false,
	waituntil = 20
}
local speedofthefly = 6
local speedofthevfly =  6
function tp(x, y, z, speed)
	pcall(function()
		local maxForce = Vector3.new(math.huge, math.huge, math.huge)
		local velocity = Instance.new("BodyVelocity")
		velocity.MaxForce = maxForce
		velocity.Velocity = Vector3.new(0, 0, 0)
		velocity.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		local targetPosition = Vector3.new(x, y, z)
		local dochange = false
		if not speed then dochange = true end
		while true do
			if not rubyhub.autofarming then
				velocity:Destroy()
				break
			end
			local currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
			local direction = (targetPosition - currentPos).unit
			local distance = (targetPosition - currentPos).magnitude
			if dochange then
				speed = rubyhub.aspeed
			end
			local distanceCheck = speed/30
			if distance >= distanceCheck then
				velocity.Velocity = direction * speed
			else
				velocity:Destroy()
				for i = 1, 20 do
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
					game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
					task.wait()
				end
				break
			end
			wait()
		end
	end)
end
local isfirstrun = true
local autofarm = Tabs.Main:AddToggle("autofarm", {Title = "Auto Farm", Default = false })
autofarm:OnChanged(function()
	rubyhub.autofarming = Options.autofarm.Value
	if rubyhub.autofarming then
		notify("Autofarm started.")
		while task.wait() do
			if rubyhub.autofarming then
				if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					local water = game:GetService("Workspace").BoatStages.NormalStages.CaveStage1.Water
					local waterp = water.Position
					local lastwater = game:GetService("Workspace").BoatStages.NormalStages.CaveStage10.Water
					local lastwaterp = lastwater.Position
					local chest = game:GetService("Workspace").BoatStages.NormalStages.TheEnd.GoldenChest.Trigger
					local success = pcall(function()
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(waterp.x, waterp.y + rubyhub.stayatyvalue, waterp.z)
						tp(lastwaterp.x, waterp.y + rubyhub.stayatyvalue, lastwaterp.z, nil)
						for i = 1, 5 do
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(chest.Position.x, chest.Position.y + 20, chest.Position.z)
							task.wait(0.05)
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(chest.Position.x, chest.Position.y, chest.Position.z)
							task.wait(0.05)
						end
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(chest.Position.x, chest.Position.y + 30, chest.Position.z)
						notify("Waiting 20 seconds...")
						task.wait(rubyhub.waituntil)
					end)
					if not success then
						notify("An error occured but it's protected, autofarm continues :)")
					end
				end
			else
				break
			end
		end
	else
		if isfirstrun then
			isfirstrun = false
		else
			notify("Autofarm stopped.")
		end
	end
end)
Tabs.Player:AddButton({
	Title = "Fly (F) Vehicle & Player",
	Description = "Allows you to Fly",
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
					pcall(function()
						if KEY:lower() == 'w' then
							if game.Players.LocalPlayer.Humanoid.SeatPart then
								CONTROL.F = speedofthevfly
							else
								CONTROL.F = speedofthefly
							end
						elseif KEY:lower() == 's' then
							if game.Players.LocalPlayer.Humanoid.SeatPart then
								CONTROL.B = - speedofthevfly
							else
								CONTROL.B = - speedofthefly
							end
						elseif KEY:lower() == 'a' then
							if game.Players.LocalPlayer.Humanoid.SeatPart then
								CONTROL.L = - speedofthevfly
							else
								CONTROL.L = - speedofthefly
							end
						elseif KEY:lower() == 'd' then
							if game.Players.LocalPlayer.Humanoid.SeatPart then
								CONTROL.R = speedofthevfly
							else
								CONTROL.R = speedofthefly
							end
						elseif KEY:lower() == 'y' then
							if game.Players.LocalPlayer.Humanoid.SeatPart then
								CONTROL.Q = speedofthevfly*2
							else
								CONTROL.Q = speedofthefly*2
							end
						elseif KEY:lower() == 't' then
							if game.Players.LocalPlayer.Humanoid.SeatPart then
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
				end)
				FLY()
			end
		end)
	end
})
local afspeed = Tabs.asettings:AddSlider("afspeed", {
	Title = "Autofarm Speed",
	Description = "Changes the Autofarm Speed",
	Default = 1000,
	Min = 100,
	Max = 10000,
	Rounding = 0,
	Callback = function(Value)
		rubyhub.aspeed = Value
	end
})

afspeed:OnChanged(function(Value)
	rubyhub.aspeed = Value
end)

local stayat = Tabs.asettings:AddSlider("stayat", {
	Title = "Stay at Y Value",
	Description = "Stays at the given Y Value (height)",
	Default = 55,
	Min = 55,
	Max = 100,
	Rounding = 0,
	Callback = function(Value)
		rubyhub.stayatyvalue = Value
	end
})
local wai = Tabs.asettings:AddSlider("wai", {
	Title = "Wait until AutoFarm starts again",
	Description = "Waits ... seconds until AutoFarm starts again",
	Default = 20,
	Min = 10,
	Max = 60,
	Rounding = 0,
	Callback = function(Value)
		rubyhub.waituntil = Value
	end
})

wai:OnChanged(function(Value)
	rubyhub.waituntil = Value
end)
local pfly = Tabs.Player:AddSlider("pfly", {
	Title = "Player Fly Speed",
	Description = "Changes the Fly Speed of the Player",
	Default = 6,
	Min = 1,
	Max = 50,
	Rounding = 0,
	Callback = function(Value)
		speedofthefly = Value
	end
})

pfly:OnChanged(function(Value)
	speedofthefly = Value
end)
local vfly = Tabs.Player:AddSlider("vfly", {
	Title = "Vehicle Fly Speed",
	Description = "Changes the Fly Speed of the Vehicle you're in",
	Default = 6,
	Min = 1,
	Max = 50,
	Rounding = 0,
	Callback = function(Value)
		speedofthevfly = Value
	end
})

vfly:OnChanged(function(Value)
	speedofthevfly = Value
end)
local walk = Tabs.Player:AddSlider("walk", {
	Title = "WalkSpeed",
	Description = "Changes the WalkSpeed of the Player",
	Default = 16,
	Min = 16,
	Max = 1000,
	Rounding = 0,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})
walk:OnChanged(function(Value)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)
local jump = Tabs.Player:AddSlider("jump", {
	Title = "JumpPower",
	Description = "Changes the JumpPower of the Player",
	Default = 50,
	Min = 50,
	Max = 1000,
	Rounding = 0,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})
jump:OnChanged(function(Value)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("Ruby Hub")
SaveManager:SetFolder("Ruby Hub/BABFT")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
