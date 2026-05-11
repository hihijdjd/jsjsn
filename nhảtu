_G.Auto = true
while _G.Auto do
    task.wait(0.1)
    local bp = game.Players.LocalPlayer.Backpack
    -- Dừng script nếu có Chén hoặc Fist
    if bp:FindFirstChild("God's Chalice") or bp:FindFirstChild("Fist of Darkness") then
        _G.Auto = false
        print("DA TIM THAY DO QUY - STOP!")
        break
    end
    -- Gom rương (dùng hàm firetouch của Delta)
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("TouchTransmitter") and v.Parent.Name:find("Chest") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
end
