if game.PlaceId == 1224212277 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/require/main/bannedhwids", true))() -- banned hwids
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/require/main/whitelistedhwids", true))() -- whitelisted hwids
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/require/main/moderators", true))()
	function hwidcheck()
		local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
		local count = 0
		local player = game.Players.LocalPlayer
		for i,v in pairs(_G.bannedhwids) do
			count = count + 1
		end
		count2 = 0
		while(count2 < count) do
			if _G.bannedhwids["b" .. count2] == nil then
				count2 = count2 + 1
				count = count + 1
				continue
			end
			if _G.bannedhwids["b" .. count2] == hwid then
				if _G.bannedhwids["b" .. count2] == _G.whitelistedhwids["w1"] or _G.bannedhwids["b" .. count2] == _G.whitelistedhwids["w2"] then 
					break
				else
					player:Kick("You are banned from ruby hub. Reason: trying to bypass premium.")
				end
			end
			count2 = count2 + 1
		end
	end
	hwidcheck()
	local player = game.Players.LocalPlayer
	groupid = 17079244
	premium = false
	gobypass = false
	ownsgamepass = false
	local GAMEPASS_ID = 140751103
	local MarketplaceService = game:GetService("MarketplaceService")
	function getpremium()
		count3 = 1
		local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
		for i, v in pairs(_G.whitelistedhwids) do
			if hwid == _G.whitelistedhwids["w" .. count3] then
				gobypass = true
				count3 = count3 + 1
				premium = true
				ownsgamepass = true
				break
			else
				count3 = count3 + 1
			end
		end
		if not gobypass then
			if MarketplaceService:UserOwnsGamePassAsync(game.Players.LocalPlayer.UserId, GAMEPASS_ID) then
				ownsgamepass = true
				if player:IsInGroup(groupid) then
					roleingroup = player:GetRoleInGroup(groupid)
					if roleingroup == "Premium" or roleingroup == "Owner" or roleingroup == "Admin" then
						premium = true
					else
						premium = false
					end
				else
					premium = false
				end
			else
				ownsgamepass = false
				if player:IsInGroup(groupid) then
					roleingroup = player:GetRoleInGroup(groupid)
					if roleingroup == "Premium" then
						premium = true
					else
						premium = false
					end
				else
					premium = false
				end
			end
		end
		return premium, ownsgamepass
	end
	local premium, ownsgamepass = getpremium()
	------------------------------------------
	if premium and ownsgamepass then
		Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
	elseif premium and not ownsgamepass then
		player:Kick("You got caught trying to bypass Premium. Create a Ticket in the Discord and tell them: player in group but doesn't own gamepass. Otherwise you will be banned from ruby hub forever within 1 day.")
		HttpService = game:GetService("HttpService")
		Webhook_URL = "https://discord.com/api/webhooks/1086956622674403359/eHY8O4pK1GS_ZpVjWmioihOxgBQVfeElXwwjPbYjWOSINQBUsCUNdsvFiomdVQc1M6Jl"
		local response = request or syn.request or http_request(
		{
			Url = Webhook_URL,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = HttpService:JSONEncode({
				["content"] = "",
				["embeds"] = {{
					["title"] = "**Ruby Hub**",
					["description"] = "User got Kicked by Premium Check. \n\nInfo:\n\n Name: " .. game.Players.LocalPlayer.Name .. " \n UserId: " .. game.Players.LocalPlayer.UserId .. " \n DisplayName: " .. game.Players.LocalPlayer.DisplayName .. " \n\n Reason: \n\nPremium check: User is in Premium in Ruby Hub Group but does not own the Premium Gamepass. \n",
					["type"] = "rich",
					["color"] = tonumber(0xffffff),
					["fields"] = {
						{
							["name"] = "Hardware ID:",
							["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
							["inline"] = true
						}
					}
				}}
			})
		}
		)
	elseif ownsgamepass and not premium then
		player:Kick("Create a Ticket in the Discord and tell them: player owns gamepass but not in group.")
	elseif not ownsgamepass and not premium then
		Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
	end
	
	-- Variables --
	player = game:GetService("Players")
	localplayer = player.LocalPlayer
	character = localplayer.Character
	humanoid = character.Humanoid
	hrd = character.HumanoidRootPart
	playern = localplayer.Name
	workspacelp = game.Workspace[playern]
	teleporttime = 0.1
	speedofthefly = 3
	speedofthevfly = 3
	walkspeedenabled = false
	levelcheckwait = 5
	instantgoup = false
	instantgountil = false
	instantgodown = false
	cartweenup = 10
	cartweenuntil = 80
	cartweendown = 7
	shiftwalkspeed = false
	pathfindmethod = false -- true = collision detect (new) false = old pathfind
	levelchecklimit = 400
	checklevel = true
	tweenspeeddown = 3000
	tweenspeeduntil = 30000
	waituntilgoinguntil = 1
	waituntilgoingdown = 0.2
	checkcash = false
	speed = 16
	shiftspeed = 24
	car = nil
	currentcar = nil
	pathfindtime = 0.001
	cashcheckwait = 10
	infinijump = false
	triestodo = 20
	AutoCooldownWait = 5
	cartp = false
	playertp = true
	safemode = false
	cashchecklimit = 50000000
	antitazeenabled = false
	detectedstopall = false
	autoserverhop = true
	automoddetect = true
	-- End of Variables --
	
	-- Functions --
	function notify(text, duration)
		Rayfield:Notify({
			Title = "Ruby Hub",
			Content = text,
			Duration = duration,
			Image = 4483362458,
		})
	end
	function getcar()
		player = game.Players.LocalPlayer
		SeatPart = player.Character.Humanoid.SeatPart
		if SeatPart then
			currentcar = SeatPart.Parent
		else
			notify("Car not Found.", 7)
		end
	end
	function cartpc(x, y, z)
		player = game.Players.LocalPlayer
		SeatPart = player.Character.Humanoid.SeatPart
		if SeatPart then
			car = SeatPart.Parent
			car:PivotTo(CFrame.new(x, y, z))
		else
			notify("Car not Found.", 7)
		end
	end
	local uis = game:GetService("UserInputService")
	function findplayerincrim(player)
		playertosearch = player
		local crimpart = Instance.new("Part")
		crimpart.Material = "Neon"
		crimpart.Size = Vector3.new(238, 93.4613, 340)
		crimpart.CFrame = CFrame.new(9.05971146, 68.8884125, -132.511703, 0.374797106, 2.33058454e-05, 0.927106857, 0.000119832453, -1, -2.33058454e-05, 0.927106857, 0.000119832453, -0.374797106)
		crimpart.Anchored = true
		crimpart.Shape = "Block"
		crimpart.CanCollide = false
		crimpart.Parent = game.Workspace
		crimpart.Reflectance = 0
		crimpart.Name = "CrimPart"
		found = false
		crimpart.Touched:Connect(function(player)
			if player.Parent.Name == playertosearch and not found or player.Parent.Parent.Name == playertosearch and not found then
				found = true
				crimpart:Destroy()
			else
				found = false
			end
		end)
	end
	function cartpdone(x, y, z)
		player = game.Players.LocalPlayer
		hrd = player.Character.HumanoidRootPart
		SeatPart = player.Character.Humanoid.SeatPart
		yourcar = nil
		if SeatPart then
			yourcar = SeatPart.Parent
			local p = hrd.Position
			if carinstantgoup then
				yourcar:PivotTo(CFrame.new(p.x, 1000, p.z))
			else
				local currentPos = Vector3.new(p.x, p.y, p.z)
				local targetPos = Vector3.new(p.x, 1000, p.z)

				local direction = (targetPos - currentPos).Unit
				local distance = (targetPos - currentPos).Magnitude
				local steps = math.floor(distance / cartweenup)
				for i = 1, steps do
					currentPos = currentPos + direction * cartweenup
					yourcar:PivotTo(CFrame.new(currentPos))
					task.wait()
				end
				-- move to the exact target position
				currentPos = targetPos
				yourcar:PivotTo(CFrame.new(currentPos))
			end
			task.wait(0.5)
			local p = hrd.Position
			if instantgountil then
				yourcar:PivotTo(CFrame.new(x, 1000, z))
			else
				local currentPos = Vector3.new(p.x, 1000, p.z)
				local targetPos = Vector3.new(x, 1000, z)

				local direction = (targetPos - currentPos).Unit
				local distance = (targetPos - currentPos).Magnitude
				local steps = math.floor(distance / cartweenuntil)
				for i = 1, steps do
					currentPos = currentPos + direction * cartweenuntil
					yourcar:PivotTo(CFrame.new(currentPos))
					task.wait()
				end
				-- move to the exact target position
				currentPos = targetPos
				yourcar:PivotTo(CFrame.new(currentPos))
			end
			task.wait(0.8)
			if instantgodown then
				yourcar:PivotTo(CFrame.new(x, y, z))
			else
				local currentPos = Vector3.new(x, 1000, z)
				local targetPos = Vector3.new(x, y, z)

				local direction = (targetPos - currentPos).Unit
				local distance = (targetPos - currentPos).Magnitude
				local steps = math.floor(distance / tweenspeeddown)
				for i = 1, steps do
					currentPos = currentPos + direction * tweenspeeddown
					yourcar:PivotTo(CFrame.new(currentPos))
					task.wait()
				end
				-- move to the exact target position
				currentPos = targetPos
				yourcar:PivotTo(CFrame.new(currentPos))
				task.wait()
			end
		else
			notify("Car not Found.", 7)
		end
	end
	
	function cartpcustom(x, y, z)
		local Car = humanoid.SeatPart
		Car.Parent:PivotTo(CFrame.new(x, y, z))
	end
	
	function playertpcustom(x, y, z)
		hrd.CFrame = CFrame.new(x, y, z)
	end

	function notifyclick(text, clicktext)
		Rayfield:Notify({
			Title = "Ruby Hub",
			Content = text,
			Duration = 1,
			Image = 4483362458,
			Actions = { -- Notification Buttons
				Ignore = {
					Name = "Okay!",
					Callback = function()
						--
					end
				},
			},
		})
	end
	
	function tpdone(x, y, z)
		local Char = localplayer.Character or workspace:FindFirstChild(localplayer.Name)
		local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
		if not Char or not HRP then
			notify("Something has gone really wrong. reset character please.", 1)
		end
		local player = game:GetService("Players").LocalPlayer
		local hrd = player.Character.HumanoidRootPart
		local p = hrd.Position
		hrd.CFrame = CFrame.new(p.x, 1000, p.z)
		task.wait(waituntilgoinguntil)
		local targetPosition = Vector3.new(x, 1000, z)
		local speed = tweenspeeduntil
		local maxForce = Vector3.new(math.huge, math.huge, math.huge)

		local velocity = Instance.new("BodyVelocity")
		velocity.MaxForce = maxForce
		velocity.Velocity = Vector3.new(0, 0, 0)
		velocity.Parent = player.Character.HumanoidRootPart

		while true do
			local currentPos = player.Character.HumanoidRootPart.Position
			local direction = (targetPosition - currentPos).unit
			local distance = (targetPosition - currentPos).magnitude
			local distanceCheck = speed/30
			
			if distance >= distanceCheck then
				velocity.Velocity = direction * speed
			else
				velocity:Destroy()
				for i = 1, 20 do
					player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
					player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0) -- stop player movement
					task.wait()
				end
				break
			end
			
			wait()
		end
		task.wait(waituntilgoingdown)
		local targetPosition = Vector3.new(x, y, z)
		local speed = tweenspeeddown
		local maxForce = Vector3.new(math.huge, math.huge, math.huge)

		local velocity = Instance.new("BodyVelocity")
		velocity.MaxForce = maxForce
		velocity.Velocity = Vector3.new(0, 0, 0)
		velocity.Parent = player.Character.HumanoidRootPart

		while true do
			local currentPos = player.Character.HumanoidRootPart.Position
			local direction = (targetPosition - currentPos).unit
			local distance = (targetPosition - currentPos).magnitude
			local distanceCheck = speed/30
			
			if distance >= distanceCheck then
				velocity.Velocity = direction * speed
			else
				velocity:Destroy()
				for i = 1, 20 do
					player.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
					player.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0) -- stop player movement
					task.wait()
				end
				break
			end
			
			wait()
		end

		task.wait()
	end
	
	function tweentime(x, y, z, del)
		local New_CFrame = CFrame.new(x, y, z) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(del, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end
	
	function tweentpdone(x, y, z)
		pos = hrd.Position
		local New_CFrame = CFrame.new(pos.x, 1000, pos.z) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(teleporttime, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(teleporttime)
		local New_CFrame = CFrame.new(x, 1000, z) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(teleporttime, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(teleporttime)
		local New_CFrame = CFrame.new(x, y + 3, z) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(teleporttime, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
		wait(teleporttime)
	end
	
	function noEcooldown()
		for i,v in next, getgc(true) do
			if type(v) == "table" and rawget(v, "ID") and rawget(v, "Seconds") then
			 if typeof(v.Seconds) == "number" then
				 rawset(v, "Seconds", 0.001) -- setting it to 0 will not work because the game checks that.
			 end
		  end
		end
	end

	function pressE()
		local vim = game:service("VirtualInputManager")
		local function hold(keyCode, time)
		vim:SendKeyEvent(true, keyCode, false, game)
		task.wait(time)
		vim:SendKeyEvent(false, keyCode, false, game)
		end
		hold(Enum.KeyCode.E, 0.015)
	end

	function pressSpace()
		local vim = game:service("VirtualInputManager")
		local function hold(keyCode, time)
		vim:SendKeyEvent(true, keyCode, false, game)
		task.wait(time)
		vim:SendKeyEvent(false, keyCode, false, game)
		end
		hold(Enum.KeyCode.Space, 0.15)
	end

	function leftclick()
		local vim = game:service("VirtualInputManager")
		local function hold(keyCode, time)
		vim:SendKeyEvent(true, keyCode, false, game)
		task.wait(time)
		vim:SendKeyEvent(false, keyCode, false, game)
		end
		hold(Enum.KeyCode.ButtonL1, 0.15)
	end

	function tweento(x, y, z)
		local New_CFrame = CFrame.new(x, y, z) --The Cord where you want to go
		local ts = game:GetService('TweenService')
		local char = game.Players.LocalPlayer.Character
		local part = char.HumanoidRootPart
		local ti = TweenInfo.new(1, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
		local tp = {CFrame = New_CFrame}
		ts:Create(part, ti, tp):Play()
	end

	function tweenpath(x, y, z)
		if pathfindmethod == false then
			modified = false
			local destination = Vector3.new(x, y, z) -- Replace with your desired destination
			local humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
			local humanoidRootPart = humanoid.RootPart

			-- Create path object
			local path = game:GetService("PathfindingService"):CreatePath()
			path:ComputeAsync(humanoidRootPart.Position, destination)

			local waypoints = path:GetWaypoints()
			for i, waypoint in ipairs(waypoints) do
				modifyxm3 = false
				modifyxp3 = false
				modifyzm3 = false
				modifyzp3 = false
				function collisioncheck()
					local hrd = game.Players.LocalPlayer.Character.HumanoidRootPart

					local rayparts = Instance.new("Folder", game.Workspace)
					rayparts.Name = "rayparts"

					local start = Instance.new("Part")
					start.Material = "Neon"
					start.Size = Vector3.new(0, 0, 0)
					start.Position = Vector3.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z)
					start.Anchored = true
					start.CanCollide = false
					start.Parent = rayparts
					start.Name = "start"

					local finish = Instance.new("Part")
					finish.Material = "Neon"
					finish.Size = Vector3.new(0, 0, 0)
					finish.Position = Vector3.new(waypoint.Position.x + 2, waypoint.Position.y + 4, waypoint.Position.z)
					finish.Anchored = true
					finish.CanCollide = false
					finish.Parent = rayparts
					finish.Name = "finish"
					
					local rayOrigin = start.Position
					local rayDestination = finish.Position
					local rayDirection = rayDestination - rayOrigin

					local ray = Ray.new(rayOrigin, rayDirection)

					local part = Workspace:FindPartOnRay(ray, finish)
					if part == nil then
						-- nothing
					elseif part.CanCollide and part.Parent.Name ~= game.Players.LocalPlayer.Name then
						local modifiedwp = PathWaypoint.new(waypoint.Position + Vector3.new(-3, 0, 0))
						modified = true
						modifyxm3 = true
					end
					-- next
					local hrd = game.Players.LocalPlayer.Character.HumanoidRootPart

					local rayparts = Instance.new("Folder", game.Workspace)
					rayparts.Name = "rayparts"

					local start = Instance.new("Part")
					start.Material = "Neon"
					start.Size = Vector3.new(0, 0, 0)
					start.Position = Vector3.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z)
					start.Anchored = true
					start.CanCollide = false
					start.Parent = rayparts
					start.Name = "start"

					local finish = Instance.new("Part")
					finish.Material = "Neon"
					finish.Size = Vector3.new(0, 0, 0)
					finish.Position = Vector3.new(waypoint.Position.x - 2, waypoint.Position.y + 4, waypoint.Position.z)
					finish.Anchored = true
					finish.CanCollide = false
					finish.Parent = rayparts
					finish.Name = "finish"

					local rayOrigin = start.Position
					local rayDestination = finish.Position
					local rayDirection = rayDestination - rayOrigin

					local ray = Ray.new(rayOrigin, rayDirection)

					local part = Workspace:FindPartOnRay(ray, finish)
					if part == nil then
						-- nothing
					elseif part.CanCollide and part.Parent.Name ~= game.Players.LocalPlayer.Name then
						local modifiedwp = PathWaypoint.new(waypoint.Position + Vector3.new(3, 0, 0))
						modified = true
						modifyxp3 = true
					end
					-- next
					
					local hrd = game.Players.LocalPlayer.Character.HumanoidRootPart

					local rayparts = Instance.new("Folder", game.Workspace)
					rayparts.Name = "rayparts"

					local start = Instance.new("Part")
					start.Material = "Neon"
					start.Size = Vector3.new(0, 0, 0)
					start.Position = Vector3.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z)
					start.Anchored = true
					start.CanCollide = false
					start.Parent = rayparts
					start.Name = "start"

					local finish = Instance.new("Part")
					finish.Material = "Neon"
					finish.Size = Vector3.new(0, 0, 0)
					finish.Position = Vector3.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z + 2)
					finish.Anchored = true
					finish.CanCollide = false
					finish.Parent = rayparts
					finish.Name = "finish"


					local rayOrigin = start.Position
					local rayDestination = finish.Position
					local rayDirection = rayDestination - rayOrigin

					local ray = Ray.new(rayOrigin, rayDirection)

					local part = Workspace:FindPartOnRay(ray, finish)
					if part == nil then
						-- nothing
					elseif part.CanCollide and part.Parent.Name ~= game.Players.LocalPlayer.Name  then
						local modifiedwp = PathWaypoint.new(waypoint.Position + Vector3.new(0, 0, -3))
						modified = true
						modifyzm3 = true
					end
					-- next
					
					local hrd = game.Players.LocalPlayer.Character.HumanoidRootPart

					local rayparts = Instance.new("Folder", game.Workspace)
					rayparts.Name = "rayparts"

					local start = Instance.new("Part")
					start.Material = "Neon"
					start.Size = Vector3.new(0, 0, 0)
					start.Position = Vector3.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z)
					start.Anchored = true
					start.CanCollide = false
					start.Parent = rayparts
					start.Name = "start"

					local finish = Instance.new("Part")
					finish.Material = "Neon"
					finish.Size = Vector3.new(0, 0, 0)
					finish.Position = Vector3.new(waypoint.Position.x, waypoint.Position.y + 6, waypoint.Position.z - 2)
					finish.Anchored = true
					finish.CanCollide = false
					finish.Parent = rayparts
					finish.Name = "finish"

					local rayOrigin = start.Position
					local rayDestination = finish.Position
					local rayDirection = rayDestination - rayOrigin

					local ray = Ray.new(rayOrigin, rayDirection)

					local part = Workspace:FindPartOnRay(ray, finish)
					if part == nil then
						-- nothing
					elseif part.CanCollide and part.Parent.Name ~= game.Players.LocalPlayer.Name then
						modifiedwp = PathWaypoint.new(waypoint.Position + Vector3.new(0, 0, 3))
						modified = true
						modifyzp3 = true
					end
				end
				collisioncheck()
				
				if modified then
					if modifyxm3 then
						local newCFrame = CFrame.new(waypoint.Position.x - 3, waypoint.Position.y, waypoint.Position.z)
						local tweenInfo = TweenInfo.new(
							0.05, -- Tween duration
							Enum.EasingStyle.Sine
						)
						local tween = game:GetService("TweenService"):Create(
							humanoidRootPart,
							tweenInfo,
							{CFrame = newCFrame}
						)
						tween:Play()
						tween.Completed:Wait()
					elseif modifyxp3 then
						local newCFrame = CFrame.new(waypoint.Position.x + 3, waypoint.Position.y, waypoint.Position.z)
						local tweenInfo = TweenInfo.new(
							0.05, -- Tween duration
							Enum.EasingStyle.Sine
						)
						local tween = game:GetService("TweenService"):Create(
							humanoidRootPart,
							tweenInfo,
							{CFrame = newCFrame}
						)
						tween:Play()
						tween.Completed:Wait()
					elseif modifyzm3 then
						local newCFrame = CFrame.new(waypoint.Position.x, waypoint.Position.y, waypoint.Position.z - 3)
						local tweenInfo = TweenInfo.new(
							0.05, -- Tween duration
							Enum.EasingStyle.Sine
						)
						local tween = game:GetService("TweenService"):Create(
							humanoidRootPart,
							tweenInfo,
							{CFrame = newCFrame}
						)
						tween:Play()
						tween.Completed:Wait()
					elseif modifyzp3 then
						local newCFrame = CFrame.new(waypoint.Position.x, waypoint.Position.y, waypoint.Position.z + 3)
						local tweenInfo = TweenInfo.new(
							0.05, -- Tween duration
							Enum.EasingStyle.Sine
						)
						local tween = game:GetService("TweenService"):Create(
							humanoidRootPart,
							tweenInfo,
							{CFrame = newCFrame}
						)
						tween:Play()
						tween.Completed:Wait()
					end
				else
					-- Tween to waypoint
					local newCFrame = CFrame.new(waypoint.Position.x, waypoint.Position.y + 3, waypoint.Position.z)
					local tweenInfo = TweenInfo.new(
						0.05, -- Tween duration
						Enum.EasingStyle.Sine
					)
					local tween = game:GetService("TweenService"):Create(
						humanoidRootPart,
						tweenInfo,
						{CFrame = newCFrame}
					)
					tween:Play()
					tween.Completed:Wait()
				end
			end
		else
			local destination = Vector3.new(x, y, z) -- Replace with your desired destination
			local humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
			local humanoidRootPart = humanoid.RootPart
			-- Create path object
			local path = game:GetService("PathfindingService"):CreatePath()
			path:ComputeAsync(humanoidRootPart.Position, destination)

			-- Get waypoints
			local waypoints = path:GetWaypoints()
			for i, waypoint in ipairs(waypoints) do
				modifyxm3 = false
				modifyxp3 = false
				modifyzm3 = false
				modifyzp3 = false
				function collisioncheck()
					local hrd = game.Players.LocalPlayer.Character.HumanoidRootPart

					local rayparts = Instance.new("Folder", game.Workspace)
					rayparts.Name = "rayparts"

					local start = Instance.new("Part")
					start.Material = "Neon"
					start.Size = Vector3.new(0, 0, 0)
					start.Position = Vector3.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z)
					start.Anchored = true
					start.CanCollide = false
					start.Parent = rayparts
					start.Name = "start"

					local finish = Instance.new("Part")
					finish.Material = "Neon"
					finish.Size = Vector3.new(0, 0, 0)
					finish.Position = Vector3.new(waypoint.Position.x + 2, waypoint.Position.y + 4, waypoint.Position.z)
					finish.Anchored = true
					finish.CanCollide = false
					finish.Parent = rayparts
					finish.Name = "finish"
					
					local rayOrigin = start.Position
					local rayDestination = finish.Position
					local rayDirection = rayDestination - rayOrigin

					local ray = Ray.new(rayOrigin, rayDirection)

					local part = Workspace:FindPartOnRay(ray, finish)
					if part == nil then
						-- nothing
					elseif part.CanCollide and part.Parent.Name ~= game.Players.LocalPlayer.Name then
						local modifiedwp = PathWaypoint.new(waypoint.Position + Vector3.new(-3, 0, 0))
						modified = true
						modifyxm3 = true
					end
					-- next
					local hrd = game.Players.LocalPlayer.Character.HumanoidRootPart

					local rayparts = Instance.new("Folder", game.Workspace)
					rayparts.Name = "rayparts"

					local start = Instance.new("Part")
					start.Material = "Neon"
					start.Size = Vector3.new(0, 0, 0)
					start.Position = Vector3.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z)
					start.Anchored = true
					start.CanCollide = false
					start.Parent = rayparts
					start.Name = "start"

					local finish = Instance.new("Part")
					finish.Material = "Neon"
					finish.Size = Vector3.new(0, 0, 0)
					finish.Position = Vector3.new(waypoint.Position.x - 2, waypoint.Position.y + 4, waypoint.Position.z)
					finish.Anchored = true
					finish.CanCollide = false
					finish.Parent = rayparts
					finish.Name = "finish"

					local rayOrigin = start.Position
					local rayDestination = finish.Position
					local rayDirection = rayDestination - rayOrigin

					local ray = Ray.new(rayOrigin, rayDirection)

					local part = Workspace:FindPartOnRay(ray, finish)
					if part == nil then
						-- nothing
					elseif part.CanCollide and part.Parent.Name ~= game.Players.LocalPlayer.Name then
						local modifiedwp = PathWaypoint.new(waypoint.Position + Vector3.new(3, 0, 0))
						modified = true
						modifyxp3 = true
					end
					-- next
					
					local hrd = game.Players.LocalPlayer.Character.HumanoidRootPart

					local rayparts = Instance.new("Folder", game.Workspace)
					rayparts.Name = "rayparts"

					local start = Instance.new("Part")
					start.Material = "Neon"
					start.Size = Vector3.new(0, 0, 0)
					start.Position = Vector3.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z)
					start.Anchored = true
					start.CanCollide = false
					start.Parent = rayparts
					start.Name = "start"

					local finish = Instance.new("Part")
					finish.Material = "Neon"
					finish.Size = Vector3.new(0, 0, 0)
					finish.Position = Vector3.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z + 2)
					finish.Anchored = true
					finish.CanCollide = false
					finish.Parent = rayparts
					finish.Name = "finish"


					local rayOrigin = start.Position
					local rayDestination = finish.Position
					local rayDirection = rayDestination - rayOrigin

					local ray = Ray.new(rayOrigin, rayDirection)

					local part = Workspace:FindPartOnRay(ray, finish)
					if part == nil then
						-- nothing
					elseif part.CanCollide and part.Parent.Name ~= game.Players.LocalPlayer.Name  then
						local modifiedwp = PathWaypoint.new(waypoint.Position + Vector3.new(0, 0, -3))
						modified = true
						modifyzm3 = true
					end
					-- next
					
					local hrd = game.Players.LocalPlayer.Character.HumanoidRootPart

					local rayparts = Instance.new("Folder", game.Workspace)
					rayparts.Name = "rayparts"

					local start = Instance.new("Part")
					start.Material = "Neon"
					start.Size = Vector3.new(0, 0, 0)
					start.Position = Vector3.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z)
					start.Anchored = true
					start.CanCollide = false
					start.Parent = rayparts
					start.Name = "start"

					local finish = Instance.new("Part")
					finish.Material = "Neon"
					finish.Size = Vector3.new(0, 0, 0)
					finish.Position = Vector3.new(waypoint.Position.x, waypoint.Position.y + 6, waypoint.Position.z - 2)
					finish.Anchored = true
					finish.CanCollide = false
					finish.Parent = rayparts
					finish.Name = "finish"

					local rayOrigin = start.Position
					local rayDestination = finish.Position
					local rayDirection = rayDestination - rayOrigin

					local ray = Ray.new(rayOrigin, rayDirection)

					local part = Workspace:FindPartOnRay(ray, finish)
					if part == nil then
						-- nothing
					elseif part.CanCollide and part.Parent.Name ~= game.Players.LocalPlayer.Name then
						modifiedwp = PathWaypoint.new(waypoint.Position + Vector3.new(0, 0, 3))
						modified = true
						modifyzp3 = true
					end
				end
				collisioncheck()

				if modified then
					if modifyxm3 then
						local newCFrame = CFrame.new(waypoint.Position.x - 3, waypoint.Position.y + 4, waypoint.Position.z)
						local tweenInfo = TweenInfo.new(
							pathfindtime, -- Tween duration
							Enum.EasingStyle.Sine
						)
						local tween = game:GetService("TweenService"):Create(
							humanoidRootPart,
							tweenInfo,
							{CFrame = newCFrame}
						)
						tween:Play()
						tween.Completed:Wait()
					elseif modifyxp3 then
						local newCFrame = CFrame.new(waypoint.Position.x + 3, waypoint.Position.y + 4, waypoint.Position.z)
						local tweenInfo = TweenInfo.new(
							pathfindtime, -- Tween duration
							Enum.EasingStyle.Sine
						)
						local tween = game:GetService("TweenService"):Create(
							humanoidRootPart,
							tweenInfo,
							{CFrame = newCFrame}
						)
						tween:Play()
						tween.Completed:Wait()
					elseif modifyzm3 then
						local newCFrame = CFrame.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z - 3)
						local tweenInfo = TweenInfo.new(
							pathfindtime, -- Tween duration
							Enum.EasingStyle.Sine
						)
						local tween = game:GetService("TweenService"):Create(
							humanoidRootPart,
							tweenInfo,
							{CFrame = newCFrame}
						)
						tween:Play()
						tween.Completed:Wait()
					elseif modifyzp3 then
						local newCFrame = CFrame.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z + 3)
						local tweenInfo = TweenInfo.new(
							pathfindtime, -- Tween duration
							Enum.EasingStyle.Sine
						)
						local tween = game:GetService("TweenService"):Create(
							humanoidRootPart,
							tweenInfo,
							{CFrame = newCFrame}
						)
						tween:Play()
						tween.Completed:Wait()
					end
				else
					local newCFrame = CFrame.new(waypoint.Position.x, waypoint.Position.y + 4, waypoint.Position.z)
					local tweenInfo = TweenInfo.new(
						pathfindtime, -- Tween duration
						Enum.EasingStyle.Sine
					)
					local tween = game:GetService("TweenService"):Create(
						humanoidRootPart,
						tweenInfo,
						{CFrame = newCFrame}
					)
					tween:Play()
					tween.Completed:Wait()
				end
			end
		end
	end
	function fulltp(x, y, z)
		if playertp then
			tpdone(x, y, z)
		elseif cartp then
			cartpdone(x, y, z)
		end
	end
	-- End of Functions --
	local moderatorcount = 0
	for i, v in pairs(_G.madcitymods) do
		moderatorcount = moderatorcount + 1
	end
	mc2 = 1
	detected = false
	for i, v in pairs(game.Players:GetPlayers()) do
		if _G.madcitymods["m" .. mc2] == nil then
			break
		else
			if not detected then
				if v.Name == _G.madcitymods["m" .. mc2] then
					if _G.detectedoption == "Kick" then
						detected = true
						game.Players.LocalPlayer:Kick("Ruby Hub - Mod Detected.")
					elseif _G.detectedoption == "Serverhop" then
						detected = true
						rejoining = true
						cmdlp = game.Players.LocalPlayer
						local Decision = "any"
						local GUIDs = {}
						local maxPlayers = 0
						local pagesToSearch = 100
						if Decision == "fast" then pagesToSearch = 5 end
						local Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="))
						for i = 1,pagesToSearch do
							for i,v in pairs(Http.data) do
								if v.playing ~= v.maxPlayers and v.id ~= game.JobId then
									maxPlayers = v.maxPlayers
									table.insert(GUIDs, {id = v.id, users = v.playing})
								end
							end
							if Http.nextPageCursor ~= null then Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..Http.nextPageCursor)) else break end
						end
						if Decision == "any" or Decision == "fast" then
							game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[math.random(1,#GUIDs)].id, cmdlp)
						elseif Decision == "smallest" then
							game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[#GUIDs].id, cmdlp)
						elseif Decision == "largest" then
							game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[1].id, cmdlp)
						else
							print("")
						end
						wait(3)
						rejoining = false
					elseif _G.detectedoption == "UseRubyHub" then
						detected = true
						--use ruby hub lmao
					end
				else
					mc2 = mc2 + 1
				end
			end
		end
	end
	
	ModifiedName = "Ruby Hub Free"
	if premium and ownsgamepass then
		ModifiedName = "Ruby Hub Premium"
	else
		ModifiedName = "Ruby Hub Free"
	end
	local Window = Rayfield:CreateWindow({
	Name = ModifiedName,
	LoadingTitle = "Ruby Hub",
	LoadingSubtitle = 'by ! "Deni210#8309 & Nordbergdk#1684, tested by Doom',
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
	local TeamSection = MainTab:CreateSection("Teams")
	local PrisonerTeam = MainTab:CreateButton({
	   Name = "Switch to Prisoners",
	   Callback = function()
			game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("RequestTeamChange","Prisoners")
	   end,
	})
	
	local PoliceTeam = MainTab:CreateButton({
	   Name = "Switch to Police",
	   Callback = function()
			game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("RequestTeamChange","Police")
	   end,
	})
	
	local HeroTeam = MainTab:CreateButton({
	   Name = "Switch to Heroes",
	   Callback = function()
			game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("RequestTeamChange","Heroes")
	   end,
	})
	
	local MainSection = MainTab:CreateSection("Main")
	
	local NoCooldown = MainTab:CreateButton({
	   Name = "No E Cooldown",
	   Callback = function()
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "ID") and rawget(v, "Seconds") then
					if typeof(v.Seconds) == "number" then
						rawset(v, "Seconds", 0.001) -- setting it to 0 will not work because the game checks that.
					end
				end
			end
	   end,
	})
	local cooldowne = MainTab:CreateSlider({
	   Name = "Cooldown for E",
	   Range = {0.001, 10000},
	   Suffix = "ms",
	   Increment = 1,
	   CurrentValue = 5,
	   Flag = "ecooldown", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "ID") and rawget(v, "Seconds") then
					if typeof(v.Seconds) == "number" then
						rawset(v, "Seconds", Value) -- setting it to 0 will not work because the game checks that.
					end
				end
			end
	   end,
	})
	local DestroyLasers = MainTab:CreateButton({
	   Name = "Destroy All Lasers",
	   Callback = function()
			function destroylasers()
				for i, v in pairs(game:GetDescendants()) do
					if v.Name == "MovingLasers" or v.Name == "Laser" or v.Name == "GreenLaser" or v.Name == "GreenLasers" or v.Name == "Lasers" or v.Name == "VaultLasers" or v.Name == "NightLaser" or v.Name == "LaserDoor" or v.Name == "Lava" then
						v:Destroy()
					end
				end
				lasersdestroyed = true
				notify("Lasers Destroyed!", 7)
			end
			destroylasers()
	   end,
	})
	
	local DestroyLasers = MainTab:CreateButton({
	   Name = "ServerHop",
	   Callback = function()
			rejoining = true
			local Decision = "any"
			local GUIDs = {}
			local maxPlayers = 0
			local pagesToSearch = 100
			if Decision == "fast" then pagesToSearch = 5 end
			local Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="))
			for i = 1,pagesToSearch do
				for i,v in pairs(Http.data) do
					if v.playing ~= v.maxPlayers and v.id ~= game.JobId then
						maxPlayers = v.maxPlayers
						table.insert(GUIDs, {id = v.id, users = v.playing})
					end
				end
				if Http.nextPageCursor ~= null then Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..Http.nextPageCursor)) else break end
			end
			if Decision == "any" or Decision == "fast" then
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[math.random(1,#GUIDs)].id, cmdlp)
			elseif Decision == "smallest" then
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[#GUIDs].id, cmdlp)
			elseif Decision == "largest" then
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[1].id, cmdlp)
			else
				print("")
			end
			wait(3)
			rejoining = false
	   end,
	})
	
	local ModsTab = Window:CreateTab("Mods")
	local ModsSection = ModsTab:CreateSection("Mods")
	
	local GunMods = ModsTab:CreateButton({
	   Name = "Mod Guns",
	   Callback = function()
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Damage") then
					rawset(v, "RateOfFire", 0) -- firerate
					rawset(v, "ReloadTime", 0) -- ReloadTime 
					rawset(v, "ClipSize", math.huge) -- inf ammo only works on shotguns etc (math.huge or 0 etc) MaxAmmo
					rawset(v, "MinAccuracy", 0) 
					rawset(v, "MaxAccuracy", 0)
					rawset(v, "Range", math.huge) -- gun range (serversided)
					rawset(v, "Clips", math.huge) -- Ammo
				end
			end
	   end,
	})
	
	local CarMods = ModsTab:CreateButton({
	   Name = "Mod Car",
	   Callback = function()
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "MaxSpeed") then
					rawset(v, "TurretFireRate", 0.3) -- turret firerate on all vehicles
					rawset(v, "MaxSpeed", 300) -- speed
					rawset(v, "HoverHitWater", true) -- dont change
					rawset(v, "CanTurnHoverMode", true) -- can hover (Y is the keybind)
					rawset(v, "StartTime", 0.04) --vehicle start time
				end
			end
	   end,
	})
	
	local InfiniteNitro = ModsTab:CreateButton({
	   Name = "Infinite Nitro",
	   Callback = function()
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "BoostRegenPerSecond") then
					rawset(v, "BoostRegenPerSecond", 5000)
				end
			end
	   end,
	})
	
	local NoMissileCooldown = ModsTab:CreateButton({
	   Name = "No Missile Cooldown",
	   Callback = function()
			notify("WARNING: YOU WILL GET KICKED IF YOU USE LONGER THAN 2 SECONDS. Btw, if you see this, you're awesome xD")
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Missiles") then
					v.MissileCooldown = 0.1 --cooldown (works on buzzard)
					v.MissileTargetRange = 2000 --range
					v.MissileLock = 0.1 -- missile locking time
				end
			end
	   end,
	})
	local ModsSection = ModsTab:CreateSection("Customization")
	local info = ModsTab:CreateLabel("A lot of Customization.")
	local GunsSection = ModsTab:CreateSection("Guns")
	local antirecoil = ModsTab:CreateButton({
	   Name = "AutoFireMode",
	   Callback = function()
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Damage") then
					rawset(v, "FireMode", "Auto")
				end
			end
	   end,
	})
	local antirecoil = ModsTab:CreateButton({
	   Name = "Anti Recoil",
	   Callback = function()
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Damage") then
					rawset(v, "MinAccuracy", 1) 
					rawset(v, "MaxAccuracy", 1)
				end
			end
	   end,
	})
	local firerate = ModsTab:CreateSlider({
	   Name = "Gun Firerate",
	   Range = {0, 3},
	   Increment = 0.01,
	   CurrentValue = 0.01,
	   Flag = "frate", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Damage") then
					rawset(v, "RateOfFire", Value) -- firerate
				end
			end
	   end,
	})
	
	local reloadtime = ModsTab:CreateSlider({
	   Name = "Gun Reloadtime",
	   Range = {0, 10},
	   Suffix = "s",
	   Increment = 1,
	   CurrentValue = 0,
	   Flag = "reload", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Damage") then
					rawset(v, "ReloadTime", Value) -- firerate
				end
			end
	   end,
	})
	
	local reloadtime = ModsTab:CreateSlider({
	   Name = "Gun Maximum Ammo",
	   Range = {0, 100000},
	   Increment = 100,
	   CurrentValue = 0,
	   Flag = "ammo", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Damage") then
					rawset(v, "ClipSize", Value) -- firerate
				end
			end
	   end,
	})
	
	local minaccuracy = ModsTab:CreateSlider({
	   Name = "Gun Minimum Accuracy",
	   Range = {0, 100},
	   Increment = 1,
	   CurrentValue = 0,
	   Flag = "accmin", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Damage") then
					rawset(v, "MinAccuracy", Value) -- firerate
				end
			end
	   end,
	})
	
	local maxaccuracy = ModsTab:CreateSlider({
	   Name = "Gun Maximum Accuracy",
	   Range = {0, 100},
	   Increment = 1,
	   CurrentValue = 0,
	   Flag = "accmax", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Damage") then
					rawset(v, "MaxAccuracy", Value) -- firerate
				end
			end
	   end,
	})
	
	local gunrange = ModsTab:CreateSlider({
	   Name = "Gun Range",
	   Range = {0, 1000000},
	   Increment = 100,
	   CurrentValue = 0,
	   Flag = "grange", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Damage") then
					rawset(v, "Range", Value) -- firerate
				end
			end
	   end,
	})
	
	local gunammo = ModsTab:CreateSlider({
	   Name = "Gun Ammo",
	   Range = {0, 1000000},
	   Increment = 1,
	   CurrentValue = 0,
	   Flag = "ga", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Damage") then
					rawset(v, "Clips", Value) -- firerate
				end
			end
	   end,
	})
	local sep = ModsTab:CreateLabel("Vehicles")
	local Hover = ModsTab:CreateButton({
	   Name = "Enable Hovermode (Y/Z Keybind)",
	   Callback = function()
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "MaxSpeed") then
					rawset(v, "HoverHitWater", true) -- dont change
					rawset(v, "CanTurnHoverMode", true) -- can hover (Y is the keybind)
				end
			end
	   end,
	})
	
	local VehicleSpeed = ModsTab:CreateSlider({
	   Name = "Max Vehicle Speed",
	   Range = {1, 100000},
	   Increment = 100,
	   CurrentValue = 300,
	   Flag = "vehiclespeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "MaxSpeed") then
					rawset(v, "MaxSpeed", Value)
				end
			end
	   end,
	})
	
	local VehicleStart = ModsTab:CreateSlider({
	   Name = "Vehicle Start Time",
	   Range = {0.1, 10},
	   Suffix = "s",
	   Increment = 0.1,
	   CurrentValue = 1,
	   Flag = "vehiclestart", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "MaxSpeed") then
					rawset(v, "StartTime", Value)
				end
			end
	   end,
	})
	local flyvehiclesection = ModsTab:CreateSection("Flying Vehicles")
	local jetmaxspeed = ModsTab:CreateSlider({
	   Name = "Max Speed",
	   Range = {1, 100000},
	   Increment = 100,
	   CurrentValue = 300,
	   Flag = "maxspeedfly", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "MaxSpeed") then
					rawset(v, "MaxSpeed", Value)
				end
			end
	   end,
	})
	local jetacceleration = ModsTab:CreateSlider({
	   Name = "Jet Acceleration",
	   Range = {1, 100000},
	   Increment = 100,
	   CurrentValue = 300,
	   Flag = "maxacceleration", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "JetAcceleration") then
					rawset(v, "JetAcceleration", Value)
				end
			end
	   end,
	})
	
	local jetmaxturnspeed = ModsTab:CreateSlider({
	   Name = "Jet Max Turn Speed",
	   Range = {1, 50000},
	   Increment = 100,
	   CurrentValue = 300,
	   Flag = "maxturnspeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "JetMaxTurnSpeed") then
					rawset(v, "JetMaxTurnSpeed", Value)
				end
			end
	   end,
	})
	
	local jetturnacceleration = ModsTab:CreateSlider({
	   Name = "Jet Turn Acceleration",
	   Range = {1, 50000},
	   Increment = 100,
	   CurrentValue = 300,
	   Flag = "maxacceleration", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "JetTurnAccel") then
					rawset(v, "JetTurnAccel", Value)
				end
			end
	   end,
	})
	
	local helicopteracceleration = ModsTab:CreateSlider({
	   Name = "Helicopter Acceleration",
	   Range = {1, 50000},
	   Increment = 100,
	   CurrentValue = 300,
	   Flag = "heliaccel", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Acceleration") then
					rawset(v, "Acceleration", Value)
				end
			end
	   end,
	})
	
	local helicopterdeceleration = ModsTab:CreateSlider({
	   Name = "Helicopter Deceleration",
	   Range = {1, 50000},
	   Increment = 100,
	   CurrentValue = 300,
	   Flag = "helidecel", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "Deceleration") then
					rawset(v, "Deceleration", Value)
				end
			end
	   end,
	})
	
	local helicopterspeeddecay = ModsTab:CreateSlider({
	   Name = "Helicopter Speeddecay",
	   Range = {1, 50000},
	   Increment = 100,
	   CurrentValue = 300,
	   Flag = "helispeeddecay", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "SpeedDecay") then
					rawset(v, "SpeedDecay", Value)
				end
			end
	   end,
	})
	
	local helicopterbrakeforce = ModsTab:CreateSlider({
	   Name = "Helicopter Brake Force",
	   Range = {1, 100},
	   Increment = 1,
	   CurrentValue = 1,
	   Flag = "helibrakeforce", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "BrakeForce") then
					rawset(v, "BrakeForce", Value)
				end
			end
	   end,
	})
	
	local helicoptermaxaltitude = ModsTab:CreateSlider({
	   Name = "Helicopter Maximum Altitude",
	   Range = {1, 100},
	   Increment = 1,
	   CurrentValue = 1,
	   Flag = "helimaxalt", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "MaxAltitude") then
					rawset(v, "MaxAltitude", Value)
				end
			end
	   end,
	})
	
	local heliascent = ModsTab:CreateSlider({
	   Name = "Helicopter Ascent Speed",
	   Range = {1, 100},
	   Increment = 1,
	   CurrentValue = 1,
	   Flag = "heliascent", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "AscentSpeed") then
					rawset(v, "AscentSpeed", Value)
				end
			end
	   end,
	})
	
	local helidescent = ModsTab:CreateSlider({
	   Name = "Helicopter Descent Speed",
	   Range = {1, 100},
	   Increment = 1,
	   CurrentValue = 1,
	   Flag = "helidescent", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "DescentSpeed") then
					rawset(v, "DescentSpeed", Value)
				end
			end
	   end,
	})
	
	local helivtilt = ModsTab:CreateSlider({
	   Name = "Helicopter Maximum Vertical Tilt Angle",
	   Range = {1, 360},
	   Increment = 1,
	   CurrentValue = 1,
	   Flag = "helivtilt", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "MaxVerticalTiltAngle") then
					rawset(v, "MaxVerticalTiltAngle", Value)
				end
			end
	   end,
	})
	
	local helivtiltspeed = ModsTab:CreateSlider({
	   Name = "Helicopter Vertical Tilt Speed",
	   Range = {1, 1000},
	   Increment = 1,
	   CurrentValue = 1,
	   Flag = "helivtiltspeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "VerticalTiltSpeed") then
					rawset(v, "VerticalTiltSpeed", Value)
				end
			end
	   end,
	})
	
	local helihorrotspeed = ModsTab:CreateSlider({
	   Name = "Helicopter Horizontal Rotation Speed",
	   Range = {1, 1000},
	   Increment = 1,
	   CurrentValue = 1,
	   Flag = "helihorrotspeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "HorizontalRotationSpeed") then
					rawset(v, "HorizontalRotationSpeed", Value)
				end
			end
	   end,
	})
	
	local heliresponsespeed = ModsTab:CreateSlider({
	   Name = "Helicopter Response Speed",
	   Range = {0.01, 2},
	   Increment = 0.01,
	   CurrentValue = 0.01,
	   Flag = "heliresponsespeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "ResponseSpeed") then
					rawset(v, "ResponseSpeed", Value)
				end
			end
	   end,
	})
	
	local helimaxsidetilt = ModsTab:CreateSlider({
	   Name = "Helicopter Max Side Tilt",
	   Range = {1, 360},
	   Increment = 1,
	   CurrentValue = 1,
	   Flag = "heliresponsespeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "MaxSideTilt") then
					rawset(v, "MaxSideTilt", Value)
				end
			end
	   end,
	})
	
	local heliminheightabove = ModsTab:CreateSlider({
	   Name = "Helicopter Min height above ground",
	   Range = {1, 360},
	   Increment = 1,
	   CurrentValue = 1,
	   Flag = "heliminheightabove", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "MinHeightAboveGround") then
					rawset(v, "MinHeightAboveGround", Value)
				end
			end
	   end,
	})
	
	local missilecooldown = ModsTab:CreateSlider({
	   Name = "Missile Cooldown",
	   Range = {0.01, 2},
	   Increment = 0.01,
	   CurrentValue = 0.01,
	   Flag = "missilecooldown", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "MissileCooldown") then
					rawset(v, "MissileCooldown", Value)
				end
			end
	   end,
	})
	
	local missilelock = ModsTab:CreateSlider({
	   Name = "Missile Lock",
	   Range = {1, 50},
	   Increment = 1,
	   CurrentValue = 1,
	   Flag = "MissileLock", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			for i,v in next, getgc(true) do
				if type(v) == "table" and rawget(v, "MissileLock") then
					rawset(v, "MissileLock", Value)
				end
			end
	   end,
	})
	
	
	local PlayerTab = Window:CreateTab("Player")
	local PlayerSection = PlayerTab:CreateSection("Player")
	
	local Fly = PlayerTab:CreateButton({
	   Name = "Fly (F) Car & Player",
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
	
	local FlySpeed = PlayerTab:CreateSlider({
	   Name = "Fly Speed",
	   Range = {1, 50},
	   Increment = 1,
	   CurrentValue = 6,
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
			speed = Value
	   end,
	})
	local togglewalkspeed = PlayerTab:CreateButton({
	   Name = "Toggle Walkspeed",
	   Callback = function()
			walkspeedenabled = not walkspeedenabled
			while true do
				if walkspeedenabled then
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
				end
				wait()
			end
	   end,
	})
	local UserInputService = game:GetService("UserInputService")
	local WalkSpeed = PlayerTab:CreateSlider({
	   Name = "Shift WalkSpeed",
	   Range = {0, 500},
	   Increment = 2,
	   CurrentValue = 16,
	   Flag = "WalkSpeed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			shiftspeed = Value
	   end,
	})
	local stop = false
	local infinitejump = PlayerTab:CreateButton({
	   Name = "Toggle Shift WalkSpeed",
	   Callback = function()
			shiftwalkspeed = not shiftwalkspeed
			local ContextActionService = game:GetService("ContextActionService")
			local mouse = game.Players.LocalPlayer:GetMouse()
			ContextActionService:UnbindAction("MouseLockSwitchAction")
			mouse.KeyDown:Connect(function(key)
				if key == "0" then
					stop = false
					while true do
						if not stop and shiftwalkspeed then
							game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 500
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
	
	local infinitejump = PlayerTab:CreateButton({
	   Name = "Toggle Infinite Jump",
	   Callback = function()
			infinijump = not infinijump
			if infinijump then
				infj = uis.JumpRequest:Connect(function()
					game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
				end)
			else
				infj:Disconnect()
			end
	   end,
	})
	
	local infinitejump = PlayerTab:CreateButton({
	   Name = "ForceField Body",
	   Callback = function()
			for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("MeshPart") or v:IsA("Part") then
					v.Material = Enum.Material.ForceField
				end
			end
	   end,
	})
	
	local combat = PlayerTab:CreateSection("Combat/Visual")
	
	local SilentAim = PlayerTab:CreateButton({
	   Name = "Silent Aim",
	   Callback = function()
			getgenv().fov = 2100 -- Field of View: The silent aim is only targetted at the target inside the fov's radius.
			getgenv().bodypart = "Torso" -- Targetting: "Head", "Torso". For example: Using "Head" will only deal headshots.
			loadstring(game:HttpGet('https://raw.githubusercontent.com/Cesare0328/my-scripts/main/SAMCH2', true))()
	   end,
	})
	
	local ESP = PlayerTab:CreateButton({
	   Name = "ESP",
	   Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Deni210/require/main/customesp", true))()
	   end,
	})
	
	-- End of Player Section
	
	local TeleportsTab = Window:CreateTab("Teleports")
	local TeleportSection = TeleportsTab:CreateSection("Teleports")
	local escapepris = TeleportsTab:CreateButton({
	   Name = "Escape Prison (Pathfind)",
	   Callback = function()
			stop = false
			useregion3 = false
			failedtimes = 0
			local function pathfindtoescape()
				if not stop then
					tweenpath(-4168.2, 61.2, 1299.6)
					wait(0.7)
					if useregion3 then
						region = Region3.new(Vector3.new(-4252.271484375, 59.07221984863281, 1278.21728515625), Vector3.new(-4116.03515625, 65.12169647216797, 1320.629638671875))
						for _, part in pairs(workspace:FindPartsInRegion3(region, nil, math.huge)) do
							local character = nil
							
							if part.Parent:FindFirstChild("Humanoid") then
								character = part.Parent
							elseif part.Parent.Parent:FindFirstChild("Humanoid") then
								character = part.Parent.Parent
							end
							
							if character then
								local player = game.Players:GetPlayerFromCharacter(character)
								if player.Name == game.Players.LocalPlayer.Name then
									x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
									y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
									z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
									local New_CFrame = CFrame.new(x, y+100, z) --The Cord where you want to go
									local ts = game:GetService('TweenService')
									local char = game.Players.LocalPlayer.Character
									local part = char.HumanoidRootPart
									local ti = TweenInfo.new(0.1, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
									local tp = {CFrame = New_CFrame}
									ts:Create(part, ti, tp):Play()
									wait(0.06)
									y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
									local New_CFrame = CFrame.new(-3636.3, y, 1295.94) --The Cord where you want to go
									local ts = game:GetService('TweenService')
									local char = game.Players.LocalPlayer.Character
									local part = char.HumanoidRootPart
									local ti = TweenInfo.new(0.1, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
									local tp = {CFrame = New_CFrame}
									ts:Create(part, ti, tp):Play()
									wait(0.06)
									local New_CFrame = CFrame.new(-3636.3, 19, 1295.94) --The Cord where you want to go
									local ts = game:GetService('TweenService')
									local char = game.Players.LocalPlayer.Character
									local part = char.HumanoidRootPart
									local ti = TweenInfo.new(0.1, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
									local tp = {CFrame = New_CFrame}
									ts:Create(part, ti, tp):Play()
								else
									if modified then
										pathfindtoescape()
									else
										failedtimes = failedtimes + 1
										if failedtimes >= 5 then
											print("failed 5 times. stopping.")
											stop = true
										end
										if failedtimes >= 3 then
											useregion3 = true
										end
										wait(0.1)
										game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y + 1.86, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z)
										wait(0.2)
										pathfindtoescape()
									end
								end
							end
						end
					else
						local hrd = game.Players.LocalPlayer.Character.HumanoidRootPart

						local rayparts = Instance.new("Folder", game.Workspace)
						rayparts.Name = "rayparts"

						local start = Instance.new("Part")
						start.Material = "Neon"
						start.Size = Vector3.new(0, 0, 0)
						start.Position = Vector3.new(-4168, 60.2, 1299)
						start.Anchored = true
						start.CanCollide = false
						start.Parent = rayparts
						start.Name = "start"

						local finish = Instance.new("Part")
						finish.Material = "Neon"
						finish.Size = Vector3.new(0, 0, 0)
						finish.Position = Vector3.new(-4168.4, 63.2, 1300.2)
						finish.Anchored = true
						finish.CanCollide = false
						finish.Parent = rayparts
						finish.Name = "finish"
					
						local a = start.Position
						local b = finish.Position
						local direction = b - a
						local directionpart = Instance.new("Part")
						local ray = Workspace:Raycast(a, direction)
						if ray then
							if ray.Instance.Parent:FindFirstChild("Humanoid") then
								local char = ray.Instance.Parent
								local plr = game.Players:GetPlayerFromCharacter(char)
								if plr then
									x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
									y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
									z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
									local New_CFrame = CFrame.new(x, y+100, z) --The Cord where you want to go
									local ts = game:GetService('TweenService')
									local char = game.Players.LocalPlayer.Character
									local part = char.HumanoidRootPart
									local ti = TweenInfo.new(1, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
									local tp = {CFrame = New_CFrame}
									ts:Create(part, ti, tp):Play()
									wait(0.8)
									y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
									local New_CFrame = CFrame.new(-3636.3, y, 1295.94) --The Cord where you want to go
									local ts = game:GetService('TweenService')
									local char = game.Players.LocalPlayer.Character
									local part = char.HumanoidRootPart
									local ti = TweenInfo.new(1, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
									local tp = {CFrame = New_CFrame}
									ts:Create(part, ti, tp):Play()
									wait(1)
									local New_CFrame = CFrame.new(-3636.3, 19, 1295.94) --The Cord where you want to go
									local ts = game:GetService('TweenService')
									local char = game.Players.LocalPlayer.Character
									local part = char.HumanoidRootPart
									local ti = TweenInfo.new(1, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
									local tp = {CFrame = New_CFrame}
									ts:Create(part, ti, tp):Play()
								end
							else
								if modified then
									pathfindtoescape()
								else
									failedtimes = failedtimes + 1
									if failedtimes >= 5 then
										print("failed 5 times. stopping.")
										stop = true
									end
									if failedtimes >= 3 then
										useregion3 = true
									end
									wait(0.1)
									game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y + 1.86, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z)
									wait(0.2)
									pathfindtoescape()
								end
							end
						else
							if modified then
								pathfindtoescape()
							else
								failedtimes = failedtimes + 1
								if failedtimes >= 5 then
									print("failed 5 times. stopping.")
									stop = true
								end
								if failedtimes >= 3 then
									useregion3 = true
								end
								wait(0.1)
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y + 1.86, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z)
								wait(0.2)
								pathfindtoescape()
							end
						end
						rayparts:Destroy()
					end
				end
			end
			pathfindtoescape()
	   end,
	})
	
	--[[
	local escapepris = TeleportsTab:CreateButton({
	   Name = "Escape Prison (Pyramid Method)",
	   Callback = function()
			local somepos = game:GetService("ReplicatedStorage").Assets.Heists.Pyramid.HeistZones.Pyramid.CFrame
			local PyramidAudioSoundTrack = game:GetService("SoundService").Ambients.HEIST_Pyramid
			local success = false
			local t = 0
			local hb = game:GetService("RunService").Heartbeat:Connect(function()
			if game.Players.LocalPlayer.Team.Name == "Prisoners" then
				if not success then
					if t == 600 then task.wait(3.6); t = 0; else game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(somepos.x, somepos.y, somepos.z); game:GetService("ReplicatedStorage").Remote.RemoteEvent:FireServer("AbortHeistDueToUIButton"); t += 1 end
				end
			else
				success = true
			end
		end)
	   end,
	})
	]]
	--44.799110412597656, 30.7789306640625, -61.82960891723633
	--[[local escapepriscrim = TeleportsTab:CreateButton({
	   Name = "Escape Prison (Criminal Instant)",
	   Callback = function()
			local hb = game:GetService("RunService").Heartbeat:Connect(function()
				if game.Players.LocalPlayer.Team.Name == "Prisoners" then
					if not success then
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(44.799110412597656, 30.7789306640625, -61.82960891723633)
						keypress(0x45)
						task.wait(0.01)
						keyrelease(0x45)
					end
				else
					success = true
				end
			end)
	   end,
	})
	]]
	local PlayerTP = TeleportsTab:CreateInput({
	   Name = "Teleport to Player",
	   PlaceholderText = "Player Name",
	   RemoveTextAfterFocusLost = false,
	   Callback = function(Player)
			playerpos = game.Workspace[Player]:GetPivot()
			if cartp then
				cartpdone(playerpos.Position.x, playerpos.Position.y, playerpos.Position.z)
			else
				tpdone(playerpos.Position.x, playerpos.Position.y, playerpos.Position.z)
			end
	   end,
	})
	local TeleportDropdown = TeleportsTab:CreateDropdown({
		Name = "Teleports",
		Options = {"Teleport to Criminal Base", "Teleport to Prison", "Teleport to Pyramid", "Teleport to Bank", "Teleport to Casino", "Teleport to Club", "Teleport to Jewelry", "Teleport to Airport", "Teleport to Weapon Shop", "Teleport to Garage 1", "Teleport to Garage 2"},
		CurrentOption = "Option 1",
		MultiSelection = false,
		Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		Callback = function(Option)
			if Option == "Teleport to Criminal Base" then
				fulltp(36, 40, -144)
			elseif Option == "Teleport to Prison" then
				fulltp(-4123, 75, 1352.38)
			elseif Option == "Teleport to Pyramid" then
				fulltp(-3087, 169, -615)
			elseif Option == "Teleport to Bank" then
				fulltp(622, 70, 471.4)
			elseif Option == "Teleport to Casino" then
				fulltp(1723, 41, 916)
			elseif Option == "Teleport to Club" then
				fulltp(1685, 81, -1215)
			elseif Option == "Teleport to Jewelry" then
				fulltp(-226, 150, 714)
			elseif Option == "Teleport to Airport" then
				fulltp(945, 64, 2732)
			elseif Option == "Teleport to Weapon Shop" then
				fulltp(845, 39, -1047)
			elseif Option == "Teleport to Garage 1" then
				fulltp(-1329, 33, 2387)
			elseif Option == "Teleport to Garage 2" then
				tpdone(-2142.4, 10.7, 845.7)
				task.wait(0.1
				tweentime(-2050.4, 20, 961.3, 0.32)
				wait(0.3)
				tweentime(-2366.7, 59, 1191.8, 0.32)
				wait(0.3)
				tweentime(-2400, 11, 1066.9, 0.32)
			end
		end,
	})
	
	local TeleportSettingsTab = Window:CreateTab("Teleport Settings")
	local TeleportSettingsSection = TeleportSettingsTab:CreateSection("Settings")
	
	local TPMethod = TeleportSettingsTab:CreateLabel("Teleport Method: Player Teleport")
	
	local UseCarTP = TeleportSettingsTab:CreateButton({
	   Name = "Use Car Teleport Method",
	   Callback = function()
			playertp = false
			cartp = true
			TPMethod:Set("Teleport Method: Car Teleport")
	   end,
	})
	
	local UsePlayerTP = TeleportSettingsTab:CreateButton({
	   Name = "Use Player Teleport Method",
	   Callback = function()
			playertp = true
			cartp = false
			TPMethod:Set("Teleport Method: Player Teleport")
	   end,
	})
	local carsettings = TeleportSettingsTab:CreateLabel("Player TP Settings")
	local recommended = TeleportSettingsTab:CreateLabel("Recommended: Down: 3000. Until: 30000")
	local waituntil = TeleportSettingsTab:CreateLabel("Wait until going Down/Until means how long it waits until it does the teleport.")
	local recommendedwait = TeleportSettingsTab:CreateLabel("Recommended Wait: Down: 200ms. Until: 1000ms")

	local playerwaitdown = TeleportSettingsTab:CreateSlider({
	   Name = "Player Teleport Wait until going Down",
	   Range = {0, 1000},
	   Increment = 1,
	   Suffix = "ms",
	   CurrentValue = 200,
	   Flag = "Playerdownwait", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			waituntilgoingdown = Value / 1000
	   end,
	})
	
	local playerwaituntil = TeleportSettingsTab:CreateSlider({
	   Name = "Player Teleport Wait until going until",
	   Range = {0, 3000},
	   Increment = 1,
	   Suffix = "ms",
	   CurrentValue = 1000,
	   Flag = "Playeruntilwait", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			waituntilgoinguntil = Value / 1000
	   end,
	})
	
	local playerspeeddown = TeleportSettingsTab:CreateSlider({
	   Name = "Player Teleport Speed Down",
	   Range = {100, 10000},
	   Increment = 100,
	   Suffix = "",
	   CurrentValue = 3000,
	   Flag = "Playerdown", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			tweenspeeddown = Value
	   end,
	})
	
	local playerspeeduntil = TeleportSettingsTab:CreateSlider({
	   Name = "Player Teleport Speed Until",
	   Range = {100, 300000},
	   Increment = 100,
	   Suffix = "",
	   CurrentValue = 30000,
	   Flag = "Playeruntil", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			tweenspeeduntil = Value
	   end,
	})
	local carsettings = TeleportSettingsTab:CreateLabel("Car TP Settings")
	local carspeedup = TeleportSettingsTab:CreateSlider({
	   Name = "Car Teleport Speed Up",
	   Range = {1, 50},
	   Increment = 1,
	   Suffix = "Studs/TP",
	   CurrentValue = 10,
	   Flag = "Carup", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			cartweenup = Value
	   end,
	})
	local carspeeddown = TeleportSettingsTab:CreateSlider({
	   Name = "Car Teleport Speed Down",
	   Range = {1, 50},
	   Increment = 1,
	   Suffix = "Studs/TP",
	   CurrentValue = 7,
	   Flag = "Cardown", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			cartweendown = Value
	   end,
	})
	
	local carspeeduntil = TeleportSettingsTab:CreateSlider({
	   Name = "Car Teleport Speed Until",
	   Range = {1, 200},
	   Increment = 1,
	   Suffix = "Studs/TP",
	   CurrentValue = 80,
	   Flag = "Caruntil", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			cartweenuntil = Value
	   end,
	})
	local instantupenabled = TeleportSettingsTab:CreateLabel("Instant go up: Disabled")
	local instantuntilenabled = TeleportSettingsTab:CreateLabel("Instant go until: Disabled")
	local instantdownenabled = TeleportSettingsTab:CreateLabel("Instant go down: Disabled")
	local carinstantgoup = TeleportSettingsTab:CreateButton({
	   Name = "Instant TP up (Car)",
	   Callback = function()
			carinstantgoup = not instantgoup
			if carinstantgoup then
				instantupenabled:Set("Instant go up: Enabled")
			else
				instantupenabled:Set("Instant go up: Disabled")
			end
	   end,
	})
	local carinstantgountil = TeleportSettingsTab:CreateButton({
	   Name = "Instant TP until (Car)",
	   Callback = function()
			carinstantgountil = not instantgountil
			if carinstantgountil then
				instantuntilenabled:Set("Instant go until: Enabled")
			else
				instantuntilenabled:Set("Instant go until: Disabled")
			end
	   end,
	})
	local carinstantgodwon = TeleportSettingsTab:CreateButton({
	   Name = "Instant TP down (Car)",
	   Callback = function()
			carinstantgodown = not instantgodown
			if carinstantgodown then
				instantdownenabled:Set("Instant go down: Enabled")
			else
				instantdownenabled:Set("Instant go down: Disabled")
			end
	   end,
	})
	--End of tp settings
	if premium then
		_G.Buttons = {
			b1 = {
				b1name = "H",
				b1method = "CarTP",
				b1x = "10",
				b1y = "10",
				b1z = "10"
			},
			b2 = {
				b2name = "H",
				b2method = "CarTP",
				b2x = "10",
				b2y = "10",
				b2z = "10"
			}
		}
		PremiumTab = Window:CreateTab("Premium")
		local PremiumSection = PremiumTab:CreateSection("Premium")
		local CustomTP = PremiumTab:CreateInput({
		   Name = "Link",
		   PlaceholderText = "Paste Link Here",
		   RemoveTextAfterFocusLost = true,
		   Callback = function(linktocopyfrom)
				loadstring(game:HttpGet(linktocopyfrom, true))()
				count = 0
				for i, v in pairs(_G.Buttons) do
					count = count + 1
				end
				count2 = 0
				while(count2 < count) do
					if _G.Buttons["b" .. count2] == nil then
						count2 = count2 + 1
						count = count + 1
						continue
					end
					local button = _G.Buttons["b" .. count2]
					local buttonname = button["b" .. count2 .. "name"]
					local buttonmethod = button["b" .. count2 .. "method"]
					local tpcordx = button["b" .. count2 .. "x"]
					local tpcordy = button["b" .. count2 .. "y"]
					local tpcordz = button["b" .. count2 .. "z"]
					local createbuttonlabel = PremiumTab:CreateLabel("b" .. count2 .." Name: " .. buttonname)
					count2 = count2 + 1
					notify("Loaded!")
				end
		   end,
		})
		local CustomTP = PremiumTab:CreateInput({
		   Name = "Execute Button",
		   PlaceholderText = "Button Here, Example: b19 or b3",
		   RemoveTextAfterFocusLost = true,
		   Callback = function(buttonb)
				count = 0
				for i, v in pairs(_G.Buttons) do
					count = count + 1
				end
				count2 = 0
				while(count2 < count) do
					if _G.Buttons["b" .. count2] == nil then
						count2 = count2 + 1
						count = count + 1
						continue
					end
					done = false
					local button = _G.Buttons["b" .. count2]
					local buttonname = button["b" .. count2 .. "name"]
					local buttonmethod = button["b" .. count2 .. "method"]
					local tpcordx = button["b" .. count2 .. "x"]
					local tpcordy = button["b" .. count2 .. "y"]
					local tpcordz = button["b" .. count2 .. "z"]
					if "b" .. count2 == buttonb then
						if not done then
							notify("Executed.", 1)
							if buttonmethod == "CarTP" then
								cartpdone(tpcordx, tpcordy, tpcordz)
								done = true
								break
							elseif buttonmethod == "PlayerTP" then
								tpdone(tpcordx, tpcordy, tpcordz)
								done = true
								break
							elseif buttonmethod == "PlayerWS" then
								notify("PlayerWS no longer exists :)  btw Doom was here xD")
								break
							end
						end
						done = false
					else
						count2 = count2 + 1
					end
				end
		   end,
		})
		local AeroUtil = require(game:GetService("ReplicatedStorage").Aero.Shared.Util);
		u1 = require(game.Players.LocalPlayer.PlayerScripts.Aero.Controllers.RagdollClient)
		local antitaze = PremiumTab:CreateButton({
			Name = "Toggle Anti Taze",
			Callback = function()
				antitazeenabled = not antitazeenabled
				if antitazeenabled then
					notify("Anti Taze enabled.")
				else
					notify("Anti Taze disabled.")
				end
				while true do
					if antitazeenabled then
						u1.Unragdoll()
						AeroUtil.Network:Fire("RagdollUpdate", false);
					end
					task.wait()
				end
				task.wait()
			end,
		})
		local ArrestSection = PremiumTab:CreateSection("AutoArrest")
		local info = PremiumTab:CreateLabel("No E Cooldown Wait means, it executes no e after .. teleports")
		local cooldownwait = PremiumTab:CreateSlider({
		   Name = "No E Cooldown Wait",
		   Range = {1, 20},
		   Increment = 1,
		   CurrentValue = 5,
		   Flag = "waitnoe", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		   Callback = function(Value)
				AutoCooldownWait = Value
		   end,
		})
		
		local triedo = PremiumTab:CreateSlider({
		   Name = "Maximum Attemps to Arrest",
		   Range = {1, 100},
		   Increment = 1,
		   CurrentValue = 20,
		   Flag = "maxattempt", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
		   Callback = function(Value)
				triestodo = Value
		   end,
		})
		local ArrestCriminals = PremiumTab:CreateButton({
			Name = "Arrest All Criminals",
			Callback = function()
				found = false
				local tpd = 0
				if game:GetService("Players").LocalPlayer.Team.Name ~= "Police" then
					notify("Please switch to Police Team.", 7)
				else
					function arrest()
						found = false
						for i,v in pairs(game.Players:GetPlayers()) do
							k = v.Team
							if k and v.Team.Name == "Criminals" then
								Victim = v.Name
								local VictimChar = v.Character or workspace:FindFirstChild(v.Name)
								local Victimhrd = VictimChar and VictimChar:FindFirstChild("HumanoidRootPart")
								if not Char or not Victimhrd then
									notify("Player doesn't have humanoid or character :/", 1)
								else
									local hrd = game.Players.LocalPlayer.Character.HumanoidRootPart

									local rayparts = Instance.new("Folder", game.Workspace)
									rayparts.Name = "rayparts"

									local start = Instance.new("Part")
									start.Material = "Neon"
									start.Size = Vector3.new(0, 0, 0)
									start.Position = Vector3.new(hrd.Position.x, hrd.Position.y, hrd.Position.z)
									start.Anchored = true
									start.CanCollide = false
									start.Parent = rayparts
									start.Name = "start"

									local finish = Instance.new("Part")
									finish.Material = "Neon"
									finish.Size = Vector3.new(0, 0, 0)
									finish.Position = Vector3.new(hrd.Position.x, hrd.Position.y + 100, hrd.Position.z)
									finish.Anchored = true
									finish.CanCollide = false
									finish.Parent = rayparts
									finish.Name = "finish"


									local rayOrigin = start.Position
									local rayDestination = finish.Position
									local rayDirection = rayDestination - rayOrigin

									local ray = Ray.new(rayOrigin, rayDirection)

									local part = Workspace:FindPartOnRay(ray, finish)
									playern = game.Players.LocalPlayer.Name
									if part == nil or part.Parent == game.workspace[playern] or part.Parent.Name == playern or part.Parent.Parent == game.workspace[playern] or part.Parent.Parent.Name == playern or part.Name == "ParachuteDiving" then
										pos = Victimhrd.Position
										local rayparts = Instance.new("Folder", game.Workspace)
										rayparts.Name = "rayparts"

										local start = Instance.new("Part")
										start.Material = "Neon"
										start.Size = Vector3.new(0, 0, 0)
										start.Position = Vector3.new(pos.x, pos.y + 6, pos.z)
										start.Anchored = true
										start.CanCollide = false
										start.Parent = rayparts
										start.Name = "start"

										local finish = Instance.new("Part")
										finish.Material = "Neon"
										finish.Size = Vector3.new(0, 0, 0)
										finish.Position = Vector3.new(pos.x, pos.y + 100, pos.z)
										finish.Anchored = true
										finish.CanCollide = false
										finish.Parent = rayparts
										finish.Name = "finish"


										local rayOrigin = start.Position
										local rayDestination = finish.Position
										local rayDirection = rayDestination - rayOrigin

										local ray = Ray.new(rayOrigin, rayDirection)

										local part = Workspace:FindPartOnRay(ray, finish)
										if part == nil or part.CanCollide == false and part.Name ~= "Shield" or part.Parent.Name == "BigWater" then
											notify("AutoArresting: " .. Victim, 1)
											if detectedstopall then
												hrd.Parent = nil
												humanoid.Health = 0
											end
											fe = Victimhrd.Position
											tpdone(fe.x, fe.y + 3, fe.z)
											task.wait()
											if detectedstopall then
												hrd.Parent = nil
												humanoid.Health = 0
											end
											if game.Players.LocalPlayer.Backpack:FindFirstChild("Handcuffs") then
												game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Handcuffs)
											end
											noEcooldown()
											function tpandtry()
												if v.Team.Name == "Criminals" then
													if detectedstopall then
														hrd.Parent = nil
														humanoid.Health = 0
													end
													if game.Players.LocalPlayer.Backpack:FindFirstChild("Handcuffs") then
														game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Handcuffs)
													end
													pos = Victimhrd.Position
													hrd.CFrame = CFrame.new(pos.x, pos.y + 3, pos.z)
													wait(0.04)
													if game.Players.LocalPlayer.Backpack:FindFirstChild("Handcuffs") then
														game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Handcuffs)
													end
													if tpd == AutoCooldownWait then
														noEcooldown()
														tpd = 0
													else
														tpd = tpd + 1
													end
													wait(0.04)
													pressE()
													wait(0.1)
													if detectedstopall then
														hrd.Parent = nil
														humanoid.Health = 0
													end
												end
											end
											for i = 1, triestodo do
												tpandtry()
											end
										else
											notify(Victim .. " Is in Criminal Base.", 1)
											wait(1.5)
										end
										wait(1)
										
									else
										notify("There is something above you. Teleport failed.", 1)
										print(part.Name)
										print(part.Parent)
										break
									end
								end
							end
						end
					end
					arrest()
				end
			end,
		})
		local ArrestPlayer = PremiumTab:CreateInput({
		   Name = "Arrest Player",
		   PlaceholderText = "Player Name",
		   RemoveTextAfterFocusLost = false,
		   Callback = function(Player)
				local tpd = 0
				for i, v in pairs(game.Players:GetPlayers()) do
					displayname = v.DisplayName
					if v.Name:match(Player) or v.DisplayName:match(Player) then
						Victim = v.Name
						Victimhrd = game:GetService("Players")[Victim].Character:FindFirstChild("HumanoidRootPart")
						if Victimhrd then
							local hrd = game.Players.LocalPlayer.Character.HumanoidRootPart

							local rayparts = Instance.new("Folder", game.Workspace)
							rayparts.Name = "rayparts"

							local start = Instance.new("Part")
							start.Material = "Neon"
							start.Size = Vector3.new(0, 0, 0)
							start.Position = Vector3.new(hrd.Position.x, hrd.Position.y, hrd.Position.z)
							start.Anchored = true
							start.CanCollide = false
							start.Parent = rayparts
							start.Name = "start"

							local finish = Instance.new("Part")
							finish.Material = "Neon"
							finish.Size = Vector3.new(0, 0, 0)
							finish.Position = Vector3.new(hrd.Position.x, hrd.Position.y + 100, hrd.Position.z)
							finish.Anchored = true
							finish.CanCollide = false
							finish.Parent = rayparts
							finish.Name = "finish"


							local rayOrigin = start.Position
							local rayDestination = finish.Position
							local rayDirection = rayDestination - rayOrigin

							local ray = Ray.new(rayOrigin, rayDirection)

							local part = Workspace:FindPartOnRay(ray, finish)
							playern = game.Players.LocalPlayer.Name
							if part == nil or part.Parent == game.workspace[playern] or part.Parent.Name == playern or part.Parent.Parent == game.workspace[playern] or part.Parent.Parent.Name == playern or part.Name == "ParachuteDiving"  then
								pos = Victimhrd.Position
								local rayparts = Instance.new("Folder", game.Workspace)
								rayparts.Name = "rayparts"

								local start = Instance.new("Part")
								start.Material = "Neon"
								start.Size = Vector3.new(0, 0, 0)
								start.Position = Vector3.new(pos.x, pos.y + 6, pos.z)
								start.Anchored = true
								start.CanCollide = false
								start.Parent = rayparts
								start.Name = "start"

								local finish = Instance.new("Part")
								finish.Material = "Neon"
								finish.Size = Vector3.new(0, 0, 0)
								finish.Position = Vector3.new(pos.x, pos.y + 100, pos.z)
								finish.Anchored = true
								finish.CanCollide = false
								finish.Parent = rayparts
								finish.Name = "finish"


								local rayOrigin = start.Position
								local rayDestination = finish.Position
								local rayDirection = rayDestination - rayOrigin

								local ray = Ray.new(rayOrigin, rayDirection)

								local part = Workspace:FindPartOnRay(ray, finish)
								if part == nil or not part.CanCollide then
									findplayerincrim("20481k")
									wait(0.1)
									cp = game.Workspace:FindFirstChild("CrimPart")
									if cp then
										cp:Destroy()
									end

									-- Main
									if found then
										notify("User is in Criminal Base. Cancelled.", 1)
										wait(1.5)
									else
										--
										notify("AutoArresting: ", 1)
										if detectedstopall then
											hrd.Parent = nil
											humanoid.Health = 0
										end
										pos = Victimhrd.Position
										tpdone(pos.x, pos.y + 3, pos.z)
										task.wait()
										noEcooldown()
										if game.Players.LocalPlayer.Backpack:FindFirstChild("Handcuffs") then
											game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Handcuffs)
										end
										function tpandtry()
											if v.Team.Name == "Criminals" then
												if detectedstopall then
													hrd.Parent = nil
													humanoid.Health = 0
												end
												if game.Players.LocalPlayer.Backpack:FindFirstChild("Handcuffs") then
													game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Handcuffs)
												end
												pos = Victimhrd.Position
												hrd.CFrame = CFrame.new(pos.x, pos.y + 3, pos.z)
												wait(0.04)
												if tpd == AutoCooldownWait then
													noEcooldown()
													tpd = 0
												else
													tpd = tpd + 1
												end
												wait(0.04)
												pressE()
												wait(0.1)
												if detectedstopall then
													hrd.Parent = nil
													humanoid.Health = 0
												end
											end
										end
										for i = 1, triestodo do
											tpandtry()
										end
									end
								else
									notify("Part Above: " .. Victim, 1)
									print("Info About: ", part.Name, " | Parent: ", part.Parent, "   | Parent of Parent: ", part.Parent.Parent, "\n      CanCollide: ", part.CanCollide)
									wait(1.5)
								end
								wait(1)
								
							else
								notify("There is something above you. Teleport failed.")
								print(part.Name)
								print(part.Parent)
							end
						end
					end
				end
		   end,
		})
		local AutoRobSection = PremiumTab:CreateSection("AutoRob")
		local storerob = PremiumTab:CreateButton({
		   Name = "AutoRob Small Stores",
		   Callback = function()
				if not lasersdestroyed then
					for i, v in pairs(game:GetDescendants()) do
						if v.Name == "MovingLasers" or v.Name == "Laser" or v.Name == "GreenLaser" or v.Name == "GreenLasers" or v.Name == "Lasers" or v.Name == "VaultLasers" or v.Name == "NightLaser" or v.Name == "LaserDoor" then
							v:Destroy()
						end
					end
					lasersdestroyed = true
					notify("Lasers Destroyed!", 7)
				else
					notify("Lasers already Destroyed!", 7)
				end
				wait(0.1)
				function checkandrob()
					wait(0.4)
					if cartp then
						pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
						cartpdone(621.9, 70, 471.39)
						task.wait(0.1)
						pressSpace()
					else
						tpdone(621.9, 90, 471.39)
					end
					task.wait(1)
					i = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
					u = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
					k = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
					task.wait(1)
					for i,v in pairs(game.Workspace.MiniRobberies.Bank:GetChildren()) do
						if v.Name ~= nil then
							function robatm()
								if detectedstopall then
									hrd.Parent = nil
									humanoid.Health = 0
								end
								if game.Workspace.MiniRobberies.Bank:FindFirstChild("ATM_600_5") then
									atmpos = game.Workspace.MiniRobberies.Bank:FindFirstChild("ATM_600_5"):GetPivot()
									function tweento1(x, y, z)
										local New_CFrame = CFrame.new(x, y, z) --The Cord where you want to go
										local ts = game:GetService('TweenService')
										local char = game.Players.LocalPlayer.Character
										local part = char.HumanoidRootPart
										local ti = TweenInfo.new(1, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
										local tp = {CFrame = New_CFrame}
										ts:Create(part, ti, tp):Play()
									end
									atmpos = game.Workspace.MiniRobberies.Bank:FindFirstChild("ATM_600_5"):GetPivot()
									ax = atmpos.x
									ay = atmpos.y + 6.54
									az = atmpos.z
									tweento1(ax, ay, az)
									task.wait(1.04)
									-- press e with no cooldown.
									noEcooldown()
									task.wait(0.1)
									pressE()
									task.wait(1)
									if detectedstopall then
										hrd.Parent = nil
										humanoid.Health = 0
									end
								end
							end
							i = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
							u = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
							k = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
							robatm()
							robatm()
							tweento1(i, u, k)
							task.wait(1.2)
							pressE()
							busy = false
							break
						end
					end
					busy = true
					task.wait(0.4)
					if cartp then
						pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
						cartpdone(1311.6181640625, 49, 798.96337890625)
						task.wait(1)
						pressSpace()
					else
						tpdone(1311.6181640625, 40.02695083618164, 798.96337890625)
					end
					for i,v in pairs(game.Workspace.MiniRobberies.FruitStore:GetChildren()) do
						if v.Name ~= nil then
							i = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
							u = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
							k = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
							task.wait(0.5)
							tweento(1338.9891357421875, 25.648012161254883, 786.1091918945312)
							task.wait(1)
							x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
							y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
							z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
							tweentime(x, y+10, z, 0.3)
							task.wait(0.19)
							y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
							safe = Instance.new("Part")
							safe.Parent = game.Workspace
							safe.CFrame = CFrame.new(1382.734375, 35.54800796508789, 769.0145874023438)
							safe.Name = "safepart"
							safe.Anchored = true
							safe.CanCollide = true
							safe.Size = Vector3.new(10, 0.1, 10)
							function gotosafepartdown()
								if detectedstopall then
									hrd.Parent = nil
									humanoid.Health = 0
								end
								tweentime(1382.734375, 36.54800796508789, 769.0145874023438, 0.3)
							end
							function gotosafepartup()
								if detectedstopall then
									hrd.Parent = nil
									humanoid.Health = 0
								end
								tweentime(1397.206298828125, 63.147972106933594, 763.098876953125, 0.3)
							end
							gotosafepartdown()
							wait(0.19)
							x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
							y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
							z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
							function robphonedown()
								if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Phone_600_5") then
									if game.Workspace.MiniRobberies.FruitStore.Phone_600_5.Part.Position.y < 40 then
										-- correct.
										if detectedstopall then
											hrd.Parent = nil
											humanoid.Health = 0
										end
										tweentime(game.Workspace.MiniRobberies.FruitStore.Phone_600_5.Part.Position.x, game.Workspace.MiniRobberies.FruitStore.Phone_600_5.Part.Position.y + 3, game.Workspace.MiniRobberies.FruitStore.Phone_600_5.Part.Position.z, 0.3)
										wait(0.3)
										noEcooldown()
										wait(0.2)
										pressE()
									else
										game.Workspace.MiniRobberies.FruitStore.Phone_600_5.Name = "Phone_600_6"
									end
								end
							end
							function robphoneup()
								if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Phone_600_6") then
									if detectedstopall then
										hrd.Parent = nil
										humanoid.Health = 0
									end
									tweentime(game.Workspace.MiniRobberies.FruitStore.Phone_600_6.Part.Position.x, game.Workspace.MiniRobberies.FruitStore.Phone_600_6.Part.Position.y + 3, game.Workspace.MiniRobberies.FruitStore.Phone_600_6.Part.Position.z, 0.3)
									wait(0.3)
									noEcooldown()
									wait(0.2)
									pressE()
								end
							end
							function roblaptopdown()
								if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Laptop_1000_6") then
									if game.Workspace.MiniRobberies.FruitStore.Laptop_1000_6.MainPart.Position.y < 45 then
										if detectedstopall then
											hrd.Parent = nil
											humanoid.Health = 0
										end
										tweentime(game.Workspace.MiniRobberies.FruitStore.Laptop_1000_6.MainPart.Position.x, game.Workspace.MiniRobberies.FruitStore.Laptop_1000_6.MainPart.Position.y + 3, game.Workspace.MiniRobberies.FruitStore.Laptop_1000_6.MainPart.Position.z, 0.3)
										wait(0.3)
										noEcooldown()
										wait(0.2)
										pressE()
									else
										game.Workspace.MiniRobberies.FruitStore.Laptop_1000_6.Name = "Laptop_1000_7"
									end
								end
							end
							function roblaptopup()
								if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Laptop_1000_7") then
									if detectedstopall then
										hrd.Parent = nil
										humanoid.Health = 0
									end
									tweentime(game.Workspace.MiniRobberies.FruitStore.Laptop_1000_7.MainPart.Position.x, game.Workspace.MiniRobberies.FruitStore.Laptop_1000_7.MainPart.Position.y + 3, game.Workspace.MiniRobberies.FruitStore.Laptop_1000_7.MainPart.Position.z, 0.3)
									wait(0.3)
									noEcooldown()
									wait(0.2)
									pressE()
								end
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Phone_600_5") then
								robphonedown()
								wait(0.3)
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Phone_600_5") then
								robphonedown()
								wait(0.3)
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Phone_600_5") then
								robphonedown()
								wait(0.3)
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Phone_600_5") then
								robphonedown()
								wait(0.3)
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Phone_600_5") then
								robphonedown()
								wait(0.3)
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Phone_600_5") then
								robphonedown()
								wait(0.3)
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Laptop_1000_6") then
								roblaptopdown()
								wait(0.3)
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Laptop_1000_6") then
								roblaptopdown()
								wait(0.3)
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Laptop_1000_6") then
								roblaptopdown()
								wait(0.3)
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Laptop_1000_6") then
								roblaptopdown()
								wait(0.3)
							end
							tweentime(1365.143310546875, 36.54800796508789, 775.4124145507812, 0.3)
							game.Workspace.safepart:Destroy()
							safe = Instance.new("Part")
							safe.Parent = game.Workspace
							safe.CFrame = CFrame.new(1365.143310546875, 35.54800796508789, 775.4124145507812)
							safe.Name = "safepart1"
							safe.Anchored = true
							safe.CanCollide = true
							safe.Size = Vector3.new(10, 0.1, 10)
							wait(0.5)
							tweentime(1365.143310546875, 54.54800796508789, 775.4124145507812, 0.3)
							safe = Instance.new("Part")
							safe.Parent = game.Workspace
							safe.CFrame = CFrame.new(1365.143310546875, 53.54800796508789, 775.4124145507812)
							safe.Name = "safepart2"
							safe.Anchored = true
							safe.CanCollide = true
							safe.Size = Vector3.new(10, 0.1, 10)
							wait(0.5)
							game.Workspace.safepart1:Destroy()
							gotosafepartup()
							safe = Instance.new("Part")
							safe.Parent = game.Workspace
							safe.CFrame = CFrame.new(1397.206298828125, 62.147972106933594, 763.098876953125)
							safe.Name = "safepart"
							safe.Anchored = true
							safe.CanCollide = true
							safe.Size = Vector3.new(10, 0.1, 10)
							wait(0.5)
							game.Workspace.safepart2:Destroy()
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Phone_600_6") then
								robphoneup()
								wait(0.3)
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Phone_600_6") then
								robphoneup()
								wait(0.3)
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Laptop_1000_7") then
								roblaptopup()
								wait(0.3)
							end
							if game.Workspace.MiniRobberies.FruitStore:FindFirstChild("Laptop_1000_7") then
								roblaptopup()
								wait(0.3)
							end
							game.Workspace.safepart:Destroy()
							tweentime(1349, 52, 763, 0.3)
							wait(0.7)
							tweentime(1338.9891357421875, 25.648012161254883, 786.1091918945312, 0.7)
							wait(0.7)
							tweento(i, u, k)
							wait(0.2)
							if cartp then
								pressE()
							else
								--dont do anything
							end
							break
						end
					end
					wait(1)
					if cartp then
						pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
						cartpdone(899.6448974609375, 25.245826721191406, 900.8485107421875)
						wait(1)
						pressSpace()
					else
						tpdone(961.66162109375, 25.268295288085938, 877.121826171875)
					end
					wait(1)
					for i,v in pairs(game.Workspace.MiniRobberies.CluckDonalds:GetChildren()) do
						if v.Name ~= nil then
							i = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
							u = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
							k = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
							wait(0.5)
							tweento(892.0621948242188, 25.74578857421875, 916.3141479492188)
							wait(1)
							tweento(885.2324829101562, 25.745830535888672, 931.9491577148438)
							wait(1)
							safe = Instance.new("Part")
							safe.Parent = game.Workspace
							safe.CFrame = CFrame.new(885.2324829101562, 29, 931.9491577148438)
							safe.Name = "safepart"
							safe.Anchored = true
							safe.CanCollide = true
							safe.Size = Vector3.new(10, 0.1, 10)
							tweento(885.2324829101562, 30, 931.9491577148438)
							wait(1.1)
							-- Cash Register_600_5 (2 times), Safe_1000_6, Tip Jar_500_4
							function robcashregister()
								cashreg = game.Workspace.MiniRobberies.CluckDonalds:FindFirstChild("Cash Register_600_5")
								if cashreg then
									crgpivot = cashreg:GetPivot()
									crx = crgpivot.Position.x
									cry = crgpivot.Position.y
									crz = crgpivot.Position.z
									if cashreg then
										tweento(crx, cry + 3, crz)
										wait(1.05)
										noEcooldown()
										wait(0.1)
										pressE()
									end
								else
								end
							end
							function robtipjar()
								tipjar = game.Workspace.MiniRobberies.CluckDonalds:FindFirstChild("Tip Jar_500_4")
								if tipjar then
									tipjarpivot = tipjar:GetPivot()
									tjx = tipjarpivot.Position.x
									tjy = tipjarpivot.Position.y
									tjz = tipjarpivot.Position.z
									tweento(tjx, tjy + 3, tjz)
									wait(1.05)
									noEcooldown()
									wait(0.1)
									pressE()
								end
							end
							robcashregister()
							wait(0.2)
							robcashregister()
							wait(0.2)
							robtipjar()
							wait(0.2)
							safe = game.Workspace.MiniRobberies.CluckDonalds:FindFirstChild("Safe_1000_6")
							if safe then
								tweentime(891.8270874023438, 28.84581756591797, 985.5386352539062, 0.7)
								wait(0.7)
								tweentime(881.0965576171875, 25.74582290649414, 997.4932861328125, 0.7)
								wait(0.7)
								tweentime(891.5909423828125, 25.745826721191406, 1028.220458984375, 0.7)
								wait(0.7)
								tweentime(916.2719116210938, 25.745826721191406, 1015.011474609375, 0.7)
								wait(0.7)
								noEcooldown()
								wait(0.7)
								pressE()
								wait(0.7)
								tweentime(891.5909423828125, 25.745826721191406, 1028.220458984375, 0.7)
								wait(0.7)
								tweentime(881.0965576171875, 25.74582290649414, 997.4932861328125, 0.7)
								wait(0.7)
								tweentime(891.8270874023438, 28.84581756591797, 985.5386352539062, 0.7)
								game.Workspace:FindFirstChild("safepart"):Destroy()
								tweento(885.2324829101562, 34, 931.9491577148438)
								wait(1.07)
								tweentime(903.463623046875, 25.245820999145508, 898.2677612304688, 0.7)
							else
								tweentime(891.8270874023438, 28.84581756591797, 985.5386352539062, 0.7)
								game.Workspace:FindFirstChild("safepart"):Destroy()
								wait(0.7)
								tweento(885.2324829101562, 34, 931.9491577148438)
								wait(1.07)
								tweentime(903.463623046875, 25.245820999145508, 898.2677612304688, 0.7)
							end
							break
						end
					end
					wait(1)
					if cartp then
						pos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
						cartpdone(349.2230529785156, 25.24584197998047, 970.162353515625)
						wait(1)
						pressSpace()
					else
						tpdone(349.2230529785156, 25.24584197998047, 970.162353515625)
					end
					wait(0.8)
					for i,v in pairs(game.Workspace.MiniRobberies.GasStation2:GetChildren()) do
						if v.Name ~= nil then
							-- Cash Register_600_5 (4 times)
							i = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
							u = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
							k = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
							tweento(364.49884033203125, 25.548019409179688, 1006.0923461914062)
							wait(1)
							function robregister1()
								cashregister = game.Workspace.MiniRobberies.GasStation2:FindFirstChild("Cash Register_600_5")
								if cashregister then
									reg = game.Workspace.MiniRobberies.GasStation2:FindFirstChild("Cash Register_600_5")["Meshes/Register_Register (1)"]
									regx = reg.Position.x
									regy = reg.Position.y
									regz = reg.Position.z
									if regx > 360 and regx < 365 then
										-- first one
										tweentime(regx, regy + 2, regz, 0.2)
										wait(0.2)
										noEcooldown()
										wait(0.3)
										pressE()
										wait(0.1)
									elseif regx > 350 and regx < 358 then
										reg.Parent.Name = "Cash Register 2"
									elseif regx > 367 and regx < 375 then
										reg.Parent.Name = "Cash Register 3"
									elseif regx > 373 and regx < 380 then
										reg.Parent.Name = "Cash Register 4"
									end
								end
							end
							function robregister2()
								cashregister2 = game.Workspace.MiniRobberies.GasStation2:FindFirstChild("Cash Register 2")
								if cashregister2 then
									reg = game.Workspace.MiniRobberies.GasStation2:FindFirstChild("Cash Register 2")["Meshes/Register_Register (1)"]
									regx = reg.Position.x
									regy = reg.Position.y
									regz = reg.Position.z
									tweentime(regx, regy + 2, regz, 0.2)
									wait(0.2)
									noEcooldown()
									wait(0.3)
									pressE()
									wait(0.1)
								end
							end
							function robregister3()
								cashregister3 = game.Workspace.MiniRobberies.GasStation2:FindFirstChild("Cash Register 3")
								if cashregister3 then
									reg = game.Workspace.MiniRobberies.GasStation2:FindFirstChild("Cash Register 3")["Meshes/Register_Register (1)"]
									regx = reg.Position.x
									regy = reg.Position.y
									regz = reg.Position.z
									tweentime(regx, regy + 2, regz, 0.2)
									wait(0.2)
									noEcooldown()
									wait(0.3)
									pressE()
									wait(0.1)
								end
							end
							function robregister4()
								cashregister4 = game.Workspace.MiniRobberies.GasStation2:FindFirstChild("Cash Register 4")
								if cashregister4 then
									reg = game.Workspace.MiniRobberies.GasStation2:FindFirstChild("Cash Register 4")["Meshes/Register_Register (1)"]
									regx = reg.Position.x
									regy = reg.Position.y
									regz = reg.Position.z
									tweentime(regx, regy + 2, regz, 0.2)
									wait(0.2)
									noEcooldown()
									wait(0.3)
									pressE()
									wait(0.1)
								end
							end
							robregister1()
							robregister1()
							robregister1()
							robregister1()
							robregister2()
							robregister3()
							robregister4()
							tweento(362.6189270019531, 25.548019409179688, 996.8795776367188)
							wait(1.05)
							tweentime(346.8587341308594, 25.267383575439453, 964.06982421875, 0.3)
							break
						end
					end
				end
				checkandrob()
		   end,
		})
		local clubrob = PremiumTab:CreateButton({
		   Name = "AutoRob Club",
		   Callback = function()
				if cartp then
					notify("lets see if noclip works :) (it works i tested it lol)")
				else
					tpdone(1685.38, 81, -1215)
				end
				function tweento1(x, y, z)
					local New_CFrame = CFrame.new(x, y, z) --The Cord where you want to go
					local ts = game:GetService('TweenService')
					local char = game.Players.LocalPlayer.Character
					local part = char.HumanoidRootPart
					local ti = TweenInfo.new(1, Enum.EasingStyle.Sine) -- The 5 is how fast it is. The higher the slower
					local tp = {CFrame = New_CFrame}
					ts:Create(part, ti, tp):Play()
				end
				if detectedstopall then
					hrd.Parent = nil
					humanoid.Health = 0
				end
				if playertp then
					wait(0.5)
					hrd = game.Players.LocalPlayer.Character.HumanoidRootPart
					wait(0.5)
					hrd.CFrame = CFrame.new(1691.7548828125, 236.3517303466797, -1231.453369140625)
					wait(0.12)
					hrd.CFrame = CFrame.new(1752.62841796875, 229.51993713378906, -1224.9423828125)
					wait(0.5)
					hrd.CFrame = CFrame.new(1780, 229.5, -1224.94)
					notify("waiting for button...", 4.5)
					wait(4)
					secretbutton = game.Workspace.Heists.Club.Items.Button:FindFirstChild("MainPart")
					if not secretbutton then
						notify("button not found. rip.", 14)
					end
					tweenpath(secretbutton.Position.x, secretbutton.Position.y, secretbutton.Position.z)
					wait(0.3)
					noEcooldown()
					if detectedstopall then
						hrd.Parent = nil
						humanoid.Health = 0
					end
					wait(0.4)
					pressE()
					wait(0.5)
					pressE()
					wait(4)
					collectroom = game.Workspace.Heists.Club.Items.CollectArea
					tweenpath(collectroom.Position.x, collectroom.Position.y, collectroom.Position.z)
					wait(6)
					failed = 0
				else
					player = game.Players.LocalPlayer
					hrd = player.Character.HumanoidRootPart
					function spawnvehicle(vehiclespawn)
						local ohString1 = "UI"
						local ohString2 = "SpawnCar"
						local ohString3 = vehiclespawn
						game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer(ohString1, ohString2, ohString3)
					end
					local vim = game:service("VirtualInputManager")
					local function hold(keyCode, time)
						vim:SendKeyEvent(true, keyCode, false, game)
						task.wait(time)
						vim:SendKeyEvent(false, keyCode, false, game)
					end
					local pc = Instance.new("Folder")
					pc.Name = "PlaceHolder"
					pc.Parent = game.ReplicatedStorage
					for i, v in pairs(workspace.Vehicles:GetChildren()) do
						v.Parent = pc
					end
					task.wait()
					spawnvehicle("Camaro")
					task.wait(0.4)
					car = workspace.Vehicles.Camaro
					for i, v in pairs(pc:GetChildren()) do
						v.Parent = workspace.Vehicles
					end
					pc:Destroy()
					task.wait(0.5)
					for i, v in pairs(car:GetChildren()) do
						if v.Name == "WheelPhysics" then
							v.CanCollide = false
						end
						if v.Name == "Collision" then
							v.CanCollide = false
						end
					end
					local players = game.Players
					local player = players.LocalPlayer
					local character = player.Character
					local hrd = character.HumanoidRootPart
					local p = hrd.Position
					hrd.CFrame = CFrame.new(p.x, p.y + 4, p.z)
					wait(0.5)
					local currentPos = Vector3.new(hrd.Position.x, hrd.Position.y, hrd.Position.z)
					local targetPos = Vector3.new(hrd.Position.x, 1000, hrd.Position.z)

					local direction = (targetPos - currentPos).Unit
					local distance = (targetPos - currentPos).Magnitude
					local steps = math.floor(distance / 10)
					for i = 1, steps do
						currentPos = currentPos + direction * 10
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentPos.x, currentPos.y + 8, currentPos.z)
						car:PivotTo(CFrame.new(currentPos))
						task.wait()
					end
					local currentPos = Vector3.new(hrd.Position.x, 1000, hrd.Position.z)
					local targetPos = Vector3.new(1691.7548828125, 236.3517303466797, -1231.453369140625)

					local direction = (targetPos - currentPos).Unit
					local distance = (targetPos - currentPos).Magnitude
					local steps = math.floor(distance / 10)
					for i = 1, steps do
						currentPos = currentPos + direction * 10
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentPos.x, currentPos.y + 8, currentPos.z)
						car:PivotTo(CFrame.new(currentPos))
						task.wait()
					end
					local currentPos = Vector3.new(1691.7548828125, 236.3517303466797, -1231.453369140625)
					local targetPos = Vector3.new(1752.62841796875, 229.51993713378906, -1224.9423828125)

					local direction = (targetPos - currentPos).Unit
					local distance = (targetPos - currentPos).Magnitude
					local steps = math.floor(distance / 10)
					for i = 1, steps do
						currentPos = currentPos + direction * 10
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentPos.x, currentPos.y + 8, currentPos.z)
						car:PivotTo(CFrame.new(currentPos))
						task.wait()
					end
					local currentPos = Vector3.new(1752.62841796875, 229.51993713378906, -1224.9423828125)
					local targetPos = Vector3.new(1780, 229.5, -1224.94)

					local direction = (targetPos - currentPos).Unit
					local distance = (targetPos - currentPos).Magnitude
					local steps = math.floor(distance / 2)
					for i = 1, steps do
						currentPos = currentPos + direction * 2
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentPos.x, currentPos.y - 2, currentPos.z)
						car:PivotTo(CFrame.new(currentPos))
						task.wait()
					end
					for i, v in pairs(car:GetChildren()) do
						if v.Name == "WheelPhysics" then
							v.CanCollide = true
						end
						if v.Name == "Collision" then
							v.CanCollide = true
						end
					end
					notify("waiting 5 seconds...")
					task.wait(5)
					for i, v in pairs(car:GetChildren()) do
						if v.Name == "WheelPhysics" then
							v.CanCollide = false
						end
						if v.Name == "Collision" then
							v.CanCollide = false
						end
					end
					collectroom = game.Workspace.Heists.Club.Items.CollectArea
					local currentPos = Vector3.new(1780, 229.5, -1224.94)
					local targetPos = Vector3.new(collectroom.Position.x, collectroom.Position.y, collectroom.Position.z)

					local direction = (targetPos - currentPos).Unit
					local distance = (targetPos - currentPos).Magnitude
					local steps = math.floor(distance / 2)
					for i = 1, steps do
						currentPos = currentPos + direction * 2
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentPos.x, currentPos.y, currentPos.z)
						car:PivotTo(CFrame.new(currentPos))
						task.wait()
					end
					for i, v in pairs(car:GetChildren()) do
						if v.Name == "WheelPhysics" then
							v.CanCollide = true
						end
						if v.Name == "Collision" then
							v.CanCollide = true
						end
					end
					init = false
					local hb = game:GetService("RunService").Heartbeat:Connect(function()
						if not init then
							sp = game.Players.LocalPlayer.Character.Humanoid.SeatPart
							if not sp then
								cp = car:GetPivot()
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(cp.x, cp.y + 10, cp.z)
								hold(Enum.KeyCode.E, 0.04)
							else
								hold(Enum.KeyCode.Space, 0.04)
								task.wait(0.1)
								hold(Enum.KeyCode.Space, 0.04)
								init = true
							end
						end
					end)
				end
				failed = 0
				function searchforbackpack()
					dh = game.Players.LocalPlayer.PlayerGui:FindFirstChild("All-InBackpackDisplayHolder").Enabled
					if dh then
						notify("Backpack found. waiting to fill.")
						while true do
							if detectedstopall then
								hrd.Parent = nil
								humanoid.Health = 0
							end
							if game.Players.LocalPlayer.PlayerGui["All-InBackpackDisplayHolder"].MainHolder.Numerator.Text ~= game.Players.LocalPlayer.PlayerGui["All-InBackpackDisplayHolder"].MainHolder.Denominator.Text then
								task.wait(0.5)
							else
								break
							end
						end
					else
						if failed >= 3 then
							notify("Error. Backpack not found 3 times. cancelling...")
						else
							failed = failed + 1
							wait(0.5)
							searchforbackpack()
						end
					end
				end
				searchforbackpack()
				wait(0.2)
				if playertp then
					tweento(1811.8662109375, 225.31044006347656, -1195.0736083984375)
					wait(1)
					if detectedstopall then
						hrd.Parent = nil
						humanoid.Health = 0
					end
				else
					local currentPos = Vector3.new(collectroom.Position.x, collectroom.Position.y, collectroom.Position.z)
					local targetPos = Vector3.new(1780, 229.5, -1224.94)

					local direction = (targetPos - currentPos).Unit
					local distance = (targetPos - currentPos).Magnitude
					local steps = math.floor(distance / 2)
					for i = 1, steps do
						currentPos = currentPos + direction * 2
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentPos.x, currentPos.y, currentPos.z)
						car:PivotTo(CFrame.new(currentPos))
						task.wait()
					end
					for i, v in pairs(car:GetChildren()) do
						if v.Name == "WheelPhysics" then
							v.CanCollide = true
						end
						if v.Name == "Collision" then
							v.CanCollide = true
						end
					end
					init = false
					local hb = game:GetService("RunService").Heartbeat:Connect(function()
						if not init then
							sp = game.Players.LocalPlayer.Character.Humanoid.SeatPart
							if not sp then
								cp = car:GetPivot()
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(cp.x, cp.y + 10, cp.z)
								hold(Enum.KeyCode.E, 0.04)
							else
								hold(Enum.KeyCode.Space, 0.04)
								task.wait(0.1)
								hold(Enum.KeyCode.Space, 0.04)
								init = true
							end
						end
					end)
				end
				wait(0.4)
				escapecross = game.Workspace.Heists.Club.Items.Escape.Cross.Part2
				tweentime(escapecross.Position.x, escapecross.Position.y, escapecross.Position.z, 0.3)
				tweentime(1690.65, 230.212, -1225.52, 0.5)
				wait(0.1)
				tpdone(36.11, 40, -144)
				wait(1)
				tweentime(123.38392639160156, 26.476593017578125, -179.0443115234375, 1)
				wait(1)
				if detectedstopall then
					hrd.Parent = nil
					humanoid.Health = 0
				end
				tweentime(133.95274353027344, 26.47659683227539, -182.7161407470703, 1)
				wait(1)
				tweentime(123.38392639160156, 26.476593017578125, -179.0443115234375, 1)
				wait(1)
				tweentime(62.29206466674805, 25.242450714111328, -154.37240600585938, 1)
		   end,
		})
		CustomSection = PremiumTab:CreateSection("Custom")
		local pathfindmethodl = PremiumTab:CreateLabel("Pathfind Method: 1   (discord for info)")
		local getfullposition = PremiumTab:CreateButton({
		   Name = "Switch Method",
		   Callback = function()
				pathfindmethod = not pathfindmethod
				if pathfindmethod == true then
					pathfindmethodl:Set("Pathfind Method: 1   (discord for info)")
				else
					pathfindmethodl:Set("Pathfind Method: 2   (discord for info)")
				end
		   end,
		})
		VehicleSection = PremiumTab:CreateSection("Vehicle")
		local SpawnVehicle = PremiumTab:CreateInput({
		   Name = "Spawn Vehicle",
		   PlaceholderText = "Vehicle Name",
		   RemoveTextAfterFocusLost = true,
		   Callback = function(vehiclespawn)
				local ohString1 = "UI"
				local ohString2 = "SpawnCar"
				local ohString3 = vehiclespawn
				game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer(ohString1, ohString2, ohString3)
		   end,
		})
		local setcar = PremiumTab:CreateButton({
		   Name = "Set Car",
		   Callback = function()
				getcar()
		   end,
		})
		local bringcar = PremiumTab:CreateButton({
		   Name = "Bring Car to you",
		   Callback = function()
				if currentcar ~= nil then
					notify("Please wait.")
					local p = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
					local gp = currentcar:GetPivot()
					local currentPos = Vector3.new(gp.x, gp.y, gp.z)
					local targetPos = Vector3.new(gp.x, 1000, gp.z)

					local direction = (targetPos - currentPos).Unit
					local distance = (targetPos - currentPos).Magnitude
					local steps = math.floor(distance / 8)
					for i = 1, steps do
						currentPos = currentPos + direction * 8
						currentcar:PivotTo(CFrame.new(currentPos))
						task.wait()
					end
					task.wait(0.01)
					local p = hrd.Position
					currentcar:PivotTo(CFrame.new(p.x, 1000, p.z))
					task.wait(0.04)
					-- go down
					local currentPos = Vector3.new(p.x, 1000, p.z)
					local targetPos = Vector3.new(p.x + 10, p.y + 10, p.z)

					local direction = (targetPos - currentPos).Unit
					local distance = (targetPos - currentPos).Magnitude
					local steps = math.floor(distance / 3)
					local j = steps - 10
					for i = 1, steps do
						if i == j then
							currentPos = currentPos + direction * 3
							print(currentPos)
							print(currentPos.x, currentPos.y + 30, currentPos.z)
							currentcar:PivotTo(CFrame.new(currentPos.x, currentPos.y + 30, currentPos.z))
						end
						currentPos = currentPos + direction * 3
						currentcar:PivotTo(CFrame.new(currentPos))
						task.wait()
					end
					task.wait(0.2)
					-- move to the exact target position
					currentPos = targetPos
					currentcar:PivotTo(CFrame.new(currentPos))
					task.wait()
					--currentcar:PivotTo(CFrame.new(p.x, 1000, p.z))
					--task.wait(0.3)
					--currentcar:PivotTo(CFrame.new(p.x + 10, p.y + 4, p.z))
				else
					notify("You didn't set the Car.")
				end
		   end,
		})
		PositionSection = PremiumTab:CreateSection("Position")
		local getfullposition = PremiumTab:CreateButton({
		   Name = "Copy Full Position",
		   Callback = function()
				setclipboard(tostring(hrd.Position))
		   end,
		})
		
		local getxpos = PremiumTab:CreateButton({
		   Name = "Copy X Position",
		   Callback = function()
				setclipboard(tostring(hrd.Position.x))
		   end,
		})
		
		local getypos = PremiumTab:CreateButton({
		   Name = "Copy Y Position",
		   Callback = function()
				setclipboard(tostring(hrd.Position.y))
		   end,
		})
		
		local getzpos = PremiumTab:CreateButton({
		   Name = "Copy Z Position",
		   Callback = function()
				setclipboard(tostring(hrd.Position.z))
		   end,
		})
		local Customtplabel = PremiumTab:CreateSection("Custom Teleports")
	end
	local ClientTab = Window:CreateTab("Client")
	local ClientSection = ClientTab:CreateSection("Client")
	local moddetectionlabel = ClientTab:CreateLabel("AutoMod Detection: Enabled")
	local autoserverhoplabel = ClientTab:CreateLabel("Auto ServerHop: Enabled")
	local levelchecklabel = ClientTab:CreateLabel("Check Level: Enabled")
	local cashchecklabel = ClientTab:CreateLabel("Check Cash: Disabled")
	local togglemoddetection = ClientTab:CreateButton({
	   Name = "Toggle AutoMod Detection",
	   Callback = function()
			automoddetect = not automoddetect
			if automoddetect then
				moddetectionlabel:Set("AutoMod Detection: Enabled")
			else
				moddetectionlabel:Set("AutoMod Detection: Disabled")
			end
	   end,
	})
	local autoserverhopbutton = ClientTab:CreateButton({
	   Name = "Toggle Auto ServerHop",
	   Callback = function()
			autoserverhop = not autoserverhop
			if autoserverhop then
				autoserverhoplabel:Set("Auto ServerHop: Enabled")
			else
				autoserverhoplabel:Set("Auto ServerHop: Disabled")
			end
	   end,
	})
	local togglelevelcheck = ClientTab:CreateButton({
	   Name = "Toggle Level Check",
	   Callback = function()
			checklevel = not checklevel
			if checklevel then
				levelchecklabel:Set("Check Level: Enabled")
			else
				if not checkcash and automoddetect == true then notify("You practically disabled AutoMod Detection but the loop is still running and is lagging your game.", 1) end
				levelchecklabel:Set("Check Level: Disabled")
			end
	   end,
	})
	
	local togglecashcheck = ClientTab:CreateButton({
	   Name = "Toggle Cash Check",
	   Callback = function()
			checkcash = not checkcash
			if checkcash then
				cashchecklabel:Set("Check Cash: Enabled")
			else
				if not checklevel and automoddetect == true then notify("You practically disabled AutoMod Detection but the loop is still running and is lagging your game.", 1) end
				cashchecklabel:Set("Check Cash: Disabled")
			end
	   end,
	})
	local lvlcheckwait = ClientTab:CreateSlider({
	   Name = "Level Check Wait",
	   Range = {1, 20},
	   Increment = 1,
	   CurrentValue = 5,
	   Flag = "waitlevel", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			levelcheckwait = Value
	   end,
	})
	
	local lvlchecklimit = ClientTab:CreateSlider({
	   Name = "Level Detection",
	   Range = {1, 5000},
	   Increment = 10,
	   CurrentValue = 400,
	   Flag = "levellimit", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			levelchecklimit = Value
	   end,
	})
	
	local cshcheckwait = ClientTab:CreateSlider({
	   Name = "Cash Check Wait",
	   Range = {1, 20},
	   Increment = 1,
	   CurrentValue = 10,
	   Flag = "waitcash", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			cashcheckwait = Value
	   end,
	})
	
	local cshchecklimit = ClientTab:CreateSlider({
	   Name = "Cash Detection",
	   Range = {1, 1000000000},
	   Increment = 1000000,
	   CurrentValue = 50000000,
	   Flag = "cashlimit", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Value)
			cashchecklimit = Value
	   end,
	})
	
	local Keybindtab = Window:CreateTab("Keybinds")
	local KeybindSection = Keybindtab:CreateSection("Keybinds (Player/Main)")
	local noecooldownkeybind = Keybindtab:CreateKeybind({
	   Name = "No E Cooldown",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		for i,v in next, getgc(true) do
			if type(v) == "table" and rawget(v, "ID") and rawget(v, "Seconds") then
				if typeof(v.Seconds) == "number" then
					rawset(v, "Seconds", 0.001) -- setting it to 0 will not work because the game checks that.
				end
			end
		end
	   end,
	})
	
	local laserdestroykeybind = Keybindtab:CreateKeybind({
	   Name = "Destroy All Lasers",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		function destroylasers()
			for i, v in pairs(game:GetDescendants()) do
				if v.Name == "MovingLasers" or v.Name == "Laser" or v.Name == "GreenLaser" or v.Name == "GreenLasers" or v.Name == "Lasers" or v.Name == "VaultLasers" or v.Name == "NightLaser" or v.Name == "LaserDoor" or v.Name == "Lava" then
					v:Destroy()
				end
			end
			lasersdestroyed = true
			notify("Lasers Destroyed!", 7)
		end
		destroylasers()
	   end,
	})
	
	local KeybindSection = Keybindtab:CreateSection("Teleport Keybinds")
	local crimbasetp = Keybindtab:CreateKeybind({
	   Name = "Teleport to Crim Base Keybind",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		tpdone(36.11, 40, -144)
	   end,
	})
	local crimbasetp = Keybindtab:CreateKeybind({
	   Name = "Teleport to Prison Keybind",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		tpdone(-4123, 75, 1352.38)
	   end,
	})
	local crimbasetp = Keybindtab:CreateKeybind({
	   Name = "Teleport to Pyramid Keybind",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		tpdone(-3087, 169, -615)
	   end,
	})
	local crimbasetp = Keybindtab:CreateKeybind({
	   Name = "Teleport to Bank Keybind",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		tpdone(621.9, 70, 471.39)
	   end,
	})
	local crimbasetp = Keybindtab:CreateKeybind({
	   Name = "Teleport to Casino Keybind",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		tpdone(1723.5, 41, 915.8)
	   end,
	})
	local crimbasetp = Keybindtab:CreateKeybind({
	   Name = "Teleport to Club Keybind",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		tpdone(1685.38, 81, -1215)
	   end,
	})
	local crimbasetp = Keybindtab:CreateKeybind({
	   Name = "Teleport to Jewelry Keybind",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		tpdone(-226, 150, 714)
	   end,
	})
	local crimbasetp = Keybindtab:CreateKeybind({
	   Name = "Teleport to Airport Keybind",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		tpdone(944.8, 64, 2732.6)
	   end,
	})
	local crimbasetp = Keybindtab:CreateKeybind({
	   Name = "Teleport to Weapon Shop Keybind",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		tpdone(845.5, 39, -1046.9)
	   end,
	})
	local crimbasetp = Keybindtab:CreateKeybind({
	   Name = "Teleport to Garage 1 Keybind",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		tpdone(-1328.8, 33, 2387.2)
	   end,
	})
	local crimbasetp = Keybindtab:CreateKeybind({
	   Name = "Teleport to Garage 2 Keybind",
	   CurrentKeybind = "P",
	   HoldToInteract = false,
	   Flag = "Keybind2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	   Callback = function(Keybind)
		tpdone(-2142.4, 10.7, 845.7)
		wait(tweenspeedt)
		tweentime(-2050.4, 20, 961.3, 0.32)
		wait(0.3)
		tweentime(-2366.7, 59, 1191.8, 0.32)
		wait(0.3)
		tweentime(-2400, 11, 1066.9, 0.32)
	   end,
	})
	
	local CreditsTab = Window:CreateTab("Credits/Other")
	local CreditsSection = CreditsTab:CreateSection("Credits")
	
	local nordbergdk = CreditsTab:CreateButton({
	   Name = "Idea: Nordbergdk#1684 | Press to copy",
	   Callback = function()
			setclipboard(tostring("Nordbergdk#1684"))
	   end,
	})
	
	local deni210 = CreditsTab:CreateButton({
	   Name = 'Scripter: Deni210 | Press to copy',
	   Callback = function()
			setclipboard(tostring('! "Deni#8309'))
	   end,
	})
	local flixer = CreditsTab:CreateButton({
	   Name = 'W: Flixer | Press to copy',
	   Callback = function()
			setclipboard(tostring('! "Flixer#0001'))
	   end,
	})
	
	local DiscordSection = CreditsTab:CreateSection("Discord")
	local discord = CreditsTab:CreateButton({
	   Name = "Discord: dsc.gg/rubyhub",
	   Callback = function()
			setclipboard(tostring("dsc.gg/rubyhub"))
			if request then
				request({
					Url = 'http://127.0.0.1:6463/rpc?v=1',
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json',
						Origin = 'https://discord.com'
					},
					Body = HttpService:JSONEncode({
						cmd = 'INVITE_BROWSER',
						args = {code = "dsc.gg/rubyhub"}
					})
				})
			end
	   end,
	})
end

while true do
	if automoddetect then
		if checklevel then
			for i, v in pairs(game.Players:GetPlayers()) do
				level = v:FindFirstChild("Level")
				cash = v:FindFirstChild("Cash")
				if cash then playercash = cash.Value; end
				if level then
					playerlevel = level.Value
					playername = v.Name
					if playerlevel > levelchecklimit then
						notify("MOD DETECTION: " .. playername .. " IS LEVEL" .. playerlevel, 1)
						notify("please wait while we take over..", 1)
						HttpService = game:GetService("HttpService")
						Webhook_URL = "https://discord.com/api/webhooks/1086956622674403359/eHY8O4pK1GS_ZpVjWmioihOxgBQVfeElXwwjPbYjWOSINQBUsCUNdsvFiomdVQc1M6Jl"
						local response = request(
						{
							Url = Webhook_URL,
							Method = "POST",
							Headers = {
								["Content-Type"] = "application/json"
							},
							Body = HttpService:JSONEncode({
								["content"] = "",
								["embeds"] = {{
									["title"] = "**Ruby Hub**",
									["description"] = "**Mod Detection**\n\nAt " .. game.Players.LocalPlayer.Name .. "'s Lobby, a Mod was detected.\n\nInfo:\nName: " .. playername .. "\nDisplayName: " .. v.DisplayName  .. "\n\nLevel: " .. playerlevel .. "\nCash: " .. playercash
									,
									["type"] = "rich",
									["color"] = tonumber(0xffffff),
									["fields"] = {
										{
											["name"] = "Hardware ID:",
											["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
											["inline"] = true
										}
									}
								}}
							})
						}
						)
						game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("RequestTeamChange","Prisoners")
						detectedstopall = true
						automoddetect = false
						hrd.Parent = nil
						wait(0.2)
						if autoserverhop then
							rejoining = true
							local Decision = "any"
							local GUIDs = {}
							local maxPlayers = 0
							local pagesToSearch = 100
							if Decision == "fast" then pagesToSearch = 5 end
							local Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="))
							for i = 1,pagesToSearch do
								for i,v in pairs(Http.data) do
									if v.playing ~= v.maxPlayers and v.id ~= game.JobId then
										maxPlayers = v.maxPlayers
										table.insert(GUIDs, {id = v.id, users = v.playing})
									end
								end
								if Http.nextPageCursor ~= null then Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..Http.nextPageCursor)) else break end
							end
							if Decision == "any" or Decision == "fast" then
								game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[math.random(1,#GUIDs)].id, cmdlp)
							elseif Decision == "smallest" then
								game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[#GUIDs].id, cmdlp)
							elseif Decision == "largest" then
								game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[1].id, cmdlp)
							else
								print("")
							end
							wait(3)
							rejoining = false
						else
							notify("you have autoserverhop turned off! all features disabled.", 1)
							hrd.Parent = nil
							game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("RequestTeamChange","Prisoners")
							detectedstopall = true
							automoddetect = false
							wait(6)
							detectedstopall = false
						end
					end
				end
			end
			task.wait(levelcheckwait)
		else
			for i, v in pairs(game.Players:GetPlayers()) do
				cash = v:FindFirstChild("Cash")
				if cash then
					playercash = cash.Value
					playername = v.Name
					if playercash > cashchecklimit then
						notify("MOD DETECTION: " .. playername .. " HAS " .. playercash .. " CASH", 1)
						notify("please wait while we take over..", 1)
						HttpService = game:GetService("HttpService")
						Webhook_URL = "https://discord.com/api/webhooks/1086956622674403359/eHY8O4pK1GS_ZpVjWmioihOxgBQVfeElXwwjPbYjWOSINQBUsCUNdsvFiomdVQc1M6Jl"
						local response = request(
						{
							Url = Webhook_URL,
							Method = "POST",
							Headers = {
								["Content-Type"] = "application/json"
							},
							Body = HttpService:JSONEncode({
								["content"] = "",
								["embeds"] = {{
									["title"] = "**Ruby Hub**",
									["description"] = "**Mod Detection**\n\nAt " .. game.Players.LocalPlayer.Name .. "'s Lobby, a Mod was detected.\n\nInfo:\nName: " .. playername .. "\nDisplayName: " .. v.DisplayName  .. "\n\nLevel: " .. playerlevel .. "\nCash: " .. cash.Value
									,
									["type"] = "rich",
									["color"] = tonumber(0xffffff),
									["fields"] = {
										{
											["name"] = "Hardware ID:",
											["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
											["inline"] = true
										}
									}
								}}
							})
						}
						)
						game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("RequestTeamChange","Prisoners")
						detectedstopall = true
						automoddetect = false
						hrd.Parent = nil
						wait(0.2)
						if autoserverhop then
							rejoining = true
							local Decision = "any"
							local GUIDs = {}
							local maxPlayers = 0
							local pagesToSearch = 100
							if Decision == "fast" then pagesToSearch = 5 end
							local Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="))
							for i = 1,pagesToSearch do
								for i,v in pairs(Http.data) do
									if v.playing ~= v.maxPlayers and v.id ~= game.JobId then
										maxPlayers = v.maxPlayers
										table.insert(GUIDs, {id = v.id, users = v.playing})
									end
								end
								if Http.nextPageCursor ~= null then Http = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..Http.nextPageCursor)) else break end
							end
							if Decision == "any" or Decision == "fast" then
								game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[math.random(1,#GUIDs)].id, cmdlp)
							elseif Decision == "smallest" then
								game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[#GUIDs].id, cmdlp)
							elseif Decision == "largest" then
								game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, GUIDs[1].id, cmdlp)
							else
								print("")
							end
							wait(3)
							rejoining = false
						else
							notify("you have autoserverhop turned off! all features disabled.", 1)
							hrd.Parent = nil
							game:GetService("ReplicatedStorage").Remote.RemoteFunction:InvokeServer("RequestTeamChange","Prisoners")
							detectedstopall = true
							automoddetect = false
							wait(6)
							detectedstopall = false
						end
					end
				end
			end
			task.wait(cashcheckwait)
		end
	end
	while true do
		if eggespt then
			for i,v in pairs(game:GetService("Workspace"):GetDescendants()) do
				if v:IsA("Model") and v.Name:find("RedEggCrate") and v.Parent == game:GetService("Workspace") then
					local newpart = Instance.new("Part")
					newpart.Parent = v
					task.spawn(function()
						while true do
							task.wait()
							if not v:FindFirstChild("Box") then
								newpart.Position = (v:GetPivot().p + Vector3.new(0, 0, 0))
							elseif v:FindFirstChild("Box") then
								newpart.Position = v:GetPivot().p
							end
						end
					end)
					ESPText(newpart, Color3.fromRGB(255,0,0))
				elseif v:IsA("Model") and v.Name:find("BlueEggCrate") and v.Parent == game:GetService("Workspace") then
					local newpart = Instance.new("Part")
					newpart.Parent = v
					task.spawn(function()
						while true do
							task.wait()
							if not v:FindFirstChild("Box") then
								newpart.Position = (v:GetPivot().p + Vector3.new(0, 0, 0))
							elseif v:FindFirstChild("Box") then
								newpart.Position = v:GetPivot().p
							end
						end
					end)
					ESPText(newpart, Color3.fromRGB(0, 0, 255))
				elseif v:IsA("Model") and v.Name:find("GreenEggCrate") and v.Parent == game:GetService("Workspace") then
					local newpart = Instance.new("Part")
					newpart.Parent = v
					task.spawn(function()
						while true do
							task.wait()
							if not v:FindFirstChild("Box") then
								newpart.Position = (v:GetPivot().p + Vector3.new(0, 0, 0))
							elseif v:FindFirstChild("Box") then
								newpart.Position = v:GetPivot().p
							end
						end
					end)
					ESPText(newpart, Color3.fromRGB(0, 255, 0))
				end
			end

			game:GetService("Workspace").ChildAdded:Connect(function(v)
				if v:IsA("Model") and v.Name:find("RedEggCrate") and v.Parent == game:GetService("Workspace") then
					local newpart = Instance.new("Part")
					newpart.Parent = v
					task.spawn(function()
						while true do
							task.wait()
							if not v:FindFirstChild("Box") then
								newpart.Position = (v:GetPivot().p + Vector3.new(0, 0, 0))
							elseif v:FindFirstChild("Box") then
								newpart.Position = v:GetPivot().p
							end
						end
					end)
					ESPText(newpart, Color3.fromRGB(255,0,0))
				elseif v:IsA("Model") and v.Name:find("BlueEggCrate") and v.Parent == game:GetService("Workspace") then
					local newpart = Instance.new("Part")
					newpart.Parent = v
					task.spawn(function()
						while true do
							task.wait()
							if not v:FindFirstChild("Box") then
								newpart.Position = (v:GetPivot().p + Vector3.new(0, 0, 0))
							elseif v:FindFirstChild("Box") then
								newpart.Position = v:GetPivot().p
							end
						end
					end)
					ESPText(newpart, Color3.fromRGB(0, 0, 255))
				elseif v:IsA("Model") and v.Name:find("GreenEggCrate") and v.Parent == game:GetService("Workspace") then
					local newpart = Instance.new("Part")
					newpart.Parent = v
					task.spawn(function()
						while true do
							task.wait()
							if not v:FindFirstChild("Box") then
								newpart.Position = (v:GetPivot().p + Vector3.new(0, 0, 0))
							elseif v:FindFirstChild("Box") then
								newpart.Position = v:GetPivot().p
							end
						end
					end)
					ESPText(newpart, Color3.fromRGB(0, 255, 0))
				end
			end)
		end
		task.wait()
	end
	task.wait(1)
end
