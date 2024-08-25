local CloudHub_Lib = loadstring(game:HttpGet("https://cloudhub-library.surge.sh"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Cloud-Hub/main/Settings.lua"))()

local Window = CloudHub_Lib:MakeWindow({
  Title = "Cloud Hub",
  SubTitle = "Made by TWR Team",
  LoadText = "Cloud Hub",
  Flags = "Cloud Hub | Meme Sea.lua"
})

Window:AddMinimizeButton({ 
  Button = {Image = "rbxassetid://18636055150"},
  UICorner = {true, CornerRadius = UDim.new(0.5, 0)},
  UIStroke = {false,{}}
})

local CloudHub_env = {}

local Home = Window:MakeTab({Name = "Home", Icon = "scan-face"}) do
  Home:AddDiscordInvite({
    DiscordTitle = "Cloud Hub | Community",
    DiscordIcon = "rbxassetid://18863514314",
    DiscordLink = Discord
  })
end

local Funcs = {} do
  function Funcs:Toggle(Tab, Name, Default)
    return Tab:AddToggle({
      Name = Name,
      Default = Default,
      Callback = function(Value)
        CloudHub_env[Name] = Value
      end, Flag = "CloudHub/Toggle" .. (type(Name) == "string" and Name or tostring(Name))
    })
  end

  function Funcs:Button(Tab, Name, Funcs)
    return Tab:AddButton({
      Name = Name,
      Callback = Funcs
    })
  end

  function Funcs:Slider(Tab, Name, MinValue, MaxValue, Default, Increase)
    return Tab:AddSlider({
      Name = Name,
      MinValue = MinValue, 
      MaxValue = MaxValue,
      Default = Default,
      Increase = Increase,
      Callback = function(Value)
        CloudHub_env[Name] = Value
      end, Flag = "CloudHub/Slider" .. (type(Name) == "string" and Name or tostring(Name))
    })
  end

  function Funcs:Dropdown(Tab, Name, Options, Default, MultSelect)
    return Tab:AddDropdown({
      Name = Name,
      Options = Options,
      Default = Default,
      MultSelect = MultSelect,
      Callback = function(Value)
        CloudHub_env[Name] = Value
      end, Flag = "CloudHub/Dropdown" .. (type(Name) == "string" and Name or tostring(Name))
    })
  end
end

local _main = Window:MakeTab({Name = "Main", Icon = "Home"}) do
  _main:AddSection({"Config"})
  Funcs:Dropdown(_main, "Weapon Tool", {"Fight", "Power", "Weapon"}, "Fight", false)
  Funcs:Dropdown(_main, "Teleport Mode", {"Tween", "Instant"}, "Instant", false)
  _main:AddSection({"Farming"})
  Funcs:Toggle(_main, "Auto Farm Level", false) 
  Funcs:Toggle(_main, "Auto Farm Nearest", false)
end

return CloudHub_env
