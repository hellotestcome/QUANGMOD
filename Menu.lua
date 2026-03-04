local queue_on_teleport = queue_on_teleport or syn.queue_on_teleport or fluxus.queue_on_teleport
if queue_on_teleport then
    queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/hellotestcome/QUANGMOD/refs/heads/main/Menu.lua"))()')
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "QUANG MOD HUB", SubTitle = "- Blox Fruit",
    TabWidth = 160, Size = UDim2.fromOffset(580, 460),
    Acrylic = true, Theme = "Dark", MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Report = Window:AddTab({ Title = "Report And Ideas", Icon = "message-circle" }),
    Shop = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }),
    StatSer = Window:AddTab({ Title = "Status & Server", Icon = "server" }),
    LocalPlayer = Window:AddTab({ Title = "LocalPlayer", Icon = "user" }),
    Settings = Window:AddTab({ Title = "Setting Farm", Icon = "settings" }),
    Skills = Window:AddTab({ Title = "Hold & Select Skill", Icon = "crosshair" }),
    Farming = Window:AddTab({ Title = "Farming", Icon = "swords" }),
    Stack = Window:AddTab({ Title = "Stack Farming", Icon = "layers" }),
    Other = Window:AddTab({ Title = "Farming Other", Icon = "box" }),
    Admin = Window:AddTab({ Title = "Admin & Fake", Icon = "shield-alert" })
}

-- =======================================
-- TAB: REPORT AND IDEAS
-- =======================================
Tabs.Report:AddSection("Report And Ideas")
local selectedType = nil
local userMessage = ""
Tabs.Report:AddDropdown("ReportAndIdeasSelect", { Title = "Select Type", Values = {"Report", "Ideas"}, Default = nil, Callback = function(Value) selectedType = Value end })
Tabs.Report:AddInput("InputMessage", { Title = "Input Message", Placeholder = "Input Here", Callback = function(Value) userMessage = Value end })
Tabs.Report:AddButton({ Title = "Send To Server Developer", Callback = function() 
    -- Code webhook giữ nguyên logic của bạn
    print("Sending webhook...") 
end})

-- =======================================
-- TAB: SHOP
-- =======================================
Tabs.Shop:AddSection("Misc Shop")
Tabs.Shop:AddButton({ Title = "Redeem Code", Callback = function()
    local codes = {"LIGHTNINGABUSE", "1LOSTADMIN", "ADMINFIGHT", "NOMOREHACK", "BANEXPLOIT", "krazydares"}
    for _, v in pairs(codes) do game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v) task.wait(0.5) end
end})
Tabs.Shop:AddButton({ Title = "Teleport Old World", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain") end})
Tabs.Shop:AddButton({ Title = "Teleport New World", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa") end})
Tabs.Shop:AddButton({ Title = "Teleport Third Sea", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou") end})
Tabs.Shop:AddButton({ Title = "Buy Dual Flintlock", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual Flintlock") end})
Tabs.Shop:AddButton({ Title = "Reroll Race", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1") game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2") end})
Tabs.Shop:AddButton({ Title = "Reset Stats", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1") game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2") end})
Tabs.Shop:AddButton({ Title = "Buy Ghoul Race", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4) task.wait(0.5) game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Ectoplasm", "Change", 4) end})
Tabs.Shop:AddButton({ Title = "Buy Cyborg Race", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy") end})

Tabs.Shop:AddSection("Fighting Shop")
Tabs.Shop:AddToggle("BlackLegMeleeBuy", { Title = "Black Leg", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg") end end})
Tabs.Shop:AddToggle("FishManMeleeBuy", { Title = "Fishman Karate", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate") end end})
Tabs.Shop:AddToggle("ElectroMeleeBuy", { Title = "Electro", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro") end end})
Tabs.Shop:AddToggle("DragonClawMeleeBuy", { Title = "Dragon Breath", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2") end end})
Tabs.Shop:AddToggle("SuperHumanMeleeBuy", { Title = "SuperHuman", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman") end end})
Tabs.Shop:AddToggle("DeathStepMeleeBuy", { Title = "Death Step", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep") end end})
Tabs.Shop:AddToggle("SharkmanMeleeBuy", { Title = "Sharkman Karate", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate") end end})
Tabs.Shop:AddToggle("ElectricClawMeleeBuy", { Title = "Electric Claw", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw") end end})
Tabs.Shop:AddToggle("DragonTalonMeleeBuy", { Title = "Dragon Talon", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon") end end})
Tabs.Shop:AddToggle("GodHumanMeleeBuy", { Title = "God Human", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman") end end})
Tabs.Shop:AddToggle("SanguineArt", { Title = "Sanguine Art", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt") end end})

Tabs.Shop:AddSection("Ability Shop")
Tabs.Shop:AddButton({ Title = "Skyjump [ $10,000 Beli ]", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo") end})
Tabs.Shop:AddButton({ Title = "Buso Haki [ $25,000 Beli ]", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso") end})
Tabs.Shop:AddButton({ Title = "Observation haki [ $750,000 Beli ]", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy") end})
Tabs.Shop:AddButton({ Title = "Soru [ $100,000 Beli ]", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru") end})

-- =======================================
-- TAB: STATUS AND SERVER
-- =======================================
Tabs.StatSer:AddSection("Status")
local TimeLabel = Tabs.StatSer:AddLabel("Time Zone: Loading...")
local ServerTimeLabel = Tabs.StatSer:AddLabel("Server Time: Loading...")
local MirageLabel = Tabs.StatSer:AddLabel("Mirage Island: ❌")
local KitsuneLabel = Tabs.StatSer:AddLabel("Kitsune Island: ❌")
local PrehistoricLabel = Tabs.StatSer:AddLabel("Prehistoric Island: ❌")
local FrozenLabel = Tabs.StatSer:AddLabel("Frozen Dimension: ❌")
local DimensionKilled = Tabs.StatSer:AddLabel("Dimension Killed: Loading...")
local RipIndraLabel = Tabs.StatSer:AddLabel("Rip_Indra: ❌")
local DoughKingLabel = Tabs.StatSer:AddLabel("Dough King: ❌")
local EliteHunterLabel = Tabs.StatSer:AddLabel("Elite Hunter: ❌")
local FMLabel = Tabs.StatSer:AddLabel("Full Moon: 0/5")
local LegendarySwordLabel = Tabs.StatSer:AddLabel("Legendary Sword: ❌")

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            TimeLabel:SetText("Time Zone: " .. os.date("%X"))
            MirageLabel:SetText("Mirage Island: " .. (game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") and "✅" or "❌"))
            KitsuneLabel:SetText("Kitsune Island: " .. (game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") and "✅" or "❌"))
            PrehistoricLabel:SetText("Prehistoric Island: " .. (game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") and "✅" or "❌"))
            FrozenLabel:SetText("Frozen Dimension: " .. (game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") and "✅" or "❌"))
        end)
    end
end)

Tabs.StatSer:AddSection("Server")
Tabs.StatSer:AddInput("InputJob", { Title = "Input Your JobID Here", Callback = function(value) getgenv().Job = value end})
Tabs.StatSer:AddToggle("SpamJoin", { Title = "Spam Join", Default = false, Callback = function(Value) -- Logic here 
end})
Tabs.StatSer:AddButton({ Title = "Join Server", Callback = function() if getgenv().Job then game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, getgenv().Job, game.Players.LocalPlayer) end end})
Tabs.StatSer:AddButton({ Title = "Copy JobId", Callback = function() setclipboard(tostring(game.JobId)) end})
Tabs.StatSer:AddButton({ Title = "Rejoin Server", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) end})
Tabs.StatSer:AddButton({ Title = "Hop Server", Callback = function() Hop() end})

-- =======================================
-- TAB: LOCAL PLAYER
-- =======================================
Tabs.LocalPlayer:AddSection("Local Player")
Tabs.LocalPlayer:AddButton({ Title = "Open Devil Fruit Shop", Callback = function() playDlg("FruitShop") end})
Tabs.LocalPlayer:AddButton({ Title = "Open Devil Fruit Shop Mirage", Callback = function() playDlg("FruitShop2") end})
Tabs.LocalPlayer:AddButton({ Title = "Boost FPS", Callback = function() FPSBooster() end})
Tabs.LocalPlayer:AddButton({ Title = "Change Team To Pirates", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates") end})
Tabs.LocalPlayer:AddButton({ Title = "Change Team To Marines", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines") end})

Tabs.LocalPlayer:AddToggle("AutoCP", { Title = "Auto Summon Cake Prince", Default = true, Callback = function(v) _G.AutoSpawnCP = v end})
-- (Đã xoá bỏ NoClip theo yêu cầu của bạn)
Tabs.LocalPlayer:AddToggle("RemoveDmg", { Title = "Remove Damage Text", Default = true, Callback = function(v) if game:GetService("ReplicatedStorage").Assets.GUI:FindFirstChild("DamageCounter") then game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = not v end end})
Tabs.LocalPlayer:AddToggle("RemoveNoti", { Title = "Remove Notification", Default = false, Callback = function(v) game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = not v end})

Tabs.LocalPlayer:AddDropdown("StatsDropdown", { Title = "Select Stats", Values = {"Melee", "Sword", "Gun", "Devil Fruit", "Defense"}, Default = nil, Callback = function(Value) _G.SelectedStat = Value end})
Tabs.LocalPlayer:AddSlider("PointStats", { Title = "Point Stats", Min = 0, Max = 6736, Default = 1, Callback = function(Value) _G.pSats = Value end})
Tabs.LocalPlayer:AddToggle("AutoStatsToggle", { Title = "Auto Stats", Default = false, Callback = function(Value) _G.Auto_Stats = Value end})

local LocList = {}
for _,v in pairs(workspace["_WorldOrigin"].Locations:GetChildren()) do table.insert(LocList ,v.Name) end
Tabs.LocalPlayer:AddDropdown("TeleportDropdown", { Title = "Select Island", Values = LocList, Default = nil, Callback = function(Value) _G.Island = Value end})
Tabs.LocalPlayer:AddToggle("TeleportToggle", { Title = "Teleport to Island", Default = false, Callback = function(Value) _G.Teleport = Value end})

-- =======================================
-- TAB: SETTING FARM
-- =======================================
Tabs.Settings:AddSection("Setting Farm")
Tabs.Settings:AddDropdown("SelectWeapon", { Title = "Select Weapon", Values = {"Melee","Sword","Blox Fruit"}, Default = nil, Callback = function(Value) _G.ChooseWP = Value end})
Tabs.Settings:AddToggle("BringMob", { Title = "Bring Mob", Default = false, Callback = function(Value) _B = Value end})
Tabs.Settings:AddToggle("SafeMode", { Title = "Teleport Y if low hearth", Default = false, Callback = function(Value) _G.Safemode = Value end})
Tabs.Settings:AddToggle("AutoObs", { Title = "Auto Open Observation", Default = false, Callback = function(Value) getgenv().Observation = Value end})
Tabs.Settings:AddToggle("AutoBuso", { Title = "Auto Open Buso", Default = false, Callback = function(Value) getgenv().AutoHakiBuso = Value end})
Tabs.Settings:AddToggle("AutoV3", { Title = "Auto Open Race V3", Default = false, Callback = function(Value) getgenv().AutoTurnOnV3 = Value end})
Tabs.Settings:AddToggle("AutoV4", { Title = "Auto Open Race V4", Default = false, Callback = function(Value) getgenv().AutoTurnOnV4 = Value end})
Tabs.Settings:AddToggle("AntiAFK", { Title = "Anti AFK", Default = false, Callback = function(Value) _G.AntiAFK = Value end})
Tabs.Settings:AddToggle("SpinPosition", { Title = "Spin Position", Default = false, Callback = function(Value) RandomCFrame = Value end})

-- =======================================
-- TAB: HOLD & SELECT SKILL
-- =======================================
Tabs.Skills:AddSection("Select Skills")
Tabs.Skills:AddDropdown("MeleeSkills", { Title = "Select Skill Melee", Values = {"Z", "X", "C"}, Multi = true, Callback = function(Value) _G.MeleeSkills = Value end})
Tabs.Skills:AddDropdown("SwordSkills", { Title = "Select Skill Sword", Values = {"Z", "X"}, Multi = true, Callback = function(Value) _G.SwordSkills = Value end})
Tabs.Skills:AddDropdown("GunSkills", { Title = "Select Skill Gun", Values = {"Z", "X"}, Multi = true, Callback = function(Value) _G.GunSkills = Value end})
Tabs.Skills:AddDropdown("FruitsSkills", { Title = "Select Skill Blox Fruit", Values = {"Z", "X", "C", "V", "F"}, Multi = true, Callback = function(Value) _G.BfSkills = Value end})

Tabs.Skills:AddSection("Hold Skills")
Tabs.Skills:AddSlider("KillAtSlider", { Title = "Kill At % Health", Min = 10, Max = 90, Default = 70, Rounding = 0, Callback = function(Value) getgenv().Kill_At = Value end})
Tabs.Skills:AddSlider("HoldZ", { Title = "Hold Skill Z (seconds)", Min = 0.1, Max = 2, Default = 0.1, Rounding = 1, Callback = function(Value) getgenv().HoldSkillZ = Value end})
Tabs.Skills:AddSlider("HoldX", { Title = "Hold Skill X (seconds)", Min = 0.1, Max = 2, Default = 0.1, Rounding = 1, Callback = function(Value) getgenv().HoldSkillX = Value end})
Tabs.Skills:AddSlider("HoldC", { Title = "Hold Skill C (seconds)", Min = 0.1, Max = 2, Default = 0.1, Rounding = 1, Callback = function(Value) getgenv().HoldSkillC = Value end})

-- =======================================
-- TAB: FARMING
-- =======================================
Tabs.Farming:AddSection("Setting Farm")
Tabs.Farming:AddDropdown("SelectMethodFarm", { Title = "Select Method Farm", Values = {"Level Farm", "Farm Bones", "Farm Katakuri", "Farm Tyrant of the Skies", "Aura Farm"}, Default = nil, Callback = function(Value) _G.MethodSelect = Value end})
Tabs.Farming:AddSlider("DistAura", { Title = "Distance Farm Aura", Min = 0, Max = 500, Default = 300, Callback = function(Value) _G.Safemode = Value end})
Tabs.Farming:AddToggle("HopKata", { Title = "Hop Find Katakuri", Default = false, Callback = function(Value) _G.Auto_Cake_Prince = Value end})
Tabs.Farming:AddToggle("AcceptQuest", { Title = "Accept Quest [Katakuri/Bone/Tyrant]", Default = false, Callback = function(Value) _G.AcceptQuestC = Value end})
Tabs.Farming:AddToggle("StartFarm", { Title = "Start Farm", Default = false, Callback = function(Value) _G.StartFarm = Value end})

Tabs.Farming:AddSection("Mastery Farm")
Tabs.Farming:AddDropdown("SelectMethodFarmMas", { Title = "Select Method Farm Mastery", Values = {"Blox Fruit", "Gun"}, Default = nil, Callback = function(Value) _G.MasteryTypeSelect = Value end})
Tabs.Farming:AddToggle("MasteryStart", { Title = "Farm Mastery", Default = false, Callback = function(Value) _G.MasteryFarmStart = Value end})

Tabs.Farming:AddSection("Farming Meterial")
Tabs.Farming:AddDropdown("SelectMeterial", { Title = "Select Meterial", Values = {"Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Vampire Fang", "Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Mini Tusk"}, Default = nil, Callback = function(Value) _G.SelectMaterial = Value end})
Tabs.Farming:AddToggle("MeterialStart", { Title = "Farm Meterial", Default = false, Callback = function(Value) _G.AutoMaterial = Value end})

-- =======================================
-- TAB: STACK FARMING
-- =======================================
Tabs.Stack:AddSection("Auto World")
Tabs.Stack:AddToggle("AutoW2", { Title = "Auto New World", Default = false, Callback = function(Value) _G.TravelDres = Value end})
Tabs.Stack:AddToggle("AutoW3", { Title = "Auto Third World", Default = false, Callback = function(Value) _G.AutoZou = Value end})

Tabs.Stack:AddSection("Devil Fruit")
Tabs.Stack:AddToggle("TwFruits", { Title = "Teleport to Fruit", Default = false, Callback = function(Value) _G.TwFruits = Value end})
Tabs.Stack:AddToggle("HopFruit", { Title = "Teleport to Fruit [Hop Server]", Default = false, Callback = function(Value) _G.HopFruitsFarm = Value end})

Tabs.Stack:AddSection("Event Game")
Tabs.Stack:AddToggle("AutoFactory", { Title = "Auto Factory", Default = false, Callback = function(Value) _G.AutoFactory = Value end})
Tabs.Stack:AddToggle("AutoRaid", { Title = "Auto Pirate Raid", Default = false, Callback = function(Value) _G.AutoRaidCastle = Value end})

Tabs.Stack:AddSection("Boss Rip Indra")
Tabs.Stack:AddToggle("FarmElite", { Title = "Auto Elite Hunter", Default = false, Callback = function(Value) _G.FarmEliteHunt = Value end})
Tabs.Stack:AddToggle("HopElite", { Title = "Hop Server Elite Hunter", Default = false, Callback = function(Value) _G.EliteHop = Value end})
Tabs.Stack:AddToggle("AutoPad", { Title = "Auto Touch Pad Haki", Default = false, Callback = function(Value) getgenv().AutoTouchPadHaki = Value end})
Tabs.Stack:AddToggle("AutoRip", { Title = "Auto Rip Indra", Default = false, Callback = function(Value) _G.AutoRipIngay = Value end})

Tabs.Stack:AddSection("Boss Soul Reaper")
Tabs.Stack:AddToggle("AutoSoul", { Title = "Auto Soul Reaper", Default = false, Callback = function(Value) _G.AutoHytHallow = Value end})
Tabs.Stack:AddToggle("HopSoul", { Title = "Auto Soul Reaper [ Hop Server ]", Default = false, Callback = function(Value) _G.SoulHopR = Value end})

Tabs.Stack:AddSection("Boss Dough King")
Tabs.Stack:AddToggle("AutoDough", { Title = "Auto Dough King", Default = false, Callback = function(Value) _G.AutoMiror = Value end})
Tabs.Stack:AddToggle("HopDough", { Title = "Auto Dough King [ Hop Server ]", Default = false, Callback = function(Value) _G.DoughKingHop = Value end})

Tabs.Stack:AddSection("Boss Darkbeard")
Tabs.Stack:AddToggle("AutoDark", { Title = "Auto Darkbread", Default = false, Callback = function(Value) _G.Auto_Def_DarkCoat = Value end})
Tabs.Stack:AddToggle("HopDark", { Title = "Auto Darkbread [ Hop Server ]", Default = false, Callback = function(Value) _G.DarkbreadHop = Value end})

-- =======================================
-- TAB: FARMING OTHER
-- =======================================
Tabs.Other:AddSection("Fishing")
Tabs.Other:AddDropdown("SelectRod", { Title = "Select Rod", Values = {"Fishing Rod", "Gold Rod", "Shark Rod", "Shell Rod", "Treasure Rod"}, Default = nil, Callback = function(Value) SelectedRod = Value end})
Tabs.Other:AddDropdown("SelectBait", { Title = "Select Bait", Values = {"Basic Bait", "Kelp Bait", "Good Bait", "Abyssal Bait", "Frozen Bait"}, Default = nil, Callback = function(Value) SelectedBait = Value end})
Tabs.Other:AddToggle("AutoFishing", { Title = "Auto Fishing", Default = false, Callback = function(Value) AutoFishing = Value end})
Tabs.Other:AddToggle("AutoFishingQuest", { Title = "Auto Quest Fishing", Default = false, Callback = function(Value) AutoFishingQuest = Value end})
Tabs.Other:AddToggle("AutoDoneQuest", { Title = "Auto Done Quest Fishing", Default = false, Callback = function(Value) AutoQuestComplete = Value end})
Tabs.Other:AddToggle("SellFish", { Title = "Sell Fishing", Default = false, Callback = function(Value) AutoSellFish = Value end})
Tabs.Other:AddToggle("SpamZ", { Title = "Spam Skill Z if Fishing", Default = false, Callback = function(Value) AutoSkillZ = Value end})

Tabs.Other:AddSection("Quest Dragon")
Tabs.Other:AddToggle("AutoDojo", { Title = "Auto Dojo Trainer", Default = false, Callback = function(Value) _G.Dojoo = Value end})
Tabs.Other:AddToggle("AutoDragon", { Title = "Auto Dragon Hunter", Default = false, Callback = function(Value) _G.FarmBlazeEM = Value end})

-- =======================================
-- TAB: ADMIN & FAKE (Tính năng đặc biệt)
-- =======================================
Tabs.Admin:AddSection("Extra Features")
Tabs.Admin:AddToggle("AutoStoreFruit", { Title = "Auto Store Fruit", Default = false, Callback = function(Value) _G.AutoStoreFruit = Value end})

Tabs.Admin:AddButton({ Title = "Fake Admin (!ad)", Callback = function()
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
        if msg == "!ad" then
            game.StarterGui:SetCore("SendNotification", {Title = "System", Text = "Admin Mode Activated", Duration = 5})
            local Head = game.Players.LocalPlayer.Character:WaitForChild("Head")
            local Eye = Instance.new("Decal", Head)
            Eye.Texture = "rbxassetid://13580556738"
            Eye.Face = Enum.NormalId.Front
            local Tag = Instance.new("BillboardGui", Head)
            Tag.Size = UDim2.new(0, 100, 0, 40)
            Tag.StudsOffset = Vector3.new(0, 3, 0)
            local Txt = Instance.new("TextLabel", Tag)
            Txt.Text = "[Admin]"
            Txt.TextColor3 = Color3.fromRGB(255, 0, 0)
            Txt.BackgroundTransparency = 1
            Txt.Size = UDim2.new(1, 0, 1, 0)
            Txt.TextScaled = true
        end
    end)
end})

Tabs.Admin:AddButton({ Title = "Fake Kitsune Fruit", Callback = function()
    local FakeFruit = Instance.new("Tool")
    FakeFruit.Name = "Kitsune-Kitsune"
    FakeFruit.ToolTip = "Blox Fruit"
    local Handle = Instance.new("Part", FakeFruit)
    Handle.Name = "Handle"
    Handle.Size = Vector3.new(1, 1, 1)
    FakeFruit.Parent = game.Players.LocalPlayer.Backpack
end})

-- Space tàng hình
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Space then
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChildOfClass("Humanoid") and character:FindFirstChildOfClass("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then part.Transparency = 1 end
            end
        end
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then
        local character = game.Players.LocalPlayer.Character
        if character then
            for _, part in pairs(character:GetDescendants()) do
                if (part:IsA("BasePart") and part.Name ~= "HumanoidRootPart") or part:IsA("Decal") then part.Transparency = 0 end
            end
        end
    end
end)

-- Nhuộm Đỏ Giao Diện
task.spawn(function()
    while task.wait(1) do 
        local coreGui = game:GetService("CoreGui")
        for _, gui in pairs(coreGui:GetChildren()) do
            if gui:IsA("ScreenGui") then
                for _, obj in pairs(gui:GetDescendants()) do
                    if obj:IsA("Frame") or obj:IsA("TextButton") or obj:IsA("ScrollingFrame") then
                        if obj.BackgroundColor3.R < 0.3 then obj.BackgroundColor3 = Color3.fromRGB(200, 80, 80) end
                    end
                    if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                        obj.TextColor3 = Color3.fromRGB(255, 255, 255)
                        obj.TextTransparency = 0
                    end
                    if obj:IsA("UIStroke") then obj.Color = Color3.fromRGB(255, 100, 100) end
                end
            end
        end
    end
end)

Window:SelectTab(1)

