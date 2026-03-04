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
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- TẠO CÁC TAB CHÍNH
local Tabs = {
    Farming = Window:AddTab({ Title = "Main Farming", Icon = "swords" }),
    Stack = Window:AddTab({ Title = "Stack Farm", Icon = "layers" }),
    Other = Window:AddTab({ Title = "Other Farm", Icon = "box" }),
    Skills = Window:AddTab({ Title = "Skills", Icon = "crosshair" }),
    Local = Window:AddTab({ Title = "Local Player", Icon = "user" }),
    Shop = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }),
    Stat = Window:AddTab({ Title = "Server & Status", Icon = "server" }),
    Admin = Window:AddTab({ Title = "Admin & Fake", Icon = "shield-alert" })
}

-- ==========================================
-- TAB: MAIN FARMING
-- ==========================================
Tabs.Farming:AddSection("Auto Farm Level")
Tabs.Farming:AddDropdown("Method", { Title = "Select Method", Values = {"Level Farm", "Farm Bones", "Farm Katakuri", "Aura Farm"}, Default = "Level Farm", Callback = function(v) _G.MethodSelect = v end })
Tabs.Farming:AddToggle("StartF", { Title = "Start Auto Farm", Default = false, Callback = function(v) _G.StartFarm = v end })
Tabs.Farming:AddToggle("AccQuest", { Title = "Auto Accept Quest", Default = false, Callback = function(v) _G.AcceptQuestC = v end })

Tabs.Farming:AddSection("Settings Farm")
Tabs.Farming:AddDropdown("Weapon", { Title = "Select Weapon", Values = {"Melee","Sword","Blox Fruit"}, Default = "Melee", Callback = function(v) _G.ChooseWP = v end })
Tabs.Farming:AddToggle("BringMob", { Title = "Bring Mobs", Default = true, Callback = function(v) _B = v end })
Tabs.Farming:AddToggle("AutoBuso", { Title = "Auto Haki Buso", Default = true, Callback = function(v) getgenv().AutoHakiBuso = v end })

-- ==========================================
-- TAB: STACK FARMING
-- ==========================================
Tabs.Stack:AddSection("Auto World & Boss")
Tabs.Stack:AddToggle("AutoW2", { Title = "Auto New World", Default = false, Callback = function(v) _G.TravelDres = v end })
Tabs.Stack:AddToggle("AutoW3", { Title = "Auto Third World", Default = false, Callback = function(v) _G.AutoZou = v end })
Tabs.Stack:AddToggle("AutoFac", { Title = "Auto Factory", Default = false, Callback = function(v) _G.AutoFactory = v end })
Tabs.Stack:AddToggle("AutoIndra", { Title = "Auto Rip Indra", Default = false, Callback = function(v) _G.AutoRipIngay = v end })
Tabs.Stack:AddToggle("AutoDough", { Title = "Auto Dough King", Default = false, Callback = function(v) _G.AutoMiror = v end })
Tabs.Stack:AddToggle("AutoSoul", { Title = "Auto Soul Reaper", Default = false, Callback = function(v) _G.AutoHytHallow = v end })

-- ==========================================
-- TAB: OTHER FARM
-- ==========================================
Tabs.Other:AddSection("Fishing")
Tabs.Other:AddDropdown("FishRod", { Title = "Select Rod", Values = {"Fishing Rod", "Gold Rod", "Shark Rod"}, Callback = function(v) SelectedRod = v end })
Tabs.Other:AddToggle("AutoFish", { Title = "Auto Fishing", Default = false, Callback = function(v) AutoFishing = v end })

Tabs.Other:AddSection("Material & Dragon")
Tabs.Other:AddToggle("FarmMat", { Title = "Auto Material", Default = false, Callback = function(v) _G.AutoMaterial = v end })
Tabs.Other:AddToggle("AutoDragon", { Title = "Auto Dragon Hunter", Default = false, Callback = function(v) _G.FarmBlazeEM = v end })

-- ==========================================
-- TAB: SKILLS
-- ==========================================
Tabs.Skills:AddSection("Equip Skills")
Tabs.Skills:AddDropdown("MeleeS", { Title = "Melee Skills", Values = {"Z", "X", "C"}, Multi = true, Callback = function(v) _G.MeleeSkills = v end })
Tabs.Skills:AddDropdown("SwordS", { Title = "Sword Skills", Values = {"Z", "X"}, Multi = true, Callback = function(v) _G.SwordSkills = v end })
Tabs.Skills:AddDropdown("FruitS", { Title = "Fruit Skills", Values = {"Z", "X", "C", "V", "F"}, Multi = true, Callback = function(v) _G.BfSkills = v end })

-- ==========================================
-- TAB: LOCAL PLAYER
-- ==========================================
Tabs.Local:AddSection("Character Utilities")
Tabs.Local:AddButton({ Title = "Open Devil Fruit Shop", Callback = function() local rs = game:GetService("ReplicatedStorage") require(rs.DialogueController):Start(require(rs.DialoguesList)["FruitShop"]) end })
Tabs.Local:AddButton({ Title = "Join Pirates", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates") end })
Tabs.Local:AddButton({ Title = "Join Marines", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines") end })
Tabs.Local:AddToggle("RemoveDmg", { Title = "Remove Damage Text", Default = true, Callback = function(v) if game:GetService("ReplicatedStorage").Assets.GUI:FindFirstChild("DamageCounter") then game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = not v end end })

-- ==========================================
-- TAB: SHOP
-- ==========================================
Tabs.Shop:AddSection("Fighting Styles")
local styles = {"BuyBlackLeg", "BuyFishmanKarate", "BuyElectro", "BuySuperhuman", "BuyDeathStep", "BuySharkmanKarate", "BuyElectricClaw", "BuyDragonTalon", "BuyGodhuman", "BuySanguineArt"}
for _, s in pairs(styles) do
    Tabs.Shop:AddButton({ Title = s:gsub("Buy", "Buy "), Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(s) end })
end

-- ==========================================
-- TAB: STATUS & SERVER
-- ==========================================
Tabs.Stat:AddSection("Live Status")
local StatusPara = Tabs.Stat:AddParagraph({ Title = "Server Info", Content = "Loading..." })

task.spawn(function()
    while task.wait(2) do 
        pcall(function()
            local m = game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island")
            local k = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
            StatusPara:SetDesc("Time: " .. os.date("%X") .. "\nMirage Island: " .. (m and "✅ Found" or "❌ Not Found") .. "\nKitsune Island: " .. (k and "✅ Found" or "❌ Not Found"))
        end)
    end
end)

Tabs.Stat:AddSection("Server Manager")
Tabs.Stat:AddInput("JobID", { Title = "Input JobID", Callback = function(v) getgenv().Job = v end })
Tabs.Stat:AddButton({ Title = "Join Server", Callback = function() if getgenv().Job then game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, getgenv().Job) end end })
Tabs.Stat:AddButton({ Title = "Rejoin", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end })

-- ==========================================
-- TAB: ADMIN & FAKE
-- ==========================================
Tabs.Admin:AddSection("Troll & Special Functions")
Tabs.Admin:AddToggle("AutoStore", { Title = "Auto Store Fruit", Default = false, Callback = function(v) _G.AutoStoreFruit = v end })

Tabs.Admin:AddButton({ Title = "Fake Admin (!ad)", Callback = function()
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

Tabs.Admin:AddButton({ Title = "Get Fake Kitsune Fruit", Callback = function()
    local f = Instance.new("Tool"); f.Name = "Kitsune-Kitsune"
    local h = Instance.new("Part", f); h.Name = "Handle"; h.Size = Vector3.new(1, 1, 1)
    f.Parent = game.Players.LocalPlayer.Backpack
end})

-- LOGIC TÀNG HÌNH KHI BAY (SPACE)
local UIS = game:GetService("UserInputService")
UIS.InputBegan:Connect(function(i, p)
    if not p and i.KeyCode == Enum.KeyCode.Space then
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") and char.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
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

-- LOGIC AUTO STORE
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
