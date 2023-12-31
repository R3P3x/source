--Ruby Hub
--Made by Nordbergdk and Deni
--Version: v1.3

-----------Mad City----------------
if game.PlaceId == 1224212277 then
	game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Thank you for using Ruby Hub!";Icon = "";Duration = 14;})

	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
	local Window = Library.CreateLib("Ruby Hub - v2.0", "BloodTheme")

	--Player
	local Player = Window:NewTab("Player")
	local PlayerSection = Player:NewSection("Movement (Glitchy)")	

	PlayerSection:NewSlider("WalkSpeed", "Changes the walkspeed", 250, 16, function(v) -- 500 (MaxValue) | 0 (MinValue)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
	end)
	PlayerSection:NewSlider("JumpPower", "Changes the jumpPower", 250, 50, function(v) -- 500 (MaxValue) | 0 (MinValue)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
	end)

	PlayerSection:NewButton("Fly (F)", "Click this and toggle with F", function()
		repeat wait()

		until game:GetService"Players".LocalPlayer and game:GetService"Players".LocalPlayer.Character and game:GetService"Players".LocalPlayer.Character:findFirstChild("UpperTorso") and game:GetService"Players".LocalPlayer.Character:findFirstChild("Humanoid")
		local mouse = game:GetService"Players".LocalPlayer:GetMouse()
		repeat wait() until mouse
		local plr   = game:GetService"Players".LocalPlayer
		local torso = plr.Character.UpperTorso
		local flying   = true
		local deb      = true
		local ctrl     = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 100
		local speed    = 0

		function Fly()
			local bg = Instance.new("BodyGyro", torso)
			bg.P = 9e4
			bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			bg.cframe = torso.CFrame
			local bv = Instance.new("BodyVelocity", torso)
			bv.velocity = Vector3.new(0,0.1,0)
			bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
			repeat wait()
				plr.Character.Humanoid.PlatformStand = true
				if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
					speed = speed+1+(speed/maxspeed)
					if speed > maxspeed then
						speed = maxspeed
					end
				elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
					speed = speed-1
					if speed < 0 then
						speed = 0
					end
				end
				if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
					bv.velocity = ((game:GetService("Workspace").CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game:GetService("Workspace").CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game:GetService("Workspace").CurrentCamera.CoordinateFrame.p))*speed
					lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
				elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
					bv.velocity = ((game:GetService("Workspace").CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game:GetService("Workspace").CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game:GetService("Workspace").CurrentCamera.CoordinateFrame.p))*speed
				else
					bv.velocity = Vector3.new(0,0.1,0)
				end
				bg.cframe = game:GetService("Workspace").CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
			until not flying
			ctrl = {f = 0, b = 0, l = 0, r = 0}
			lastctrl = {f = 0, b = 0, l = 0, r = 0}
			speed = 0
			bg:Destroy()
			bv:Destroy()
			plr.Character.Humanoid.PlatformStand = false
		end
		mouse.KeyDown:connect(function(key)
			if key:lower() == "f" then
				if flying then flying = false
				else
					flying = true
					Fly()
				end
			elseif key:lower() == "w" then
				ctrl.f = 1
			elseif key:lower() == "s" then
				ctrl.b = -1
			elseif key:lower() == "a" then
				ctrl.l = -1
			elseif key:lower() == "d" then
				ctrl.r = 1
			end
		end)
		mouse.KeyUp:connect(function(key)
			if key:lower() == "w" then
				ctrl.f = 0
			elseif key:lower() == "s" then
				ctrl.b = 0
			elseif key:lower() == "a" then
				ctrl.l = 0
			elseif key:lower() == "d" then
				ctrl.r = 0
			end
		end)
		Fly()
	end)
	
	PlayerSection:NewButton("Enable Noclip", "Allows you to Noclip", function()
		local speaker = game.Players.LocalPlayer
		Noclipping = nil
		Clip = false
		wait(0.1)
		local function NoclipLoop()
			if Clip == false and speaker.Character ~= nil then
				for _, child in pairs(speaker.Character:GetDescendants()) do
					if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
						child.CanCollide = false
					end
				end
			end
		end
		Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
	end)
	
	PlayerSection:NewButton("Disable Noclip", "Disables Noclip", function()
		Clip = true
	end)
	
	PlayerSection:NewButton("Enable Infinite Jump", "Allows you to jump infinitely", function()
		local Player = game:GetService'Players'.LocalPlayer;
		local UIS = game:GetService'UserInputService';
		infjump = false

		_G.JumpHeight = 50;

		function Action(Object, Function) if Object ~= nil then Function(Object); end end

		UIS.InputBegan:connect(function(UserInput)
			if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space and infjump == false then
				Action(Player.Character.Humanoid, function(self)
					if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
						Action(self.Parent.HumanoidRootPart, function(self)
							self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
						end)
					end
				end)
			end
		end)
	end)
	
	PlayerSection:NewButton("Disable Infinite Jump", "Disables Infinite Jump", function()
		infjump = true
	end)
	
	PlayerSection:NewButton("Switch to Prisoner", "Switch teams to Prisoners", function()
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Prisoners")
	end)

	PlayerSection:NewButton("Switch to Criminal", "Switch teams to Prisoners then teleports to criminal base", function()
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Prisoners")
		wait(1)
		local New_CFrame = CFrame.new(2139.42,26.5,425.82) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)

	PlayerSection:NewButton("Switch to Police", "Switch teams to Police", function()
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")
	end)

	PlayerSection:NewButton("Switch to Hero", "Switch teams to Heros", function()
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Heroes")
	end)
	
	PlayerSection:NewButton("Reset", "Reset your Character", function()
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end)

	PlayerSection:NewKeybind("Key Bind for hiding/Unhiding the UI   -->", "Click to change keybind", Enum.KeyCode.V, function()

		Library:ToggleUI()
	end)

	--Auto Arrest
	local autoarrest = Window:NewTab("Auto Arrest")
	local autoarrestSection = autoarrest:NewSection("Auto Arrest")

	autoarrestSection:NewButton("Auto Arrest Criminals", "Auto Arrests all Criminals", function()
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")
		wait(0.01)
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Auto Arrest ;)";Icon = "";Duration = 7;})
		for i,v in pairs(game.Players:GetChildren()) do
			local Victim = v.Name
			while v.Team.Name == "Criminals" do
				pos = game.Players[Victim].Character.HumanoidRootPart.Position
				local _speed=2500
				function tp(...)
				local plr=game.Players.LocalPlayer
				local args={...}
				if typeof(args[1])=="number"and args[2]and args[3]then
					args=Vector3.new(args[1],args[2],args[3])
			elseif typeof(args[1])=="Vector3" then
					args=args[1]    
				elseif typeof(args[1])=="CFrame" then
					args=args[1].Position
				end
				local dist=(plr.Character.HumanoidRootPart.Position-args).Magnitude
				game:GetService("TweenService"):Create(
				plr.Character.HumanoidRootPart,
				TweenInfo.new(dist/_speed,Enum.EasingStyle.Linear),
				{CFrame=CFrame.new(args)}
				):Play()
				end
				tp(pos)
				wait(0.8)
				game.ReplicatedStorage.Event:FireServer("Eject", v)
				game.ReplicatedStorage.Event:FireServer("Arrest", v)
			end
		end
	end)

	autoarrestSection:NewButton("Auto Arrest Villians", "Auto Arrests all Villians", function()
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")
		wait(0.01)
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Auto Arrest ;)";Icon = "";Duration = 7;})
		for i,v in pairs(game.Players:GetChildren()) do
			local Victim = v.Name
			while v.Team.Name == "Villains" do
				pos = game.Players[Victim].Character.HumanoidRootPart.Position
				local _speed=2500
				function tp(...)
				local plr=game.Players.LocalPlayer
				local args={...}
				if typeof(args[1])=="number"and args[2]and args[3]then
					args=Vector3.new(args[1],args[2],args[3])
			elseif typeof(args[1])=="Vector3" then
					args=args[1]    
				elseif typeof(args[1])=="CFrame" then
					args=args[1].Position
				end
				local dist=(plr.Character.HumanoidRootPart.Position-args).Magnitude
				game:GetService("TweenService"):Create(
				plr.Character.HumanoidRootPart,
				TweenInfo.new(dist/_speed,Enum.EasingStyle.Linear),
				{CFrame=CFrame.new(args)}
				):Play()
				end
				tp(pos)
				wait(0.8)
				game.ReplicatedStorage.Event:FireServer("Eject", v)
				game.ReplicatedStorage.Event:FireServer("Arrest", v)
			end
		end
	end)
	
	
	autoarrestSection:NewTextBox("Arrest Player", "Arrests the Selected Player", function(d)
		game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("SetTeam", "Police")
		local arrestname = (d)
		local arrest = game.Players[arrestname]
		wait(0.01)
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Auto Arrest ;)";Icon = "";Duration = 7;})
		local Victim = arrest
		if arrest.Team.Name == "Criminals" then
			while arrest.Team.Name == "Criminals" do
				pos = game.Players[arrestname].Character.HumanoidRootPart.Position
				local _speed=2500
				function tp(...)
				local plr=game.Players.LocalPlayer
				local args={...}
				if typeof(args[1])=="number"and args[2]and args[3]then
					args=Vector3.new(args[1],args[2],args[3])
				elseif typeof(args[1])=="Vector3" then
					args=args[1]    
				elseif typeof(args[1])=="CFrame" then
					args=args[1].Position
				end
				local dist=(plr.Character.HumanoidRootPart.Position-args).Magnitude
				game:GetService("TweenService"):Create(
				plr.Character.HumanoidRootPart,
				TweenInfo.new(dist/_speed,Enum.EasingStyle.Linear),
				{CFrame=CFrame.new(args)}
				):Play()
				end
				tp(pos)
				wait(0.8)
				game.ReplicatedStorage.Event:FireServer("Eject", arrest)
				game.ReplicatedStorage.Event:FireServer("Arrest", arrest)
			end
		if arrest.Team.Name == "Villains" then
			while arrest.Team.Name == "Villains" do
				pos = game.Players[Victim].Character.HumanoidRootPart.Position
				local _speed=2500
				function tp(...)
				local plr=game.Players.LocalPlayer
				local args={...}
				if typeof(args[1])=="number"and args[2]and args[3]then
					args=Vector3.new(args[1],args[2],args[3])
				elseif typeof(args[1])=="Vector3" then
					args=args[1]    
				elseif typeof(args[1])=="CFrame" then
					args=args[1].Position
				end
				local dist=(plr.Character.HumanoidRootPart.Position-args).Magnitude
				game:GetService("TweenService"):Create(
				plr.Character.HumanoidRootPart,
				TweenInfo.new(dist/_speed,Enum.EasingStyle.Linear),
				{CFrame=CFrame.new(args)}
				):Play()
				end
				tp(pos)
				wait(0.8)
				game.ReplicatedStorage.Event:FireServer("Eject", v)
				game.ReplicatedStorage.Event:FireServer("Arrest", v)
			end
		end
		end
	end)

	
	--teleport
	local teleport = Window:NewTab("Teleports")
	local teleportPlayerSection = teleport:NewSection("Player Teleport")

	teleportPlayerSection:NewTextBox("Teleport to Player", "Teleport to a Player", function(txt)
		local ooooooof = (txt)
		local plr1 = game.Players.LocalPlayer.Character
        local plr2 = game.Workspace:FindFirstChild(ooooooof).HumanoidRootPart.Position
		local _speed=1400
		function tp(...)
			local plr=game.Players.LocalPlayer
			local args={...}
			if typeof(args[1])=="number"and args[2]and args[3]then
				args=Vector3.new(args[1],args[2],args[3])
			elseif typeof(args[1])=="Vector3" then
				args=args[1]    
			elseif typeof(args[1])=="CFrame" then
				args=args[1].Position
			end
			local dist=(plr.Character.HumanoidRootPart.Position-args).Magnitude
			game:GetService("TweenService"):Create(
			plr.Character.HumanoidRootPart,
			TweenInfo.new(dist/_speed,Enum.EasingStyle.Linear),
			{CFrame=CFrame.new(args)}
			):Play()
		end

		tp(plr2)
	end)

	local teleportCriminalSection = teleport:NewSection("Criminal Base")
	
	teleportCriminalSection:NewButton("Criminal Base Out", "Teleports you Outside of the Criminal Base", function()
		local New_CFrame = CFrame.new(2051.02, 25.5, 428.67) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	teleportCriminalSection:NewButton("Criminal Base In", "Teleports you Inside of the Criminal Base", function()
		local New_CFrame = CFrame.new(2139.42,26.5,425.82) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	local teleportBankSection = teleport:NewSection("Bank")
	teleportBankSection:NewButton("Bank Out", "Teleports you Outside of the Bank", function()
		local New_CFrame = CFrame.new(637.73,50.87,466.5) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)

	teleportBankSection:NewButton("Bank In", "Teleports you Inside of the Bank", function()
		local New_CFrame = CFrame.new(652.19, 52.12, 492.242) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)

	teleportBankSection:NewButton("Bank Vault", "Tween Teleports you", function()
		local New_CFrame = CFrame.new(707.13,110.29,545.4) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	local teleportCasinoSection = teleport:NewSection("Casino")
	teleportCasinoSection:NewButton("Casino Hack", "Teleports you to the Casino Computer", function()
		local New_CFrame = CFrame.new(1695.55,38.56,739.93) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	teleportCasinoSection:NewButton("Casino Out", "Teleports you Outside of Casino", function()
		local New_CFrame = CFrame.new(1697.72, 37.78, 842.83) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	teleportCasinoSection:NewButton("Casino In", "Teleports you Inside of Casino", function()
		local New_CFrame = CFrame.new(1696.77, 37.78, 772.21) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	teleportCasinoSection:NewButton("Casino Vault", "Teleports you to the Casino Vault", function()
		local New_CFrame = CFrame.new(1685.34,41.56,514.75) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	local teleportClubSection = teleport:NewSection("Club")
	teleportClubSection:NewButton("Club Out", "Teleports you Outside of Club", function()
		local New_CFrame = CFrame.new(1102.92,54.15,160.71) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	teleportClubSection:NewButton("Club In", "Teleports you Inside of Club", function()
		local New_CFrame = CFrame.new(1107.65, 54.11, 150.04) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	teleportClubSection:NewButton("Club Vault", "Teleports you to the Club Vault", function()
		local New_CFrame = CFrame.new(1141.09,172.71,5.17) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)

	local teleportJewelrySection = teleport:NewSection("Jewelry")
	teleportJewelrySection:NewButton("Jewelry Out", "Teleports you Outside of the Jewelry", function()
		local New_CFrame = CFrame.new(-128.15, 25.23, 717.77) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)

	teleportJewelrySection:NewButton("Jewelry In", "Teleports you Inside of the Jewelry", function()
		local New_CFrame = CFrame.new(-80.58,87.26,805.89) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)

	teleportJewelrySection:NewButton("Jewelry Vault", "Teleports you to the Jewelry Vault", function()
		local New_CFrame = CFrame.new(-95.61,27.05,798.9) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	local teleportShipSection = teleport:NewSection("Ship")
	teleportShipSection:NewButton("Ship", "Teleports you to the Ship", function()
		local New_CFrame = CFrame.new(2509.57,83,339.8) --The Cord where you want to go --game:GetService("Workspace").Ship.Boat.MARKPART.CFrame

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)

	teleportShipSection:NewButton("Ship Current Location", "Teleports you to the Ship's Current Location", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "If Nothing Happens its because ship is not loaded";Icon = "";Duration = 16;})
		
		local New_CFrame = game:GetService("Workspace").Ship.Boat.MARKPART.CFrame --The Cord where you want to go --game:GetService("Workspace").Ship.Boat.MARKPART.CFrame

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	local teleportAirportSection = teleport:NewSection("Airport")
	teleportAirportSection:NewButton("Airport", "Teleports you to the Airport", function()
		local New_CFrame = CFrame.new(-2105.59,31.45,-1231.09) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	local teleportPrisonSection = teleport:NewSection("Prison")
	teleportPrisonSection:NewButton("Prison Out", "Teleports you Outside of the Prison", function()
		local New_CFrame = CFrame.new(-886.63,80,-2651.56) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)

	teleportPrisonSection:NewButton("Prison In", "Teleports you Inside of the Prison", function()
		local New_CFrame = CFrame.new(-895.1, 66.84, -3147.45) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	teleportPrisonSection:NewButton("Police Station 1", "Teleports you to the Police Station 1", function()
		local New_CFrame = CFrame.new(-895.68, 66.81, -3077.27) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	teleportPrisonSection:NewButton("Police Station 2", "Teleports you to the Police Station 2", function()
		local New_CFrame = CFrame.new(-1037.74, 66.93, -3044.93) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	local teleportPyramidSection = teleport:NewSection("Pyramid")
	teleportPyramidSection:NewButton("Pyramid Out", "Teleports you Outside of the Pyramid", function()
		local New_CFrame = CFrame.new(-1047.64,18.82,-514.79) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)

	teleportPyramidSection:NewButton("Pyramid In", "Teleports you Inside of the Pyramid", function()
		game.Workspace.Pyramid.Tele.Core2.CanCollide = false
        game.Workspace.Pyramid.Tele.Core2.Transparency = 1
        game.Workspace.Pyramid.Tele.Core2.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait()
        game.Workspace.Pyramid.Tele.Core2.CFrame = CFrame.new(1231.14185, 51051.2344, 318.096191)
        game.Workspace.Pyramid.Tele.Core2.Transparency = 0
        game.Workspace.Pyramid.Tele.Core2.CanCollide = true
        wait(0.35)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1231.14185, 51051.2344, 318.096191)
	end)

	teleportPyramidSection:NewButton("Pyramid Vault", "Teleports you to the Pyramid Vault", function()
		game.Workspace.Pyramid.Tele.Core2.CanCollide = false
        game.Workspace.Pyramid.Tele.Core2.Transparency = 1
        game.Workspace.Pyramid.Tele.Core2.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait()
        game.Workspace.Pyramid.Tele.Core2.CFrame = CFrame.new(1231.14185, 51051.2344, 318.096191)
        game.Workspace.Pyramid.Tele.Core2.Transparency = 0
        game.Workspace.Pyramid.Tele.Core2.CanCollide = true
        wait(0.35)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1006,51069.50,601.98)
	end)
	local teleportTrainSection = teleport:NewSection("Train")
	teleportTrainSection:NewButton("Train (Best if train is stopped)", "Teleports you to the Train", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "If Nothing Happened its because train is not loaded";Icon = "";Duration = 16;})
		
		local New_CFrame = game:GetService("Workspace").Train.Mid1.Body.CFrame --The Cord where you want to go --game:GetService("Workspace").Train.Mid1.Body

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	teleportTrainSection:NewButton("Trainstation 1", "Teleports you to the Trainstation 1", function()
		local New_CFrame = CFrame.new(1167.55,82,558.15) --The Cord where you want to go --game:GetService("Workspace").Train.Mid1.Body

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)

	teleportTrainSection:NewButton("Trainstation 2", "Teleports you to the Trainstation 2", function()
		local New_CFrame = CFrame.new(189.96,82,-650.09) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	local teleportHeroSection = teleport:NewSection("Hero")
	teleportHeroSection:NewButton("Hero Base", "Teleports you to the Hero Base", function()
		local New_CFrame = CFrame.new(-825.98, 346.38, 811.44) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	local teleportWeaponSection = teleport:NewSection("Weapon Shop")
	teleportWeaponSection:NewButton("Weapon Shop Out", "Teleports you Outside of the Weapon Shop", function()
		local New_CFrame = CFrame.new(-1621.56, 42.67, 687.27) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	teleportWeaponSection:NewButton("Weapon Shop In", "Teleports you Inside of the Weapon Shop", function()
		local New_CFrame = CFrame.new(-1636.57, 42.79, 687.37) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	
	local teleportVillainSection = teleport:NewSection("Villain")
	teleportVillainSection:NewButton("Villain Lair Out", "Teleports you Outside of the Villain Lair", function()
		local New_CFrame = CFrame.new(-1351.7, 20.93, 1167.34) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	teleportVillainSection:NewButton("Villain Lair In", "Teleports you Inside of the Villain Lair", function()
		local New_CFrame = CFrame.new(-1642.28, 300, 1384.55) --The Cord where you want to go

		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character

		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(5.0942)
		local _speed=1400
		function tp(...)
		local plr=game.Players.LocalPlayer
		local args={...}
		if typeof(args[1])=="number"and args[2]and args[3]then
			args=Vector3.new(args[1],args[2],args[3])
		elseif typeof(args[1])=="Vector3" then
			args=args[1]    
		elseif typeof(args[1])=="CFrame" then
			args=args[1].Position
		end
		local dist=(plr.Character.HumanoidRootPart.Position-args).Magnitude
		game:GetService("TweenService"):Create(
		plr.Character.HumanoidRootPart,
		TweenInfo.new(dist/_speed,Enum.EasingStyle.Linear),
		{CFrame=CFrame.new(args)}
		):Play()
		end
		tp(-1809.82, 109.06, 1404.04)
		
	end)
	
	--Autorob

	local autorob = Window:NewTab("Auto Rob")
	local autorobSection = autorob:NewSection("Auto Rob")


	autorobSection:NewButton("Auto Rob Small Stores", "Gives around 50k", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Robbing...";Icon = "";Duration = 7;})
		game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
		for i,v in pairs(getnilinstances()) do
			if v.Name == "HumanoidRootPart" then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
		for i,v in pairs(game:GetService("Workspace").ObjectSelection:GetDescendants()) do 
			if v.Name == "Cash" and v:IsA("MeshPart") or v.Name == "Steal" and v:IsA("Part") or v.Name == "SmashCash" and v:IsA("Part") or v.Name == "ATM" and v:IsA("Part") then
				wait(0.01)
				v:FindFirstChildOfClass("Script").Event:FireServer()  
			end
		end
		wait(1.718)
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting for Fix!";Icon = "";Duration = 9;})
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(8)
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done Robbing!";Icon = "";Duration = 5;})
	end)
	
	autorobSection:NewButton("Auto Rob Bank", "Auto Robs the selected item if open", function()
		if game.ReplicatedStorage.HeistStatus.Bank.Robbing.Value then
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting to Rob Bank";Icon = "";Duration = 10;})
			--autorobSection:UpdateSection("Status: Resetting to rob bank")
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Robbing Bank";Icon = "";Duration = 10;})
			--autorobSection:UpdateSection("Status: Robbing bank")
			for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do 
				if v:IsA("Accessory") or v:IsA("BillboardGui") or v:IsA("Decal") or v:IsA("Shirt") or v:IsA("Pants") then 
					v:Destroy()
				end
			end
			local New_CFrame = CFrame.new(723.64, 109.76, 536.81) --The Cord where you want to go

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()

			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Waiting for bag to fill";Icon = "";Duration = 30;})
			--autorobSection:UpdateSection("Status: Waiting for bag to fill")
			wait(29)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Teleporting to Criminal Base";Icon = "";Duration = 10;})
			--autorobSection:UpdateSection("Status: Teleporting to Criminal Base")
			game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
			for i,v in pairs(getnilinstances()) do
				if v.Name == "HumanoidRootPart" then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
			wait(0.9)
			local New_CFrame = CFrame.new(2139.42,26.5,425.82) --The Cord where you want to go

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()

			wait(6)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting for fix";Icon = "";Duration = 10;})
			--autorobSection:UpdateSection("Status: Resetting for fix")
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done robbing bank";Icon = "";Duration = 5;})
			--autorobSection:UpdateSection("Status: Done robbing bank")
			--wait(1.5)
			--autorobSection:UpdateSection("Status: Click to Rob") --autorobSection:UpdateSection("Status: ") -- for copy :)
		else
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Bank is not open!";Icon = "";Duration = 5;})
			--autorobSection:UpdateSection("Status: Bank is not open!")
			--wait(1.5)
			--autorobSection:UpdateSection("Status: Click to Rob") --autorobSection:UpdateSection("Status: ") -- for copy :)
		end      
	end)

	autorobSection:NewButton("Auto Rob Casino", "Auto Robs the selected item if open", function()
		if game.ReplicatedStorage.HeistStatus.Casino.Robbing.Value then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
			for i,v in pairs(getnilinstances()) do
				if v.Name == "HumanoidRootPart" then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Robbing Casino";Icon = "";Duration = 7;})
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(1685.34,41.56,514.75)
			wait(1)
			function robtrayy()
				if game.Workspace.ObjectSelection.Trayy.Open.Value then
					game.Workspace.ObjectSelection.Trayy.Name = "TrayyOpened"
					wait(0.5)
					robtrayy()
				else
					wait(0.001)
					game.Workspace.ObjectSelection.Trayy.Trayy.Trayy.Event:FireServer()
					wait(0.1)
					game.Workspace.ObjectSelection.Trayy.Name = "TrayyOpened"
					wait(0.001)
				end
			end
			function tptonexttrayy()
				if game.Workspace.ObjectSelection.Trayy.Open.Value == false then
					local New_CFrame = CFrame.new(game.Workspace.ObjectSelection.Trayy.Trayy.Position) --The Cord where you want to go

					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character

					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.1)
				else
					if game.Workspace.ObjectSelection.TrayyOpened.Value == false then
						local New_CFrame = CFrame.new(game.Workspace.ObjectSelection.TrayyOpened.Trayy.Position) --The Cord where you want to go

						local ts = game:GetService('TweenService')
						local char = game.Players.LocalPlayer.Character

						local part = char.HumanoidRootPart
						local ti = TweenInfo.new(0.1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
						local tp = {CFrame = New_CFrame}
						ts:Create(part, ti, tp):Play()
						wait(0.1)
					else
						wait(0.1)
						tptonexttrayy()
					end
				end
			end
			tptonexttrayy()
			robtrayy()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "1st Trayy Robbed";Icon = "";Duration = 7;})
			robtrayy()
			wait(0.1)
			tptonexttrayy()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "2nd Trayy Robbed";Icon = "";Duration = 7;})
			robtrayy()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "3th Trayy Robbed";Icon = "";Duration = 7;})
			robtrayy()
			wait(0.1)
			tptonexttrayy()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "4th Trayy Robbed";Icon = "";Duration = 7;})
			robtrayy()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "5th Trayy Robbed";Icon = "";Duration = 7;})
			robtrayy()
			wait(0.1)
			tptonexttrayy()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "6th Trayy Robbed";Icon = "";Duration = 7;})
			robtrayy()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "7th Trayy Robbed";Icon = "";Duration = 7;})
			robtrayy()
			wait(0.1)
			tptonexttrayy()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "8th Trayy Robbed";Icon = "";Duration = 7;})
			robtrayy()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "9th Trayy Robbed";Icon = "";Duration = 7;})
			robtrayy() -- last trayy
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Last Trayy Robbed";Icon = "";Duration = 7;})
			wait(1.4714)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Waiting to bypass kick";Icon = "";Duration = 16;})
			wait(14)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(1595.55,36.56,739.93)
			wait(1)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Teleporting to criminal base!";Icon = "";Duration = 5;})
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(2139.42,26.42,425.9212)
			wait(1.718)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting for fix";Icon = "";Duration = 9;})
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done Robbing Casino";Icon = "";Duration = 7;})
		else
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Casino is closed :c";Icon = "";Duration = 7;})
		end
	end)

	autorobSection:NewButton("Auto Rob Club", "Auto Robs the selected item if open", function()
		if game.ReplicatedStorage.HeistStatus.Club.Robbing.Value then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
			for i,v in pairs(getnilinstances()) do
				if v.Name == "HumanoidRootPart" then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
			
			function robdiamond()
				if game.Workspace.ObjectSelection.ClubDiamond.Open.Value then
					game.Workspace.ObjectSelection.ClubDiamond.Name = "ClubDiamondOff"
					wait(0.5)
					game.Workspace.ObjectSelection.ClubDiamondOff.Name = "ClubDiamond"
					robdiamond()
				else
					wait(0.001)
					game.Workspace.ObjectSelection.ClubDiamond.ClubDiamond.ClubDiamond.Event:FireServer()
					wait(0.09)
					game.Workspace.ObjectSelection.ClubDiamond.Name = "ClubDiamondOff"
				end
			end
			function tptonextdiamond()
				if game.Workspace.ObjectSelection.ClubDiamond.Open.Value == false then
					local New_CFrame = CFrame.new(game.Workspace.ObjectSelection.ClubDiamond.ClubDiamond.Position) --The Cord where you want to go

					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character

					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.1)
				else
					if game.Workspace.ObjectSelection.ClubDiamondOff.Open.Value == false then
						local New_CFrame = CFrame.new(game.Workspace.ObjectSelection.ClubDiamondOff.ClubDiamond.Position) --The Cord where you want to go

						local ts = game:GetService('TweenService')
						local char = game.Players.LocalPlayer.Character

						local part = char.HumanoidRootPart
						local ti = TweenInfo.new(0.1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
						local tp = {CFrame = New_CFrame}
						ts:Create(part, ti, tp):Play()
						wait(0.1)
					else
						wait(0.1)
						tptonextdiamond()
					end
				end
			end
			
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Robbing Club";Icon = "";Duration = 7;})
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(1141.09,172.71,5.17)
			wait(1)
			tptonextdiamond()
			robdiamond()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "1st diamond robbed";Icon = "";Duration = 7;})
			robdiamond()
			wait(0.1)
			tptonextdiamond()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "2nd diamond robbed";Icon = "";Duration = 7;})
			robdiamond()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "3th diamond robbed";Icon = "";Duration = 7;})
			robdiamond()
			wait(0.1)
			tptonextdiamond()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "4th diamond robbed";Icon = "";Duration = 7;})
			robdiamond()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "5th diamond robbed";Icon = "";Duration = 7;})
			robdiamond()
			wait(0.1)
			tptonextdiamond()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "6th diamond robbed";Icon = "";Duration = 7;})
			robdiamond()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "7th diamond robbed";Icon = "";Duration = 7;})
			robdiamond()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "8th diamond robbed";Icon = "";Duration = 7;})
			wait(0.1)
			
			function debug()
				game.Workspace.ObjectSelection.ClubDiamondOff.Name = "ClubDiamond"
				wait(0.001)
				game.Workspace.ObjectSelection.ClubDiamondOff.Name = "ClubDiamond"
				wait(0.001)
				game.Workspace.ObjectSelection.ClubDiamondOff.Name = "ClubDiamond"
				wait(0.001)
				game.Workspace.ObjectSelection.ClubDiamondOff.Name = "ClubDiamond"
				wait(0.001)
				game.Workspace.ObjectSelection.ClubDiamondOff.Name = "ClubDiamond"
				wait(0.001)
				game.Workspace.ObjectSelection.ClubDiamondOff.Name = "ClubDiamond"
				wait(0.001)
				game.Workspace.ObjectSelection.ClubDiamondOff.Name = "ClubDiamond"
				wait(0.001)
				game.Workspace.ObjectSelection.ClubDiamondOff.Name = "ClubDiamond"
			end
			
			debug()
			
			wait(0.1)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Waiting 5 seconds to bypass erorr...";Icon = "";Duration = 7;})
			wait(5)
			tptonextdiamond()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Robbing the rest";Icon = "";Duration = 7;})
			robdiamond()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "9th diamond robbed";Icon = "";Duration = 7;})
			robdiamond()
			wait(0.1)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Last diamond robbed";Icon = "";Duration = 7;})
			wait(0.001)
			
			function lastdebug()
				game.Workspace.ObjectSelection.ClubDiamondOff.Name = "ClubDiamond"
				wait(0.001)
				game.Workspace.ObjectSelection.ClubDiamondOff.Name = "ClubDiamond"
				wait(0.001)
			end
			
			lastdebug()
			
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Waiting to bypass kick";Icon = "";Duration = 16;})
			wait(14)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(1102.92,54.15,160.71)
			wait(1)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Teleporting to criminal base";Icon = "";Duration = 7;})
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(2139.42,26.42,425.9212)
			wait(1.718)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting to fix";Icon = "";Duration = 9;})
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done Robbing Club";Icon = "";Duration = 7;})
		else
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Club is closed!";Icon = "";Duration = 7;})
		end
	end)

	autorobSection:NewButton("Auto Rob Pyramid", "Auto Robs the selected item if open", function()
		if game.ReplicatedStorage.HeistStatus.Pyramid.Robbing.Value then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
			for i,v in pairs(getnilinstances()) do
				if v.Name == "HumanoidRootPart" then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
			
			function robtreasure()
				if game.Workspace.ObjectSelection.TreasurePyramid.Open.Value == true then
					game.Workspace.ObjectSelection.TreasurePyramid.Name = "PyramidOpened"
					wait(0.5)
					robtreasure()
				else
					wait(0.001)
					game.Workspace.ObjectSelection.TreasurePyramid.TreasurePyramid.TreasurePyramid.Event:FireServer()
					wait(0.09)
					game.Workspace.ObjectSelection.TreasurePyramid.Name = "PyramidOpened"
					wait(0.001)
				end
			end
			
			function tptonexttreasure()
				if game.Workspace.ObjectSelection.TreasurePyramid.Open.Value == false then
					local New_CFrame = CFrame.new(game.Workspace.ObjectSelection.TreasurePyramid.TreasurePyramid.Position) --The Cord where you want to go

					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character

					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.1)
				else
					if game.Workspace.ObjectSelection.PyramidOpened.Value == false then
						local New_CFrame = CFrame.new(game.Workspace.ObjectSelection.PyramidOpened.TreasurePyramid.Position) --The Cord where you want to go
						
						local ts = game:GetService('TweenService')
						local char = game.Players.LocalPlayer.Character

						local part = char.HumanoidRootPart
						local ti = TweenInfo.new(0.1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
						local tp = {CFrame = New_CFrame}
						ts:Create(part, ti, tp):Play()
						wait(0.1)
					else
						wait(0.1)
						tptonexttreasure()
					end
				end
			end
			
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Robbing Pyramid";Icon = "";Duration = 7;})
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(1006,51069.50,601.98)
			wait(1)
			tptonexttreasure()
			robtreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "1st Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			wait(0.1)
			tptonexttreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "2nd Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "3rd Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			wait(0.1)
			tptonexttreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "4th Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "5th Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			wait(0.1)
			tptonexttreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "6th Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "7th Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			wait(0.1)
			tptonexttreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "8th Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "9th Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			wait(0.1)
			tptonexttreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "10th Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "11th Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			wait(0.1)
			tptonexttreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "12th Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "13th Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			wait(0.1)
			tptonexttreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "14th Treasure Robbed";Icon = "";Duration = 7;})
			robtreasure()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Last Treasure Robbed";Icon = "";Duration = 7;})
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Waiting to bypass kick";Icon = "";Duration = 16;})
			wait(14)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-1047.64,18.82,-514.79)
			wait(1)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Teleporting to criminal base";Icon = "";Duration = 7;})
			wait(1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(2139.42,26.42,425.9212)
			wait(1.718)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting for fix";Icon = "";Duration = 9;})
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done Robbing Pyramid";Icon = "";Duration = 7;})
		else
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Pyramid is closed!";Icon = "";Duration = 7;})
		end
	end)

	autorobSection:NewButton("Auto Rob Ship", "Autorobs Ship if its There", function()
        local New_CFrame = CFrame.new(2509.57, 81.55, 339.8) --The Cord where you want to go

        local ts = game:GetService('TweenService')
        local char = game.Players.LocalPlayer.Character

        local part = char.HumanoidRootPart
        local ti = TweenInfo.new(4, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
        local tp = {CFrame = New_CFrame}
        ts:Create(part, ti, tp):Play()
        wait(24)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(2139.42,26.5,425.82)
    end)
	
	autorobSection:NewButton("Auto Rob Jewelry (BETA)", "Expect Some Bugs", function()
		if game.ReplicatedStorage.HeistStatus.Jewel.Robbing.Value then
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Jewelry Auto Rob is in beta, Expect some bugs ;)";Icon = "";Duration = 7;})
			wait(3)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
			for i,v in pairs(getnilinstances()) do
				if v.Name == "HumanoidRootPart" then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-90.81,26.35,806.56)
			wait(0.2)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Robbing please wait...";Icon = "";Duration = 30;})
			--autorobSection:UpdateSection("Status: Robbing please wait...")
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-84.17,26.35,809.56)
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-73.54,26.66,821.26)
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-58.26,26.35,822.31)
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-54.92,26.35,823.62)
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-97.04,26.35,833.05)
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-102.62,26.35,832.26)
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-101.24,26.35,828.24)
			wait(0.1)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-94.64,26.66,816.2)
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-93.14,26.66,807.02)
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.5)
			mouse1click()
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-95.76,29.73,862.77)
			wait(1)
			
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Taking diamond";Icon = "";Duration = 9;})
			keypress(0x45)
			wait(8.35872) -- literally the exact wait time in the game
			keyrelease(0x45)
			wait(0.1)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Teleporting to criminal base";Icon = "";Duration = 7;})
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(2139.42,26.42,425.82)
			wait(0.1)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting for Fix...";Icon = "";Duration = 7;})
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done Robbing Jewelry";Icon = "";Duration = 7;})
		else
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Jewelry is Closed!";Icon = "";Duration = 7;})
		end
	end)

	autorobSection:NewButton("Auto Rob All (NO WAY BACK AFTER CLICKED)", "Executes Auto Rob (NO WAY BACK)", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Auto Rob Enabled, No way back now";Icon = "";Duration = 10;})
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Only way to get back is leaving the game!";Icon = "";Duration = 10;})
		loadstring(game:HttpGet('https://www.system-exodus.com/scripts/madcity/MadLadsAR.lua'))()
	end)

	--Stores

	local stores = Window:NewTab("Stores")
	local storesSection = stores:NewSection("Click on one")

	storesSection:NewButton("Open Bank", "Opens the bank for you", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Opening Bank";Icon = "";Duration = 7;})
		if game.ReplicatedStorage.HeistStatus.Bank.Robbing.Value == false then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
			for i,v in pairs(getnilinstances()) do
				if v.Name == "HumanoidRootPart" then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
			wait(0.1)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(708.68, 109.59, 543.86)
			wait(0.2)
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(708.68, 110.99, 543.86)
			wait(1.718)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting to fix";Icon = "";Duration = 9;})
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done";Icon = "";Duration = 7;})
		else
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Bank is already being robbed! Just auto rob bank";Icon = "";Duration = 10;})
		end
	end)

	storesSection:NewButton("Open Club", "Opens the club for you", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Opening Club...";Icon = "";Duration = 7;})
		if game.ReplicatedStorage.HeistStatus.Club.Robbing.Value == false then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
			for i,v in pairs(getnilinstances()) do
				if v.Name == "HumanoidRootPart" then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(1176.25,72.71,-21.92)
			wait(1.718)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting to fix";Icon = "";Duration = 9;})
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done";Icon = "";Duration = 7;})
		else
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Club is already being robbed! Just auto rob club";Icon = "";Duration = 10;})
		end
	end)

	storesSection:NewButton("Open Jewelry", "Opens the Jewelry for you", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Opening Jewelry...";Icon = "";Duration = 7;})
		if game.ReplicatedStorage.HeistStatus.Jewel.Robbing.Value == false then
			game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
			for i,v in pairs(getnilinstances()) do
				if v.Name == "HumanoidRootPart" then
					v.Parent = game.Players.LocalPlayer.Character
				end
			end
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Vector3.new(-80.58,86.56,805.89)
			wait(1.718)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting to fix";Icon = "";Duration = 9;})
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done";Icon = "";Duration = 7;})
		else
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Jewelry is already being robbed! Just auto rob jewelry";Icon = "";Duration = 10;})
		end
	end)

	storesSection:NewButton("Open Pyramid", "Opens the Pyramid for you", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Opening Pyramid...";Icon = "";Duration = 7;})
		if game.ReplicatedStorage.HeistStatus.Pyramid.Locked.Value == false and game.ReplicatedStorage.HeistStatus.Pyramid.Robbing.Value == false then
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting to open pyramid";Icon = "";Duration = 9;})
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Opening Pyramid...";Icon = "";Duration = 7;})
			local _speed=1000
			function tp(...)
				local plr=game.Players.LocalPlayer
				local args={...}
				if typeof(args[1])=="number"and args[2]and args[3]then
					args=Vector3.new(args[1],args[2],args[3])
				elseif typeof(args[1])=="Vector3" then
					args=args[1]    
				elseif typeof(args[1])=="CFrame" then
					args=args[1].Position
				end
				local dist=(plr.Character.HumanoidRootPart.Position-args).Magnitude
				game:GetService("TweenService"):Create(
				plr.Character.HumanoidRootPart,
				TweenInfo.new(dist/_speed,Enum.EasingStyle.Linear),
				{CFrame=CFrame.new(args)}
				):Play()
			end

			tp(-1043.37, 17.94, -483.57)
			wait(5.18)
			wait(1.718)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting to fix";Icon = "";Duration = 9;})
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done";Icon = "";Duration = 9;})
		else
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Pyramid is already being robbed! Just auto rob pyramid";Icon = "";Duration = 10;})
		end
	end)

	storesSection:NewButton("Hack Club Vault", "Hacks the club vault for you", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Hacking Club Vault... Please wait";Icon = "";Duration = 7;})
		wait(1.718)
		game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
		for i,v in pairs(getnilinstances()) do
			if v.Name == "HumanoidRootPart" then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
			wait(0.1)
			game.Workspace.ObjectSelection.HackKeyPad.HackKeyPad.HackKeyPad.Event:FireServer()
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Succesfully Hacked Club Vault!";Icon = "";Duration = 7;})
			wait(1.718)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting to fix";Icon = "";Duration = 9;})
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done";Icon = "";Duration = 5;})
	end)

	storesSection:NewButton("Pull all Casino Levers", "Pulls the Casino Levers for you", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
		for i,v in pairs(getnilinstances()) do
			if v.Name == "HumanoidRootPart" then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
		if game.Workspace.ObjectSelection.Lever1.Open.Value == false then
			game.Workspace.ObjectSelection.Lever1.Lever.Lever.Event:FireServer()
		end
		if game.Workspace.ObjectSelection.Lever2.Open.Value == false then
			game.Workspace.ObjectSelection.Lever2.Lever.Lever.Event:FireServer()
		end
		if game.Workspace.ObjectSelection.Lever3.Open.Value == false then
			game.Workspace.ObjectSelection.Lever3.Lever.Lever.Event:FireServer()
		end
		if game.Workspace.ObjectSelection.Lever4.Open.Value == false then
			game.Workspace.ObjectSelection.Lever4.Lever.Lever.Event:FireServer()
		end
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "All Casino Levers Pulled!";Icon = "";Duration = 7;})
		wait(1.718)
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting to fix";Icon = "";Duration = 9;})
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(8)
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done";Icon = "";Duration = 7;})
	end)

	storesSection:NewButton("Hack Casino Computers", "Hacks the casino computer for you", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Executing FireServer... Please Wait";Icon = "";Duration = 7;})
		game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
		for i,v in pairs(getnilinstances()) do
			if v.Name == "HumanoidRootPart" then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
		if game.ReplicatedStorage.HeistStatus.Casino.Locked.Value == false and game.ReplicatedStorage.HeistStatus.Casino.Robbing.Value == false then
			game.Workspace.ObjectSelection.HackComputer.HackComputer.HackComputer.Event:FireServer()
			wait(1.718)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Resetting to fix";Icon = "";Duration = 9;})
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done";Icon = "";Duration = 7;})

		else
			Statuss.Text = "Status: Error while Executing FireServer: Casino is already Opened or is being Robbed!"
			wait(1.718)
			Statuss.Text = "Status: Resetting for Fix..."
			game.Players.LocalPlayer.Character.Humanoid.Health = 0
			wait(8)
			Statuss.Text = "Status: Waiting..."

		end
	end)

	--Weapons game:GetService("Workspace").ObjectSelection.Shotgun.Shotgun
	local weapons = Window:NewTab("Weapons")
	local weaponSection = weapons:NewSection("Click to Get")
	
	weaponSection:NewButton("Pistol", "Gets the Pistol for you", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Please Wait...";Icon = "";Duration = 7;})
		local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		if game.Players.LocalPlayer.Team.Name == "Criminals" or game.Players.LocalPlayer.Team.Name == "Prisoners" then
			local New_CFrame = CFrame.new(2149.65, 26.5, 417.38) --The Cord where you want to go --game:GetService("Workspace").Ship.Boat.MARKPART.CFrame

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
			wait(5.3)
			keypress(0x45)
			wait(0.1)
			keyrelease(0x45)
			Wait(0.45)
			local New_CFrame = CFrame.new(oldpos) --The Cord where you want to go

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
		else
			local New_CFrame = CFrame.new(-1646.52, 43.53, 729.32) --The Cord where you want to go --game:GetService("Workspace").Ship.Boat.MARKPART.CFrame

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
			wait(5.3)
			keypress(0x45)
			wait(0.1)
			keyrelease(0x45)
			Wait(0.45)
			local New_CFrame = CFrame.new(oldpos) --The Cord where you want to go

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
		end
	end)
	
	weaponSection:NewButton("AK47", "Gets the AK47 for you", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Please Wait...";Icon = "";Duration = 7;})
		local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		if game.Players.LocalPlayer.Team.Name == "Criminals" or game.Players.LocalPlayer.Team.Name == "Prisoners" then
			local New_CFrame = CFrame.new(2152.37, 28.56, 429.59) --The Cord where you want to go --game:GetService("Workspace").Ship.Boat.MARKPART.CFrame

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
			wait(5.3)
			keypress(0x45)
			wait(0.1)
			keyrelease(0x45)
			Wait(0.45)
			local New_CFrame = CFrame.new(oldpos) --The Cord where you want to go

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
		else
			local New_CFrame = CFrame.new(-1645.94, 43.78, 709.07) --The Cord where you want to go --game:GetService("Workspace").Ship.Boat.MARKPART.CFrame

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
			wait(5.3)
			keypress(0x45)
			wait(0.1)
			keyrelease(0x45)
			Wait(0.45)
			local New_CFrame = CFrame.new(oldpos) --The Cord where you want to go

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
		end
	end)
	
	weaponSection:NewButton("Shotgun", "Gets the Shotgun for you", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Please Wait...";Icon = "";Duration = 7;})
		local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		if game.Players.LocalPlayer.Team.Name == "Criminals" or game.Players.LocalPlayer.Team.Name == "Prisoners" then
			local New_CFrame = CFrame.new(2152.48, 28.73, 424.08) --The Cord where you want to go --game:GetService("Workspace").Ship.Boat.MARKPART.CFrame

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
			wait(5.3)
			keypress(0x45)
			wait(0.1)
			keyrelease(0x45)
			Wait(0.45)
			local New_CFrame = CFrame.new(oldpos) --The Cord where you want to go

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
		else
			local New_CFrame = CFrame.new(-1114.676, 67.27, -3041.15) --The Cord where you want to go --game:GetService("Workspace").Ship.Boat.MARKPART.CFrame

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
			wait(5.3)
			keypress(0x45)
			wait(0.1)
			keyrelease(0x45)
			Wait(0.45)
			local New_CFrame = CFrame.new(oldpos) --The Cord where you want to go

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
		end
	end)
	
	weaponSection:NewButton("Sniper", "Gets the Sniper for you", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Please Wait...";Icon = "";Duration = 7;})
		local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		if game.Players.LocalPlayer.Team.Name == "Criminals" or game.Players.LocalPlayer.Team.Name == "Prisoners" then
			local New_CFrame = CFrame.new(2152.36, 28.56, 382.49) --The Cord where you want to go --game:GetService("Workspace").Ship.Boat.MARKPART.CFrame

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
			wait(5.3)
			keypress(0x45)
			wait(0.1)
			keyrelease(0x45)
			Wait(0.45)
			local New_CFrame = CFrame.new(oldpos) --The Cord where you want to go

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
		else
			local New_CFrame = CFrame.new(-1649.29, 43.78, 696.55) --The Cord where you want to go --game:GetService("Workspace").Ship.Boat.MARKPART.CFrame

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
			wait(5.3)
			keypress(0x45)
			wait(0.1)
			keyrelease(0x45)
			Wait(0.45)
			local New_CFrame = CFrame.new(oldpos) --The Cord where you want to go

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
		end
	end)
	
	weaponSection:NewButton("Pistol-S", "Gets the Pistol-S for you", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Please Wait...";Icon = "";Duration = 7;})
		local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		if game.Players.LocalPlayer.Team.Name == "Criminals" or game.Players.LocalPlayer.Team.Name == "Prisoners" then
			local New_CFrame = CFrame.new(-892.1, 68.8, -3073.21) --The Cord where you want to go --game:GetService("Workspace").Ship.Boat.MARKPART.CFrame

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
			wait(5.3)
			keypress(0x45)
			wait(0.1)
			keyrelease(0x45)
			Wait(0.45)
			local New_CFrame = CFrame.new(oldpos) --The Cord where you want to go

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
		else
			local New_CFrame = CFrame.new(-892.1, 68.8, -3073.21) --The Cord where you want to go --game:GetService("Workspace").Ship.Boat.MARKPART.CFrame

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
			wait(5.3)
			keypress(0x45)
			wait(0.1)
			keyrelease(0x45)
			Wait(0.45)
			local New_CFrame = CFrame.new(oldpos) --The Cord where you want to go

			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character

			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
		end
	end)

	--MOD 
	local mod = Window:NewTab("Mods")
	local modSection = mod:NewSection("Mods")
	
	modSection:NewButton("Mod AK47 x10", "Mods the AK47 x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['AK47']  --MP5,Pistol,Baton,Shotgun,Baton etc.
		local ss = gun['RifleScript'] --RifleScript,PistolScript,MeeleScript,ShotgunScript etc.
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Famas x10", "Mods the Famas x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Famas']  --MP5,Pistol,Baton,Shotgun,Baton etc.
		local ss = gun['RifleScript'] --RifleScript,PistolScript,MeeleScript,ShotgunScript etc.
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Shotgun x10", "Mods the Shotgun x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Shotgun']  --MP5,Pistol,Baton,Shotgun,Baton etc.
		local ss = gun['ShotgunScript'] --RifleScript,PistolScript,MeeleScript,ShotgunScript etc.
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod SPAS x10", "Mods the SPAS x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['SPAS']  --MP5,Pistol,Baton,Shotgun,Baton etc.
		local ss = gun['ShotgunScript'] --RifleScript,PistolScript,MeeleScript,ShotgunScript etc.
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)

	modSection:NewButton("Mod Pistol x10", "Mods the Pistol x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Pistol']  --MP5,Pistol,Baton,Shotgun,Baton etc.
		local ss = gun['PistolScript'] --RifleScript,PistolScript,MeeleScript,ShotgunScript etc.
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Pistol-S x10", "Mods the Pistol-S x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Pistol-S']  --MP5,Pistol,Baton,Shotgun,Baton etc.
		local ss = gun['PistolScript'] --RifleScript,PistolScript,MeeleScript,ShotgunScript etc.
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Deagle x10", "Mods the Deagle x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Deagle']  --MP5,Pistol,Baton,Shotgun,Baton etc.
		local ss = gun['PistolScript'] --RifleScript,PistolScript,MeeleScript,ShotgunScript etc.
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Sniper x10", "Mods the Sniper x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Sniper']  --MP5,Pistol,Baton,Shotgun,Baton etc.
		local ss = gun['RifleScript'] --RifleScript,PistolScript,MeeleScript,ShotgunScript etc.
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod MP5 x10", "Mods the MP5 x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['MP5']  --MP5,Pistol,Baton,Shotgun,Baton etc.
		local ss = gun['RifleScript'] --RifleScript,PistolScript,MeeleScript,ShotgunScript etc.
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)

	modSection:NewButton("Mod Baton x10", "Mods the Baton x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Baton']  --MP5,Pistol,Baton,Shotgun,Baton etc.
		local ss = gun['MeeleScript'] --RifleScript,PistolScript,MeeleScript,ShotgunScript etc.
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Phantom x10", "Mods the SuperPower from Phantom x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Phantom']  --Laser Beam,Dark Energy etc.
		local ss = gun['PowerScript']
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Darkness x10", "Mods the SuperPower from Raven x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Darkness']  --Laser Beam,Dark Energy etc.
		local ss = gun['PowerScript']
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Ninja Star x10", "Mods the SuperPower from Rykou x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Ninja Star']  --Laser Beam,Dark Energy etc.
		local ss = gun['PowerScript']
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Laser Beam x10", "Mods the Laser Beam x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Laser Beam']  --Laser Beam,Dark Energy etc.
		local ss = gun['PowerScript']
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)

	modSection:NewButton("Mod Dark Energy x10", "Mods the Hero Power from Vanta x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Dark Energy']  --Laser Beam,Dark Energy etc.
		local ss = gun['PowerScript']
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Repulsor x10", "Mods the Hero Power from Titan x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Repulsor']  --Laser Beam,Dark Energy etc.
		local ss = gun['PowerScript']
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Frost x10", "Mods the Hero Power from Frostbite x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Frost']  --Laser Beam,Dark Energy etc.
		local ss = gun['PowerScript']
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Electricity x10", "Mods the Hero Power from Voltron x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Electricity']  --Laser Beam,Dark Energy etc.
		local ss = gun['PowerScript']
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Fire Ball x10", "Mods the Hero Power from Inferno x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Fire Ball']  --Laser Beam,Dark Energy etc.
		local ss = gun['PowerScript']
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	
	modSection:NewButton("Mod Bow & Arrow x10", "Mods the Hero Power from Archer x10", function()
		local backpack = game.Players.LocalPlayer.Backpack
		local gun = backpack['Bow & Arrow']  --Laser Beam,Dark Energy etc.
		local ss = gun['PowerScript']
		for i=1,10 do --u can change this to higher value if u want more damage
		ss:Clone().Parent = gun
		end
	end)
	

	modSection:NewButton("Infinite Ammo", "Not Working", function()
		for _,v in next,game.Players.LocalPlayer.Backpack:GetDescendants() do
            if v:FindFirstChild("PistolScript") or v:FindFirstChild("RifleScript") or v:FindFirstChild("ShotgunScript") or v:FindFirstChild("TazerScript") or v:FindFirstChild("GrenadeScript") or v:FindFirstChild("PowerScript") then
                for _,b in next, v:GetDescendants() do 
                    if b:IsA("LocalScript") then
                        local env = getsenv(b)
                        debug.setupvalue(env.Reload, "Ammo", math.huge)
                        debug.setupvalue(env.Reload, "Clip", math.huge)
                    end 
                end
            end
        end
	end)

	

	--MISC

	local misc = Window:NewTab("MISC")
	local miscSection = misc:NewSection("MISC")
	
	miscSection:NewButton("Vehicle GUI", "Opens a Vehicle GUI with Modifiations", function()
		_G.RedGUI = false
		_G.Theme = "Dark"
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/UniversalVehicleGUI.lua", true))()
	end)
	
	miscSection:NewButton("Get Boss Key", "Gets the Boss Key", function()
		game.Workspace.ObjectSelection.BossKey.Nope.BossKey.Event:FireServer()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Successfully got Boss Key.";Icon = "";Duration = 7;})

	end)
	
	miscSection:NewButton("Get Key Card", "Gets the Key Card", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "If nothing happened, thats because no Keycard is dropped.";Icon = "";Duration = 7;})
		game.Workspace.ObjectSelection.CopDropKeycard.CopDropKeycard.CopDropKeycard.Event:FireServer()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Successfully got Keycard.";Icon = "";Duration = 7;})

	end)
	
	miscSection:NewButton("Get Jetpack", "Gets the Jetpack", function()
		local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Grabbing Jetpack...";Icon = "";Duration = 7;})
		game.Workspace.ObjectSelection.BossKey.Nope.BossKey.Event:FireServer()
		wait(0.1)
		local New_CFrame = CFrame.new(-2260.64, 30.37, -1563.86) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(5.3)
		keypress(0x45)
		wait(0.2)
		keyrelease(0x45)
		wait(0.2)
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Done Grabbing Jetpack.";Icon = "";Duration = 7;})
		local New_CFrame = CFrame.new(oldpos) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end)
	
	miscSection:NewButton("Walk through Doors", "Allows you to Walk through Doors", function()
		for i,v in pairs(workspace:GetDescendants()) do
			if v.Name == "Door" and v.ClassName == "Part" and v.CanCollide==true then
				wait()
				v.CanCollide = false
			end
		end
	end)
	
	miscSection:NewButton("Anti Report", "Makes Players unable to report you", function()
		for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do 
			if v:IsA("Accessory") or v:IsA("BillboardGui") or v:IsA("Decal") or v:IsA("Shirt") or v:IsA("Pants") then 
				v:Destroy()
			end
		end
	end)

    miscSection:NewButton("Auto XP farm", "Executes the auto xp farm", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Executed!";Icon = "";Duration = 7;})
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Cesare0328/my-scripts/main/XP-FARM-1MIN.lua', true))()
	end)

	miscSection:NewButton("Kill all Criminals", "You need to be in a vehicle with missiles on it!", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "You have to be in a Vehicle that has Missiles on it!";Icon = "";Duration = 7;})
		_G.TargetTeam = "Criminals" -- put team u need to kill here
		while wait() do 
			for i,v in next, game.Teams[_G.TargetTeam]:GetPlayers() do
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
			end
		end
	end)

	miscSection:NewButton("Kill all Villains", "You need to be in a vehicle with missiles on it!", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "You have to be in a Vehicle that has Missiles on it!";Icon = "";Duration = 7;})
		_G.TargetTeam = "Villains" -- put team u need to kill here
		while wait() do 
			for i,v in next, game.Teams[_G.TargetTeam]:GetPlayers() do
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
			end
		end
	end)

	miscSection:NewButton("Kill all Cops", "You need to be in a vehicle with missiles on it!", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "You have to be in a Vehicle that has Missiles on it!";Icon = "";Duration = 7;})
		_G.TargetTeam = "Police" -- put team u need to kill here
		while wait() do 
			for i,v in next, game.Teams[_G.TargetTeam]:GetPlayers() do
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
			end
		end
	end)

	miscSection:NewButton("Kill all Heroes", "You need to be in a vehicle with missiles on it!", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "You have to be in a Vehicle that has Missiles on it!";Icon = "";Duration = 7;})
		_G.TargetTeam = "Heroes" -- put team u need to kill here
		while wait() do 
			for i,v in next, game.Teams[_G.TargetTeam]:GetPlayers() do
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
				game.ReplicatedStorage.Event:FireServer("BM", v.Character.Head.Position)
			end
		end
	end)

	miscSection:NewButton("Unlock All Gamepasses", "Click to unlock all gamepasses!", function()
		local g1 = Instance.new("BoolValue",game.Players.LocalPlayer)
		g1.Name = "5275404"
		g1.Value = true
		local g2 = Instance.new("BoolValue",game.Players.LocalPlayer)
		g2.Name = "5275406"
		g2.Value = true
		local g3 = Instance.new("BoolValue",game.Players.LocalPlayer)
		g3.Name = "5275408"
		g3.Value = true
		local g4 = Instance.new("BoolValue",game.Players.LocalPlayer)
		g4.Name = "5283883"
		g4.Value = true
		local g5 = Instance.new("BoolValue",game.Players.LocalPlayer)
		g5.Name = "5285945"
		g5.Value = true
		local g6 = Instance.new("BoolValue",game.Players.LocalPlayer)
		g6.Name = "5786950"
		g6.Value = true
		local g7 = Instance.new("BoolValue",game.Players.LocalPlayer)
		g7.Name = "5945566"
		g7.Value = true
		local g8 = Instance.new("BoolValue",game.Players.LocalPlayer)
		g8.Name = "5981868"
		g8.Value = true
		local g9 = Instance.new("BoolValue",game.Players.LocalPlayer)
		g9.Name = "6023566"
		g9.Value = true
		local g10 = Instance.new("BoolValue",game.Players.LocalPlayer)
		g10.Name = "6329988"
		g10.Value = true
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "All Gamepasses Unlocked!";Icon = "";Duration = 5;})
	end)

	miscSection:NewButton("Unlock All Emotes", "Click to unlock all emotes!", function()
		game.Players.LocalPlayer.Name = "nic10telf"
		game.Players.LocalPlayer.Character.Head:Destroy()
		game.Players.LocalPlayer.Character.HumanoidRootPart.Changed:connect(function ()
		game.Players.LocalPlayer.Name = "nic10telf"
		print(game.Players.LocalPlayer.Name)
		end)
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "All Emotes Unlocked!";Icon = "";Duration = 5;})
		end)


	miscSection:NewButton("Server Hop", "Joins another server", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Remember to execute the script again!";Icon = "";Duration = 7;})
		wait(2)
		local PlaceID = game.PlaceId
		local AllIDs = {}
		local foundAnything = ""
		local actualHour = os.date("!*t").hour
		local Deleted = false
		local File = pcall(function()
			AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
		end)
		if not File then
			table.insert(AllIDs, actualHour)
			writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
		end
		function TPReturner()
			local Site;
			if foundAnything == "" then
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
			else
				Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
			end
			local ID = ""
			if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
				foundAnything = Site.nextPageCursor
			end
			local num = 0;
			for i,v in pairs(Site.data) do
				local Possible = true
				ID = tostring(v.id)
				if tonumber(v.maxPlayers) > tonumber(v.playing) then
					for _,Existing in pairs(AllIDs) do
						if num ~= 0 then
							if ID == tostring(Existing) then
								Possible = false
							end
						else
							if tonumber(actualHour) ~= tonumber(Existing) then
								local delFile = pcall(function()
									delfile("NotSameServers.json")
									AllIDs = {}
									table.insert(AllIDs, actualHour)
								end)
							end
						end
						num = num + 1
					end
					if Possible == true then
						table.insert(AllIDs, ID)
						wait()
						pcall(function()
							writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
							wait()
							game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
						end)
						wait(4)
					end
				end
			end
		end

		function Teleport()
			while wait() do
				pcall(function()
					TPReturner()
					if foundAnything ~= "" then
						TPReturner()
					end
				end)
			end
		end

		-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
		Teleport()
	end)

	-- Experimental
	local experimental = Window:NewTab("Experimental")
	local experimentalSection = experimental:NewSection("Experimental")
	
	experimentalSection:NewButton("Tweak Position", "Dont use this unless you know what your doing!", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
		for i,v in pairs(getnilinstances()) do
			if v.Name == "HumanoidRootPart" then
				v.Parent = game.Players.LocalPlayer.Character
			end
		end
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Your Player Position Has been Tweaked. Reset to Fix.";Icon = "";Duration = 7;}) 
	end)
	
	experimentalSection:NewTextBox("Spawn Vehicle", "Spawn any Vehicle", function(txt)
		local args = {
		[1] = "SpawnVehicle",
		[2] = txt
		}

		game:GetService("ReplicatedStorage").Event:FireServer(unpack(args))

		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Vehicle Spawned.";Icon = "";Duration = 7;}) 
	end)
	
	-- Credits/other
	local credits = Window:NewTab("Credits/Other")
	local CreditsSection = credits:NewSection("UI design")
	CreditsSection:NewButton("Nordbergdk#1684", "Copies Nordbergdk#1684 to your clipboard", function()
		setclipboard(tostring("Nordbergdk#1684"))
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Copied!";Icon = "";Duration = 7;}) 
	end)
	local CreditsSection2 = credits:NewSection("Script Developement")
	CreditsSection2:NewButton("Deni#8510", "Copies Deni#8510 to your clipboard", function()
		setclipboard(tostring("Nordbergdk#1684"))
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Copied!";Icon = "";Duration = 7;}) 
	end)
	CreditsSection2:NewButton("And help from Nordbergdk#1684", "Copies Nordbergdk#1684 to your clipboard", function()
		setclipboard(tostring("Nordbergdk#1684"))
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Copied!";Icon = "";Duration = 7;}) 
    end)
	
    local CreditsSection3 = credits:NewSection("Other")
    
    CreditsSection3:NewButton("Discord Server (Click to copy)", "Copy discord invite", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Copied discord server";Icon = "";Duration = 7;}) 
		setclipboard(tostring("https://discord.gg/d2m4jrVFjY"))
	end)
    
    CreditsSection3:NewButton("Diamond HUB - by Deni#8510", "Opens Deni's Diamond HUB", function()
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Executed Diamond Hub by Deni#8510";Icon = "";Duration = 7;}) 
		loadstring(game:HttpGet("https://pastebin.com/raw/qv1yU9JR", true))()
	end)

------------------ NINJA LEGENDS ------------------
elseif game.PlaceId == 3956818381 then
	game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Ninja Legends)";Text = "Thank you for using Ruby Hub";Icon = "";Duration = 14;})

	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
	local Window = Library.CreateLib("Ruby Hack Hub - For Ninja Legends", "GrapeTheme")

	-- MAIN
	local Main = Window:NewTab("Main")
	local MainSection = Main:NewSection("Main")

	MainSection:NewToggle("Auto Swing", "Make your player autoswing", function(v)
		getgenv().autoswing = v
		while true do
			if not getgenv().autoswing then return end
			for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v:FindFirstChild("ninjitsuGain") then
					game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
					break
				end
			end
			local A_1 = "swingKatana"
			local Event = game:GetService("Players").LocalPlayer.ninjaEvent
			Event:FireServer(A_1)
			wait(0.1)
		end
	end)

	MainSection:NewToggle("Auto Sell", "Makes your player autosell", function(v)
		getgenv().autosell = v
		while true do
			if getgenv().autoswing == false then return end
			game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			wait(0.1)
			game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
			wait(0.1)
		end
	end)

	MainSection:NewButton("Unlock all islands", "Unlocks all islands", function()
		local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		for _,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
			wait(0.1)
		end
		wait(0.1)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
	end)

	MainSection:NewToggle("Auto buy all swords", "Auto buys all swords", function(v)
		getgenv().buyswords = v
		while true do
			if not getgenv().buyswords then return end
			local A_1 = "buyAllSwords"
			local A_2 = "Inner Peace Island"
			local Event = game:GetService("Players").LocalPlayer.ninjaEvent
			Event:FireServer(A_1, A_2)
			wait(0.5)
		end
	end)

	MainSection:NewToggle("Auto buy all belts", "Auto buys all belts", function(v)
		getgenv().buybelts = v
		while true do
			if not getgenv().buybelts then return end
			local A_1 = "buyAllBelts"
			local A_2 = "Inner Peace Island"
			local Event = game:GetService("Players").LocalPlayer.ninjaEvent
			Event:FireServer(A_1, A_2)
			wait(0.5)
		end
	end)
end


---------Prison Life-------------
if game.PlaceId == 155615604 then
	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Prison Life", "Sentinel")
 
    -- MAIN
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Main")
 
    MainSection:NewDropdown("Give Gun", "Gives the localplayer a gun", {"M9", "Remington 870", "AK-47"}, function(v)
        local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[v].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
    end)
 
    MainSection:NewDropdown("Gun Mod", "Makes the gun op", {"M9", "Remington 870", "AK-47"}, function(v)
        local module = nil
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
        end
        if module ~= nil then
            module["MaxAmmo"] = math.huge
            module["CurrentAmmo"] = math.huge
            module["StoredAmmo"] = math.huge
            module["FireRate"] = 0.000001
            module["Spread"] = 0
            module["Range"] = math.huge
            module["Bullets"] = 10
            module["ReloadTime"] = 0.000001
            module["AutoFire"] = true
        end
    end)
 
    -- PLAYER
    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Player")
 
    PlayerSection:NewSlider("Walkspeed", "Changes the walkspeed", 250, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
 
    PlayerSection:NewSlider("Jumppower", "Changes the jumppower", 250, 50, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
	






--------------Other-----------------
if game.PlaceId == 1224212277 then
	print("")
else
	game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "You're not in a suported game";Icon = "";Duration = 7;})
	wait(0.1)
	game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Executing Ez Hub";Icon = "";Duration = 7;})
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug420/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
	Library:ToggleUI()
end
end
