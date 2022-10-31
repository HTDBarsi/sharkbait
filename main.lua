local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local gui = lib.CreateLib("Sharkbait", "Sentinel")
local main = gui:NewTab("SharkBait")
local section = main:NewSection("main")
local plr = game.Players.LocalPlayer
local abc = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
local hitreg = nil

for i = #abc,1,-1 do
	if game.ReplicatedStorage.Projectiles.Events.Weapons:FindFirstChild("HitScanHitReg"..string.sub(abc,i,i)) then
		hitreg = game.ReplicatedStorage.Projectiles.Events.Weapons:FindFirstChild("HitScanHitReg"..string.sub(abc,i,i))
		break
	end
end

section:NewButton("kill shark", "Instantly kills the shark", function()
    if #plr.Backpack:GetChildren() ~= 0 then
        plr.Backpack:GetChildren()[1].Parent = plr.Character
    end
    plr.Character.Humanoid.Sit = false
    task.wait(0.5)
    for i = 1,5 do task.wait()
        plr.Character.HumanoidRootPart.CFrame = workspace.Sharks:GetChildren()[1].SharkMain.Ball.CFrame + Vector3.new(0,5,0)
        for _ = 1,50 do
            hitreg:FireServer(workspace.Sharks:GetChildren()[1])
        end
    end
end)
--I love my boyfriend so much <333--
--me too ^-^--
section:NewToggle("autofarm", "farms teeth", function(state)
    getgenv().autofarm = state
    while autofarm do task.wait()
        if plr.Team.Name == "Survivor" and #workspace.Sharks:GetChildren() ~= 0 then
            if #plr.Backpack:GetChildren() ~= 0 then
                plr.Backpack:GetChildren()[1].Parent = plr.Character
            end
            plr.Character.Humanoid.Sit = false
            pcall(function()
                plr.Character.HumanoidRootPart.CFrame = workspace.Sharks:GetChildren()[1].SharkMain.Ball.CFrame + Vector3.new(0,2.5,0)
                for _ = 1,500 do
                    task.spawn(function()
                        hitreg:FireServer(workspace.Sharks:GetChildren()[1])
                    end)
                end
            end)
        else
            task.wait(0.02)
        end
    end
end)

section:NewToggle("auto inv all", "invites everyone lol", function(state)
    getgenv().inv = state
    while inv do task.wait(0.5)
        for _,v in pairs(game.Players:GetChildren()) do
            game.ReplicatedStorage.EventsFolder.BoatSelection.InviteGuestRF:InvokeServer(v.Name)
        end
    end
end)

section:NewButton("anti-afk", "(skidded)", function()
    while task.wait(1) do 
        game:GetService("ReplicatedStorage").EventsFolder.GameLoop.ToggleSpectator:InvokeServer(false)
    end
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)
