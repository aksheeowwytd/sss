if not game:IsLoaded() then game.Loaded:Wait() end
repeat task.wait(0.5) until game:GetService("Players").LocalPlayer
repeat task.wait(0.5) until workspace.CurrentCamera and workspace.CurrentCamera.CFrame ~= CFrame.new()
task.wait(1)

local PLACE_ID = 109983668079237
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

for _, v in pairs(CoreGui:GetChildren()) do 
    if v.Name == "FakeSyn7Gui" then v:Destroy() end 
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FakeSyn7Gui"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

local ClickSound = Instance.new("Sound", ScreenGui)
ClickSound.SoundId = "rbxassetid://75311202481026"
ClickSound.Volume = 0.3
local function playClick() pcall(function() ClickSound:Play() end) end

local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
local TARGET_SCALE = isMobile and 0.72 or 1.0
local tw = TweenInfo.new(0.14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Background Container (always visible)
local Background = Instance.new("Frame", ScreenGui)
Background.BackgroundTransparency = 1
Background.Size = UDim2.new(1,0,1,0)
Background.ZIndex = 1

-- Orbs (background effects - still active)
local PL = Instance.new("Frame", Background)
PL.BackgroundTransparency = 1
PL.Size = UDim2.new(1,0,1,0)
PL.ZIndex = 2

local oC = {
    {Color3.fromRGB(0,120,255), Color3.fromRGB(100,200,255)},
    {Color3.fromRGB(0,80,220), Color3.fromRGB(80,170,255)}
}
local orbCount = 0

task.spawn(function()
    while Background and Background.Parent do
        if orbCount < 3 then
            orbCount += 1
            local col = oC[math.random(1,#oC)]
            local sz = math.random(10,24)
            local sx = math.random(3,97)/100
            local orb = Instance.new("Frame", PL)
            orb.BackgroundColor3 = col[1]
            orb.BackgroundTransparency = math.random(25,50)/100
            orb.BorderSizePixel = 0
            orb.Size = UDim2.new(0,sz,0,sz)
            orb.Position = UDim2.new(sx,0,1.04,0)
            orb.ZIndex = 3
            Instance.new("UICorner", orb).CornerRadius = UDim.new(1,0)

            local dur = math.random(60,100)/10
            local drift = math.random(-40,40)/1000
            TweenService:Create(orb, TweenInfo.new(dur, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Position = UDim2.new(sx+drift,0,-0.06,0),
                BackgroundTransparency = 1,
                Size = UDim2.new(0,sz*0.3,0,sz*0.3)
            }):Play()

            task.delay(dur, function()
                orbCount = math.max(0, orbCount-1)
                if orb and orb.Parent then orb:Destroy() end
            end)
        end
        task.wait(2)
    end
end)

-- Blue Down Screen
local DownFrame = Instance.new("Frame", ScreenGui)
DownFrame.BackgroundColor3 = Color3.fromRGB(0, 25, 55)
DownFrame.Size = UDim2.new(1,0,1,0)
DownFrame.ZIndex = 10
Instance.new("UICorner", DownFrame).CornerRadius = UDim.new(0,0)

local Glow = Instance.new("UIStroke", DownFrame)
Glow.Color = Color3.fromRGB(0, 140, 255)
Glow.Thickness = 3
Glow.Transparency = 0.6

-- Maintenance Title
local Title = Instance.new("TextLabel", DownFrame)
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.5, 0, 0.35, 0)
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.Size = UDim2.new(0.8, 0, 0, 80)
Title.Font = Enum.Font.GothamBlack
Title.Text = "SYN7 NOTIFIER"
Title.TextColor3 = Color3.fromRGB(0, 180, 255)
Title.TextSize = 42
Title.TextTransparency = 0.05

local Status = Instance.new("TextLabel", DownFrame)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0.5, 0, 0.48, 0)
Status.AnchorPoint = Vector2.new(0.5, 0.5)
Status.Size = UDim2.new(0.7, 0, 0, 60)
Status.Font = Enum.Font.GothamBold
Status.Text = "SERVICE IS CURRENTLY DOWN"
Status.TextColor3 = Color3.fromRGB(100, 200, 255)
Status.TextSize = 28
Status.TextTransparency = 0.1

local Reason = Instance.new("TextLabel", DownFrame)
Reason.BackgroundTransparency = 1
Reason.Position = UDim2.new(0.5, 0, 0.58, 0)
Reason.AnchorPoint = Vector2.new(0.5, 0.5)
Reason.Size = UDim2.new(0.65, 0, 0, 50)
Reason.Font = Enum.Font.GothamMedium
Reason.Text = "Maintenance • We'll be back shortly"
Reason.TextColor3 = Color3.fromRGB(140, 180, 255)
Reason.TextSize = 18
Reason.TextTransparency = 0.2

-- Pulsing animation
task.spawn(function()
    while DownFrame and DownFrame.Parent do
        TweenService:Create(Glow, TweenInfo.new(2.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.3}):Play()
        task.wait(2.2)
        TweenService:Create(Glow, TweenInfo.new(2.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.75}):Play()
        task.wait(2.2)
    end
end)

-- Mini pill button (still works)
local Pill = Instance.new("TextButton", ScreenGui)
Pill.BackgroundColor3 = Color3.fromRGB(5,5,13)
Pill.Position = UDim2.new(0.5,-55,0,14)
Pill.Size = UDim2.new(0,110,0,28)
Pill.Font = Enum.Font.GothamBlack
Pill.Text = "◈ SYN7"
Pill.TextColor3 = Color3.fromRGB(0,180,255)
Pill.TextSize = 13
Pill.AutoButtonColor = false
Pill.ZIndex = 50
Pill.Visible = false
Instance.new("UICorner", Pill).CornerRadius = UDim.new(1,0)

local PillS = Instance.new("UIStroke", Pill)
PillS.Color = Color3.fromRGB(0,140,255)
PillS.Thickness = 1.5

-- Fake main frame (hidden in down mode)
local Frame = Instance.new("CanvasGroup", ScreenGui)
Frame.BackgroundColor3 = Color3.fromRGB(7,7,16)
Frame.Position = UDim2.new(0.5,-340,0.5,-200)
Frame.Size = UDim2.new(0,680,0,400)
Frame.Active = true
Frame.GroupTransparency = 1
Frame.Visible = false
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,18)

-- Intro burst particles (on load)
local BL = Instance.new("Frame", ScreenGui)
BL.BackgroundTransparency = 1
BL.Size = UDim2.new(1,0,1,0)
BL.ZIndex = 5

local bCols = {Color3.fromRGB(0,140,255), Color3.fromRGB(80,200,255), Color3.fromRGB(0,80,220)}
local function spawnBP(cx,cy,d)
    task.delay(d, function()
        if not BL or not BL.Parent then return end
        local sz = math.random(6,20)
        local a = math.rad(math.random(0,360))
        local dist = math.random(80,340)
        local p = Instance.new("Frame", BL)
        p.BackgroundColor3 = bCols[math.random(1,#bCols)]
        p.BackgroundTransparency = 0.1
        p.BorderSizePixel = 0
        p.AnchorPoint = Vector2.new(0.5,0.5)
        p.Position = UDim2.new(0,cx,0,cy)
        p.Size = UDim2.new(0,sz,0,sz)
        p.ZIndex = 6
        Instance.new("UICorner",p).CornerRadius = UDim.new(1,0)

        TweenService:Create(p, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Position = UDim2.new(0,cx+math.cos(a)*dist,0,cy+math.sin(a)*dist),
            Size = UDim2.new(0,sz*1.6,0,sz*1.6)
        }):Play()

        task.delay(0.45, function()
            if p and p.Parent then
                TweenService:Create(p, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0,2,0,2)
                }):Play()
                task.delay(0.36, function() if p and p.Parent then p:Destroy() end end)
            end
        end)
    end)
end

task.spawn(function()
    local cam = workspace.CurrentCamera
    local vp = cam.ViewportSize
    local cx, cy = vp.X/2, vp.Y/2
    for i=1,20 do spawnBP(cx,cy,i*0.02) end
    task.wait(0.6)
    if BL and BL.Parent then BL:Destroy() end
end)

-- Pill animations
task.spawn(function()
    while Pill and Pill.Parent do
        TweenService:Create(PillS, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency=0}):Play()
        task.wait(1.2)
        TweenService:Create(PillS, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency=0.6}):Play()
        task.wait(1.2)
    end
end)

-- Controls
local function showDownScreen()
    DownFrame.Visible = true
    Frame.Visible = false
end

Pill.MouseButton1Click:Connect(function()
    playClick()
    showDownScreen()
end)

-- Show down screen on start
task.wait(0.8)
showDownScreen()
Pill.Visible = true
