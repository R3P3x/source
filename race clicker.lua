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
	Travel = Window:AddTab({ Title = "Travel", Icon = "" }),
	Pets = Window:AddTab({ Title = "Pets", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
local rubyhub = {
	nolag = false,
	dontshowautofarmnolag = false,
	farming = false,
	notifiedautofarmdisabled = false,
	notifiedautofarmenabled = false
}
function notify(title, content)
	if title and not content then content = title; title = "Ruby Hub" end
	Fluent:Notify({
		Title = title,
		Content = content,
		Duration = 5
	})
end
local Options = Fluent.Options

notify("Thanks for using Ruby Hub!")
local nolag;
local autofarm = Tabs.Main:AddToggle("autofarm", {Title = "Autofarm", Default = false })
autofarm:OnChanged(function(toggled)
	if toggled then
		if not rubyhub.nolag and not rubyhub.dontshowautofarmnolag then
			Window:Dialog({
				Title = "Ruby Hub",
				Content = "No Lag is disabled, Enable?",
				Buttons = {
					{
						Title = "Enable",
						Callback = function()
							rubyhub.nolag = true
							if game:GetService("Workspace").LoadedWorld:FindFirstChild("Track") then
								game:GetService("Workspace").LoadedWorld.Track.Parent = game.ReplicatedStorage
							end
							safe = Instance.new("Part")
							safe.Parent = game.Workspace
							safe.CFrame = CFrame.new(2.4, 0.01, 7.)
							safe.Anchored = true
							safe.CanCollide = true
							safe.Size = Vector3.new(1000, 0.1, 1000)
							safe.Name = "safe"
							safe2 = Instance.new("Part")
							safe2.Parent = game.Workspace
							safe2.CFrame = CFrame.new(-444400, 0.01, 0.5)
							safe2.Anchored = true
							safe2.CanCollide = true
							safe2.Size = Vector3.new(1000, 0.1, 1000)
							safe2.Name = "safe2"
							safe1 = Instance.new("Part")
							safe1.Parent = game.Workspace
							safe1.CFrame = CFrame.new(-440900, 0.01, 0.5)
							safe1.Anchored = true 
							safe1.CanCollide = true
							safe1.Size = Vector3.new(1000, 0.1, 1000)
							safe1.Name = "safe1"
						end
					},
					{
						Title = "Don't ask again",
						Callback = function()
							rubyhub.dontshowautofarmnolag = true
						end
					}
				}
			})
		end
		rubyhub.farming = true
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		while rubyhub.farming do
			pcall(function()
				if workspace:FindFirstChild("LoadedWorld").WorldMain.Door.Gate.CanCollide then
					if not rubyhub.notifiedautofarmdisabled then
						rubyhub.notifiedautofarmdisabled = true
						notify("Autofarm stopped because round ended, wait for round to begin.")
					end
					rubyhub.notifiedautofarmenabled = false
				else
					game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-440900, 3.01, 0.5)
					task.wait(0.001)
					game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-444400, 3.01, 0.5)
					rubyhub.notifiedautofarmdisabled = false
					if not rubyhub.notifiedautofarmenabled then
						rubyhub.notifiedautofarmenabled = true
						notify("Autofarm resumed.")
					end
				end
			end)
			task.wait(0.01)
		end
	else
		rubyhub.farming = false
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 2147483647
		if rubyhub.nolag then
			if nolag then
				Options.nolagsys:SetValue(true)
			end
		end
	end
end)

nolag = Tabs.Main:AddToggle("nolagsys", {Title = "No Lag", Default = false })
nolag:OnChanged(function(toggled)
	if toggled then
		rubyhub.nolag = true
		if game:GetService("Workspace").LoadedWorld:FindFirstChild("Track") then
			game:GetService("Workspace").LoadedWorld.Track.Parent = game.ReplicatedStorage
		end
		if not workspace:FindFirstChild("safe") then
			safe = Instance.new("Part")
			safe.Parent = game.Workspace
			safe.CFrame = CFrame.new(2.4, 0.01, 7.)
			safe.Anchored = true
			safe.CanCollide = true
			safe.Size = Vector3.new(1000, 0.1, 1000)
			safe.Name = "safe"
			safe2 = Instance.new("Part")
			safe2.Parent = game.Workspace
			safe2.CFrame = CFrame.new(-444400, 0.01, 0.5)
			safe2.Anchored = true
			safe2.CanCollide = true
			safe2.Size = Vector3.new(1000, 0.1, 1000)
			safe2.Name = "safe2"
			safe1 = Instance.new("Part")
			safe1.Parent = game.Workspace
			safe1.CFrame = CFrame.new(-440900, 0.01, 0.5)
			safe1.Anchored = true 
			safe1.CanCollide = true
			safe1.Size = Vector3.new(1000, 0.1, 1000)
			safe1.Name = "safe1"
		end
	else
		rubyhub.nolag = false
		if game:GetService("ReplicatedStorage"):FindFirstChild("Track") then
			game:GetService("ReplicatedStorage").Track.Parent = game:GetService("Workspace").LoadedWorld
		end
		if workspace:FindFirstChild("safe1") then
			workspace.safe:Destroy()
			workspace.safe1:Destroy()
			workspace.safe2:Destroy()
		end
	end
end)

local autoclick = Tabs.Main:AddToggle("autoclick", {Title = "Autoclick", Default = false })
autoclick:OnChanged(function(toggled)
	while toggled == true do
		if game.Workspace.LoadedWorld.WorldMain.Door.SignStatus.SurfaceGui.Status.Text == "Click to build up Speed" then
			game.ReplicatedStorage.Packages.Knit.Services.ClickService.RF.Click:InvokeServer()
			wait(0.0000001)
		else
			wait(0.1)
		end
	end
end)
local autorebirth = Tabs.Main:AddToggle("autorebirth", {Title = "Auto Rebirth", Default = false })
autorebirth:OnChanged(function(toggled)
	while toggled do
		game:GetService("ReplicatedStorage").Packages.Knit.Services.RebirthService.RF.Rebirth:InvokeServer()
		task.wait(0.2)
	end
end)
Tabs.Main:AddButton({
	Title = "Redeem all Codes",
	Description = "Redeems all Codes",
	Callback = function()
		local codes = {
			"happyanniversaryraceclicker",
			"sorryforanotherrejoin",
			"500mvisits",
			"goodupdate",
			"happy4thofjuly",
			"freepet",
			"forgiveusfornoupdate",
			"x330min5",
			"x3wincode2",
			"x3upd1",
			"winsop2",
			"NEWCODEWIN1",
			"FREEPET1",
			"X3WOWCODE",
			"obbyboost",
			"UPDATECLICKCODE",
			"500KLikes",
			"Almost100MVisits",
			"ThankYou50M",
			"1MGroupMembers",
			"ThanksFor5MillionsVisits",
			"LetsGo5KLikes",
			"NewUpdate"
			
		}
		for i, code in pairs(codes) do
			game:GetService("ReplicatedStorage").Packages.Knit.Services.CodesService.RF.Redeem:InvokeServer(code)
		end
	end
})
Tabs.Main:AddButton({
	Title = "Reset",
	Description = "Reset your Character",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.Health = 0
	end
})

Tabs.Main:AddButton({
	Title = "Serverhop",
	Description = "Go to a different server.",
	Callback = function()
		Window:Dialog({
			Title = "Ruby Hub",
			Content = "Serverhopping will unload the GUI and switch servers",
			Buttons = {
				{
					Title = "i know",
					Callback = function()
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

						Teleport()
					end
				},
				{
					Title = "i misclicked",
					Callback = function()
					end
				}
			}
		})
	end
})
Tabs.Travel:AddButton({
	Title = "Travel to Race",
	Description = "Switch to Race.",
	Callback = function()
		game:GetService("ReplicatedStorage").Packages.Knit.Services.GameModeService.RF.Travel:InvokeServer("Race")
	end
})
Tabs.Travel:AddButton({
	Title = "Travel to Event",
	Description = "Switch to Event.",
	Callback = function()
		game:GetService("ReplicatedStorage").Packages.Knit.Services.GameModeService.RF.Travel:InvokeServer("Event")
	end
})
Tabs.Travel:AddButton({
	Title = "Travel to Event Part 2",
	Description = "Switch to Event Part 2.",
	Callback = function()
		game:GetService("ReplicatedStorage").Packages.Knit.Services.GameModeService.RF.Travel:InvokeServer("EventWorld2")
	end
})
local autosayan = Tabs.Pets:AddToggle("autosayan", {Title = "Auto open Sayan Egg", Default = false })
autosayan:OnChanged(function(toggled)
	while toggled do
		game:GetService("ReplicatedStorage").Packages.Knit.Services.EggService.RF.Open:InvokeServer("Sayan Egg", "1", {})
		task.wait(0.3)
	end
end)
local autocraft = Tabs.Pets:AddToggle("autocraft", {Title = "Auto Craft all Pets", Default = false })
autocraft:OnChanged(function(toggled)
	while toggled do
		game:GetService("ReplicatedStorage").Packages.Knit.Services.PetsService.RF.CraftAll:InvokeServer()
		task.wait(1)
	end
end)
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
