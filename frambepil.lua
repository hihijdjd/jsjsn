_G.AutoFarmChest = true
_G.StopOnItem = true

local Player = game.Players.LocalPlayer

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Chest Farm";
    Text = "Script is Running!";
    Duration = 5;
})

-- Detect New Item to Stop
Player.Backpack.ChildAdded:Connect(function()
    if _G.StopOnItem then
        _G.AutoFarmChest = false
    end
end)

-- Main Farm Loop
task.spawn(function()
    while _G.AutoFarmChest do
        task.wait(0.1)
        local found = false
        for _, v in pairs(game.Workspace:GetChildren()) do
            if v:IsA("Model") and v.Name:find("Chest") then
                local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                local target = v:FindFirstChildWhichIsA("BasePart") or v:FindFirstChild("TouchInterest")
                if root and target then
                    found = true
                    root.CFrame = v:GetModelCFrame()
                    firetouchinterest(root, target.Parent, 0)
                    firetouchinterest(root, target.Parent, 1)
                    task.wait(0.2)
                end
            end
            if not _G.AutoFarmChest then break end
        end
        if not found then task.wait(1) end
    end
end)
