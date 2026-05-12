local player = game.Players.LocalPlayer
local backpack = player.Backpack

local function hasItem()
    return backpack:FindFirstChild("ItemName") ~= nil
end

local running = true

while running do
    task.wait(0.2)

    if hasItem() then
        running = false
        print("Đã có item, dừng script")
        break
    end

    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("TouchTransmitter") then
            firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
end
