--[[ 
    OPTIMIZED CHEST FARM - SEA 2 VERSION
    Auto-stop on item + Noclip + Anti-stuck
]]

_G.AutoFarmChest = true
_G.StopOnItem = true

local Player = game.Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Chest Farm Status";
    Text = "Starting... Please wait for chests!";
    Duration = 5;
})

-- Stop logic
Player.Backpack.ChildAdded:Connect(function(item)
    if _G.StopOnItem then
        _G.AutoFarmChest = false
        print("Found item: " .. item.Name .. " - Stopping!")
    end
end)

-- Noclip (Bay xuyên tường để không bị kẹt)
RunService.Stepped:Connect(function()
    if _G.AutoFarmChest and Player.Character then
        for _, part in pairs(Player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Main Loop
task.spawn(function()
    while _G.AutoFarmChest do
        task.wait(0.1)
        local foundChest = false
        
        -- Scanning for chests
        for _, v in pairs(Workspace:GetChildren()) do
            if v:IsA("Model") and v.Name:find("Chest") then
                local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                local target = v:FindFirstChildWhichIsA("BasePart") or v:FindFirstChild("TouchInterest")
                
                if root and target then
                    foundChest = true
                    -- Teleport to chest position
                    root.CFrame = v:GetModelCFrame()
                    
                    -- Simulation touch
                    firetouchinterest(root, target.Parent, 0)
                    firetouchinterest(root, target.Parent, 1)
                    
                    task.wait(0.2) -- Delay to collect
                end
            end
            if not _G.AutoFarmChest then break end
        end
        
        -- Wait if no chests are available on the map
        if not foundChest then
            task.wait(2)
        end
    end
end)
