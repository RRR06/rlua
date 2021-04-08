local IfPrint = true
local IfDebug = false and IfPrint

--local GuiH = Instance.new("ScreenGui")
--local TopBar = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local Owner = Instance.new("TextLabel")
local Txt = Instance.new("TextLabel")
--
local DestroyGui = Instance.new("TextButton")
local DestroyAll = Instance.new("TextButton")
--local ManHide = Instance.new("TextButton")

local UiColor = {
	SuperDark = Color3.fromRGB(27, 27, 28),
	Dark = Color3.fromRGB(32, 32, 33),
	LightDark = Color3.fromRGB(27, 42, 53)
}
--local HideCode = Enum.KeyCode.Home

if IfDebug then
	print("Loaded config settings")
end
if IfPrint then
	print("Loading RRR06's UiApi Template!")
end

local uiApi = getgenv().uiApi

local GuiH = createNewUI("Gui_Hack", false, Enum.KeyCode.Home, false)
local TopBar = createNewComp("Frame", GuiH, {
	Draggable = true, Active = true, BackgroundColor3 = UiColor["SuperDark"], BackgroundTransparency = 0, Position = UDim2.new(0.297752798, 0, 0.28443113, 0), Size = UDim2.new(0, 400, 0, 20), ZIndex = 2
})
createNewClickableComp("TextButton", TopBar, function()
		GuiH.Enabled = not GuiH.Enabled 
	end, {
	BackgroundColor3 = UiColor["LightDark"], BackgroundTransparency = 1, Position = UDim2.new(0.96, -12, 0, 0), Size = UDim2.new(0, 24, 0, 20), Font = Enum.Font.SourceSans, Text = "Hide", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, ZIndex = 2
})

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
   uiApi["Gui_Hack"]:Destroy()
   uiApi["Gui_Hack"] = nil
end)
if IfDebug then
	print("Loaded DestroyGui")
end

if IfPrint then
	print("Fully loaded program")
end
