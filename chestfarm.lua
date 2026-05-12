--[[
    BLOX FRUITS CHEST FARM - AUTO STOP EDITION
    Supported: Delta X, Fluxus, Hydrogen, Arceus X
]]

_G.AutoFarmChest = true
_G.StopOnItem = true -- Script will stop if a new item is added to inventory

local Player = game.Players.LocalPlayer
local Backpack = Player.Backpack
local Character = Player.Character
local RootPart = Character:WaitForChild("HumanoidRootPart")

-- Notification Function
local function SendNotify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = 5;
    })
end

-- Item Detection Logic
Backpack.ChildAdded:Connect(function(item)
    if _G.StopOnItem and _G.AutoFarmChest then
        _G.AutoFarmChest = false
        SendNotify("Item Found!", "Received: " .. item.Name .. ". Stopping script...")
        print("[SYSTEM] Stopped because item was found: " .. item.Name)
    end
end)

-- Main Farm Loop
spawn(function()
    print("[SYSTEM] Starting Chest Farm...")
    SendNotify("Chest Farm", "Script is now running!")

    while _G.AutoFarmChest do
        task.wait(0.1)
        local success, err = pcall(function()
            local foundChest = false
            
            -- Scan Workspace for Chests
            for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:IsA("Model") and v.Name:find("Chest") then
                    local chestPart = v:FindFirstChild("TouchInterest") or v:FindFirstChildWhichIsA("BasePart")
                    
                    if chestPart and _G.AutoFarmChest then
                        foundChest = true
                        -- Teleport to Chest
                        RootPart.CFrame = v:GetModelCFrame()
                        
                        -- Bypass touch requirement
                        firetouchinterest(RootPart, chestPart.Parent, 0)
                        firetouchinterest(RootPart, chestPart.Parent, 1)
                        
                        task.wait(0.3) -- Small delay to collect
                    end
                end
                if not _G.AutoFarmChest then break end
            end

            -- If no chests found on map
            if not foundChest then
                task.wait(1)
            end
        end)

        if not success then
            warn("[ERROR] Farm Error: " .. err)
        end
    end
end)
