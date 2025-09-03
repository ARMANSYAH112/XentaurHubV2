-- XentaurHub by ArmansyahOfc
-- Taruh di StarterPlayerScripts

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

--========== UI SETUP ==========
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.Name = "XentaurHub"

local function addNeon(obj)
	local stroke = Instance.new("UIStroke", obj)
	stroke.Thickness = 2
	stroke.Color = Color3.fromRGB(0,255,255)
end

--========== LOGIN ==========
local gateFrame = Instance.new("Frame", screenGui)
gateFrame.Size = UDim2.new(0, 320, 0, 200)
gateFrame.Position = UDim2.new(0.5, -160, 0.5, -100)
gateFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
Instance.new("UICorner", gateFrame).CornerRadius = UDim.new(0,16)
addNeon(gateFrame)

local gateTitle = Instance.new("TextLabel", gateFrame)
gateTitle.Size = UDim2.new(1,0,0,50)
gateTitle.Text = "XentaurHub"
gateTitle.BackgroundTransparency = 1
gateTitle.TextColor3 = Color3.fromRGB(0,255,255)
gateTitle.TextScaled = true

local keyBox = Instance.new("TextBox", gateFrame)
keyBox.Size = UDim2.new(0.8,0,0,30)
keyBox.Position = UDim2.new(0.1,0,0.5,-35)
keyBox.PlaceholderText = "Masukkan key..."
keyBox.BackgroundColor3 = Color3.fromRGB(5,5,5)
keyBox.TextColor3 = Color3.fromRGB(0,255,255)
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0,8)
addNeon(keyBox)

local enterBtn = Instance.new("TextButton", gateFrame)
enterBtn.Size = UDim2.new(0.35,0,0,30)
enterBtn.Position = UDim2.new(0.55,0,0.75,-15)
enterBtn.Text = "Enter"
enterBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
enterBtn.TextColor3 = Color3.fromRGB(0,255,255)
Instance.new("UICorner", enterBtn).CornerRadius = UDim.new(0,8)
addNeon(enterBtn)

local getKeyBtn = Instance.new("TextButton", gateFrame)
getKeyBtn.Size = UDim2.new(0.35,0,0,30)
getKeyBtn.Position = UDim2.new(0.1,0,0.75,-15)
getKeyBtn.Text = "Get Key"
getKeyBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
getKeyBtn.TextColor3 = Color3.fromRGB(0,255,255)
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0,8)
addNeon(getKeyBtn)

--========== HUB ==========
local hubFrame = Instance.new("Frame", screenGui)
hubFrame.Size = UDim2.new(0, 400, 0, 420)
hubFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
hubFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
hubFrame.Visible = false
Instance.new("UICorner", hubFrame).CornerRadius = UDim.new(0,16)
addNeon(hubFrame)

local hubTitle = Instance.new("TextLabel", hubFrame)
hubTitle.Text = "XentaurHub"
hubTitle.Size = UDim2.new(1,0,0,50)
hubTitle.BackgroundTransparency = 1
hubTitle.TextColor3 = Color3.fromRGB(0,255,255)
hubTitle.TextScaled = true

-- Minimize
local minimizeBtn = Instance.new("TextButton", hubFrame)
minimizeBtn.Size = UDim2.new(0,40,0,40)
minimizeBtn.Position = UDim2.new(1,-50,0,10)
minimizeBtn.Text = "–"
minimizeBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
minimizeBtn.TextColor3 = Color3.fromRGB(0,255,255)
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0,8)
addNeon(minimizeBtn)

local logoBtn = Instance.new("TextButton", screenGui)
logoBtn.Size = UDim2.new(0,50,0,50)
logoBtn.Position = UDim2.new(1,-60,0,20)
logoBtn.Text = "≡"
logoBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
logoBtn.TextColor3 = Color3.fromRGB(0,255,255)
Instance.new("UICorner", logoBtn).CornerRadius = UDim.new(0,25)
addNeon(logoBtn)
logoBtn.Visible = false

--========== FEATURES ==========
local yOffset = 60
local function createFeature(name, withBox)
	local f = Instance.new("Frame", hubFrame)
	f.Size = UDim2.new(0.9,0,0,40)
	f.Position = UDim2.new(0.05,0,yOffset/420,0)
	f.BackgroundColor3 = Color3.fromRGB(20,20,20)
	Instance.new("UICorner", f).CornerRadius = UDim.new(0,10)
	addNeon(f)
	yOffset = yOffset + 45

	local label = Instance.new("TextLabel", f)
	label.Text = name
	label.Size = UDim2.new(0.4,0,1,0)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(0,255,255)
	label.TextScaled = true

	local box
	if withBox then
		box = Instance.new("TextBox", f)
		box.Size = UDim2.new(0.3,0,0.8,0)
		box.Position = UDim2.new(0.4,5,0.1,0)
		box.BackgroundColor3 = Color3.fromRGB(0,0,0)
		box.TextColor3 = Color3.fromRGB(0,255,255)
		Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)
	end

	local toggle = Instance.new("TextButton", f)
	toggle.Size = UDim2.new(0.25,0,0.8,0)
	toggle.Position = UDim2.new(0.75,-5,0.1,0)
	toggle.Text = "OFF"
	toggle.BackgroundColor3 = Color3.fromRGB(0,0,0)
	toggle.TextColor3 = Color3.fromRGB(0,255,255)
	Instance.new("UICorner", toggle).CornerRadius = UDim.new(0,8)
	addNeon(toggle)

	return box, toggle
end

local flyBox, flyToggle = createFeature("Fly", true)
local jumpBox, jumpToggle = createFeature("Jump Boost", true)
local speedBox, speedToggle = createFeature("Speed Hack", true)
local _, invisToggle = createFeature("Invisible", false)
local _, aimToggle = createFeature("Aimbot", false)
local _, espToggle = createFeature("ESP Player", false)
local _, adminToggle = createFeature("Admin Command", false)

--========== FEATURE LOGIC ==========
-- Fly
-- Ambil service
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- Variabel fly lokal
local flying = false
local flyConn

-- Variabel FlyGuiV3
local flyGuiActive = false
local FlyGuiV3 = loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))

-------------------------------------------------
-- TOMBOL 1: Fly Lokal
-------------------------------------------------
flyToggle.MouseButton1Click:Connect(function()
	flying = not flying
	flyToggle.Text = flying and "Fly: ON" or "Fly: OFF"

	if flying then
		local hrp = character:WaitForChild("HumanoidRootPart")
		flyConn = RunService.RenderStepped:Connect(function()
			local speed = tonumber(flyBox.Text) or 50
			local move = Vector3.zero

			if UserInputService:IsKeyDown(Enum.KeyCode.W) then
				move += workspace.CurrentCamera.CFrame.LookVector * speed
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.S) then
				move -= workspace.CurrentCamera.CFrame.LookVector * speed
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.A) then
				move -= workspace.CurrentCamera.CFrame.RightVector * speed
			end
			if UserInputService:IsKeyDown(Enum.KeyCode.D) then
				move += workspace.CurrentCamera.CFrame.RightVector * speed
			end

			hrp.Velocity = move
		end)
	else
		if flyConn then flyConn:Disconnect() end
		character:WaitForChild("HumanoidRootPart").Velocity = Vector3.zero
	end
end)

-------------------------------------------------
-- TOMBOL 2: FlyGuiV3
-------------------------------------------------
flyGuiToggle.MouseButton1Click:Connect(function()
	flyGuiActive = not flyGuiActive
	flyGuiToggle.Text = flyGuiActive and "FlyGuiV3: ON" or "FlyGuiV3: OFF"

	if flyGuiActive then
		task.spawn(function()
			FlyGuiV3()
		end)
	else
		-- OFF = hancurin GUI bawaan FlyGuiV3 kalau ada
		if game.CoreGui:FindFirstChild("FlyGuiV3") then
			game.CoreGui.FlyGuiV3:Destroy()
		end
	end
end)

-- Jump Boost
local jumpActive = false
jumpToggle.MouseButton1Click:Connect(function()
	jumpActive = not jumpActive
	jumpToggle.Text = jumpActive and "ON" or "OFF"
	humanoid.JumpPower = jumpActive and (tonumber(jumpBox.Text) or 50) or 50
end)

-- Speed Hack
local speedActive = false
speedToggle.MouseButton1Click:Connect(function()
	speedActive = not speedActive
	speedToggle.Text = speedActive and "ON" or "OFF"
	humanoid.WalkSpeed = speedActive and (tonumber(speedBox.Text) or 16) or 16
end)

-- Invisible
local invisActive = false
invisToggle.MouseButton1Click:Connect(function()
	invisActive = not invisActive
	invisToggle.Text = invisActive and "ON" or "OFF"
	for _,p in pairs(character:GetDescendants()) do
		if p:IsA("BasePart") then
			p.Transparency = invisActive and 1 or 0
		end
	end
end)

-- Aimbot
local aiming = false
local aimConn
aimToggle.MouseButton1Click:Connect(function()
	aiming = not aiming
	aimToggle.Text = aiming and "ON" or "OFF"
	if aiming then
		aimConn = RunService.RenderStepped:Connect(function()
			local nearest, dist = nil, math.huge
			for _,plr in pairs(Players:GetPlayers()) do
				if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
					local mag = (plr.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).Magnitude
					if mag < dist then
						dist = mag
						nearest = plr
					end
				end
			end
			if nearest then
				workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, nearest.Character.HumanoidRootPart.Position)
			end
		end)
	else
		if aimConn then aimConn:Disconnect() end
	end
end)

-- ESP
local espActive = false
espToggle.MouseButton1Click:Connect(function()
	espActive = not espActive
	espToggle.Text = espActive and "ON" or "OFF"
	for _,plr in pairs(Players:GetPlayers()) do
		if plr.Character then
			local h = plr.Character:FindFirstChild("ESPHighlight")
			if espActive and not h then
				h = Instance.new("Highlight", plr.Character)
				h.Name = "ESPHighlight"
				h.FillTransparency = 1
				h.OutlineColor = Color3.fromRGB(0,255,255)
			elseif not espActive and h then
				h:Destroy()
			end
		end
	end
end)

-- Admin Command slot
adminToggle.MouseButton1Click:Connect(function()
	print("Isi loadstring kamu di sini")
end)

--========== LOGIN ==========
enterBtn.MouseButton1Click:Connect(function()
	if keyBox.Text == "ArmansyahOfc" then
		gateFrame:Destroy()
		hubFrame.Visible = true
	else
		keyBox.Text = "❌ Salah"
	end
end)

getKeyBtn.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("https://example.com/yourkeylink") -- ganti link kamu disini
	end
end)

--========== MINIMIZE ==========
minimizeBtn.MouseButton1Click:Connect(function()
	hubFrame.Visible = false
	logoBtn.Visible = true
end)
logoBtn.MouseButton1Click:Connect(function()
	hubFrame.Visible = true
	logoBtn.Visible = false
end)
