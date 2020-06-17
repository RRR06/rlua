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
local Redraw = Instance.new("TextButton")
local DestroyFlags = Instance.new("TextButton")
local InputField = Instance.new("TextBox")
local SearchBtn = Instance.new("TextButton")

--RRR06's native UI version 2.2

if IfPrint then
	print("Loading RRR06's native UI version 2.1")
	print("Customize module: Natio")
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
TopBar.BackgroundColor3 = Color3.fromRGB(27, 27, 28)
TopBar.BackgroundTransparency = 0
TopBar.Position = UDim2.new(0.297752798, 0, 0.28443113, 0)
TopBar.Size = UDim2.new(0, 400, 0, 20)
TopBar.ZIndex = 2
if IfDebug then
	print("Loaded TopBar")
end

ManHide.Name = "Hide"
ManHide.Parent = TopBar
ManHide.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
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
if IfDebug then
	print("Loaded ManHide")
end

MainFrame.Parent = TopBar
MainFrame.Active = true
MainFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 33)
MainFrame.BackgroundTransparency = 0
MainFrame.Position = UDim2.new(0, 0, 0, 0)
MainFrame.Size = UDim2.new(0, 400, 0, 250)
if IfDebug then
	print("Loaded MainFrame")
end

Owner.Name = "OwnerProg"
Owner.Parent = MainFrame
Owner.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
Owner.BackgroundTransparency = 1
Owner.Position = UDim2.new(0.2, -61, 0.02, 17)
Owner.Size = UDim2.new(0, 122, 0, 34)
Owner.Font = Enum.Font.SourceSans
Owner.Text = "Made by RRR06, stolen from some1 on discord e-e"
Owner.TextColor3 = Color3.fromRGB(255, 255, 255)
Owner.TextScaled = true
if IfDebug then
	print("Loaded Owner")
end

Txt.Name = "Info"
Txt.Parent = MainFrame
Txt.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
Txt.BackgroundTransparency = 1
Txt.Position = UDim2.new(0, 0, 0.8, 15)
Txt.Size = UDim2.new(1, 0, 0, 34)
Txt.Font = Enum.Font.SourceSans
Txt.Text = "A program which shows each user's nations, use the insert key to show/hide, input a username in the middle, and it'll print the user's country name. Only works on Synapse. Enjoy!"
Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
Txt.TextScaled = true
if IfDebug then
	print("Loaded Txt")
end

DestroyGui.Name = "DestroyGui"
DestroyGui.Parent = MainFrame
DestroyGui.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
DestroyGui.BackgroundTransparency = 0
DestroyGui.Position = UDim2.new(0.8, -61, 0.75, 8.5)
DestroyGui.Size = UDim2.new(0, 122, 0, 17)
DestroyGui.Font = Enum.Font.SourceSans
DestroyGui.Text = "Destroy this Gui"
DestroyGui.TextColor3 = Color3.fromRGB(196, 40, 28)
DestroyGui.TextScaled = true
DestroyGui.MouseButton1Click:Connect(function()
	destroyAllFlags(true)
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
DestroyAll.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
DestroyAll.BackgroundTransparency = 0
DestroyAll.Position = UDim2.new(0.2, -61, 0.75, 8.5)
DestroyAll.Size = UDim2.new(0, 122, 0, 17)
DestroyAll.Font = Enum.Font.SourceSans
DestroyAll.Text = "Destroy all Guis"
DestroyAll.TextColor3 = Color3.fromRGB(196, 40, 28)
DestroyAll.TextScaled = true
DestroyAll.MouseButton1Click:Connect(function()
	destroyAllFlags(true)
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

Redraw.Name = "Redraw"
Redraw.Parent = MainFrame
Redraw.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
Redraw.BackgroundTransparency = 0
Redraw.Position = UDim2.new(0.45, -122, 0.45, -6.5)
Redraw.Size = UDim2.new(0, 122, 0, 17)
Redraw.Font = Enum.Font.SourceSans
Redraw.Text = "Redraw flags"
Redraw.TextColor3 = Color3.fromRGB(255, 255, 255)
Redraw.TextScaled = true
Redraw.MouseButton1Click:Connect(function()
	destroyAllFlags()
	wait(1)
	for i,v in next, Players:GetPlayers() do
		if v~=Players.LocalPlayer then
			createFlagPlayer(v)
		end
		getCountryName(v)
	end
end)

DestroyFlags.Name = "DestroyFlags"
DestroyFlags.Parent = MainFrame
DestroyFlags.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
DestroyFlags.BackgroundTransparency = 0
DestroyFlags.Position = UDim2.new(0.55, 0, 0.45, -6.5)
DestroyFlags.Size = UDim2.new(0, 122, 0, 17)
DestroyFlags.Font = Enum.Font.SourceSans
DestroyFlags.Text = "Destroy the flags"
DestroyFlags.TextColor3 = Color3.fromRGB(255, 255, 255)
DestroyFlags.TextScaled = true
DestroyFlags.MouseButton1Click:Connect(function()
	destroyAllFlags(true)
end)

InputField.Name = "InputField"
InputField.Parent = MainFrame
InputField.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InputField.BackgroundTransparency = 0
InputField.Position = UDim2.new(0.50, -170, 0.55, 8.5)
InputField.Size = UDim2.new(0, 300, 0, 17)
InputField.Font = Enum.Font.SourceSans
InputField.Text = "Input a username here"
InputField.TextColor3 = Color3.fromRGB(0, 0, 0)
InputField.TextScaled = true
if IfDebug then
	print("Loaded InputField")
end

SearchBtn.Name = "Search"
SearchBtn.Parent = MainFrame
SearchBtn.BackgroundColor3 = Color3.fromRGB(27, 42, 53)
SearchBtn.BackgroundTransparency = 0
SearchBtn.Position = UDim2.new(0.80, 0, 0.55, 8.5)
SearchBtn.Size = UDim2.new(0, 30, 0, 17)
SearchBtn.Font = Enum.Font.SourceSans
SearchBtn.Text = "Search"
SearchBtn.TextColor3 = Color3.fromRGB(75, 151, 75)
SearchBtn.TextScaled = true
SearchBtn.MouseButton1Click:Connect(function()
	for i,v in next, game:GetService("Players"):GetPlayers() do --btw am using the full getService instead of the players variable cus it was causing issues
		if v.Name == InputField.Text then
			getCountryName(v)
		end
	end
end)
if IfDebug then
	print("Loaded SearchBtn")
end

game:GetService("UserInputService").InputBegan:Connect(function(input, ignore)
	if input.KeyCode == Enum.KeyCode.Insert then
		GuiH.Enabled = not GuiH.Enabled
    end
end)
if IfDebug then
	print("Loaded TogglerSys")
end

--The script I stole hehe
local Players = game:GetService("Players")
local client = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local get_hidden_prop = get_hidden_prop or gethiddenproperty
local continueDo = true

local countryTbl = {}

if IfPrint then
	print("Now loading system")
end

function createImageFromRegion(regcode)
    local img = Drawing.new("Image")
    img.Data = game:HttpGet("https://www.countryflags.io/"..regcode.."/shiny/64.png")
    img.Visible = true
    img.Transparency = 1
    img.Size = Vector2.new(32,32)
    return img
end
if IfDebug then
	print("Declared function createImageFromRegion")
end

function getCountryName(plr)
	if Players[plr.Name].LocaleId:match("fr") and get_hidden_prop(plr, "CountryRegionCodeReplicate") == "CA" then
		print(" ")
		print("User " .. plr.Name .. " is from Quebec")
	else
		local nation = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://restcountries.eu/rest/v2/alpha/" .. get_hidden_prop(plr, "CountryRegionCodeReplicate")))
		if not nation.name then return end
		print(" ")
		print("User " .. plr.Name .. " is from " .. nation.name)
	end
end
if IfDebug then
	print("Declared function getCountryName")
end

function createFlagPlayer(plr)
    local test = createImageFromRegion(get_hidden_prop(plr, "CountryRegionCodeReplicate"))
    countryTbl[plr.Name] = test
    retardCheck(plr)
end
if IfDebug then
	print("Declared function createFlagPlayer")
end

function destroyFlagPlayer(plr)
    countryTbl[plr.Name]:Remove()
    countryTbl[plr.Name] = nil
end
if IfDebug then
	print("Declared function destroyFlagPlayer")
end

function destroyAllFlags(statement)
	for i,v in next, Players:GetPlayers() do
		if v~=client then
			destroyFlagPlayer(v)
		end
	end
	if statement ~= true then return end
	continueDo = false
end
if IfDebug then
	print("Declared function destroyAllFlags")
end

function retardCheck(plr)
    if Players[plr.Name].LocaleId:match("fr") and get_hidden_prop(plr, "CountryRegionCodeReplicate") == "CA" then
        countryTbl[plr.Name].Data = game:HttpGet("http://icons.iconarchive.com/icons/wikipedia/flags/64/CA-QC-Quebec-Flag-icon.png")
    end
end
if IfDebug then
	print("Declared function retardCheck")
end

for i,v in next, Players:GetPlayers() do
    if v~=client then
        createFlagPlayer(v)
    end
	getCountryName(v)
end
if IfPrint then
	print("Creating player flags")
end


Players.PlayerRemoving:Connect(function(player)
	if continueDo == false then return end
	destroyFlagPlayer(player)
end)
Players.PlayerAdded:Connect(function(player)
	if continueDo == false then return end
    player.CharacterAdded:Connect(function(character) 
		repeat wait() until character:FindFirstChild("Head")
		createFlagPlayer(player)
    end)
end)

--render

game:GetService("RunService").RenderStepped:Connect(function()
	if continueDo == false then return end
    for plr, image in next, countryTbl do
        local Pos,Person = Camera:WorldToViewportPoint(Players[plr].Character.Head.Position)
        image.Visible = Person
        image.Size = Vector2.new(32,32)
        image.Transparency = 1 - math.clamp(Pos.Z / 90, 0, 1)
        image.Position = Vector2.new(Pos.X, Pos.Y)
    end
end)

if IfPrint then
	print("Drawing player flags and program is complete")
end
