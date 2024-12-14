--loadstring(game:HttpGet("https://raw.githubusercontent.com/dvyctnew/ECFucker/refs/heads/main/main.lua"))()
_G.kms = true
_G.SoundRapeDelay = 0.05
local jork = game.ReplicatedStorage.Weapons.Goedenag
function  Damage(Player)
    local args = {
        [1] = "fffffffff",
        [2] = "\161\202\22@P9\3D\249\128p\193{\20\198\192\184\30\5>\225z$\193\0\0HB\155\173\248A\0\0\0\0",
        [3] = Player.Character.Humanoid,
        [4] = 0
    }
    
    game:GetService("ReplicatedStorage").ReplicatedEvents.ProjectileDamage:FireServer(unpack(args))
end

function cycle()
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if (_G.kms or player ~= game:GetService("Players").LocalPlayer) and not player.Character:FindFirstChildOfClass("ForceField") then
                Damage(player)
        end
    end
end

function equipls()
    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Longsword")
    if tool then
        tool.Parent = game.Players.LocalPlayer.Character
    else 
        print("no longsword found")
    end  
end

function equipjork()
    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Jerk Off")
    if tool then
        
        tool.Parent = game.Players.LocalPlayer.Character       
    else 
        local jorky = jork:Clone()
        jorky.Parent = game.Players.LocalPlayer.Character
        jorky.Name = "Jerk Off"
    end  
end

function unequipjork()
    local tool = game.Players.LocalPlayer.Character:FindFirstChild("Jerk Off")
    if tool then
        tool.Parent = game.Players.LocalPlayer.Backpack
    else 
        local jorky = jork:Clone()
        jorky.Parent = game.Players.LocalPlayer.Character
        jorky.Name = "Jerk Off"
    end  
end

function repeatAc(times)
    for i = 1, times do
        cycle()
        task.wait(0.01)
    end
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "ECFucker" .. " beta",
    SubTitle = "by dvyct",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 500),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Tabs.Main:AddButton({
        Title = "Kill All",
        Description = "No Requirements",
        Callback = function()
            Window:Dialog({
                Title = "Are you sure?",
                Content = "Are you sure you want to kill all, KILLS SHOW UP IN LEADERBOARD.",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            repeatAc(3)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

    local Toggle = Tabs.Main:AddToggle("kms", {Title = "Dies with Kill All.", Default = true })

    Toggle:OnChanged(function()
      _G.kms= Options.kms.Value 
    end)

    Options.kms:SetValue(true) 
    local Toggle = Tabs.Main:AddToggle("SoundLoop", {Title = "SoundRape 1", Default = false })

    Toggle:OnChanged(function()
    if Options.SoundLoop.Value == true then
        equipls()
    end
        while Options.SoundLoop.Value == true do
            local args = {
                [1] = 0
            }
            game:GetService("Players").LocalPlayer.Character.Longsword.Events.PlayVocal:FireServer(unpack(args)) 
            wait(_G.SoundRapeDelay)
        end
        end)

    Options.SoundLoop:SetValue(false)
--[[
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character.Longsword.Sabre.Blade.Lunge
}

game:GetService("Players").LocalPlayer.Character.Longsword.Events.PlaySound:FireServer(unpack(args))
]]

local Toggle = Tabs.Main:AddToggle("SoundLoop2", {Title = "SoundRape 2", Default = false })

Toggle:OnChanged(function()
if Options.SoundLoop2.Value == true then
    equipls()
end
    while Options.SoundLoop2.Value == true do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character.Longsword.Sabre.Blade.Lunge
        }
        
        game:GetService("Players").LocalPlayer.Character.Longsword.Events.PlaySound:FireServer(unpack(args))
        
        wait(_G.SoundRapeDelay)
    end
    end)

Options.SoundLoop2:SetValue(false)

local Toggle = Tabs.Main:AddToggle("Jorking", {Title = "FE JerkOff", Default = false })

Toggle:OnChanged(function()
    while Options.Jorking.Value == true do
        equipjork()
        wait(0.01)
        unequipjork()
        
        wait(0.01)
    end
if Options.Jorking.Value == false then
    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Jerk Off")
    if tool then
        tool:Destroy()
    end
    

end
    end)

Options.Jorking:SetValue(false)





Tabs.Main:AddButton({
    Title = "Load DMOBV2",
    Description = "Loads Deletemob V2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Mick-gordon/Hyper-Escape/main/DeleteMobV2.lua", true))()
    end
})

Tabs.Main:AddButton({
    Title = "Removes Bullet Drop for Bow",
    Description = "MUST HAVE OUT OR IT WILL BREAK",
    Callback = function()
        game.Players.LocalPlayer.Character:FindFirstChild("Bow").Settings.Miscellaneous.BulletDropPerFrame.Value = 0
    end
})

local Slider = Tabs.Main:AddSlider("BulletSpeed", {
    Title = "Bullet Speed",
    Description = "Default is 12",
    Default = 12,
    Min = 0,
    Max = 100,
    Rounding = 1,
    Callback = function(Value)
        game.Players.LocalPlayer.Character:FindFirstChild("Bow").Settings.Miscellaneous.BulletSpeedPerFrame.Value = Value
    end
})

end

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
