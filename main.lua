local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local GuiInset = game:GetService("GuiService"):GetGuiInset()
local Players = game:GetService("Players")

local function Create(instance, properties, children)
    local obj = Instance.new(instance)
    for i, v in next, properties or {} do obj[i] = v end
    for _, child in next, children or {} do child.Parent = obj end
    return obj
end

local AnimSpy = Create("ScreenGui", {ResetOnSpawn = false, Name = "NVX_AnimSpy"})

local Background = Create("Frame", {Parent = AnimSpy, BackgroundColor3 = Color3.fromRGB(16, 16, 20), ClipsDescendants = true, Position = UDim2.new(0, 500, 0, 200), Size = UDim2.new(0, 520, 0, 330)})
Create("UICorner", {Parent = Background, CornerRadius = UDim.new(0, 14)})
Create("UIStroke", {Parent = Background, Color = Color3.fromRGB(255, 60, 60), Thickness = 2.5, Transparency = 0.5})

local LeftPanel = Create("Frame", {Parent = Background, BackgroundColor3 = Color3.fromRGB(22, 22, 28), BorderSizePixel = 0, Position = UDim2.new(0, 0, 0, 40), Size = UDim2.new(0, 138, 0, 290)})
Create("UICorner", {Parent = LeftPanel, CornerRadius = UDim.new(0, 12)})

local LogList = Create("ScrollingFrame", {Parent = LeftPanel, Active = true, BackgroundTransparency = 1, Position = UDim2.new(0, 4, 0, 6), Size = UDim2.new(1, -8, 1, -10), CanvasSize = UDim2.new(0, 0, 0, 0), ScrollBarThickness = 3})
local UIListLayout = Create("UIListLayout", {Parent = LogList, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2)})

local RightPanel = Create("Frame", {Parent = Background, BackgroundColor3 = Color3.fromRGB(19, 19, 24), BorderSizePixel = 0, Position = UDim2.new(0, 138, 0, 40), Size = UDim2.new(0, 382, 0, 290)})
Create("UICorner", {Parent = RightPanel, CornerRadius = UDim.new(0, 12)})

local CodeBox = Create("Frame", {Parent = RightPanel, BackgroundColor3 = Color3.fromRGB(12, 12, 16), BorderSizePixel = 0, Size = UDim2.new(0, 382, 0, 155)})
Create("UICorner", {Parent = CodeBox, CornerRadius = UDim.new(0, 10)})

local ViewportFrame = Create("ViewportFrame", {Parent = CodeBox, BackgroundColor3 = Color3.fromRGB(20, 20, 28), Size = UDim2.new(0.44, -1, 1, 0)})
Create("UICorner", {Parent = ViewportFrame, CornerRadius = UDim.new(0, 10)})

Create("Frame", {Parent = CodeBox, BackgroundColor3 = Color3.fromRGB(35, 35, 48), Position = UDim2.new(0.44, -1, 0, 0), Size = UDim2.new(0, 1, 1, 0)})

local CodeLabel = Create("TextLabel", {Parent = CodeBox, BackgroundTransparency = 1, Size = UDim2.new(0.56, -6, 1, -6), Position = UDim2.new(0.44, 3, 0, 3), Font = Enum.Font.Code, TextColor3 = Color3.fromRGB(195, 195, 215), TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, Text = "-- Select a log entry to view details"})

local ViewportCamera = Instance.new("Camera")
ViewportCamera.Parent = ViewportFrame
ViewportFrame.CurrentCamera = ViewportCamera

local ScrollingFrame = Create("ScrollingFrame", {Parent = RightPanel, Active = true, BackgroundTransparency = 1, Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.new(1, 0, 0.5, -9), CanvasSize = UDim2.new(0, 0, 0, 0), ScrollBarThickness = 3})
local UIGridLayout = Create("UIGridLayout", {Parent = ScrollingFrame, CellPadding = UDim2.new(0, 4, 0, 4), CellSize = UDim2.new(0, 100, 0, 24)})

local TopBar = Create("Frame", {Parent = Background, BackgroundColor3 = Color3.fromRGB(18, 18, 23), Size = UDim2.new(1, 0, 0, 40)})
Create("UICorner", {Parent = TopBar, CornerRadius = UDim.new(0, 14)})

local Title = Create("TextLabel", {Parent = TopBar, BackgroundTransparency = 1, Position = UDim2.new(0, 14, 0, 6), Size = UDim2.new(0.6, 0, 0, 22), Font = Enum.Font.GothamBold, Text = "NVX-AnimSpy", TextColor3 = Color3.fromRGB(255, 65, 65), TextSize = 19})
Create("UIStroke", {Parent = Title, Color = Color3.fromRGB(255, 100, 100), Thickness = 2, Transparency = 0.35})

Create("TextLabel", {Parent = TopBar, BackgroundTransparency = 1, Position = UDim2.new(0, 14, 0, 26), Size = UDim2.new(0.6, 0, 0, 14), Font = Enum.Font.Gotham, Text = "by: Silence", TextColor3 = Color3.fromRGB(170, 170, 190), TextSize = 12})

local CloseButton = Create("TextButton", {Parent = TopBar, BackgroundColor3 = Color3.fromRGB(36, 36, 46), Position = UDim2.new(1, -30, 0, 8), Size = UDim2.new(0, 22, 0, 22)})
Create("UICorner", {Parent = CloseButton, CornerRadius = UDim.new(0, 6)})
Create("ImageLabel", {Parent = CloseButton, BackgroundTransparency = 1, Position = UDim2.new(0, 7, 0, 7), Size = UDim2.new(0, 8, 0, 8), Image = "http://www.roblox.com/asset/?id=5597086202"})

local MaximizeButton = Create("TextButton", {Parent = TopBar, BackgroundColor3 = Color3.fromRGB(36, 36, 46), Position = UDim2.new(1, -56, 0, 8), Size = UDim2.new(0, 22, 0, 22)})
Create("UICorner", {Parent = MaximizeButton, CornerRadius = UDim.new(0, 6)})
Create("ImageLabel", {Parent = MaximizeButton, BackgroundTransparency = 1, Position = UDim2.new(0, 7, 0, 7), Size = UDim2.new(0, 8, 0, 8), Image = "http://www.roblox.com/asset/?id=5597108117"})

local MinimizeButton = Create("TextButton", {Parent = TopBar, BackgroundColor3 = Color3.fromRGB(36, 36, 46), Position = UDim2.new(1, -82, 0, 8), Size = UDim2.new(0, 22, 0, 22)})
Create("UICorner", {Parent = MinimizeButton, CornerRadius = UDim.new(0, 6)})
Create("ImageLabel", {Parent = MinimizeButton, BackgroundTransparency = 1, Position = UDim2.new(0, 7, 0, 7), Size = UDim2.new(0, 8, 0, 8), Image = "http://www.roblox.com/asset/?id=5597105827"})

local ToolTip = Create("Frame", {Parent = AnimSpy, BackgroundColor3 = Color3.fromRGB(26, 26, 34), Size = UDim2.new(0, 200, 0, 50), ZIndex = 3, Visible = false})
Create("UICorner", {Parent = ToolTip, CornerRadius = UDim.new(0, 8)})
Create("UIStroke", {Parent = ToolTip, Color = Color3.fromRGB(255, 80, 80), Thickness = 1.5})

local ToolTipLabel = Create("TextLabel", {Parent = ToolTip, BackgroundTransparency = 1, Size = UDim2.new(1, -16, 1, -12), Position = UDim2.new(0, 8, 0, 6), Font = Enum.Font.Gotham, TextColor3 = Color3.fromRGB(205, 205, 220), TextSize = 12, TextWrapped = true})

-- Variables
local layoutOrderNum = 999999999
local logs = {}
local selected = nil
local excluded = {}
local previewCharClone, previewWorldModel, previewTrack, previewRotConn = nil, nil, nil, nil

local codebox = {
    setRaw = function(self, text) CodeLabel.Text = tostring(text or "") end,
    getString = function(self) return CodeLabel.Text end
}

-- Funciones básicas
local function clearPreview()
    if previewRotConn then previewRotConn:Disconnect() end
    if previewTrack then pcall(function() previewTrack:Stop() end) end
    if previewWorldModel then pcall(function() previewWorldModel:Destroy() end) end
    previewCharClone, previewWorldModel, previewTrack, previewRotConn = nil, nil, nil, nil
end

local function previewAnim(assetId)
    clearPreview()
    local char = Players.LocalPlayer.Character
    if not char then return end
    local clone = char:Clone()
    local wm = Instance.new("WorldModel")
    wm.Parent = ViewportFrame
    clone.Parent = wm
    previewCharClone = clone
    previewWorldModel = wm
    -- Cámara simple
    local cam = ViewportCamera
    cam.CFrame = CFrame.new(0, 3, 8) * CFrame.Angles(0, math.rad(180), 0)
end

local function eventSelect(frame)
    if selected then
        TweenService:Create(selected.Button, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0,0,0)}):Play()
    end
    for _, v in ipairs(logs) do
        if v.Log == frame then selected = v break end
    end
    if selected then
        TweenService:Create(selected.Button, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(92, 126, 229)}):Play()
        codebox:setRaw(selected.Text or "")
        if selected.assetId then previewAnim(selected.assetId) end
    end
end

function newLog(name, logType, text)
    local accent = logType == "event" and Color3.fromRGB(112, 200, 130) or Color3.fromRGB(115, 100, 240)
    local f = Create("Frame", {Parent = LogList, Size = UDim2.new(1,0,0,26), BackgroundColor3 = Color3.fromRGB(30,30,38), LayoutOrder = layoutOrderNum})
    Create("UICorner", {Parent = f, CornerRadius = UDim.new(0,5)})
    Create("Frame", {Parent = f, Size = UDim2.new(0,3,1,-8), Position = UDim2.new(0,0,0,4), BackgroundColor3 = accent})
    Create("TextLabel", {Parent = f, Text = name, Size = UDim2.new(1,-12,1,0), Position = UDim2.new(0,9,0,0), BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(195,195,215), TextXAlignment = Enum.TextXAlignment.Left, Font = Enum.Font.Gotham, TextSize = 10})
    local btn = Create("TextButton", {Parent = f, Size = UDim2.new(1,0,1,0), BackgroundTransparency = 1, Text = ""})
    local entry = {Log = f, Button = btn, Text = text, assetId = name:match("%d+")}
    table.insert(logs, entry)
    btn.MouseButton1Click:Connect(function() eventSelect(f) end)
    layoutOrderNum -= 1
    return entry
end

function newButton(name, desc, callback)
    local f = Create("Frame", {Parent = ScrollingFrame, Size = UDim2.new(0,117,0,24), BackgroundTransparency = 1})
    local b = Create("TextButton", {Parent = f, Size = UDim2.new(1,-8,1,-6), Position = UDim2.new(0,4,0,3), BackgroundColor3 = Color3.fromRGB(34,34,44), Text = name, TextColor3 = Color3.fromRGB(195,195,215), Font = Enum.Font.Gotham, TextSize = 11})
    Create("UICorner", {Parent = b, CornerRadius = UDim.new(0,5)})
    b.MouseButton1Click:Connect(function() callback(f) end)
end

local function flashButton(frame, msg)
    local b = frame:FindFirstChild("Button")
    if b then
        local old = b.Text
        b.Text = msg
        task.delay(1.2, function() if b then b.Text = old end end)
    end
end

-- Botones
newButton("Copy Code", nil, function(f)
    setclipboard(codebox:getString())
    flashButton(f, "Copied!")
end)

newButton("Copy ID", nil, function(f)
    if selected and selected.assetId then
        setclipboard("rbxassetid://" .. selected.assetId)
        flashButton(f, "Copied!")
    end
end)

newButton("Clr Logs", nil, function(f)
    LogList:ClearAllChildren()
    logs = {}
    selected = nil
    codebox:setRaw("-- Select a log entry to view details")
    flashButton(f, "Cleared!")
end)

-- Anim Spy Logic
local function onAnimPlayed(track)
    local id = track.Animation.AnimationId:match("%d+")
    if not id then return end
    local name = track.Animation.Name ~= "" and track.Animation.Name or "Animation"
    local label = name .. " [" .. id .. "]"
    local scriptText = '-- '..name..'\nlocal anim = Instance.new("Animation")\nanim.AnimationId = "rbxassetid://'..id..'"\nlocal humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")\nlocal track = humanoid:LoadAnimation(anim)\ntrack:Play()'
    local entry = newLog(label, "event", scriptText)
    entry.assetId = id
end

local lp = Players.LocalPlayer
lp.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    local anim = hum:WaitForChild("Animator")
    anim.AnimationPlayed:Connect(onAnimPlayed)
end)

if lp.Character then
    local hum = lp.Character:WaitForChild("Humanoid")
    local anim = hum:WaitForChild("Animator")
    anim.AnimationPlayed:Connect(onAnimPlayed)
end

-- Final
CloseButton.MouseButton1Click:Connect(function() AnimSpy:Destroy() end)
AnimSpy.Parent = CoreGui
