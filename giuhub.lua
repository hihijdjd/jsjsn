local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "GIU HUB 🏴‍☠️ | Cursed Ship Update", HidePremium = false, SaveConfig = true, ConfigFolder = "GiuHubShip", IntroText = "Giu Hub Loading..."})

_G.AutoChest = false
local itemToStop = "Fist of Darkness"

local function checkKey()
    local lp = game:GetService("Players").LocalPlayer
    if lp.Character and lp.Character:FindFirstChild(itemToStop) then return true end
    if lp:FindFirstChild("Backpack") and lp.Backpack:FindFirstChild(itemToStop) then return true end
    return false
end

local function safeTeleport(targetCFrame)
    local lp = game:GetService("Players").LocalPlayer
    local char = lp.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        for _, part in pairs(char:GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
        char.HumanoidRootPart.CFrame = targetCFrame + Vector3.new(0, 3, 0)
    end
end

local MainTab = Window:MakeTab({Name = "Auto Chest", Icon = "rbxassetid://4483345998", PremiumOnly = false})
MainTab:AddToggle({
    Name = "Auto Chest (Vượt Tàu Ma + Chống Mất Key)",
    Default = false,
    Callback = function(Value)
        _G.AutoChest = Value
        if Value then
            task.spawn(function()
                while _G.AutoChest do
                    task.wait(0.05)
                    if checkKey() then
                        _G.AutoChest = false
                        local char = game:GetService("Players").LocalPlayer.Character
                        if char then
                            for _, part in pairs(char:GetChildren()) do
                                if part:IsA("BasePart") then part:Destroy() end
                            end
                        end
                        task.wait(0.2)
                        game:GetService("Players").LocalPlayer:Kick("🏴‍☠️ GIU HUB: Đã nhặt được Fist of Darkness! Đã kick an toàn.")
                        break
                    end
                    local lp = game:GetService("Players").LocalPlayer
                    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                        for _, object in pairs(game:GetService("Workspace"):GetChildren()) do
                            if object.Name:find("Chest") and object:IsA("Part") then
                                if not _G.AutoChest or checkKey() then break end
                                safeTeleport(object.CFrame)
                                task.wait(0.35)
                            end
                        end
                    end
                end
            end)
        end
    end    
})
OrionLib:Init()
