--[[A hack for Doomspire Brickbattle, made by RRR06, thx ppl's names which'll be anonymous for reasons]]
local LocalPlayer = game:GetService('Players').LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local UserInput = game:GetService("UserInputService")

local GuiH = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Owner = Instance.new("TextLabel")
local Txt = Instance.new("TextLabel")
local loadHitbox = Instance.new("TextButton")
local loadESP = Instance.new("TextButton")
--
local TpMid = Instance.new("TextButton")
local TpSpec = Instance.new("TextButton")
local TpRed = Instance.new("TextButton")
local TpYellow = Instance.new("TextButton")
local TpBlue = Instance.new("TextButton")
local TpGreen = Instance.new("TextButton")

Mouse.Button1Down:Connect(function()
	if not Mouse.Target then return end
	if not UserInput:IsKeyDown(Enum.KeyCode.LeftControl) then return end
	LocalPlayer.Character:MoveTo(Mouse.Hit.p)
end)

UserInput.InputBegan:Connect(function(input, ignore)
	if input.KeyCode == Enum.KeyCode.Insert then
		GuiH.Enabled = not GuiH.Enabled
    end 
end)

GuiH.Name = "Gui_Hack"
GuiH.Parent = LocalPlayer.PlayerGui
GuiH.ResetOnSpawn = false

Frame.Parent = GuiH
Frame.Draggable = true
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(32, 32, 33)
Frame.BackgroundTransparency = 0
Frame.Position = UDim2.new(0.297752798, 0, 0.28443113, 0)
Frame.Size = UDim2.new(0, 400, 0, 250)

Owner.Name = "OwnerProg"
Owner.Parent = Frame
Owner.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
Owner.BackgroundTransparency = 1
Owner.Position = UDim2.new(0.25, -61, 0.02, 17)
Owner.Size = UDim2.new(0, 122, 0, 34)
Owner.Font = Enum.Font.SourceSans
Owner.Text = "Made by RRR06"
Owner.TextColor3 = Color3.fromRGB(255, 255, 255)
Owner.TextScaled = true

Txt.Name = "Info"
Txt.Parent = Frame
Txt.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
Txt.BackgroundTransparency = 1
Txt.Position = UDim2.new(0.5, -100, 0.8, 17)
Txt.Size = UDim2.new(0, 200, 0, 34)
Txt.Font = Enum.Font.SourceSans
Txt.Text = "Press Control + Left Mouse button to tp anywhere, and Insert to toggle GUI"
Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
Txt.TextScaled = true

TpMid.Name = "Tp_To_Mid"
TpMid.Parent = Frame
TpMid.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
TpMid.BackgroundTransparency = 0
TpMid.Position = UDim2.new(0.25, -61, 0.25, 8.5)
TpMid.Size = UDim2.new(0, 122, 0, 17)
TpMid.Font = Enum.Font.SourceSans
TpMid.Text = "Teleport to Mid"
TpMid.TextColor3 = Color3.fromRGB(255,255,255)
TpMid.TextScaled = true
TpMid.MouseButton1Click:Connect(function()
   LocalPlayer.Character:MoveTo(Vector3.new(0, 155, 0))
end)

TpSpec.Name = "Tp_To_Spectators"
TpSpec.Parent = Frame
TpSpec.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
TpSpec.BackgroundTransparency = 0
TpSpec.Position = UDim2.new(0.75, -61, 0.25, 8.5)
TpSpec.Size = UDim2.new(0, 122, 0, 17)
TpSpec.Font = Enum.Font.SourceSans
TpSpec.Text = "Teleport to Spectators"
TpSpec.TextColor3 = Color3.fromRGB(255,255,255)
TpSpec.TextScaled = true
TpSpec.MouseButton1Click:Connect(function()
   LocalPlayer.Character:MoveTo(Vector3.new(0, 400, 0))
end)

TpRed.Name = "Tp_To_Red"
TpRed.Parent = Frame
TpRed.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
TpRed.BackgroundTransparency = 0
TpRed.Position = UDim2.new(0.25, -61, 0.50, 8.5)
TpRed.Size = UDim2.new(0, 122, 0, 17)
TpRed.Font = Enum.Font.SourceSans
TpRed.Text = "Teleport to Red"
TpRed.TextColor3 = Color3.fromRGB(196, 40, 28)
TpRed.TextScaled = true
TpRed.MouseButton1Click:Connect(function()
   LocalPlayer.Character:MoveTo(Vector3.new(-130, 27, 0))
end)

TpYellow.Name = "Tp_To_Yellow"
TpYellow.Parent = Frame
TpYellow.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
TpYellow.BackgroundTransparency = 0
TpYellow.Position = UDim2.new(0.25, -61, 0.67, 8.5)
TpYellow.Size = UDim2.new(0, 122, 0, 17)
TpYellow.Font = Enum.Font.SourceSans
TpYellow.Text = "Teleport to Yellow"
TpYellow.TextColor3 = Color3.fromRGB(245, 205, 48)
TpYellow.TextScaled = true
TpYellow.MouseButton1Click:Connect(function()
   LocalPlayer.Character:MoveTo(Vector3.new(130, 27, 0))
end)

TpBlue.Name = "Tp_To_Blue"
TpBlue.Parent = Frame
TpBlue.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
TpBlue.BackgroundTransparency = 0
TpBlue.Position = UDim2.new(0.75, -61, 0.50, 8.5)
TpBlue.Size = UDim2.new(0, 122, 0, 17)
TpBlue.Font = Enum.Font.SourceSans
TpBlue.Text = "Teleport to Blue"
TpBlue.TextColor3 = Color3.fromRGB(13, 105, 172)
TpBlue.TextScaled = true
TpBlue.MouseButton1Click:Connect(function()
   LocalPlayer.Character:MoveTo(Vector3.new(0, 27, 130))
end)

TpGreen.Name = "Tp_To_Green"
TpGreen.Parent = Frame
TpGreen.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
TpGreen.BackgroundTransparency = 0
TpGreen.Position = UDim2.new(0.75, -61, 0.67, 8.5)
TpGreen.Size = UDim2.new(0, 122, 0, 17)
TpGreen.Font = Enum.Font.SourceSans
TpGreen.Text = "Teleport to Green"
TpGreen.TextColor3 = Color3.fromRGB(75, 151, 75)
TpGreen.TextScaled = true
TpGreen.MouseButton1Click:Connect(function()
   LocalPlayer.Character:MoveTo(Vector3.new(0, 27, -130))
end)

loadHitbox.Name = "Load_HitboxExpander"
loadHitbox.Parent = Frame
loadHitbox.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
loadHitbox.BackgroundTransparency = 0
loadHitbox.Position = UDim2.new(0.75, -61, 0.02, 10)
loadHitbox.Size = UDim2.new(0, 122, 0, 20)
loadHitbox.Font = Enum.Font.SourceSans
loadHitbox.Text = "Load HitboxExpander (Requires SynapseX)"
loadHitbox.TextColor3 = Color3.fromRGB(110, 65, 200)
loadHitbox.TextScaled = true
loadHitbox.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://gameovers.net/Scripts/Free/HitboxExpander/main.lua", true))()
end)

loadESP.Name = "Load_Unnamed"
loadESP.Parent = Frame
loadESP.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
loadESP.BackgroundTransparency = 0
loadESP.Position = UDim2.new(0.75, -61, 0.12, 10)
loadESP.Size = UDim2.new(0, 122, 0, 20)
loadESP.Font = Enum.Font.SourceSans
loadESP.Text = "Load Unnamed ESP (Requires SynapseX)"
loadESP.TextColor3 = Color3.fromRGB(110, 65, 200)
loadESP.TextScaled = true
loadESP.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RRR06/rlua/master/DoomedSpire/Unnamed_ESP.lua", true))()
end)
