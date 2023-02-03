local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Player = game.Players.LocalPlayer
local Window = OrionLib:MakeWindow({Name = "Key System | Vers Hub", HidePremium = false, SaveConfig = true, IntroText = "Key System"})

OrionLib:MakeNotification({
	Name = "Logged in!",
	Content = "You are logged in as "..Player.Name..".",
	Image = "rbxassetid://4483345998",
	Time = 5
})

_G.key = "verko"
_G.keyInput = "string"

function MakeScriptHub()
    if game.PlaceId == 8750997647 then
        local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
        local Window = OrionLib:MakeWindow({Name = "Vers Hub | [FOOD WORLD] ⚡Clicker Simulator", HidePremium = true, IntroText = "Vers Hub", SaveConfig = true, ConfigFolder = "TutorialConfig"})
        
        -- Values
        _G.autoTap = true
        _G.autoRebirth = true
        _G.autoHatch = true
        _G.selectEgg = "Basic Egg"
        _G.autoEquip = true
        -- Functions
        
        function autoTap()
            while _G.autoTap == true do
                game:GetService("ReplicatedStorage").Remotes.Tap:FireServer()
                wait(.00000000000000000000000000000000000000000000000000000000000001)
            end
        end
        
        function autoRebirth()
            while _G.autoRebirth == true do
                game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer(1)
                wait(.00000000000000000000000000000000000000000000000000000000000001)
            end
        end
        
        function autoHatch()
            while _G.autoHatch == true do
                game:GetService("ReplicatedStorage").Remotes.BuyEgg:InvokeServer(_G.selectEgg, 1)
                wait(.00000000000000000000000000000000000000000000000000000000000001)
            end
        end
        
        function equipBest()
            game:GetService("ReplicatedStorage").Remotes.UnequipAll:InvokeServer()
            game:GetService("ReplicatedStorage").Remotes.EquipBest:InvokeServer()
        end
        
        function autoEquipBest()
            while _G.autoEquipBest == true do
                game:GetService("ReplicatedStorage").Remotes.UnequipAll:InvokeServer()
                game:GetService("ReplicatedStorage").Remotes.EquipBest:InvokeServer()
                wait(30)
            end
        end
        
        -- Tabs
        
        local FarmTab = Window:MakeTab({
            Name = "AutoFarm",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })
        
        local EggsTab = Window:MakeTab({
            Name = "Eggs",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })
        
        local MiscTab = Window:MakeTab({
            Name = "Misc",
            Icon = "rbxassetid://4483345998",
            PremiumOnly = false
        })
        
        -- Toggles
        
        FarmTab:AddToggle({
            Name = "Auto Tap",
            Default = false,
            Callback = function(Value)
                _G.autoTap = Value
                autoTap()
            end    
        })
        
        FarmTab:AddToggle({
            Name = "Auto Rebirth",
            Default = false,
            Callback = function(Value)
                _G.autoRebirth = Value
                autoRebirth()
            end    
        })
        
        EggsTab:AddLabel("NOTICE: You Need To Be Near Egg In Order To AutoHatch")
        EggsTab:AddLabel("To WORK!")
        
        EggsTab:AddToggle({
            Name = "Auto Hatch",
            Default = false,
            Callback = function(Value)
                _G.autoHatch = Value
                autoHatch()
            end    
        })
        
        MiscTab:AddToggle({
            Name = "Auto Equip Best Pets",
            Default = false,
            Callback = function(Value)
                _G.autoEquipBest = Value
                autoEquipBest()
            end    
        })
        
        -- Buttons
        
        MiscTab:AddButton({
            Name = "Equip Best Pets",
            Callback = function()
                  equipBest()
              end    
        })
        
        
        -- Dropdowns
        
        EggsTab:AddDropdown({
            Name = "Select Egg",
            Default = "Basic Egg",
            Options = {"Basic Egg", "Rare Egg"},
            Callback = function(Value)
                _G.selectEgg = Value
                print(_G.selectEgg)
            end    
        })
        
        
        
        
        
        
        end
end

function CorectKeyNotification()
    OrionLib:MakeNotification({
        Name = "Correct Key",
        Content = "You have entered correct key ",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

function IncorectKeyNotification()
    OrionLib:MakeNotification({
        Name = "Incorrect Key",
        Content = "You have entered incorrect key ",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

local Tab = Window:MakeTab({
	Name = "Key",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Enter Key",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		_G.keyInput = Value
	end	  
})

Tab:AddButton({
	Name = "Check Key!",
	Callback = function()
      		if _G.keyInput == _G.key then
        MakeScriptHub()
        CorectKeyNotification()
            else
                IncorectKeyNotification()
        end
  	end    
})
