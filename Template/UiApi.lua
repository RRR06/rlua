local IfPrint = true
local IfDebug = false and IfPrint

if IfPrint then
	print("Loading RRR06's native UI version 3.0.0")
end

getgenv().uiApi = setmetatable({}, {
	__index = function(_, ind)
		if IfDebug then
			print("Tried indexing", ind)
		end
		return nil
	end
})

local uiApi = getgenv().uiApi

getgenv().createNewUI = function(Name, ResetOnSpawn, HideKeyCode, Force)
	if uiApi[Name] and not Force then
		error(string.format("UI %s already exists in uiApi!", Name))
		return
	elseif uiApi[Name] and IfDebug then
		print(string.format("UI %s already exists in uiApi!", Name))
	end
	if ResetOnSpawn == nil then ResetOnSpawn = false end
	local NewUI = Instance.new("ScreenGui")
	NewUI.Name = Name
	NewUI.Parent = game:GetService("CoreGui")
	NewUI.ResetOnSpawn = ResetOnSpawn
	if HideKeyCode then
		game:GetService("UserInputService").InputBegan:Connect(function(input, GPE)
			if input.KeyCode == HideKeyCode and not GPE then
				NewUI.Enabled = not NewUI.Enabled
			end
		end)
	end
	if IfDebug then
		print("Created NewUI window", Name)
	end
	uiApi[Name] = NewUI
	return uiApi[Name]
end

getgenv().createNewComp = function(Type, Parent, Options)
	local NewElement
	if typeof(Type) == "string" then
		NewElement = Instance.new(Type)
	elseif typeof(Type) == "Instance" then
		NewElement = Type
	end
	print(NewElement, typeof(Type))
	NewElement.Parent = Parent
	for i, v in pairs(Options) do
		NewElement[i] = v
	end
	if IfDebug then
		print("Created New Component")
	end
	return NewElement
end

getgenv().createNewClickableComp = function(Type, Parent, Function, Options)
	local NewClickableElement = createNewComp(Type, Parent, Options)
	NewClickableElement.MouseButton1Click:Connect(Function)
	return NewClickableElement
end

if IfPrint then
	print("Fully loaded program")
end
