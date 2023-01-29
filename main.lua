local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local sbtheme = "DarkTheme"
if isfile("sbtheme.txt") then
    sbtheme = readfile("sbtheme.txt")
end
local gui = lib.CreateLib("CatWare", sbtheme)
local main = gui:NewTab("ðŸ¦ˆðŸŽ£")
local guns = gui:NewTab("Gun mods")
local section = main:NewSection("Main")
local etc = main:NewSection("Others")
local guns = guns:NewSection("Gun mods")
local plr = game.Players.LocalPlayer
local abc = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
game:HttpGet("https://api.countapi.xyz/update/mcitomi-sharkbait/f8051a91-ecc1-470c-9fb4-04177d3c7682/?amount=1")
etc:NewKeybind("Open/close GUI", "", Enum.KeyCode.RightShift, function()
	lib:ToggleUI()
end)

-- you should kill the person called "yourself" 😹

local s = require(game:GetService("ReplicatedStorage").Projectiles.ProjectileStatsModule)

section:NewButton("OP guns", "Modifies the guns to be OP", function()
    for i,v in pairs(s.get()) do 
        v.FireRate = math.huge
        v.ReloadTime = 1e-123
        v.Spread = 0 
        v.MagSize = 9e9
        v.Mode = 2
        v.ProjectileSpeed = 15000
        v.Range = 100000
        v.Recoil = Vector3.new(0,0,0)
    end
end)

guns:NewSlider("FireRate", "Set the firerate", 500, 0, function(val)
    for i,v in pairs(s.get()) do 
        v.FireRate = val
    end
end)

guns:NewSlider("Reload time", "Set the reload time", 5, 0, function(val)
    for i,v in pairs(s.get()) do 
        v.ReloadTime = val
    end
end)

guns:NewSlider("Spread", "Set the spread", 5, 0, function(val)
    for i,v in pairs(s.get()) do 
        v.Spread = val
    end
end)

guns:NewSlider("Mag size", "Set the mag's size", 100000, 10, function(val)
    for i,v in pairs(s.get()) do 
        v.MagSize = val
    end
end)

guns:NewSlider("Projectile Speed", "Set the speed of the bullets", 50000, 0, function(val)
    for i,v in pairs(s.get()) do 
        v.ProjectileSpeed = val
    end
end)

guns:NewSlider("Range", "Set the range", 500000, 1000, function(val)
    for i,v in pairs(s.get()) do 
        v.Range = val
    end
end)

guns:NewSlider("Recoil", "Set the recoil", 5, 0, function(val)
    for i,v in pairs(s.get()) do 
        v.Range = Vector3.new(val,val,val)
    end
end)

etc:NewToggle("Clear water", "makes water see-through", function(state)
    if state then
        game:GetService("Workspace").Terrain.WaterTransparency = 1 
    else
        game:GetService("Workspace").Terrain.WaterTransparency = 0.35
    end
end)

etc:NewToggle("Auto inv all", "invites everyone lol", function(state)
    getgenv().inv = state
    while inv do task.wait(0.5)
        for _,v in pairs(game.Players:GetChildren()) do
            game.ReplicatedStorage.EventsFolder.BoatSelection.InviteGuestRF:InvokeServer(v.Name)
        end
    end
end)

etc:NewToggle("looptp to shark", "teleport to shark", function(state)
    getgenv().sharkie = state
    pcall(function()
        while sharkie do task.wait(0.02)
            if workspace.Sharks:GetChildren()[1] ~= nil then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Sharks:GetChildren()[1].SharkMain.Ball.CFrame + Vector3.new(0,5,0)
            end
        end
    end)
end)

etc:NewButton("Anti-afk", ":)", function()
    task.spawn(function()
        while task.wait(1) do 
            game:GetService("ReplicatedStorage").EventsFolder.GameLoop.ToggleSpectator:InvokeServer(false)
        end
    end)
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)
