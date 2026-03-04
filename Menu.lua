local queue_on_teleport = queue_on_teleport or syn.queue_on_teleport or fluxus.queue_on_teleport
if queue_on_teleport then
    queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/hellotestcome/QUANGMOD/refs/heads/main/Dm.lua"))()')
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

local Tabs = {
    Webhook = Window:AddTab({ Title = "Report And Ideas", Icon = "message-circle" }),
    ShopBuy = Window:AddTab({ Title = "Shop", Icon = "shopping-cart" }),
    StatSer = Window:AddTab({ Title = "Status & Server", Icon = "server" }),
    LocalPlayer = Window:AddTab({ Title = "LocalPlayer", Icon = "user" }),
    Settings = Window:AddTab({ Title = "Setting Farm", Icon = "settings" }),
    SkillsHold = Window:AddTab({ Title = "Select Skill", Icon = "crosshair" }),
    AutoModeFarm = Window:AddTab({ Title = "Farming", Icon = "swords" }),
    Stack = Window:AddTab({ Title = "Stack Farming", Icon = "layers" }),
    Other = Window:AddTab({ Title = "Farming Other", Icon = "box" }),
    AdminFake = Window:AddTab({ Title = "Admin & Fake", Icon = "alert-triangle" })
}

local reportWebhookURL = ""
local ideasWebhookURL = ""
local selectedType = nil
local userMessage = ""

Tabs.Webhook:AddDropdown("ReportAndIdeasSelect", {
    Title = "Select Type",
    Values = {"Report", "Ideas"},
    Default = nil,
    Multi = false,
    Callback = function(Value)
       selectedType = Value
    end
})

Tabs.Webhook:AddInput("InputMessage", { 
    Title = "Input Message",
    Placeholder = "Input Here",
    Callback = function(Value)
        userMessage = Value
    end
})

Tabs.Webhook:AddButton({
    Title = "Send To Server Developer",
    Callback = function()
        if not selectedType then return end
        local time = os.date("%Y-%m-%d %H:%M:%S")
        local finalMessage = (userMessage ~= "" and userMessage) or "No message provided!"
        local webhookURL = selectedType == "Report" and reportWebhookURL or ideasWebhookURL
        local embedColor = selectedType == "Report" and 16711680 or 8384863
        local embedTitle = selectedType == "Report" and "Bug Report" or "New Idea"
        local data = {
            ["username"] = "QUANG MOD HUB BOT",
            ["embeds"] = {{
                ["title"] = embedTitle,
                ["color"] = embedColor,
                ["fields"] = {
                    {["name"] = "User Name", ["value"] = game.Players.LocalPlayer.Name, ["inline"] = true},
                    {["name"] = "User ID", ["value"] = tostring(game.Players.LocalPlayer.UserId), ["inline"] = true},
                    {["name"] = "Type", ["value"] = selectedType, ["inline"] = true},
                    {["name"] = "Message", ["value"] = finalMessage, ["inline"] = false}
                }
            }}
        }
        local requestFunc = syn and syn.request or request or http and http.request or http_request or fluxus and fluxus.request or Krnl and Krnl.request
        if requestFunc and webhookURL ~= "" then
            requestFunc({
                Url = webhookURL,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = game:GetService("HttpService"):JSONEncode(data)
            })
        end
    end
})

Tabs.ShopBuy:AddButton({
    Title = "Redeem Code",
    Callback = function()
        local codes = {"LIGHTNINGABUSE", "1LOSTADMIN", "ADMINFIGHT", "NOMOREHACK", "BANEXPLOIT"}
        for _, v in pairs(codes) do
            game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(v)
            task.wait(0.5)
        end
    end
})

Tabs.ShopBuy:AddButton({Title = "Teleport Old World", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain") end})
Tabs.ShopBuy:AddButton({Title = "Teleport New World", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa") end})
Tabs.ShopBuy:AddButton({Title = "Teleport Third Sea", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou") end})
Tabs.ShopBuy:AddButton({Title = "Buy Dual Flintlock", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual Flintlock") end})
Tabs.ShopBuy:AddButton({Title = "Reroll Race", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1") game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2") end})
Tabs.ShopBuy:AddButton({Title = "Reset Stats", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","1") game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","Refund","2") end})

Tabs.ShopBuy:AddToggle("GodHumanMeleeBuy", {Title = "Buy God Human", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman") end end})
Tabs.ShopBuy:AddToggle("SanguineArt", {Title = "Buy Sanguine Art", Default = false, Callback = function(Value) if Value then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt") end end})

local TimeLabel = Tabs.StatSer:AddLabel("Time Zone: ")
local ServerTimeLabel = Tabs.StatSer:AddLabel("Time: ")
local MirageLabel = Tabs.StatSer:AddLabel("Mirage Island: ")
local KitsuneLabel = Tabs.StatSer:AddLabel("Kitsune Island: ")
local FM = Tabs.StatSer:AddLabel("Full Moon: ")

task.spawn(function()
    while task.wait(1) do
        TimeLabel:SetText("Time Zone: " .. os.date("%X"))
        local isMiragePresent = game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") ~= nil
        MirageLabel:SetText("Mirage Island: " .. (isMiragePresent and "Found" or "Not Found"))
        local isKitsunePresent = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
        KitsuneLabel:SetText("Kitsune Island: " .. (isKitsunePresent and "Found" or "Not Found"))
    end
end)

Tabs.StatSer:AddInput("InputJob", {Title = "Input JobID", Callback = function(value) getgenv().Job = value end})
Tabs.StatSer:AddButton({Title = "Join Server", Callback = function() if getgenv().Job then game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, getgenv().Job, game.Players.LocalPlayer) end end})

Tabs.LocalPlayer:AddButton({Title = "Open Devil Fruit Shop", Callback = function() local rs = game:GetService("ReplicatedStorage") local dlgCtrl = require(rs.DialogueController) local dlgList = require(rs.DialoguesList) for k, v in pairs(dlgList) do if tostring(k) == "FruitShop" then dlgCtrl:Start(v) end end end})

Tabs.LocalPlayer:AddToggle("AutoSpawnCPToggle", {Title = "Auto Summon Cake Prince", Default = false, Callback = function(v) _G.AutoSpawnCP = v end})
Tabs.LocalPlayer:AddToggle("RemoveDamageTextToggle", {Title = "Remove Damage Text", Default = true, Callback = function(v) if game:GetService("ReplicatedStorage").Assets.GUI:FindFirstChild("DamageCounter") then game:GetService("ReplicatedStorage").Assets.GUI.DamageCounter.Enabled = not v end end})

Tabs.Settings:AddDropdown("SelectWeapon", {Title = "Select Weapon", Values = {"Melee","Sword","Blox Fruit"}, Default = "Melee", Callback = function(Value) _G.ChooseWP = Value end})
Tabs.Settings:AddToggle("BringMob", {Title = "Bring Mob", Default = false, Callback = function(Value) _B = Value end})
Tabs.Settings:AddToggle("ObservationOpen", {Title = "Auto Open Observation", Default = false, Callback = function(Value) getgenv().Observation = Value end})
Tabs.Settings:AddToggle("BusoOpen", {Title = "Auto Open Buso", Default = false, Callback = function(Value) getgenv().AutoHakiBuso = Value end})

Tabs.SkillsHold:AddDropdown("MeleeSkills", {Title = "Select Skill Melee", Values = {"Z", "X", "C"}, Multi = true, Callback = function(Value) _G.MeleeSkills = Value end})
Tabs.SkillsHold:AddDropdown("SwordSkills", {Title = "Select Skill Sword", Values = {"Z", "X"}, Multi = true, Callback = function(Value) _G.SwordSkills = Value end})
Tabs.SkillsHold:AddDropdown("FruitsSkills", {Title = "Select Skill Blox Fruit", Values = {"Z", "X", "C", "V", "F"}, Multi = true, Callback = function(Value) _G.BfSkills = Value end})
Tabs.SkillsHold:AddSlider("KillAtSlider", {Title = "Kill At % Health", Min = 10, Max = 90, Default = 70, Rounding = 0, Callback = function(Value) getgenv().Kill_At = Value end})

Tabs.AutoModeFarm:AddDropdown("SelectMethodFarm", {Title = "Select Method Farm", Values = {"Level Farm", "Farm Bones", "Farm Katakuri", "Farm Tyrant of the Skies", "Aura Farm"}, Default = nil, Callback = function(Value) _G.MethodSelect = Value end})
Tabs.AutoModeFarm:AddToggle("AcceptQuest", {Title = "Auto Accept Quest", Default = false, Callback = function(Value) _G.AcceptQuestC = Value end})
Tabs.AutoModeFarm:AddToggle("StartFarm", {Title = "Start Farm (Auto Scan Sea Level)", Default = false, Callback = function(Value) _G.StartFarm = Value end})

Tabs.Stack:AddToggle("World2AutoGet", {Title = "Auto New World", Default = false, Callback = function(Value) _G.TravelDres = Value end})
Tabs.Stack:AddToggle("DevilFarmNormal", {Title = "Teleport to Fruit", Default = false, Callback = function(Value) _G.TwFruits = Value end})

Tabs.Other:AddDropdown("SelectRod", {Title = "Select Rod", Values = {"Fishing Rod", "Gold Rod", "Shark Rod"}, Default = nil, Callback = function(Value) SelectedRod = Value end})
Tabs.Other:AddToggle("AutoFishing", {Title = "Auto Fishing", Default = false, Callback = function(Value) AutoFishing = Value end})

Tabs.AdminFake:AddToggle("AutoStoreFruit", {Title = "Auto Store Fruit", Default = false, Callback = function(Value) _G.AutoStoreFruit = Value end})

spawn(function()
    while task.wait(1) do
        if _G.AutoStoreFruit then
            pcall(function()
                for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v:GetAttribute("OriginalName"), v)
                    end
                end
                for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if string.find(v.Name, "Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", v:GetAttribute("OriginalName"), v)
                    end
                end
            end)
        end
    end
end)

Tabs.AdminFake:AddButton({Title = "Fake Admin (!ad)", Callback = function()
    game.Players.LocalPlayer.Chatted:Connect(function(msg)
        if msg == "!ad" then
            game.StarterGui:SetCore("SendNotification", {Title = "System", Text = "Admin Mode Activated", Duration = 5})
            local Player = game.Players.LocalPlayer
            local Head = Player.Character:WaitForChild("Head")
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

Tabs.AdminFake:AddButton({Title = "Fake Fruit", Callback = function()
    local FakeFruit = Instance.new("Tool")
    FakeFruit.Name = "Kitsune-Kitsune"
    FakeFruit.ToolTip = "Blox Fruit"
    local Handle = Instance.new("Part", FakeFruit)
    Handle.Name = "Handle"
    Handle.Size = Vector3.new(1, 1, 1)
    FakeFruit.Parent = game.Players.LocalPlayer.Backpack
end})

local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Space then
        local character = player.Character
        if not character then return end
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid:GetState() == Enum.HumanoidStateType.Freefall then
            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = 1
                end
            end
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then
        local character = player.Character
        if not character then return end
        for _, part in pairs(character:GetDescendants()) do
            if (part:IsA("BasePart") and part.Name ~= "HumanoidRootPart") or part:IsA("Decal") then
                part.Transparency = 0
            end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do 
        local coreGui = game:GetService("CoreGui")
        for _, gui in pairs(coreGui:GetChildren()) do
            if gui:IsA("ScreenGui") then
                for _, obj in pairs(gui:GetDescendants()) do
                    if obj:IsA("Frame") or obj:IsA("TextButton") or obj:IsA("ScrollingFrame") then
                        if obj.BackgroundColor3.R < 0.3 then 
                            obj.BackgroundColor3 = Color3.fromRGB(200, 80, 80) 
                        end
                    end
                    if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                        obj.TextColor3 = Color3.fromRGB(255, 255, 255)
                        obj.TextTransparency = 0
                    end
                    if obj:IsA("UIStroke") then
                        obj.Color = Color3.fromRGB(255, 100, 100)
                    end
                end
            end
        end
    end
end)

Window:SelectTab(1)

local function getDistance(target)
    if not target or not target:FindFirstChild("HumanoidRootPart") then return math.huge end
    return (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - target.HumanoidRootPart.Position).Magnitude
end

local function _tp(pos)
    local player = game.Players.LocalPlayer
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local distance = (player.Character.HumanoidRootPart.Position - pos.Position).Magnitude
    local speed = 300
    local time = distance / speed
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(time, Enum.EasingStyle.Linear)
    local tween = tweenService:Create(player.Character.HumanoidRootPart, tweenInfo, {CFrame = pos})
    tween:Play()
end

local function ScanSeaLevels()
    local mapData = {NPCs = {}, Mobs = {}, Quests = {}}
    for _, v in pairs(game:GetService("Workspace").Map:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
            table.insert(mapData.NPCs, v.Name)
        end
    end
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        table.insert(mapData.Mobs, v.Name)
    end
    return mapData
end

local function EquipWeapon()
    local player = game.Players.LocalPlayer
    for _, tool in pairs(player.Backpack:GetChildren()) do
        if tool:IsA("Tool") and tool.ToolTip == _G.ChooseWP then
            player.Character.Humanoid:EquipTool(tool)
        end
    end
end

local function Attack()
    local vim = game:GetService("VirtualUser")
    vim:CaptureController()
    vim:ClickButton1(Vector2.new())
end

spawn(function()
    while task.wait() do
        if _G.StartFarm then
            pcall(function()
                local seaData = ScanSeaLevels()
                local target = nil
                
                for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        target = v
                        break
                    end
                end

                if target then
                    EquipWeapon()
                    if _B and target:FindFirstChild("HumanoidRootPart") then
                        for _, mob in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if mob.Name == target.Name and mob:FindFirstChild("HumanoidRootPart") and getDistance(mob) < 300 then
                                mob.HumanoidRootPart.CFrame = target.HumanoidRootPart.CFrame
                            end
                        end
                    end
                    _tp(target.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0))
                    Attack()
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(0.5) do
        if getgenv().AutoHakiBuso then
            pcall(function()
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait(0.5) do
        if getgenv().Observation then
            pcall(function()
                local player = game.Players.LocalPlayer
                if player.Character and not player.Character:FindFirstChild("ObservationHaki") then
                    game:GetService("ReplicatedStorage").Remotes.CommE_:FireServer("Ken", true)
                end
            end)
        end
    end
end)

local RunService = game:GetService("RunService")
RunService.Stepped:Connect(function()
    if getgenv().WalkSpeedEnabled then
        local player = game:GetService('Players').LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
        end
    end
end)

Tabs.Settings:AddButton({
    Title = "Copy Full Function Config to Clipboard",
    Callback = function()
        local configData = "getgenv().Config = {\n"
        configData = configData .. "  StartFarm = " .. tostring(_G.StartFarm) .. ",\n"
        configData = configData .. "  AutoStoreFruit = " .. tostring(_G.AutoStoreFruit) .. ",\n"
        configData = configData .. "  Weapon = '" .. tostring(_G.ChooseWP) .. "',\n"
        configData = configData .. "  BringMob = " .. tostring(_B) .. ",\n"
        configData = configData .. "  AutoBuso = " .. tostring(getgenv().AutoHakiBuso) .. "\n"
        configData = configData .. "}"
        setclipboard(configData)
        Fluent:Notify({
            Title = "Success",
            Content = "Config Copied to Clipboard!",
            Duration = 3
        })
    end
})

game:GetService('Players').LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    if getgenv().WalkSpeedEnabled then
        character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue
    end
end)

-- ==========================================
-- HỆ THỐNG ĐIỀU KHIỂN NHÂN VẬT & TỐI ƯU (PHẦN CUỐI)
-- ==========================================

-- Hàm kiểm tra Quest (Quest Check)
local function GetQuest()
    local lv = game.Players.LocalPlayer.Data.Level.Value
    if lv >= 1 and lv <= 9 then
        return {"Bandit", "BanditQuest1", 1}
    -- Bạn có thể thêm các mốc level khác tại đây dựa theo logic game
    end
    return nil
end

-- Vòng lặp tự động nhận nhiệm vụ
task.spawn(function()
    while task.wait(1) do
        if _G.StartFarm and _G.AcceptQuestC then
            local qData = GetQuest()
            if qData and not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
                _tp(game:GetService("Workspace").NPCs[qData[2]].HumanoidRootPart.CFrame)
                task.wait(0.5)
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", qData[2], qData[3])
            end
        end
    end
end)

-- Hệ thống chống kẹt khi Farm
task.spawn(function()
    while task.wait(5) do
        if _G.StartFarm then
            local lastPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            task.wait(2)
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - lastPos).Magnitude < 1 then
                -- Nếu đứng yên quá lâu thì reset vị trí nhẹ để tránh kẹt map
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 50, 0)
            end
        end
    end
end)

-- Tự động bật Haki khi vào game
if getgenv().AutoHakiBuso == nil then getgenv().AutoHakiBuso = true end

-- Thông báo hoàn tất thiết lập
Fluent:Notify({
    Title = "QUANG MOD - HOÀN TẤT",
    Content = "Tất cả chức năng đã được nhúng vào thư viện Fluent thành công!",
    Duration = 5
})

-- Lưu cấu hình (Sử dụng SaveManager của Fluent)
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildContextMenu(Tabs.Settings)
