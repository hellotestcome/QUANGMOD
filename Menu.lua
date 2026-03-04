-- AUTO EXECUTE KHI ĐỔI SERVER
local queue_on_teleport = queue_on_teleport or syn.queue_on_teleport or fluxus.queue_on_teleport
if queue_on_teleport then
    queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/hellotestcome/QUANGMOD/refs/heads/main/Menu.lua"))()')
end

-- TẢI THƯ VIỆN UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "QUANG MOD HUB", SubTitle = "- Blox Fruit",
    TabWidth = 160, Size = UDim2.fromOffset(580, 460),
    Acrylic = true, Theme = "Dark", MinimizeKey = Enum.KeyCode.LeftControl
})

-- TẠO TAB
local Tabs = {
    Main = Window:AddTab({ Title = "Farming", Icon = "swords" }),
    Shop = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }),
    Admin = Window:AddTab({ Title = "Admin & Fake", Icon = "shield-alert" }),
    Stat = Window:AddTab({ Title = "Status", Icon = "server" })
}

-- TAB FARMING
local FarmSec = Tabs.Main:AddSection("Main Farming")
FarmSec:AddDropdown("SelectMethod", { Title = "Method Farm", Values = {"Level Farm", "Farm Bones", "Aura Farm"}, Default = "Level Farm", Callback = function(v) _G.MethodSelect = v end })
FarmSec:AddToggle("StartFarm", { Title = "Start Auto Farm", Default = false, Callback = function(v) _G.StartFarm = v end })
FarmSec:AddToggle("AcceptQuest", { Title = "Auto Accept Quest", Default = false, Callback = function(v) _G.AcceptQuestC = v end })

local SetSec = Tabs.Main:AddSection("Settings")
SetSec:AddDropdown("Weapon", { Title = "Select Weapon", Values = {"Melee","Sword","Blox Fruit"}, Default = "Melee", Callback = function(v) _G.ChooseWP = v end })
SetSec:AddToggle("Bring", { Title = "Bring Mobs", Default = true, Callback = function(v) _B = v end })

-- TAB SHOP
local ShopSec = Tabs.Shop:AddSection("Buy Items")
ShopSec:AddButton({ Title = "Redeem All Codes", Callback = function()
    local codes = {"LIGHTNINGABUSE", "1LOSTADMIN", "ADMINFIGHT"}
    for _, v in pairs(codes) do game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v) end
end})
ShopSec:AddButton({ Title = "Buy Godhuman", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman") end })

-- TAB ADMIN & FAKE
local AdSec = Tabs.Admin:AddSection("Special Functions")
AdSec:AddToggle("Store", { Title = "Auto Store Fruit", Default = false, Callback = function(v) _G.AutoStoreFruit = v end })
AdSec:AddButton({ Title = "Fake Admin (!ad)", Callback = function()
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
        if msg == "!ad" then
            game.StarterGui:SetCore("SendNotification", {Title = "QUANG MOD", Text = "Admin Mode Activated"})
        end
    end)
end})

-- LOGIC TÀNG HÌNH (SPACE)
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(i, p)
    if not p and i.KeyCode == Enum.KeyCode.Space then
        local char = game.Players.LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end end
        end
    end
end)
UIS.InputEnded:Connect(function(i)
    if i.KeyCode == Enum.KeyCode.Space then
        local char = game.Players.LocalPlayer.Character
        if char then
            for _, v in pairs(char:GetDescendants()) do if (v:IsA("BasePart") and v.Name ~= "HumanoidRootPart") or v:IsA("Decal") then v.Transparency = 0 end end
        end
    end
end)

-- HỆ THỐNG NHUỘM ĐỎ (OVERRIDE THEME)
task.spawn(function()
    while task.wait(1) do 
        pcall(function()
            for _, gui in pairs(game:GetService("CoreGui"):GetChildren()) do
                if gui:IsA("ScreenGui") then
                    for _, obj in pairs(gui:GetDescendants()) do
                        if obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
                            if obj.BackgroundColor3.R < 0.3 then obj.BackgroundColor3 = Color3.fromRGB(180, 60, 60) end
                        end
                        if obj:IsA("TextLabel") or obj:IsA("TextButton") then obj.TextColor3 = Color3.fromRGB(255, 255, 255) end
                    end
                end
            end
        end)
    end
end)

Window:SelectTab(1)
