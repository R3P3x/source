game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Thank you for using Ruby Hub!";Icon = "";Duration = 14;})

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Ruby Hub - V1.5", "Synapse")

local teleport = Window:NewTab("Race Teleports")
local teleports = teleport:NewSection("Worlds")
busy = false

busytp = teleports:NewLabel("Status: you are Currently ? Busy.")
function updatetplabels()
	if busy == false then
		busytp:UpdateLabel("Status: you are Currently not Busy.")
	else
		busytp:UpdateLabel("Status: you are Currently Busy.")
	end
end

teleports:NewButton("Teleport to Zaruto Race", "Teleports to Zaruto Race", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)

teleports:NewButton("Teleport to Dragon Race", "Teleports to Dragon Race", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(250, 3.19, 37.77)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)

teleports:NewButton("Teleport to Piece Race", "Teleports to Piece Race", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(499, 3.19, 37.77)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)

teleports:NewButton("Teleport to Titan Race", "Teleports to Titan Race", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(747, 3.19, 37.77)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)

teleports:NewButton("Teleport to Demon Race", "Teleports to Demon Race", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1001, 3.19, 37.77)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)

teleports:NewButton("Teleport to Bizarre Race", "Teleports to Bizarre Race", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1250, 3.19, 37.77)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)
teleports:NewButton("Teleport to SAO Race", "Teleports to SAO Race", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1500, 3.19, 37.77)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)

teleports:NewButton("Teleport to Hunter Race", "Teleports to Hunter Race", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1748, 3.19, 37.77)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)

teleports:NewButton("Teleport to Academia Race", "Teleports to Academia Race", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1998.47, 3.19, 37.77)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)

teleports:NewButton("Teleport to Hollow Race", "Teleports to Hollow Race", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2251.8, 3.19, 37.77)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)

teleports:NewButton("Teleport to Youtuber Race", "Teleports to Youtuber Race", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2499.15, 3.19, 37.77)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)


local ot = Window:NewTab("Other Teleports")
local ots = ot:NewSection("Finish Once")
busyots = ots:NewLabel("You Are Currently ? Busy")

ots:NewButton("Teleport to Fuse Heroes Menu", "Teleports to Fuze Heroes Menu", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(289.97, 3.3, -38.79)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)

ots:NewButton("Teleport to Fuse Heroes Menu", "Teleports to Fuze Heroes Menu", function()
	if busy == false then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1785.05, 3.3, -30.89)
	else
		tpst:UpdateLabel("Status: Can't start.")
		wait(1)
		tpst:UpdateLabel("Status: Waiting...")
	end
end)

function updatetpolabels()
	if busy == false then
		busyots:UpdateLabel("Status: you are Currently not Busy.")
	else
		busyots:UpdateLabel("Status: you are Currently Busy.")
	end
end


local Farm1 = Window:NewTab("Finish Once")
local Farm1Section = Farm1:NewSection("Finish Once")
busyla = Farm1Section:NewLabel("You Are Currently ? Busy")

function updatefarm1labels()
	if busy == false then
		busyla:UpdateLabel("You are Currently not Busy.")
	else
		busyla:UpdateLabel("You are Currently Busy.")
	end
end


function newss(text)
	statuss:UpdateLabel(text)
end

Farm1Section:NewButton("Finish Zaruto Race", "Finishes Zaruto Race Once.", function()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" and busy == false then
		busy = true
		newss("Status: Resetting for timer fix...")
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		newss("Status: Going to Position...")
		local New_CFrame = CFrame.new(0.115, 3.19, 37.77) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(1.8)
		newss("Status: Starting...")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.10, 779661.6875)
		wait(1)
		newss("Status: Waiting 10 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
		end
		wait(1)
		newss("Status: Waiting 9 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
		end
		wait(1)
		newss("Status: Waiting 8 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
		end
		wait(1)
		newss("Status: Waiting 7 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
		end
		wait(1)
		newss("Status: Waiting 6 Seconds to bypass AntiCheat...")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
		end
		wait(1)
		newss("Status: Waiting 5 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
		end
		wait(1)
		newss("Status: Waiting 4 Seconds to bypass AntiCheat.")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
		end
		wait(1)
		newss("Status: Waiting 3 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 2 Seconds to bypass AntiCheat...")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 1 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Finishing...")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		local New_CFrame = CFrame.new(0.115, 3.10, 780350) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(0.6)
		newss("Status: Waiting...")
		busy = false
	else
		newss("Status: Can't Start.")
		wait(1)
		newss("Status: Waiting...")
	end
end)
Farm1Section:NewButton("Finish Dragon Race", "Finishes Dragon Race Once.", function()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" and busy == false then
		busy = true
		newss("Status: Resetting for timer fix...")
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		newss("Status: Going to Position...")
		local New_CFrame = CFrame.new(250, 3.19, 37.77) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(1.8)
		newss("Status: Starting...")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(250, 3.10, 779661.6875)
		wait(1)
		newss("Status: Waiting 10 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 9 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 8 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 7 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 6 Seconds to bypass AntiCheat...")
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 5 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 4 Seconds to bypass AntiCheat.")
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 3 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 2 Seconds to bypass AntiCheat...")
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 1 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Finishing...")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		local New_CFrame = CFrame.new(250, 3.10, 780350) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(0.6)
		newss("Status: Waiting...")
		busy = false
	else
		newss("Status: Can't Start.")
		wait(1)
		newss("Status: Waiting...")
	end
end)
Farm1Section:NewButton("Finish Piece Race", "Finishes Piece Race Once.", function()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" and busy == false then
		busy = true
		newss("Status: Resetting for timer fix...")
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		newss("Status: Going to Position...")
		local New_CFrame = CFrame.new(499, 3.19, 37.77) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(1.8)
		newss("Status: Starting...")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(499, 3.10, 779661.6875)
		wait(1)
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		newss("Status: Waiting 10 Seconds to bypass AntiCheat..")
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 9 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 8 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 7 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 6 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 5 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 4 Seconds to bypass AntiCheat.")
		wait(1)
		newss("Status: Waiting 3 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 2 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 1 Seconds to bypass AntiCheat..")
		wait(1)
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		newss("Status: Finishing...")
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		local New_CFrame = CFrame.new(499, 3.10, 780350) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(0.6)
		newss("Status: Waiting...")
		busy = false
	else
		newss("Status: Can't Start.")
		wait(1)
		newss("Status: Waiting...")
	end
end)

Farm1Section:NewButton("Finish Titan Race", "Finishes Titan Race Once.", function()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" and busy == false then
		busy = true
		newss("Status: Resetting for timer fix...")
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		newss("Status: Going to Position...")
		local New_CFrame = CFrame.new(747, 3.19, 37.77) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(1.8)
		newss("Status: Starting...")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(747, 3.10, 779661.6875)
		wait(1)
		newss("Status: Waiting 10 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 9 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 8 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 7 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 6 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 5 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 4 Seconds to bypass AntiCheat.")
		wait(1)
		newss("Status: Waiting 3 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 2 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 1 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		
		newss("Status: Finishing...")
		local New_CFrame = CFrame.new(747, 3.10, 780350) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(0.6)
		newss("Status: Waiting...")
		busy = false
	else
		newss("Status: Can't Start.")
		wait(1)
		newss("Status: Waiting...")
	end
end)

Farm1Section:NewButton("Finish Demon Race", "Finishes Demon Race Once.", function()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" and busy == false then
		busy = true
		newss("Status: Resetting for timer fix...")
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		newss("Status: Going to Position...")
		local New_CFrame = CFrame.new(1001, 3.19, 37.77) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(1.8)
		newss("Status: Starting...")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1001, 3.10, 779661.6875)
		wait(1)
		newss("Status: Waiting 10 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 9 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 8 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 7 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 6 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 5 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 4 Seconds to bypass AntiCheat.")
		wait(1)
		newss("Status: Waiting 3 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 2 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 1 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Finishing...")
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		local New_CFrame = CFrame.new(1001, 3.10, 780350) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(0.6)
		newss("Status: Waiting...")
	else
		newss("Status: Can't Start.")
		wait(1)
		newss("Status: Waiting...")
	end
end)

Farm1Section:NewButton("Finish Bizarre Race", "Finishes Bizarre Race Once.", function()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" and busy == false then
		busy = true
		newss("Status: Resetting for timer fix...")
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		newss("Status: Going to Position...")
		local New_CFrame = CFrame.new(1250, 3.19, 37.77) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(1.8)
		newss("Status: Starting...")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1250, 3.10, 779661.6875)
		wait(1)
		newss("Status: Waiting 10 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 9 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 8 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 7 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 6 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 5 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 4 Seconds to bypass AntiCheat.")
		wait(1)
		newss("Status: Waiting 3 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 2 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 1 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		newss("Status: Finishing...")
		local New_CFrame = CFrame.new(1250, 3.10, 780350) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(0.6)
		newss("Status: Waiting...")
		busy = false
	else
		newss("Status: Can't Start.")
		wait(1)
		newss("Status: Waiting...")
	end
end)

Farm1Section:NewButton("Finish SAO Race", "Finishes SAO Race Once.", function()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" and busy == false then
		newss("Status: Resetting for timer fix...")
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		newss("Status: Going to Position...")
		local New_CFrame = CFrame.new(1500, 3.19, 37.77) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(1.8)
		newss("Status: Starting...")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1500, 3.10, 779661.6875)
		wait(1)
		newss("Status: Waiting 10 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 9 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 8 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 7 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 6 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 5 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 4 Seconds to bypass AntiCheat.")
		wait(1)
		newss("Status: Waiting 3 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 2 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 1 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		newss("Status: Finishing...")
		local New_CFrame = CFrame.new(1500, 3.10, 780350) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(0.6)
		newss("Status: Waiting...")
	else
		newss("Status: Can't Start.")
		wait(1)
		newss("Status: Waiting...")
	end
end)

Farm1Section:NewButton("Finish Hunter Race", "Finishes Hunter Race Once.", function()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" and busy == false then
		newss("Status: Resetting for timer fix...")
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		newss("Status: Going to Position...")
		local New_CFrame = CFrame.new(1748, 3.19, 37.77) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(1.8)
		newss("Status: Starting...")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1748, 3.10, 779661.6875)
		wait(1)
		newss("Status: Waiting 10 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 9 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 8 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 7 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 6 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 5 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 4 Seconds to bypass AntiCheat.")
		wait(1)
		newss("Status: Waiting 3 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 2 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 1 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		newss("Status: Finishing...")
		local New_CFrame = CFrame.new(1748, 3.10, 780350) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(0.6)
		newss("Status: Waiting...")
	else
		newss("Status: Can't Start.")
		wait(1)
		newss("Status: Waiting...")
	end
end)

Farm1Section:NewButton("Finish Academia Race", "Finishes Academia Race Once.", function()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" and busy == false then
		newss("Status: Resetting for timer fix...")
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		newss("Status: Going to Position...")
		local New_CFrame = CFrame.new(1998, 3.10, 33) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(1.8)
		newss("Status: Starting...")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1998, 3.10, 779661.6875)
		wait(1)
		newss("Status: Waiting 10 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 9 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 8 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 7 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 6 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 5 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 4 Seconds to bypass AntiCheat.")
		wait(1)
		newss("Status: Waiting 3 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 2 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 1 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		newss("Status: Finishing...")
		local New_CFrame = CFrame.new(1998, 3.10, 780350) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(0.6)
		newss("Status: Waiting...")
	else
		newss("Status: Can't Start.")
		wait(1)
		newss("Status: Waiting...")
	end
end)

Farm1Section:NewButton("Finish Hollow Race", "Finishes Hollow Race Once.", function()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" and busy == false then
		newss("Status: Resetting for timer fix...")
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		newss("Status: Going to Position...")
		local New_CFrame = CFrame.new(2251, 3.10, 33) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(1.8)
		newss("Status: Starting...")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2251, 3.10, 779661.6875)
		wait(1)
		newss("Status: Waiting 10 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 9 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 8 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 7 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 6 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 5 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 4 Seconds to bypass AntiCheat.")
		wait(1)
		newss("Status: Waiting 3 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 2 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 1 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		newss("Status: Finishing...")
		local New_CFrame = CFrame.new(2251, 3.10, 780350) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(0.6)
		newss("Status: Waiting...")
	else
		newss("Status: Can't Start.")
		wait(1)
		newss("Status: Waiting...")
	end
end)

Farm1Section:NewButton("Finish Youtuber Race", "Finishes Youtuber Race Once.", function()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" and busy == false then
		newss("Status: Resetting for timer fix...")
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		newss("Status: Going to Position...")
		local New_CFrame = CFrame.new(2499, 3.10, 33) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(1.8)
		newss("Status: Starting...")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2499, 3.10, 779661.6875)
		wait(1)
		newss("Status: Waiting 10 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 9 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 8 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 7 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 6 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 5 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 4 Seconds to bypass AntiCheat.")
		wait(1)
		newss("Status: Waiting 3 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 2 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 1 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		newss("Status: Finishing...")
		local New_CFrame = CFrame.new(2499, 3.10, 780350) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(0.6)
		newss("Status: Waiting...")
	else
		newss("Status: Can't Start.")
		wait(1)
		newss("Status: Waiting...")
	end
end)

Farm1Section:NewLabel("Using Current Race, please stay")
Farm1Section:NewLabel("in the middle of the race.")

Farm1Section:NewButton("Finish Current Race", "Finishes Current Race Once.", function()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" and busy == false then
		newss("Status: Resetting for timer fix...")
		x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
		wait(5)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		newss("Status: Going to Position...")
		local New_CFrame = CFrame.new(x, 3.10, 33) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(1.8)
		newss("Status: Starting...")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, 3.10, 779661.6875)
		wait(1)
		newss("Status: Waiting 10 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 9 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 8 Seconds to bypass AntiCheat..")
		wait(1)
		newss("Status: Waiting 7 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 6 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 5 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 4 Seconds to bypass AntiCheat.")
		wait(1)
		newss("Status: Waiting 3 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		newss("Status: Waiting 2 Seconds to bypass AntiCheat...")
		wait(1)
		newss("Status: Waiting 1 Seconds to bypass AntiCheat..")
		timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		wait(1)
		if timed == "" then
			print("")
		else
			statuss:UpdateLabel("Status: Round Ended. going back...")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
			
		end
		newss("Status: Finishing...")
		local New_CFrame = CFrame.new(x, 3.10, 780350) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(0.6)
		newss("Status: Waiting...")
	else
		newss("Status: Can't Start.")
		wait(1)
		newss("Status: Waiting...")
	end
end)

---------------------------------------------------------------------------

local AutoFarm1 = Window:NewTab("AutoFarm")
local AutoFarmSection = AutoFarm1:NewSection("AutoFarm")
busyaf1 = AutoFarmSection:NewLabel("You are currently ? Busy")

function updateaf1labels()
	if busy == false then
		busyaf1:UpdateLabel("You are Currently not Busy.")
	else
		busyaf1:UpdateLabel("You are Currently Busy.")
	end
end

function news(text)
	statuss:UpdateLabel(text)
end

AutoFarmSection:NewToggle("AutoFarm Zaruto Race", "AutoFarms the first Race", function(state)
	function zarutorace()
		if state then
			killed = false
			timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
			if timed == "" and busy == false then
				toggle = false
				busy = true
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Started.";Icon = "";Duration = 14;})
				while toggle == false do
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						news("Status: Resetting for timer fix...")
						game.Players.LocalPlayer.Character.Humanoid.Health = 0
						wait(5)
						game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
						news("Status: Going to Position...")
						local New_CFrame = CFrame.new(0.115, 3.19, 37.77) --The Cord where you want to go
						local ts = game:GetService('TweenService')
						local char = game.Players.LocalPlayer.Character
						local part = char.HumanoidRootPart
						local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
						local tp = {CFrame = New_CFrame}
						ts:Create(part, ti, tp):Play()
						wait(1.8)
						news("Status: Starting...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.10, 779661.6875)
						wait(1)
						news("Status: Waiting 10 Seconds to bypass AntiCheat..")
						timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
						if timed == "" then
							print("")
						else
							news("Status: Round Ended. going back...")
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
							busy = false
							zarutorace()
						end
						wait(1)
						news("Status: Waiting 9 Seconds to bypass AntiCheat..")
						wait(1)
						news("Status: Waiting 8 Seconds to bypass AntiCheat..")
						wait(1)
						news("Status: Waiting 7 Seconds to bypass AntiCheat..")
						timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
						if timed == "" then
							print("")
						else
							news("Status: Round Ended. going back...")
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
							busy = false
							zarutorace()
						end
						wait(1)
						news("Status: Waiting 6 Seconds to bypass AntiCheat...")
						wait(1)
						news("Status: Waiting 5 Seconds to bypass AntiCheat..")
						wait(1)
						news("Status: Waiting 4 Seconds to bypass AntiCheat.")
						wait(1)
						news("Status: Waiting 3 Seconds to bypass AntiCheat..")
						timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
						if timed == "" then
							print("")
						else
							news("Status: Round Ended. going back...")
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
							busy = false
							zarutorace()
						end
						wait(1)
						news("Status: Waiting 2 Seconds to bypass AntiCheat...")
						wait(1)
						news("Status: Waiting 1 Seconds to bypass AntiCheat..")
						wait(1)
						timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
						if timed == "" then
							print("")
						else
							statuss:UpdateLabel("Status: Round Ended. going back...")
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
							busy = false
							zarutorace()
						end
						statuss:UpdateLabel("Status: Finishing...")
						local New_CFrame = CFrame.new(0.115, 3.10, 780350) --The Cord where you want to go
						local ts = game:GetService('TweenService')
						local char = game.Players.LocalPlayer.Character
						local part = char.HumanoidRootPart
						local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
						local tp = {CFrame = New_CFrame}
						ts:Create(part, ti, tp):Play()
						wait(0.6)
						statuss:UpdateLabel("Status: Waiting...")
						wait(1)
					end
				end
			else
				while true do
					if state == true and killed == false then
						busy = false
						news("Status: Checking again...")
						wait(0.2)
						piecerace()
					else
						break
					end
				end
			end
		else
			toggle = true 
			killed = true
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Will Stop When Its Done.";Icon = "";Duration = 14;})
		end
	end
	zarutorace()
end)

AutoFarmSection:NewToggle("AutoFarm Dragon Race", "AutoFarms the second Race", function(state)
	function dragonrace()
		if state then
			killed = false
			timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
			if timed == "" and busy == false then
				toggle = false
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Started.";Icon = "";Duration = 14;})
				while toggle == false do
					news("Status: Resetting for timer fix...")
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					wait(5)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
					news("Status: Going to Position...")
					local New_CFrame = CFrame.new(250, 3.19, 37.77) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(1.8)
					news("Status: Starting...")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(250, 3.10, 779661.6875)
					wait(1)
					news("Status: Waiting 10 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						dragonrace()
					end
					wait(1)
					news("Status: Waiting 9 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 8 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 7 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						dragonrace()
					end
					wait(1)
					news("Status: Waiting 6 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 5 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 4 Seconds to bypass AntiCheat.")
					wait(1)
					news("Status: Waiting 3 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						dragonrace()
					end
					wait(1)
					news("Status: Waiting 2 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 1 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						dragonrace()
					end
					wait(1)
					news("Status: Finishing...")
					local New_CFrame = CFrame.new(250, 3.10, 780350) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.6)
					news("Status: Waiting...")
					wait(1)
				end
			else
				while true do
					if state == true and killed == false then
						busy = false
						news("Status: Checking again...")
						wait(0.2)
						piecerace()
					else
						break
					end
				end
			end
		else
			toggle = true
			killed = true
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Will Stop When Its Done.";Icon = "";Duration = 14;})
		end
	end
	dragonrace()
end)

AutoFarmSection:NewToggle("AutoFarm Piece Race", "AutoFarms the third Race", function(state)
	function piecerace()
		if state then
			killed = false
			timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
			if timed == "" and busy == false then
				toggle = false
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Started.";Icon = "";Duration = 14;})
				while toggle == false do
					news("Status: Resetting for timer fix...")
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					wait(5)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
					news("Status: Going to Position...")
					local New_CFrame = CFrame.new(499, 3.19, 37.77) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(1.8)
					news("Status: Starting...")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(499, 3.10, 779661.6875)
					wait(1)
					news("Status: Waiting 10 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						piecerace()
					end
					wait(1)
					news("Status: Waiting 9 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 8 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 7 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						piecerace()
					end
					wait(1)
					news("Status: Waiting 6 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 5 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						piecerace()
					end
					wait(1)
					news("Status: Waiting 4 Seconds to bypass AntiCheat.")
					wait(1)
					news("Status: Waiting 3 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						piecerace()
					end
					wait(1)
					news("Status: Waiting 2 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 1 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						piecerace()
					end
					wait(1)
					news("Status: Finishing...")
					local New_CFrame = CFrame.new(499, 3.10, 780350) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.6)
					news("Status: Waiting...")
					wait(1)
				end
			else
				while true do
					if state == true and killed == false then
						busy = false
						news("Status: Checking again...")
						wait(0.2)
						piecerace()
					else
						break
					end
				end
			end
		else
			toggle = true
			killed = true
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Will Stop When Its Done.";Icon = "";Duration = 14;})
		end
	end
	piecerace()
end)

AutoFarmSection:NewToggle("AutoFarm Titan Race", "AutoFarms the fourth Race", function(state)
	function titanrace()
		if state then
			killed = false
			timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
			if timed == "" and busy == false then
				toggle = false
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Started.";Icon = "";Duration = 14;})
				while toggle == false do
					news("Status: Resetting for timer fix...")
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					wait(5)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
					news("Status: Going to Position...")
					local New_CFrame = CFrame.new(747, 3.19, 37.77) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(1.8)
					news("Status: Starting...")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(747, 3.10, 779661.6875)
					wait(1)
					news("Status: Waiting 10 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						titanrace()
					end
					wait(1)
					news("Status: Waiting 9 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 8 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 7 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						titanrace()
					end
					wait(1)
					news("Status: Waiting 6 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 5 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						titanrace()
					end
					wait(1)
					news("Status: Waiting 4 Seconds to bypass AntiCheat.")
					wait(1)
					news("Status: Waiting 3 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						titanrace()
					end
					wait(1)
					news("Status: Waiting 2 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 1 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						titanrace()
					end
					wait(1)
					news("Status: Finishing...")
					local New_CFrame = CFrame.new(747, 3.10, 780350) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.6)
					news("Status: Waiting...")
					wait(1)
				end
			else
				while true do
					if state == true and killed == false then
						busy = false
						news("Status: Checking again...")
						wait(0.2)
						titanrace()
					else
						break
					end
				end
			end
		else
			toggle = true
			killed = true
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Will Stop When Its Done.";Icon = "";Duration = 14;})
		end
	end
	titanrace()
end)

AutoFarmSection:NewToggle("AutoFarm Demon Race", "AutoFarms the fifth Race", function(state)
	function demonrace()
		if state then
			killed = false
			timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
			if timed == "" and busy == false then
				toggle = false
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Started.";Icon = "";Duration = 14;})
				while toggle == false do
					news("Status: Resetting for timer fix...")
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					wait(5)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
					news("Status: Going to Position...")
					local New_CFrame = CFrame.new(1001, 3.19, 37.77) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(1.8)
					news("Status: Starting...")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1001, 3.10, 779661.6875)
					wait(1)
					news("Status: Waiting 10 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						demonrace()
					end
					wait(1)
					news("Status: Waiting 9 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 8 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 7 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						demonrace()
					end
					wait(1)
					news("Status: Waiting 6 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 5 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						demonrace()
					end
					wait(1)
					news("Status: Waiting 4 Seconds to bypass AntiCheat.")
					wait(1)
					news("Status: Waiting 3 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						demonrace()
					end
					wait(1)
					news("Status: Waiting 2 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 1 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						demonrace()
					end
					wait(1)
					news("Status: Finishing...")
					local New_CFrame = CFrame.new(1001, 3.10, 780350) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.6)
					news("Status: Waiting...")
					wait(1)
				end
			else
				while true do
					if state == true and killed == false then
						busy = false
						news("Status: Checking again...")
						wait(0.2)
						demonrace()
					else
						break
					end
				end
			end
		else
			toggle = true
			killed = true
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Will Stop When Its Done.";Icon = "";Duration = 14;})
		end
	end
	demonrace()
end)

AutoFarmSection:NewToggle("AutoFarm Bizarre Race", "AutoFarms the sixth Race", function(state)
	function bizarrerace()
		if state then
			killed = false
			timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
			if timed == "" and busy == false then
				toggle = false
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Started.";Icon = "";Duration = 14;})
				while toggle == false do
					news("Status: Resetting for timer fix...")
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					wait(5)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
					news("Status: Going to Position...")
					local New_CFrame = CFrame.new(1250, 3.19, 37.77) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(1.8)
					news("Status: Starting...")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1250, 3.10, 779661.6875)
					wait(1)
					news("Status: Waiting 10 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						bizarrerace()
					end
					wait(1)
					news("Status: Waiting 9 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 8 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 7 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						bizarrerace()
					end
					wait(1)
					news("Status: Waiting 6 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 5 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						bizarrerace()
					end
					wait(1)
					news("Status: Waiting 4 Seconds to bypass AntiCheat.")
					wait(1)
					news("Status: Waiting 3 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						bizarrerace()
					end
					wait(1)
					news("Status: Waiting 2 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 1 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						bizarrerace()
					end
					wait(1)
					news("Status: Finishing...")
					local New_CFrame = CFrame.new(1250, 3.10, 780350) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.6)
					news("Status: Waiting...")
					wait(1)
				end
			else
				while true do
					if state == true and killed == false then
						busy = false
						news("Status: Checking again...")
						wait(0.2)
						bizarrerace()
					else
						break
					end
				end
			end
		else
			toggle = true
			killed = true
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Will Stop When Its Done.";Icon = "";Duration = 14;})
		end
	end
	bizarrerace()
end)
AutoFarmSection:NewToggle("AutoFarm SAO Race", "AutoFarms the seventh Race", function(state)
	function saorace()
		if state then
			killed = false
			timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
			if timed == "" and busy == false then
				toggle = false
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Started.";Icon = "";Duration = 14;})
				while toggle == false do
					news("Status: Resetting for timer fix...")
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					wait(5)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
					news("Status: Going to Position...")
					local New_CFrame = CFrame.new(1500, 3.19, 37.77) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(1.8)
					news("Status: Starting...")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1500, 3.10, 779661.6875)
					wait(1)
					news("Status: Waiting 10 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						saorace()
					end
					wait(1)
					news("Status: Waiting 9 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 8 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 7 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						saorace()
					end
					wait(1)
					news("Status: Waiting 6 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 5 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						saorace()
					end
					wait(1)
					news("Status: Waiting 4 Seconds to bypass AntiCheat.")
					wait(1)
					news("Status: Waiting 3 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						saorace()
					end
					wait(1)
					news("Status: Waiting 2 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 1 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						saorace()
					end
					wait(1)
					news("Status: Finishing...")
					local New_CFrame = CFrame.new(1500, 3.10, 780350) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.6)
					news("Status: Waiting...")
					wait(1)
				end
			else
				while true do
					if state == true and killed == false then
						busy = false
						news("Status: Checking again...")
						wait(0.2)
						saorace()
					else
						break
					end
				end
			end
		else
			toggle = true
			killed = true
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Will Stop When Its Done.";Icon = "";Duration = 14;})
		end
	end
	saorace()
end)

AutoFarmSection:NewToggle("AutoFarm Hunter Race", "AutoFarms the eight Race", function(state)
	function hunterrace()
		if state then
			killed = false
			timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
			if timed == "" and busy == false then
				toggle = false
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Started.";Icon = "";Duration = 14;})
				while toggle == false do
					news("Status: Resetting for timer fix...")
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					wait(5)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
					news("Status: Going to Position...")
					local New_CFrame = CFrame.new(1748, 3.19, 37.77) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(1.8)
					news("Status: Starting...")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1748, 3.10, 779661.6875)
					wait(1)
					news("Status: Waiting 10 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						hunterrace()
					end
					wait(1)
					news("Status: Waiting 9 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 8 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 7 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						hunterrace()
					end
					wait(1)
					news("Status: Waiting 6 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 5 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						hunterrace()
					end
					wait(1)
					news("Status: Waiting 4 Seconds to bypass AntiCheat.")
					wait(1)
					news("Status: Waiting 3 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						hunterrace()
					end
					wait(1)
					news("Status: Waiting 2 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 1 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						hunterrace()
					end
					wait(1)
					news("Status: Finishing...")
					local New_CFrame = CFrame.new(1748, 3.10, 780350) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.6)
					news("Status: Waiting...")
					wait(1)
				end
			else
				while true do
					if state == true and killed == false then
						busy = false
						news("Status: Checking again...")
						wait(0.2)
						hunterrace()
					else
						break
					end
				end
			end
		else
			toggle = true
			killed = true
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Will Stop When Its Done.";Icon = "";Duration = 14;})
		end
	end
	hunterrace()
end)

AutoFarmSection:NewToggle("AutoFarm Academia Race", "AutoFarms the ninth Race", function(state)
	function academiarace()
		if state then
			killed = false
			timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
			if timed == "" and busy == false then
				toggle = false
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Started.";Icon = "";Duration = 14;})
				while toggle == false do
					news("Status: Resetting for timer fix...")
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					wait(5)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
					news("Status: Going to Position...")
					local New_CFrame = CFrame.new(1998, 3.19, 37.77) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(1.8)
					news("Status: Starting...")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1998, 3.10, 779661.6875)
					wait(1)
					news("Status: Waiting 10 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						academiarace()
					end
					wait(1)
					news("Status: Waiting 9 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 8 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 7 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						academiarace()
					end
					wait(1)
					news("Status: Waiting 6 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 5 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						academiarace()
					end
					wait(1)
					news("Status: Waiting 4 Seconds to bypass AntiCheat.")
					wait(1)
					news("Status: Waiting 3 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						academiarace()
					end
					wait(1)
					news("Status: Waiting 2 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 1 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						academiarace()
					end
					wait(1)
					news("Status: Finishing...")
					local New_CFrame = CFrame.new(1998, 3.10, 780350) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.6)
					news("Status: Waiting...")
					wait(1)
				end
			else
				while true do
					if state == true and killed == false then
						busy = false
						news("Status: Checking again...")
						wait(0.2)
						academiarace()
					else
						break
					end
				end
			end
		else
			toggle = true
			killed = true
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Will Stop When Its Done.";Icon = "";Duration = 14;})
		end
	end
	academiarace()
end)

AutoFarmSection:NewToggle("AutoFarm Hollow Race", "AutoFarms the tenth Race", function(state)
	function hollowrace()
		if state then
			killed = false
			timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
			if timed == "" and busy == false then
				toggle = false
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Started.";Icon = "";Duration = 14;})
				while toggle == false do
					news("Status: Resetting for timer fix...")
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					wait(5)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
					news("Status: Going to Position...")
					local New_CFrame = CFrame.new(2251, 3.19, 37.77) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(1.8)
					news("Status: Starting...")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2251, 3.10, 779661.6875)
					wait(1)
					news("Status: Waiting 10 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						hollowrace()
					end
					wait(1)
					news("Status: Waiting 9 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 8 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 7 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						hollowrace()
					end
					wait(1)
					news("Status: Waiting 6 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 5 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						hollowrace()
					end
					wait(1)
					news("Status: Waiting 4 Seconds to bypass AntiCheat.")
					wait(1)
					news("Status: Waiting 3 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						hollowrace()
					end
					wait(1)
					news("Status: Waiting 2 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 1 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						hollowrace()
					end
					wait(1)
					news("Status: Finishing...")
					local New_CFrame = CFrame.new(2251, 3.10, 780350) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.6)
					news("Status: Waiting...")
					wait(1)
				end
			else
				while true do
					if state == true and killed == false then
						busy = false
						news("Status: Checking again...")
						wait(0.2)
						hollowrace()
					else
						break
					end
				end
			end
		else
			toggle = true
			killed = true
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Will Stop When Its Done.";Icon = "";Duration = 14;})
		end
	end
	hollowrace()
end)

AutoFarmSection:NewToggle("AutoFarm Youtuber Race", "AutoFarms the last Race", function(state)
	function youtuberace()
		if state then
			killed = false
			timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
			if timed == "" and busy == false then
				toggle = false
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Started.";Icon = "";Duration = 14;})
				while toggle == false do
					news("Status: Resetting for timer fix...")
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					wait(5)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
					news("Status: Going to Position...")
					local New_CFrame = CFrame.new(2499, 3.19, 37.77) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(1.8)
					news("Status: Starting...")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2499, 3.10, 779661.6875)
					wait(1)
					news("Status: Waiting 10 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						youtuberace()
					end
					wait(1)
					news("Status: Waiting 9 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 8 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 7 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						youtuberace()
					end
					wait(1)
					news("Status: Waiting 6 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 5 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						youtuberace()
					end
					wait(1)
					news("Status: Waiting 4 Seconds to bypass AntiCheat.")
					wait(1)
					news("Status: Waiting 3 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						youtuberace()
					end
					wait(1)
					news("Status: Waiting 2 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 1 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						youtuberace()
					end
					wait(1)
					news("Status: Finishing...")
					local New_CFrame = CFrame.new(2499, 3.10, 780350) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.6)
					news("Status: Waiting...")
					wait(1)
				end
			else
				while true do
					if state == true and killed == false then
						busy = false
						news("Status: Checking again...")
						wait(0.2)
						youtuberace()
					else
						break
					end
				end
			end
		else
			toggle = true
			killed = true
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Will Stop When Its Done.";Icon = "";Duration = 14;})
		end
	end
	youtuberace()
end)

AutoFarmSection:NewLabel("Using Current Race, please stay")
AutoFarmSection:NewLabel("in the middle of the race.")

AutoFarmSection:NewToggle("AutoFarm Current Race", "AutoFarms the Current Race", function(state)
	function currentrace()
		if state then
			killed = false
			timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
			if timed == "" and busy == false then
				toggle = false
				game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Started.";Icon = "";Duration = 14;})
				while toggle == false do
					news("Status: Resetting for timer fix...")
					x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					wait(5)
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
					news("Status: Going to Position...")
					local New_CFrame = CFrame.new(x, 3.19, 37.77) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(1.8)
					news("Status: Starting...")
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x, 3.10, 779661.6875)
					wait(1)
					news("Status: Waiting 10 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						currentrace()
					end
					wait(1)
					news("Status: Waiting 9 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 8 Seconds to bypass AntiCheat..")
					wait(1)
					news("Status: Waiting 7 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						currentrace()
					end
					wait(1)
					news("Status: Waiting 6 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 5 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						currentrace()
					end
					wait(1)
					news("Status: Waiting 4 Seconds to bypass AntiCheat.")
					wait(1)
					news("Status: Waiting 3 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						currentrace()
					end
					wait(1)
					news("Status: Waiting 2 Seconds to bypass AntiCheat...")
					wait(1)
					news("Status: Waiting 1 Seconds to bypass AntiCheat..")
					timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
					if timed == "" then
						print("")
					else
						news("Status: Round Ended. going back...")
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.115, 3.19, 37.77)
						busy = false
						currentrace()
					end
					wait(1)
					news("Status: Finishing...")
					local New_CFrame = CFrame.new(x, 3.10, 780350) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(0.5, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
					wait(0.6)
					news("Status: Waiting...")
					wait(1)
				end
			else
				while true do
					if state == true and killed == false then
						busy = false
						news("Status: Checking again...")
						wait(0.2)
						currentrace()
					else
						break
					end
				end
			end
		else
			toggle = true
			killed = true
			game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Auto Farm Will Stop When Its Done.";Icon = "";Duration = 14;})
		end
	end
	currentrace()
end)

AutoFarmSection:NewKeybind("Key Bind for hiding/Unhiding the UI   -->", "Click to change keybind", Enum.KeyCode.V, function()
	Library:ToggleUI()
end)

local Statustab = Window:NewTab("Status")
local Statussection = Statustab:NewSection("Statuses")


statuss = Statussection:NewLabel("Status: Waiting...")
busylas = Statussection:NewLabel("You are Currently ? Busy.")
started = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
if started == "" then
	startedb = "Started."
else
	startedb = "not Started."
end
starteds = Statussection:NewLabel("Game is currently " .. startedb)
howms = Statussection:NewLabel("... Seconds until start")

function updatestatuslabels()
	timed = game.Workspace.GPI.World2.StartBlock.SurfaceGui.Timer.Text
	if timed == "" then
		starteds:UpdateLabel("Game is currently Started.")
		howms:UpdateLabel("0 Seconds until start")
	else
		starteds:UpdateLabel("Game is currently not Started.")
	end
	if busy == false then
		busylas:UpdateLabel("You are Currently not Busy.")
	else
		busylas:UpdateLabel("You are Currently Busy.")
	end
	howms:UpdateLabel(timed .. " Seconds until start")

end

local clog = Window:NewTab("Changelogs")
local sect = clog:NewSection("Changelogs")
sect:NewLabel("V1.0 -> creation Ruby Hub")
sect:NewLabel("V1.1 -> Fixed AutoFarm continuing while round ended")
sect:NewLabel("V1.1 -> Changed UI Design")
sect:NewLabel("V1.2 -> Fixed AutoFarm stuck at bypassing anticheat")
sect:NewLabel("V1.2 -> Added Hunter Race To AutoFarm")
sect:NewLabel("V1.3 -> Added Academia Race To AutoFarm")
sect:NewLabel("V1.3 -> Added Hollow Race To AutoFarm")
sect:NewLabel("V1.4 -> Fixed AutoFarm not continuing after round ended.")
sect:NewLabel("V1.5 -> Added Youtuber Race to AutoFarm")
sect:NewLabel("V1.5 -> Added Current Race to AutoFarm - Mukz")


local credits = Window:NewTab("Credits/Other")
local CreditsSection = credits:NewSection("UI design")
CreditsSection:NewButton("Nordbergdk#1684", "Copies Nordbergdk#1684 to your clipboard", function()
    setclipboard(tostring("Nordbergdk#1684"))
    game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Copied!";Icon = "";Duration = 7;}) 
end)
local CreditsSection2 = credits:NewSection("Script Developement")
CreditsSection2:NewButton("Deni#8510", "Copies Deni#8510 to your clipboard", function()
    setclipboard(tostring("Deni#8510"))
    game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Copied!";Icon = "";Duration = 7;}) 
end)
CreditsSection2:NewButton("Nordbergdk#1684", "Copies Nordbergdk#1684 to your clipboard", function()
    setclipboard(tostring("Nordbergdk#1684"))
    game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Copied!";Icon = "";Duration = 7;}) 
end)

local CreditsSection3 = credits:NewSection("Other")

CreditsSection3:NewButton("Discord Server (Click to copy)", "Copy discord invite", function()
    game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub (Mad City)";Text = "Copied discord server";Icon = "";Duration = 7;}) 
    setclipboard(tostring("https://discord.gg/52Y3H35UtT"))
end)

while true do
	updatefarm1labels()
	updatetplabels()
	updateaf1labels()
	updatestatuslabels()
	updatetpolabels()
	wait(0.1)
end
