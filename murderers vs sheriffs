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
    Farming = Window:AddTab({ Title = "Farming", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}
local Options = Fluent.Options
local iskilling = false
function killall()
	for i, v in pairs(game.Players:GetPlayers()) do
		spawn(function()
			pcall(function()
				local ohVector31 = Vector3.new(-186.46624755859375, 49.74998474121094, math.random(-49.323232, 49.488882))
				local ohVector32 = Vector3.new(-254.47802734375, 68.99893188476562, math.random(-49.323232, 49.488882))
				local ohInstance3 = v.Character.LowerTorso
				local ohVector34 = Vector3.new(-222.7018585205078, 60.864871978759766, math.random(-49.323232, 49.488882))
				
				game:GetService("ReplicatedStorage").Remotes.Shoot:FireServer(ohVector31, ohVector32, ohInstance3, ohVector34)
			end)
		end)
	end
end
function equipgun()
	for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v:FindFirstChild("Fire") then
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
			break
		end
	end
end
do
    Fluent:Notify({
        Title = "Ruby Hub",
        Content = "Thank you for using Ruby Hub!\ndiscord.gg/rubyhub (copied)",
        Duration = 5
    })
    setclipboard(tostring("discord.gg/rubyhub"))
    Tabs.Farming:AddButton({
        Title = "Kill All",
        Description = "Kills everyone in the current map you're playing",
        Callback = function()
			equipgun()
			task.wait(0.7)
            killall()
        end
    })
    local loopkillall = Tabs.Farming:AddToggle("loopkill", {Title = "Loop Kill All", Default = false })
    loopkillall:OnChanged(function(Value)
        iskilling = Value
    end)
end
iskilling = false
spawn(function()
    while task.wait() do
        if iskilling then
			equipgun()
            killall()
			task.wait(0.5)
		end
    end
end)
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("Ruby Hub MVS")
SaveManager:SetFolder("Ruby Hub MVS")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
