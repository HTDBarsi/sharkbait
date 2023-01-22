local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local gui = lib.CreateLib("CumHaxx", "DarkTheme")
local main = gui:NewTab("😁😁")
local section = main:NewSection("Main")

local remote = game:GetService("ReplicatedStorage").Packages.Knit.Services.ClickService.RF.Click
local plr = game.Players.LocalPlayer
local closest = {{HumanoidRootPart = {Position = Vector3.new(9e9,9e9,9e9)}},9e9}
local dist = 0

function mag(p1,p2,dist)
    return math.abs(p1.Z-p2.Z)+math.abs(p1.X-p2.X) < dist
end
_G.range = 10
section:NewToggle("Kill aura", "kills enemies lol", function(state) 
    if not state then _G.killaura = false end
    _G.killaura = true
    while task.wait(0.01) and _G.killaura do 
        for i,v in pairs(game:GetService("Workspace").Live.NPCs.Client:GetChildren()) do 
            if mag(plr.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,_G.range) then
                remote:InvokeServer(v.Name)
            end
        end
    end
end)

section:NewSlider("Range","The killaura's range",50,5,function(val)
    _G.range = val 
end)

section:NewToggle("Auto pickup", "picks up coins n stuff automatically", function(state)
    for i,v in pairs(game:GetService("Workspace").Live.Pickups:GetChildren()) do 
        v.CFrame = plr.Character.HumanoidRootPart.CFrame
    end
    _G.pickup = state
end)

game.Workspace.Live.Pickups.ChildAdded:Connect(function(v)
    if _G.pickup == true then 
        v.CFrame = plr.Character.HumanoidRootPart.CFrame 
    end
end)
