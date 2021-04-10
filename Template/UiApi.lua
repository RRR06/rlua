local IfPrint = true
local IfDebug = false and IfPrint
local Protect = true

if IfPrint then
	print("Loading RRR06's UiApi version 3.1.0")
end

local function injectSelf()
	if getgenv().uiApi and IfDebug then
		warn("RRR06's UiApi has already been loaded before!")
		return false
	elseif getgenv().uiApi then
		error("RRR06's UiApi already loaded!")
		return false
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
		elseif uiApi[Name] and IfDebug and Force then
			print(string.format("UI %s is being overwritten...", Name))
		elseif uiApi[Name] and IfDebug then
			warn(string.format("UI %s already exists in uiApi!", Name))
		end
		if uiApi[Name] and Force then uiApi[Name]:Destroy() end
		if ResetOnSpawn == nil then ResetOnSpawn = false end
		local NewUI = Instance.new("ScreenGui")
		if Protect then syn.protect_gui(NewUI) end
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
		NewElement.Parent = Parent
		for i, v in pairs(Options) do
			NewElement[i] = v
		end
		if IfDebug then
			print("Created New Component with type", Type)
		end
		return NewElement
	end

	getgenv().createNewClickableComp = function(Type, Parent, Function, Options)
		local NewClickableElement = createNewComp(Type, Parent, Options)
		NewClickableElement.MouseButton1Click:Connect(function()
			Function(NewClickableElement)
		end)
		return NewClickableElement
	end
	
	return true
end

if IfPrint and injectSelf() then
	print("Fully loaded program")
end
