--[[
    AUTO CHEST BLOX FRUITS - DELTA X 2026
    Tính năng: Nhặt rương, dừng khi có trái/item mới.
--]]

_G.AutoChest = true -- Đổi thành false để dừng script
_G.StopOnItem = true -- Dừng khi nhận được item
_G.TargetItems = {"Fruit", "Legendary", "Mythical"} -- Loại item dừng lại

spawn(function()
    while _G.AutoChest do
        task.wait(0.5)
        pcall(function()
            for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
                if string.find(v.Name, "Chest") then
                    if _G.AutoChest then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v, 0)
                        task.wait(0.1)
                        firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v, 1)
                    end
                end
            end
        end)
    end
end)

-- Tính năng kiểm tra item và dừng
if _G.StopOnItem then
    game:GetService("Players").LocalPlayer.Backpack.ChildAdded:Connect(function(child)
        for _, itemName in pairs(_G.TargetItems) do
            if string.find(child.Name, itemName) then
                print("Đã phát hiện vật phẩm: " .. child.Name .. ". Đang dừng Auto Chest!")
                _G.AutoChest = false
            end
        end
    end)
end
