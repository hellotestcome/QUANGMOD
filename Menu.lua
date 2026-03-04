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
    Local = Window:AddTab({ Title = "LocalPlayer", Icon = "user" }),
    Settings = Window:AddTab({ Title = "Setting Farm", Icon = "settings" }),
    Skills = Window:AddTab({ Title = "Select Skill", Icon = "crosshair" }),
    Farming = Window:AddTab({ Title = "Farming", Icon = "swords" }),
    Stack = Window:AddTab({ Title = "Stack Farming", Icon = "layers" }),
    Other = Window:AddTab({ Title = "Farming Other", Icon = "box" })
}

-- ================= TAB 1: REPORT =================
Tabs.Report:AddSection("Report And Ideas")
local selectedType = nil; local userMessage = ""
Tabs.Report:AddDropdown("ReportAndIdeasSelect", { Title = "Select Type", Values = {"Report", "Ideas"}, Callback = function(v) selectedType = v end })
Tabs.Report:AddInput("InputMessage", { Title = "Input Message", Callback = function(v) userMessage = v end })
Tabs.Report:AddButton({ Title = "Send To Server Developer", Callback = function() print("Sent!") end })

-- ================= TAB 2: SHOP =================
Tabs.Shop:AddSection("Misc Shop")
Tabs.Shop:AddButton({ Title = "Redeem All Codes", Callback = function()
    local codes = {"LIGHTNINGABUSE", "1LOSTADMIN", "ADMINFIGHT", "NOMOREHACK", "BANEXPLOIT", "krazydares"}
    for _, v in pairs(codes) do game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v) end
end})
Tabs.Shop:AddButton({ Title = "Teleport Old World", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain") end})
Tabs.Shop:AddButton({ Title = "Teleport New World", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa") end})
Tabs.Shop:AddButton({ Title = "Teleport Third Sea", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou") end})
Tabs.Shop:AddButton({ Title = "Buy Dual Flintlock", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual Flintlock") end})
Tabs.Shop:AddButton({ Title = "Reroll Race", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1") end})
Tabs.Shop:AddButton({ Title = "Reset Stats", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1") end})

Tabs.Shop:AddSection("Fighting Shop")
local styles = {"BuyBlackLeg", "BuyFishmanKarate", "BuyElectro", "BuySuperhuman", "BuyDeathStep", "BuySharkmanKarate", "BuyElectricClaw", "BuyDragonTalon", "BuyGodhuman", "BuySanguineArt"}
for _, s in pairs(styles) do
    Tabs.Shop:AddButton({ Title = s:gsub("Buy", "Buy "), Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(s) end })
end

Tabs.Shop:AddSection("Ability Shop")
Tabs.Shop:AddButton({ Title = "Skyjump [ $10,000 Beli ]", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Geppo") end})
Tabs.Shop:AddButton({ Title = "Buso Haki [ $25,000 Beli ]", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Buso") end})
Tabs.Shop:AddButton({ Title = "Observation haki [ $750,000 Beli ]", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk","Buy") end})
Tabs.Shop:AddButton({ Title = "Soru [ $100,000 Beli ]", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki","Soru") end})

-- ================= TAB 3: STATUS =================
Tabs.StatSer:AddSection("Server Status")
local TimeLabel = Tabs.StatSer:AddParagraph({ Title = "Time Zone", Content = "Loading..." })
local MirageLabel = Tabs.StatSer:AddParagraph({ Title = "Mirage Island", Content = "Checking..." })
local KitsuneLabel = Tabs.StatSer:AddParagraph({ Title = "Kitsune Island", Content = "Checking..." })

task.spawn(function()
    while task.wait(1) do pcall(function()
        TimeLabel:SetDesc("Current Time: " .. os.date("%X"))
        local m = game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")
        MirageLabel:SetDesc(m and "✅ Found" or "❌ Not Found")
        local k = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
        KitsuneLabel:SetDesc(k and "✅ Found" or "❌ Not Found")
    end) end
end)

Tabs.StatSer:AddSection("Server Hop")
Tabs.StatSer:AddInput("InputJob", { Title = "Input JobID", Callback = function(v) getgenv().Job = v end})
Tabs.StatSer:AddButton({ Title = "Join Server", Callback = function() if getgenv().Job then game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, getgenv().Job) end end})
Tabs.StatSer:AddButton({ Title = "Rejoin Server", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end})
-- ================= TAB 4: LOCAL PLAYER =================
Tabs.Local:AddSection("Devil Fruit & Team")
Tabs.Local:AddButton({ Title = "Open Devil Fruit Shop", Callback = function() local rs = game:GetService("ReplicatedStorage") require(rs.DialogueController):Start(require(rs.DialoguesList)["FruitShop"]) end})
Tabs.Local:AddButton({ Title = "Change Team To Pirates", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates") end})
Tabs.Local:AddButton({ Title = "Change Team To Marines", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines") end})

Tabs.Local:AddSection("Player Settings")
Tabs.Local:AddToggle("AutoCP", { Title = "Auto Summon Cake Prince", Default = false, Callback = function(v) _G.AutoSpawnCP = v end})
Tabs.Local:AddToggle("RemoveDmg", { Title = "Remove Damage Text", Default = true, Callback = function(v) if game:GetService("ReplicatedStorage").Assets.GUI:FindFirstChild("DamageCounter") then game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = not v end end})

Tabs.Local:AddSection("Auto Stats")
Tabs.Local:AddDropdown("StatsSelect", { Title = "Select Stats", Values = {"Melee", "Sword", "Gun", "Devil Fruit", "Defense"}, Callback = function(v) _G.SelectedStat = v end})
Tabs.Local:AddSlider("PointStats", { Title = "Point Stats", Min = 1, Max = 100, Default = 1, Callback = function(v) _G.pSats = v end})
Tabs.Local:AddToggle("AutoStats", { Title = "Auto Stats", Default = false, Callback = function(v) _G.Auto_Stats = v end})

Tabs.Local:AddSection("Teleport Island")
local LocList = {}
pcall(function() for _,v in pairs(workspace["_WorldOrigin"].Locations:GetChildren()) do table.insert(LocList, v.Name) end end)
Tabs.Local:AddDropdown("TPSelect", { Title = "Select Island", Values = LocList, Callback = function(v) _G.Island = v end})
Tabs.Local:AddToggle("TPToggle", { Title = "Teleport to Island", Default = false, Callback = function(v) _G.Teleport = v end})

Tabs.Local:AddSection("WalkSpeed & JumpPower")
Tabs.Local:AddSlider("WSpeed", { Title = "WalkSpeed", Min = 16, Max = 500, Default = 16, Callback = function(v) getgenv().WalkSpeedValue = v end})
Tabs.Local:AddToggle("EnableWS", { Title = "Enable WalkSpeed", Default = false, Callback = function(v) getgenv().WalkSpeedEnabled = v end})
Tabs.Local:AddSlider("JPower", { Title = "JumpPower", Min = 50, Max = 500, Default = 50, Callback = function(v) getgenv().JumpValue = v end})
Tabs.Local:AddToggle("EnableJP", { Title = "Enable JumpPower", Default = false, Callback = function(v) getgenv().JumpPowerEnabled = v end})

-- ================= TAB 5: SETTINGS FARM =================
Tabs.Settings:AddSection("General")
Tabs.Settings:AddDropdown("Weapon", { Title = "Select Weapon", Values = {"Melee","Sword","Blox Fruit"}, Default = "Melee", Callback = function(v) _G.ChooseWP = v end})
Tabs.Settings:AddToggle("BringMob", { Title = "Bring Mob", Default = true, Callback = function(v) _B = v end})
Tabs.Settings:AddToggle("AutoObs", { Title = "Auto Open Observation", Default = false, Callback = function(v) getgenv().Observation = v end})
Tabs.Settings:AddToggle("AutoBuso", { Title = "Auto Open Buso", Default = true, Callback = function(v) getgenv().AutoHakiBuso = v end})
Tabs.Settings:AddToggle("AntiAFK", { Title = "Anti AFK", Default = true, Callback = function(v) _G.AntiAFK = v end})

-- ================= TAB 6: SKILLS =================
Tabs.Skills:AddSection("Select Skills")
Tabs.Skills:AddDropdown("MeleeSkills", { Title = "Select Skill Melee", Values = {"Z", "X", "C"}, Multi = true, Callback = function(v) _G.MeleeSkills = v end})
Tabs.Skills:AddDropdown("SwordSkills", { Title = "Select Skill Sword", Values = {"Z", "X"}, Multi = true, Callback = function(v) _G.SwordSkills = v end})
Tabs.Skills:AddDropdown("FruitsSkills", { Title = "Select Skill Blox Fruit", Values = {"Z", "X", "C", "V", "F"}, Multi = true, Callback = function(v) _G.BfSkills = v end})

Tabs.Skills:AddSection("Hold Skills Settings")
Tabs.Skills:AddSlider("KillAt", { Title = "Kill At % Health", Min = 10, Max = 90, Default = 70, Callback = function(v) getgenv().Kill_At = v end})
-- ================= TAB 7: FARMING =================
Tabs.Farming:AddSection("Main Farming")
Tabs.Farming:AddDropdown("Method", { Title = "Select Method", Values = {"Level Farm", "Farm Bones", "Farm Katakuri", "Farm Tyrant of the Skies", "Aura Farm"}, Default = "Level Farm", Callback = function(v) _G.MethodSelect = v end})
Tabs.Farming:AddToggle("StartF", { Title = "Start Auto Farm", Default = false, Callback = function(v) _G.StartFarm = v end})
Tabs.Farming:AddToggle("AccQuest", { Title = "Auto Accept Quest", Default = false, Callback = function(v) _G.AcceptQuestC = v end})

Tabs.Farming:AddSection("Mastery")
Tabs.Farming:AddDropdown("MasType", { Title = "Select Method Farm Mastery", Values = {"Blox Fruit", "Gun"}, Callback = function(v) _G.MasteryTypeSelect = v end})
Tabs.Farming:AddToggle("FarmMas", { Title = "Farm Mastery", Default = false, Callback = function(v) _G.MasteryFarmStart = v end})

Tabs.Farming:AddSection("Material")
local mats = {"Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Vampire Fang", "Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Mini Tusk"}
Tabs.Farming:AddDropdown("MatSelect", { Title = "Select Material", Values = mats, Callback = function(v) _G.SelectMaterial = v end})
Tabs.Farming:AddToggle("FarmMat", { Title = "Farm Material", Default = false, Callback = function(v) _G.AutoMaterial = v end})

-- ================= TAB 8: STACK FARMING =================
Tabs.Stack:AddSection("World & Event")
Tabs.Stack:AddToggle("AutoW2", { Title = "Auto New World", Default = false, Callback = function(v) _G.TravelDres = v end})
Tabs.Stack:AddToggle("AutoW3", { Title = "Auto Third World", Default = false, Callback = function(v) _G.AutoZou = v end})
Tabs.Stack:AddToggle("TPFruit", { Title = "Teleport to Fruit", Default = false, Callback = function(v) _G.TwFruits = v end})
Tabs.Stack:AddToggle("AutoFac", { Title = "Auto Factory", Default = false, Callback = function(v) _G.AutoFactory = v end})
Tabs.Stack:AddToggle("AutoRaid", { Title = "Auto Pirate Raid", Default = false, Callback = function(v) _G.AutoRaidCastle = v end})

Tabs.Stack:AddSection("Bosses")
Tabs.Stack:AddToggle("FarmElite", { Title = "Auto Elite Hunter", Default = false, Callback = function(v) _G.FarmEliteHunt = v end})
Tabs.Stack:AddToggle("AutoIndra", { Title = "Auto Rip Indra", Default = false, Callback = function(v) _G.AutoRipIngay = v end})
Tabs.Stack:AddToggle("AutoDough", { Title = "Auto Dough King", Default = false, Callback = function(v) _G.AutoMiror = v end})
Tabs.Stack:AddToggle("AutoSoul", { Title = "Auto Soul Reaper", Default = false, Callback = function(v) _G.AutoHytHallow = v end})
Tabs.Stack:AddToggle("AutoDark", { Title = "Auto Darkbeard", Default = false, Callback = function(v) _G.Auto_Def_DarkCoat = v end})

-- ================= TAB 9: OTHER FARMING =================
Tabs.Other:AddSection("Fishing")
Tabs.Other:AddDropdown("FishRod", { Title = "Select Rod", Values = {"Fishing Rod", "Gold Rod", "Shark Rod"}, Callback = function(v) SelectedRod = v end})
Tabs.Other:AddToggle("AutoFish", { Title = "Auto Fishing", Default = false, Callback = function(v) AutoFishing = v end})
Tabs.Other:AddToggle("FishQuest", { Title = "Auto Fishing Quest", Default = false, Callback = function(v) AutoFishingQuest = v end})
Tabs.Other:AddToggle("SellFish", { Title = "Sell Fish", Default = false, Callback = function(v) AutoSellFish = v end})

Tabs.Other:AddSection("Dragon")
Tabs.Other:AddToggle("AutoDojo", { Title = "Auto Dojo Trainer", Default = false, Callback = function(v) _G.Dojoo = v end})
Tabs.Other:AddToggle("AutoDragon", { Title = "Auto Dragon Hunter", Default = false, Callback = function(v) _G.FarmBlazeEM = v end})

-- HOÀN TẤT VÀ HIỂN THỊ
Window:SelectTab(1)
Fluent:Notify({ Title = "QUANG MOD HUB", Content = "Loaded Full 9 Tabs Successfully!", Duration = 5 })
