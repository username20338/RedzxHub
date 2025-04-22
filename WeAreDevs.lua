-- RedzXHub Mobile v1.0 - Estrutura com Abas local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))() local Window = redzlib:MakeWindow({ Title = "RedzXHub Mobile", SubTitle = "by Carlos", SaveFolder = "RedzXHubData" })

-- Criar as Abas local tabFarm = Window:MakeTab({ Name = "Farm", Icon = "rbxassetid://4458901886" }) local tabFruit = Window:MakeTab({ Name = "Fruits", Icon = "rbxassetid://4458901902" }) local tabTele = Window:MakeTab({ Name = "Teleports", Icon = "rbxassetid://6035047409" }) local tabPlayer = Window:MakeTab({ Name = "Player", Icon = "rbxassetid://6031071050" }) local tabESP = Window:MakeTab({ Name = "ESP", Icon = "rbxassetid://6031075938" }) local tabUtils = Window:MakeTab({ Name = "Utilidades", Icon = "rbxassetid://6034509993" }) local tabRaids = Window:MakeTab({ Name = "Raids", Icon = "rbxassetid://6035015298" }) local tabSoon = Window:MakeTab({ Name = "Coming Soon", Icon = "rbxassetid://6031075938" })

-- Aviso de carregamento Window:MakeNotification({ Name = "RedzXHub Mobile", Content = "Hub carregado com sucesso!", Time = 5 })

-- ========== ABA: FARM ========== (getgenv()).AutoFarm = false (getgenv()).FastAttack = false (getgenv()).AutoHaki = false (getgenv()).AutoSkills = false (getgenv()).FarmMastery = false -- (Funções do Farm serão completadas com lógica do AutoFarm mais tarde)

-- ========== ABA: FRUITS ========== -- (Funções como Auto Collect, Store e Random Fruit serão adicionadas aqui)

-- ========== ABA: TELEPORT ========== -- (Funções de teleporte para Sea 1, 2, 3 já foram adicionadas)

-- ========== ABA: ESP ========== local function ToggleESP(typeESP) for i, v in pairs(game.Workspace:GetChildren()) do if v:IsA("Model") and v:FindFirstChild("Humanoid") and v ~= game.Players.LocalPlayer.Character then if not v:FindFirstChild("ESP") then local esp = Instance.new("BillboardGui", v) esp.Name = "ESP" esp.Size = UDim2.new(0, 100, 0, 40) esp.AlwaysOnTop = true esp.StudsOffset = Vector3.new(0, 3, 0) local text = Instance.new("TextLabel", esp) text.Size = UDim2.new(1, 0, 1, 0) text.BackgroundTransparency = 1 text.Text = typeESP text.TextColor3 = Color3.new(1, 0, 0) text.TextStrokeTransparency = 0 end end end end

tabESP:AddButton({ Name = "Toggle ESP Players", Callback = function() ToggleESP("Player") end })

tabESP:AddButton({ Name = "Toggle ESP Inimigos", Callback = function() ToggleESP("Enemy") end })

-- ========== ABA: RAIDS ========== getgenv().AutoRaid = false getgenv().AutoAwaken = false

local function StartAutoRaid() spawn(function() while getgenv().AutoRaid do pcall(function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Raids", "Start", "Flame") end) wait(5) end end) end

local function StartAutoAwaken() spawn(function() while getgenv().AutoAwaken do pcall(function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AwakeningProgress") end) wait(2) end end) end

tabRaids:AddToggle({ Name = "Auto Raid (Flame)", Default = false, Callback = function(v) getgenv().AutoRaid = v if v then StartAutoRaid() end end })

tabRaids:AddToggle({ Name = "Auto Awaken Skills", Default = false, Callback = function(v) getgenv().AutoAwaken = v if v then StartAutoAwaken() end end })

-- ========== ABA: COMING SOON ========== tabSoon:AddLabel("Essa aba será usada para novas funções!") tabSoon:AddLabel("Algumas ideias futuras:") tabSoon:AddLabel("- Auto Elite Hunters") tabSoon:AddLabel("- Sistema de Boss Tracker") tabSoon:AddLabel("- Trocas Automatizadas") tabSoon:AddLabel("- Mais ESP Avançado") tabSoon:AddLabel("Fique ligado nas atualizações!")
