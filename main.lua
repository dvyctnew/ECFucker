--loadstring(game:HttpGet("https://raw.githubusercontent.com/dvyctnew/ECFucker/refs/heads/main/main.lua"))()
_G.kms = true
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
    Size = UDim2.fromOffset(580, 460),
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
        Description = "Must have Longsword.",
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
