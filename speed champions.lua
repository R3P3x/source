repeat wait() until game:isLoaded()
game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Thank you for using Ruby Hub";Icon = "";Duration = 14;})

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Ruby Hub - Speed Champions - v1.0", "BloodTheme")

-- MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("AutoFarm")
local busy = false

MainSection:NewToggle("Autofarm Hoops Cyber World", "Autofarms hoops in Cyber World", function(state)
	if state == true then
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "AutoHoop Enabled.";Icon = "";Duration = 14;})
		if busy == false then
			toggled = false
			busy = true
			while toggled == false do
				-- 1D Speed
				local New_CFrame = CFrame.new(-7822.10, 220.27, -2403.77) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(1.2, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(1.2)
				-- 1N Speed
				local New_CFrame = CFrame.new(-7821.53, 210.27, -2228.62) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(1)
				-- 1N Speed
				local New_CFrame = CFrame.new(-8072.90, 202.78, -2529.19) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(1.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(1.5)
				-- 1N Speed
				local New_CFrame = CFrame.new(-7831.12, 202.27, -2676.97) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(1.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				-- Diamonds
				wait(1.5)
				local New_CFrame = CFrame.new(-7619.99, 202.78, -2563.41) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(1)
				local New_CFrame = CFrame.new(-7601.59, 202.78, -2651.03) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(1)
				local New_CFrame = CFrame.new(-7838.64, 202.78, -2501.33) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(1)
			end
		else
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Other Farming is in progress!";Icon = "";Duration = 14;})
		end
	else
		toggled = true
		busy = false
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "AutoHoop Disabled.";Icon = "";Duration = 14;})
	end
end)

MainSection:NewToggle("Autofarm 4th july event hoops", "Autofarms hoops in 4th july event", function(state)
	if state == true then
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "AutoHoop Enabled.";Icon = "";Duration = 14;})
		if busy == false then
			toggled = false
			busy = true
			while toggled == false do
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3632.29, 210, 4809.667)
				wait(0.7)
				local New_CFrame = CFrame.new(3632.29, 270.11, 4809.667) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.4, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.43)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3386.287, 211.879, 4779.646)
				wait(0.5)
				local New_CFrame = CFrame.new(3371.06, 261.87, 4779.59) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.4, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.43)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3488.26, 122.82, 4904.66)
				wait(0.5)
				local New_CFrame = CFrame.new(3488.26, 182.82, 4904.66) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.4, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.43)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3077.14, 130, 4713.60)
				wait(0.5)
				local New_CFrame = CFrame.new(3077.14, 260, 4713.60) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.4, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.43)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3366.19, 132.23, 4569.68)
				wait(0.5)
				local New_CFrame = CFrame.new(3366.19, 182.23, 4569.68) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.4, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(4)
			end
		else
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Other Farming is in progress!";Icon = "";Duration = 14;})
		end
	else
		toggled = true
		busy = false
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "AutoHoop Disabled. Please wait for finish";Icon = "";Duration = 14;})
	end
end)
MainSection:NewToggle("Autofarm Yen Hoops", "Autofarms Yen Hoops", function(state)
	if state == true then
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "AutoHoop Enabled.";Icon = "";Duration = 14;})
		if busy == false then
			toggled = false
			busy = true
			while toggled == false do
				--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12441.31, 110, -2384.59)
				--wait(0.7)
				local New_CFrame = CFrame.new(-12441.31, 181.87, -2384.59) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(1.23)
				--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12294.70, 110, -2249.58)
				--wait(0.5)
				local New_CFrame = CFrame.new(-12294.70, 181.11, -2249.58) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.2, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.23)
				--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12628.22, 102.82, -2056.15)
				--wait(0.5)
				local New_CFrame = CFrame.new(-12628.22, 182.82, -2056.15) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.4, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.43)
				--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12723.53, 98, -2063.91)
				--wait(0.5)
				local New_CFrame = CFrame.new(-12723.53, 198, -2063.91) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.2, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.23)
				--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13084, 116, -2112.36)
				--wait(0.5)
				local New_CFrame = CFrame.new(-13084, 185.23, -2112.36) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.2, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.23)
				--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13334.01, 116, -2114.71)
				--wait(0.5)
				local New_CFrame = CFrame.new(-13334.01, 187, -2114.71) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.2, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.23)
				--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13521.77, 116, -2234.91)
				--wait(0.5)
				local New_CFrame = CFrame.new(-13521.77, 187, -2234.91) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.2, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.23)
				--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13524.04, 116, -2322.79)
				--wait(0.5)
				local New_CFrame = CFrame.new(-13524.04, 186, -2322.79) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.2, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.23)
				--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13079.89, 116, -2385.56)
				--wait(0.5)
				local New_CFrame = CFrame.new(-13079.89, 186, -2385.56) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.2, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.23)
				--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12868.69, 109, -2384.11)
				--wait(0.5)
				local New_CFrame = CFrame.new(-12868.69, 179, -2384.11) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.2, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.23)
				--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12755.49, 99, -2383.98)
				--wait(0.5)
				local New_CFrame = CFrame.new(-12755.49, 170, -2383.98) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.2, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(0.23)
				--game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-12550.49, 110, -2383.46)
				--wait(0.5)
				local New_CFrame = CFrame.new(-12550.49, 181, -2383.46) --The Cord where you want to go
				local ts         = game:GetService('TweenService')
				local char       = game.Players.LocalPlayer.Character
				local part       = char.HumanoidRootPart
				local ti         = TweenInfo.new(0.2, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
				local tp         = {CFrame = New_CFrame}
				ts:Create(part, ti, tp):Play()
				wait(4)
			end
		else
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Other Farming is in progress!";Icon = "";Duration = 14;})
		end
	else
		toggled = true
		busy = false
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "AutoHoop Disabled. Please wait for finish";Icon = "";Duration = 14;})
	end
end)
MainSection:NewKeybind("Key Bind for hiding/Unhiding the UI   -->", "Click to change keybind", Enum.KeyCode.V, function()
    Library:ToggleUI()
end)
