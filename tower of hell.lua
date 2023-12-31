repeat wait() until game:isLoaded()
game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Thank you for using Ruby Hub";Icon = "";Duration = 14;})

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Ruby Hub - Tower Of Hell - v1.0", "GrapeTheme")

-- MAIN
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")

MainSection:NewButton("Disable AntiCheat", "Disables the AntiCheat", function()
    local mt = getrawmetatable(game)
	local old = mt.__namecall

	setreadonly(mt, false)

	mt.__namecall = newcclosure(function(self, ...)
	local args = {...}
	local method = getnamecallmethod()
		if method == "Kick" then
			return
		end

	return old(self, ...)
	end)
	setreadonly(mt, true)
	game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript2:Destroy()
	game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript:Destroy()
	game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "AntiCheat Successfully Disabled.";Icon = "";Duration = 14;})
end)

MainSection:NewButton("Delete Kill Parts", "Deletes all Kill Parts", function()
	for i,v in pairs(game:GetService("Workspace").tower:GetDescendants()) do
		if v:IsA("BoolValue") and v.Name == "kills" then
			v.Parent:Destroy()
		end
end
end)

MainSection:NewButton("Instant Win", "Wins.", function()
	local endzone = game.Workspace.tower.sections.finish.FinishGlow.Position
 
    local player = game.Players.LocalPlayer.Character
    player.HumanoidRootPart.Position = endzone
end)

MainSection:NewButton("Tween TP Win", "Wins with Tween TP.", function()
	local endzone = game.Workspace.tower.sections.finish.FinishGlow.Position
	local New_CFrame = CFrame.new(endzone) --The Cord where you want to go
    local ts = game:GetService('TweenService')
    local char = game.Players.LocalPlayer.Character
    local part = char.HumanoidRootPart
    local ti = TweenInfo.new(2, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
    local tp = {CFrame = New_CFrame}
    ts:Create(part, ti, tp):Play()
end)

MainSection:NewToggle("Anti AFK", "Avoids getting Kicked for being AFK", function(state)
	if state == true then
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "AntiAFK Enabled.";Icon = "";Duration = 14;})
		toggled = false
		while toggled == false do
		wait(1)
			x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
			y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y
			z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
			local New_CFrame = CFrame.new(x, y-20, z) --The Cord where you want to go
			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character
			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(0.1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
			wait(0.1)
			local New_CFrame = CFrame.new(x, y, z) --The Cord where you want to go
			local ts = game:GetService('TweenService')
			local char = game.Players.LocalPlayer.Character
			local part = char.HumanoidRootPart
			local ti = TweenInfo.new(0.1, Enum.EasingStyle.Linear) -- The 5 is how fast it is. The higher the slower
			local tp = {CFrame = New_CFrame}
			ts:Create(part, ti, tp):Play()
		end
	else
		toggled = true
		game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "AntiAFK Disabled.";Icon = "";Duration = 14;})
	end
end)

MainSection:NewButton("Join Noob Towers", "Joins Noob Towers", function()
	game:GetService("TeleportService"):Teleport(1962086868, game:GetService("Players").LocalPlayer)
end)
MainSection:NewButton("Join Pro Towers", "Joins Pro Towers", function()
	game:GetService("TeleportService"):Teleport(3582763398, game:GetService("Players").LocalPlayer)
end)
-- MOVEMENT
local Movement = Window:NewTab("Movement/Player")
local MovementSection = Movement:NewSection("Movement/Player")

MovementSection:NewSlider("WalkSpeed", "Changes the walkspeed", 250, 16, function(v) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)
MovementSection:NewSlider("JumpPower", "Changes the jumpPower", 250, 50, function(v) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end)

MovementSection:NewButton("Anti Report", "Makes Players unable to report you", function()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do 
        if v:IsA("Accessory") or v:IsA("BillboardGui") or v:IsA("Decal") or v:IsA("Shirt") or v:IsA("Pants") then 
            v:Destroy()
        end
    end
end)

MovementSection:NewToggle("Noclip", "Enables Noclip", function(state)
    if state then
        Clip = false
        speaker = game.Players.LocalPlayer
        local function NoclipLoop()
            if Clip == false and speaker.Character ~= nil then
                for _, child in pairs(speaker.Character:GetDescendants()) do
                    if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                        child.CanCollide = false
                    end
                end
            end
        end
        game:GetService('RunService').Stepped:Connect(NoclipLoop)
    else
        if Noclipping then
            Noclipping:Disconnect()
        end
        Clip = true
    end
end)



local InfiniteJumpEnabled;
MovementSection:NewToggle("Infinite Jump", "By toggling this you can jump infinitely.", function(State)
    InfiniteJumpEnabled = State
end)

local Player = game:GetService("Players").LocalPlayer
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        Player.Character:WaitForChild("Humanoid"):ChangeState("Jumping")
    end
end)


MovementSection:NewButton("Fly (F)", "Click this and toggle with F", function()
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
    local speed    = 250

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
                speed = maxspeed--speed+1+(speed/maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = 0 --speed-1
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

MovementSection:NewButton("Reset", "Reset your Character", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.StarterGui:SetCore("SendNotification", {Title = "Ruby Hub";Text = "Done!";Icon = "";Duration = 7;})
end)

MovementSection:NewKeybind("Key Bind for hiding/Unhiding the UI   -->", "Click to change keybind", Enum.KeyCode.V, function()
    Library:ToggleUI()
end)

--CREDITS--

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
    setclipboard(tostring("https://discord.com/invite/52Y3H35UtT"))
end)
