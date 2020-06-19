local IfPrint = true
local IfDebug = false and IfPrint

local GuiH = Instance.new("ScreenGui")
local TopBar = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local Owner = Instance.new("TextLabel")
local Txt = Instance.new("TextLabel")
--
local DestroyGui = Instance.new("TextButton")
local DestroyAll = Instance.new("TextButton")
local ManHide = Instance.new("TextButton")
--

--
local UiColor = {
	SuperDark = Color3.fromRGB(27, 27, 28),
	Dark = Color3.fromRGB(32, 32, 33),
	LightDark = Color3.fromRGB(27, 42, 53)
}
local HideCode = Enum.KeyCode.Insert
if IfDebug then
	print("Loaded config settings")
end

--RRR06's native UI version 2.2

if IfPrint then
	print("Loading RRR06's native UI version 2.1")
	print("Customize module: Template")
end

GuiH.Name = "Gui_Hack"
GuiH.Parent = game:GetService('CoreGui')
GuiH.ResetOnSpawn = false
if IfDebug then
	print("Loaded GuiH")
end

TopBar.Parent = GuiH
TopBar.Draggable = true
TopBar.Active = true
TopBar.BackgroundColor3 = UiColor["SuperDark"]
TopBar.BackgroundTransparency = 0
TopBar.Position = UDim2.new(0.297752798, 0, 0.28443113, 0)
TopBar.Size = UDim2.new(0, 400, 0, 20)
TopBar.ZIndex = 2
if IfDebug then
	print("Loaded TopBar")
end

ManHide.Name = "Hide"
ManHide.Parent = TopBar
ManHide.BackgroundColor3 = UiColor["LightDark"]
ManHide.BackgroundTransparency = 1
ManHide.Position = UDim2.new(0.96, -12, 0, 0)
ManHide.Size = UDim2.new(0, 24, 0, 20)
ManHide.Font = Enum.Font.SourceSans
ManHide.Text = "Hide"
ManHide.TextColor3 = Color3.fromRGB(255, 255, 255)
ManHide.TextScaled = true
ManHide.ZIndex = 2
ManHide.MouseButton1Click:Connect(function()
   GuiH.Enabled = not GuiH.Enabled
end)

MainFrame.Parent = TopBar
MainFrame.Active = true
MainFrame.BackgroundColor3 = UiColor["Dark"]
MainFrame.BackgroundTransparency = 0
MainFrame.Position = UDim2.new(0, 0, 0, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 250)
if IfDebug then
	print("Loaded MainFrame")
end

Owner.Name = "OwnerProg"
Owner.Parent = MainFrame
Owner.BackgroundColor3 = UiColor["LightDark"]
Owner.BackgroundTransparency = 1
Owner.Position = UDim2.new(0.2, -61, 0.02, 17)
Owner.Size = UDim2.new(0, 122, 0, 34)
Owner.Font = Enum.Font.SourceSans
Owner.Text = "Made by RRR06"
Owner.TextColor3 = Color3.fromRGB(255, 255, 255)
Owner.TextScaled = true
if IfDebug then
	print("Loaded Owner")
end

Txt.Name = "Info"
Txt.Parent = MainFrame
Txt.BackgroundColor3 = UiColor["LightDark"]
Txt.BackgroundTransparency = 1
Txt.Position = UDim2.new(0, 0, 0.8, 15)
Txt.Size = UDim2.new(1, 0, 0, 34)
Txt.Font = Enum.Font.SourceSans
Txt.Text = "A simple test"
Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
Txt.TextScaled = true
if IfDebug then
	print("Loaded Txt")
end

DestroyGui.Name = "DestroyGui"
DestroyGui.Parent = MainFrame
DestroyGui.BackgroundColor3 = UiColor["LightDark"]
DestroyGui.BackgroundTransparency = 0
DestroyGui.Position = UDim2.new(0.8, -61, 0.75, 8.5)
DestroyGui.Size = UDim2.new(0, 122, 0, 17)
DestroyGui.Font = Enum.Font.SourceSans
DestroyGui.Text = "Destroy this Gui"
DestroyGui.TextColor3 = Color3.fromRGB(196, 40, 28)
DestroyGui.TextScaled = true
DestroyGui.MouseButton1Click:Connect(function()
   GuiH:Destroy()
end)
if IfDebug then
	print("Loaded DestroyGui")
	if IfPrint then
		print("Destroyed 1 GuiH")
	end
end

DestroyAll.Name = "DestroyAllGuis"
DestroyAll.Parent = MainFrame
DestroyAll.BackgroundColor3 = UiColor["LightDark"]
DestroyAll.BackgroundTransparency = 0
DestroyAll.Position = UDim2.new(0.2, -61, 0.75, 8.5)
DestroyAll.Size = UDim2.new(0, 122, 0, 17)
DestroyAll.Font = Enum.Font.SourceSans
DestroyAll.Text = "Destroy all Guis"
DestroyAll.TextColor3 = Color3.fromRGB(196, 40, 28)
DestroyAll.TextScaled = true
DestroyAll.MouseButton1Click:Connect(function()
	while game:GetService('CoreGui'):FindFirstChild("Gui_Hack") do
		game:GetService('CoreGui'):FindFirstChild("Gui_Hack"):Destroy()
	end
	if IfPrint then
		print("Destroyed all GuiH")
	end
end)
if IfDebug then
	print("Loaded DestroyAll")
end

game:GetService("UserInputService").InputBegan:Connect(function(input, ignore)
	if input.KeyCode == HideCode then
		GuiH.Enabled = not GuiH.Enabled
    end
end)
if IfDebug then
	print("Loaded TogglerSys")
end

if IfPrint then
	print("Fully loaded program")
end
