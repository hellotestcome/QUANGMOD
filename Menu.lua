local queue_on_teleport = queue_on_teleport or syn.queue_on_teleport or fluxus.queue_on_teleport
if queue_on_teleport then
    queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/hellotestcome/QUANGMOD/refs/heads/main/Menu.lua"))()')
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "QUANG MOD HUB",
    SubTitle = "- Blox Fruit",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark", -- MÀU GỐC CỦA FLUENT
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- KHỞI TẠO TOÀN BỘ TAB (FULL)
local Tabs = {
    Webhook = Window:AddTab({ Title = "Report & Ideas", Icon = "message-circle" }),
    Shop = Window:AddTab({ Title = "Shop / Misc", Icon = "shopping-cart" }),
    StatSer = Window:AddTab({ Title = "Status & Server", Icon = "server" }),
    LocalPlayer = Window:AddTab({ Title = "Local Player", Icon = "user" }),
    Settings = Window:AddTab({ Title = "Setting Farm", Icon = "settings" }),
    Skills = Window:AddTab({ Title = "Select Skill", Icon = "crosshair" }),
    Farming = Window:AddTab({ Title = "Main Farming", Icon = "swords" }),
    Stack = Window:AddTab({ Title = "Stack Farming", Icon = "layers" }),
    Other = Window:AddTab({ Title = "Other Farming", Icon = "box" }),
    AdminFake = Window:AddTab({ Title = "Admin & Fake", Icon = "shield-alert" })
}

-- ================== TAB: REPORT ==================
local WebSec = Tabs.Webhook:AddSection("Send Message")
local selectedType = nil; local userMessage = ""
WebSec:AddDropdown("ReportType", { Title = "Select Type", Values = {"Report", "Ideas"}, Callback = function(v) selectedType = v end })
WebSec:AddInput("ReportMsg", { Title = "Input Message", Callback = function(v) userMessage = v end })
WebSec:AddButton({ Title = "Send To Developer", Callback = function() print("Send: " .. tostring(selectedType) .. " - " .. tostring(userMessage)) end })

-- ================== TAB: SHOP ==================
local ShopSec1 = Tabs.Shop:AddSection("Misc Shop")
ShopSec1:AddButton({ Title = "Redeem All Codes", Callback = function()
    local codes = {"LIGHTNINGABUSE", "1LOSTADMIN", "ADMINFIGHT", "NOMOREHACK", "BANEXPLOIT", "krazydares"}
    for _, v in pairs(codes) do game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v) end
end})
ShopSec1:AddButton({ Title = "Teleport Old World", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain") end})
ShopSec1:AddButton({ Title = "Teleport New World", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa") end})
ShopSec1:AddButton({ Title = "Teleport Third Sea", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou") end})
ShopSec1:AddButton({ Title = "Reroll Race", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1") end})
ShopSec1:AddButton({ Title = "Reset Stats", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1") end})

local ShopSec2 = Tabs.Shop:AddSection("Fighting Style")
local styles = {"BuyBlackLeg", "BuyFishmanKarate", "BuyElectro", "BuySuperhuman", "BuyDeathStep", "BuySharkmanKarate", "BuyElectricClaw", "BuyDragonTalon", "BuyGodhuman", "BuySanguineArt"}
for _, s in pairs(styles) do
    ShopSec2:AddButton({ Title = s:gsub("Buy", "Buy "), Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(s) end })
end

-- ================== TAB: STATUS & SERVER ==================
local SrvSec = Tabs.StatSer:AddSection("Server Status")
local TimeLabel = SrvSec:AddLabel("Time Zone: Loading...")
local MirageLabel = SrvSec:AddLabel("Mirage Island: ❌")
local KitsuneLabel = SrvSec:AddLabel("Kitsune Island: ❌")
local FMLabel = SrvSec:AddLabel("Full Moon: ❌")

task.spawn(function()
    while task.wait(1) do pcall(function()
        TimeLabel:SetText("Time Zone: " .. os.date("%X"))
        MirageLabel:SetText("Mirage Island: " .. (game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") and "✅ Found" or "❌ Not Found"))
        KitsuneLabel:SetText("Kitsune Island: " .. (game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") and "✅ Found" or "❌ Not Found"))
    end) end
end)

local HopSec = Tabs.StatSer:AddSection("Server Management")
HopSec:AddInput("JobID", { Title = "Input JobID", Callback = function(v) getgenv().Job = v end })
HopSec:AddButton({ Title = "Join Server", Callback = function() if getgenv().Job then game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, getgenv().Job) end end })
HopSec:AddButton({ Title = "Rejoin", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end })
HopSec:AddButton({ Title = "Hop Server", Callback = function() print("Hopping server...") end })

-- ================== TAB: LOCAL PLAYER ==================
local LocSec1 = Tabs.LocalPlayer:AddSection("Character")
LocSec1:AddButton({ Title = "Open Devil Fruit Shop", Callback = function() local rs = game:GetService("ReplicatedStorage") local dlg = require(rs.DialogueController) dlg:Start(require(rs.DialoguesList)["FruitShop"]) end })
LocSec1:AddButton({ Title = "Join Pirates", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates") end })
LocSec1:AddButton({ Title = "Join Marines", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines") end })
LocSec1:AddToggle("RemoveDmg", { Title = "Remove Damage Text", Default = true, Callback = function(v) if game:GetService("ReplicatedStorage").Assets.GUI:FindFirstChild("DamageCounter") then game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = not v end end })

local LocSec2 = Tabs.LocalPlayer:AddSection("Auto Stats")
LocSec2:AddDropdown("StatSelect", { Title = "Select Stats", Values = {"Melee", "Sword", "Gun", "Devil Fruit", "Defense"}, Callback = function(v) _G.SelectedStat = v end })
LocSec2:AddSlider("StatPoint", { Title = "Point Stats", Min = 1, Max = 100, Default = 1, Callback = function(v) _G.pSats = v end })
LocSec2:AddToggle("AutoStat", { Title = "Auto Stats", Default = false, Callback = function(v) _G.Auto_Stats = v end })

-- ================== TAB: SETTING FARM ==================
local SetSec = Tabs.Settings:AddSection("General Settings")
SetSec:AddDropdown("Weapon", { Title = "Select Weapon", Values = {"Melee","Sword","Blox Fruit"}, Default = "Melee", Callback = function(v) _G.ChooseWP = v end })
SetSec:AddToggle("BringMob", { Title = "Bring Mobs", Default = true, Callback = function(v) _B = v end })
SetSec:AddToggle("AutoBuso", { Title = "Auto Haki Buso", Default = true, Callback = function(v) getgenv().AutoHakiBuso = v end })
SetSec:AddToggle("AutoKen", { Title = "Auto Observation", Default = false, Callback = function(v) getgenv().Observation = v end })

-- ================== TAB: SELECT SKILL ==================
local SklSec = Tabs.Skills:AddSection("Equip Skills")
SklSec:AddDropdown("MeleeS", { Title = "Melee Skills", Values = {"Z", "X", "C"}, Multi = true, Callback = function(v) _G.MeleeSkills = v end })
SklSec:AddDropdown("SwordS", { Title = "Sword Skills", Values = {"Z", "X"}, Multi = true, Callback = function(v) _G.SwordSkills = v end })
SklSec:AddDropdown("FruitS", { Title = "Fruit Skills", Values = {"Z", "X", "C", "V", "F"}, Multi = true, Callback = function(v) _G.BfSkills = v end })

-- ================== TAB: MAIN FARMING ==================
local FarmSec1 = Tabs.Farming:AddSection("Level Farming")
FarmSec1:AddDropdown("Method", { Title = "Select Method", Values = {"Level Farm", "Farm Bones", "Farm Katakuri", "Aura Farm"}, Default = "Level Farm", Callback = function(v) _G.MethodSelect = v end })
FarmSec1:AddToggle("StartF", { Title = "Start Auto Farm", Default = false, Callback = function(v) _G.StartFarm = v end })
FarmSec1:AddToggle("AccQuest", { Title = "Auto Accept Quest", Default = false, Callback = function(v) _G.AcceptQuestC = v end })

local FarmSec2 = Tabs.Farming:AddSection("Mastery & Materials")
FarmSec2:AddDropdown("MasType", { Title = "Mastery Weapon", Values = {"Blox Fruit", "Gun"}, Callback = function(v) _G.MasteryTypeSelect = v end })
FarmSec2:AddToggle("FarmMas", { Title = "Start Mastery", Default = false, Callback = function(v) _G.MasteryFarmStart = v end })
FarmSec2:AddDropdown("MatType", { Title = "Select Material", Values = {"Scrap Metal", "Magma Ore", "Vampire Fang", "Conjured Cocoa", "Dragon Scale"}, Callback = function(v) _G.SelectMaterial = v end })
FarmSec2:AddToggle("FarmMat", { Title = "Farm Material", Default = false, Callback = function(v) _G.AutoMaterial = v end })

-- ================== TAB: STACK FARMING ==================
local StackSec1 = Tabs.Stack:AddSection("World & Fruit")
StackSec1:AddToggle("AutoW2", { Title = "Auto New World", Default = false, Callback = function(v) _G.TravelDres = v end })
StackSec1:AddToggle("AutoW3", { Title = "Auto Third World", Default = false, Callback = function(v) _G.AutoZou = v end })
StackSec1:AddToggle("TPFruit", { Title = "Teleport to Fruit", Default = false, Callback = function(v) _G.TwFruits = v end })

local StackSec2 = Tabs.Stack:AddSection("Bosses & Events")
StackSec2:AddToggle("AutoFac", { Title = "Auto Factory", Default = false, Callback = function(v) _G.AutoFactory = v end })
StackSec2:AddToggle("AutoIndra", { Title = "Auto Rip Indra", Default = false, Callback = function(v) _G.AutoRipIngay = v end })
StackSec2:AddToggle("AutoDough", { Title = "Auto Dough King", Default = false, Callback = function(v) _G.AutoMiror = v end })
StackSec2:AddToggle("AutoSoul", { Title = "Auto Soul Reaper", Default = false, Callback = function(v) _G.AutoHytHallow = v end })

-- ================== TAB: OTHER FARMING ==================
local OthSec1 = Tabs.Other:AddSection("Fishing")
OthSec1:AddDropdown("FishRod", { Title = "Select Rod", Values = {"Fishing Rod", "Gold Rod", "Shark Rod"}, Callback = function(v) SelectedRod = v end })
OthSec1:AddToggle("AutoFish", { Title = "Auto Fishing", Default = false, Callback = function(v) AutoFishing = v end })
OthSec1:AddToggle("FishQuest", { Title = "Auto Fishing Quest", Default = false, Callback = function(v) AutoFishingQuest = v end })

local OthSec2 = Tabs.Other:AddSection("Dragon")
OthSec2:AddToggle("AutoDragon", { Title = "Auto Dragon Hunter", Default = false, Callback = function(v) _G.FarmBlazeEM = v end })

-- ================== TAB: ADMIN & FAKE (TÍNH NĂNG ĐẶC BIỆT) ==================
local AdSec = Tabs.AdminFake:AddSection("Troll & Utilities")
AdSec:AddToggle("AutoStore", { Title = "Auto Store Fruit", Default = false, Callback = function(v) _G.AutoStoreFruit = v end })

AdSec:AddButton({ Title = "Fake Admin (!ad)", Callback = function()
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
        if msg == "!ad" then
            game.StarterGui:SetCore("SendNotification", {Title = "System", Text = "Admin Mode Activated", Duration = 5})
            local Head = game.Players.LocalPlayer.Character:WaitForChild("Head")
            local Tag = Instance.new("BillboardGui", Head)
            Tag.Size = UDim2.new(0, 100, 0, 40); Tag.StudsOffset = Vector3.new(0, 3, 0)
            local Txt = Instance.new("TextLabel", Tag)
            Txt.Text = "[Admin]"; Txt.TextColor3 = Color3.fromRGB(255, 0, 0)
            Txt.BackgroundTransparency = 1; Txt.Size = UDim2.new(1, 0, 1, 0); Txt.TextScaled = true
        end
    end)
end})

AdSec:AddButton({ Title = "Fake Kitsune Fruit", Callback = function()
    local f = Instance.new("Tool"); f.Name = "Kitsune-Kitsune"
    local h = Instance.new("Part", f); h.Name = "Handle"; h.Size = Vector3.new(1, 1, 1)
    f.Parent = game.Players.LocalPlayer.Backpack
end})

-- LOGIC TÀNG HÌNH KHI BAY (SPACE)
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(i, p)
    if not p and i.KeyCode == Enum.KeyCode.Space then
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall then
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

-- LOGIC AUTO STORE FRUIT
task.spawn(function()
    while task.wait(1) do
        if _G.AutoStoreFruit then
            pcall(function()
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v:GetAttribute("OriginalName"), v)
                    end
                end
            end)
        end
    end
end)

Window:SelectTab(1)
Fluent:Notify({ Title = "QUANG MOD", Content = "Loaded Full Features UI!", Duration = 5 })

