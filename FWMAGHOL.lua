local Player = game.Players.LocalPlayer
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/xyzzr/libarys/main/xyzskibidi.lua"))()
local win = lib:Window("XYZ - v1.3B")
local main = win:Tab("Main")
local player = win:Tab("Player")
local weapons = win:Tab("Weapons")
local nuking = win:Tab("Nuking")
local visuals = win:Tab("Visuals")
local misc = win:Tab("Misc")

print("Made by team XYZ: Xyzzr and IsAppropriateFalse")
misc:Label("All credits goes to team XYZ.")
local wargs = {
    ["Fists"] = 0,
    ["Mace"] = 1,
    ["Katana"] = 2,
    ["Spear"] = 3,
    ["Axe"] = 4,
    ["Maul"] = 5,
    ["Macuahuitl"] = 28,
    ["Great sword"] = 6,
    ["Chainsaw"] = 7,
    ["Brute mace"] = 8,
    ["Rapier"] = 9,
    ["Cutlass"] = 10,
    ["Great axe"] = 11,
    ["Bow"] = 27,
    ["Crossbow"] = 12,
    ["Scissor"] = 13,
    ["Flail"] = 14,
    ["Kanabo"] = 16,
    ["Halberd"] = 15,
    ["Scythe"] = 17,
    ["Trident"] = 18,
    ["Dagger"] = 19,
    ["Gladius"] = 21,
    ["Warhammer"] = 22,
    ["Pickaxe"] = 23,
    ["Spiked club"] = 24,
    ["Tekko kagi"] = 25,
    ["Naginata"] = 26,
    ["ZweihÃ¤nder"] = 29,
    ["Khopesh"] = 30,
    ["Hatchets"] = 31,
    ["Flamberge"] = 32,
    ["Shovel"] = 33,
    ["Bardiche"] = 34,
    ["Bo staff"] = 35,
    ["Caestus"] = 36,
    ["Dual hammers"] = 37,
    ["Hook swords"] = 38,
    ["Saber"] = 39,
    ["Lucerne"] = 41,
    ["Guandao"] = 42,
    ["Makhaira"] = 43,
    ["Warpick"] = 44,
    ["Kamas"] = 45,
    ["Nunchuks"] = 46,
    ["Sai"] = 47,
}

local dargs = {
    ["C4"] = "0:55:55:55",
    ["Grenade"] = "55:0:55:55",
    ["Fire bomb"] = "55:55:0:55",
    ["Bear trap"] = "55:55:55:0",
    ["Caltrops"] = "55:55:55:1",
    ["Poison flask"] = "55:55:1:55",
    ["Water flask"] = "55:55:2:55",
}

local nukeamount
local projectile

nuking:Dropdown("Projectile", {"C4", "Grenade", "Fire bomb", "Bear trap", "Caltrops", "Poison flask", "Water flask"}, function(t)
    projectile = t
end)

nuking:Slider("Amount", 16, 500, 40, function(v)
    nukeamount = v
end)

nuking:Button("Start", function()
    local vmanager = game:GetService("VirtualInputManager")
    local inputservice = game:GetService("UserInputService")
    local char = Player.Character
    local backpack = Player.Backpack

    local tool = Instance.new("Tool", backpack)
    tool.Name = "Wait..."
    tool.RequiresHandle = false
    delay(4, function()
        tool.Name = "Nuke"
        tool.Activated:Connect(function()
            for _, v in pairs(backpack:GetChildren()) do
                if v:IsA("Tool") and (v.Name == "C4" or v.Name == "Bear trap" or v.Name == "Caltrops") then
                    v.Parent = char
                    v:Activate()
                    wait(0.01)
                elseif v:IsA("Tool") and (v.Name == "Grenade" or v.Name == "Fire bomb" or v.Name == "Poison flask" or v.Name == "Water flask") then
                    v.Parent = char
                    local mousepos = inputservice:GetMouseLocation()
                   vmanager:SendMouseButtonEvent(mousepos.X, mousepos.Y, 0, true, game, 0)
                    delay(0.1, function()
                        vmanager:SendMouseButtonEvent(mousepos.X, mousepos.Y, 0, false, game, 0)
                    end)
                    wait(0.01)
                end
            end
        end)
    end)

    if not backpack:FindFirstChild(projectile) then
        for i = 1, nukeamount do
            local args = {
                [1] = 0,
                [2] = dargs[projectile]
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Item"):FireServer(unpack(args))
        end
    end
end)

nuking:Button("Freeze (Only grenade, fire bomb, poison flask, water flask)", function()
    local vmanager = game:GetService("VirtualInputManager")
    local char = Player.Character
    local backpack = Player.Backpack

    local tool = Instance.new("Tool", backpack)
    tool.Name = "Wait..."
    tool.RequiresHandle = false
    delay(4, function()
        tool.Name = "Freeze"
        tool.Activated:Connect(function()
            for _, v in pairs(backpack:GetChildren()) do
                if v:IsA("Tool") and (v.Name == "Grenade" or v.Name == "Fire bomb" or v.Name == "Poison flask" or v.Name == "Water flask") then
                    v.Parent = char
                    for i = 1, 50 do
                        v.start:FireServer()
                    end
                    if v.Name == "Grenade" or v.Name == "Fire bomb" then
                        delay(3, function()
                        for j = 1, 50 do
                            local args = {
                                [1] = game.Players.LocalPlayer.Character.Torso.Position - Vector3.new(math.random(1, 50), math.random(1, 50), math.random(1, 50)),
                                [2] = 1686851243.277296,
                                [3] = game.Players.LocalPlayer.Character.Head.Position - Vector3.new(math.random(1, 50), math.random(1, 50), math.random(1, 50))
                            }
                            v.throw:FireServer(unpack(args))
                        end
                    end)
                    elseif v.Name == "Water flask" then
                        delay(1, function()
                        for j = 1, 50 do
                            local args = {
                                [1] = game.Players.LocalPlayer.Character.Torso.Position - Vector3.new(math.random(1, 50), math.random(1, 50), math.random(1, 50)),
                                [2] = 1686851243.277296,
                                [3] = game.Players.LocalPlayer.Character.Head.Position - Vector3.new(math.random(1, 50), math.random(1, 50), math.random(1, 50))
                            }
                            v.throw:FireServer(unpack(args))
                        end
                    end)
                     elseif v.Name == "Poison flask" then
                        delay(2, function()
                        for j = 1, 50 do
                            local args = {
                                [1] = game.Players.LocalPlayer.Character.Torso.Position - Vector3.new(math.random(1, 50), math.random(1, 50), math.random(1, 50)),
                                [2] = 1686851243.277296,
                                [3] = game.Players.LocalPlayer.Character.Head.Position - Vector3.new(math.random(1, 50), math.random(1, 50), math.random(1, 50))
                            }
                            v.throw:FireServer(unpack(args))
                        end
                    end)
                    end
                    wait(0.1)
                end
            end
        end)
    end)

    if not backpack:FindFirstChild(projectile) then
        for i = 1, nukeamount do
            local args = {
                [1] = 0,
                [2] = dargs[projectile]
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Item"):FireServer(unpack(args))
        end
    end
end)

_G.ScriptExecuted = false
_G.Settings = {
    Box_Color = 1,
    Box_Thickness = 1,
    Team_Check = false,
    Team_Color = false,
    Autothickness = false,
    enabled = false
}

visuals:Toggle("Toggle Esp box", function(value)
     _G.Settings.enabled = value
    if value then
            _G.Settings = {
            Box_Color = Color3.fromRGB(275, 0, 0),
            Box_Thickness = 1,
            Team_Check = false,
            Team_Color = false,
            Autothickness = false,
            enabled = false
        }
        if not _G.ScriptExecuted then
            _G.ScriptExecuted = true
 
            local Space = game:GetService("Workspace")
            local Player = game:GetService("Players").LocalPlayer
            local Camera = Space.CurrentCamera
 
            local function NewLine(color, thickness)
                local line = Drawing.new("Line")
                line.Visible = false
                line.From = Vector2.new(0, 0)
                line.To = Vector2.new(0, 0)
                line.Color = color
                line.Thickness = thickness
                line.Transparency = 1
                return line
            end
 
            local function Vis(lib, state)
                for i, v in pairs(lib) do
                    v.Visible = state
                end
            end
 
            local function Colorize(lib, color)
                for i, v in pairs(lib) do
                    v.Color = color
                end
            end
 
            local Black = Color3.fromRGB(0, 0, 0)
            local function Rainbow(lib, delay)
                for hue = 0, 1, 1/30 do
                    local color = Color3.fromHSV(hue, 0.6, 1)
                    Colorize(lib, color)
                    wait(delay)
                end
                Rainbow(lib)
            end
 
            local function Main(plr)
                repeat wait() until plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil
                local R15
                if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
                    R15 = true
                else 
                    R15 = false
                end
                local Library = {
                    TL1 = NewLine(_G.Settings.Box_Color, _G.Settings.Box_Thickness),
                    TL2 = NewLine(_G.Settings.Box_Color, _G.Settings.Box_Thickness),
                    TR1 = NewLine(_G.Settings.Box_Color, _G.Settings.Box_Thickness),
                    TR2 = NewLine(_G.Settings.Box_Color, _G.Settings.Box_Thickness),
                    BL1 = NewLine(_G.Settings.Box_Color, _G.Settings.Box_Thickness),
                    BL2 = NewLine(_G.Settings.Box_Color, _G.Settings.Box_Thickness),
                    BR1 = NewLine(_G.Settings.Box_Color, _G.Settings.Box_Thickness),
                    BR2 = NewLine(_G.Settings.Box_Color, _G.Settings.Box_Thickness)
                }
                coroutine.wrap(Rainbow)(Library, 0.15)
                local oripart = Instance.new("Part")
                oripart.Parent = Space
                oripart.Transparency = 1
                oripart.CanCollide = false
                oripart.Size = Vector3.new(1, 1, 1)
                oripart.Position = Vector3.new(0, 0, 0)
                local function Updater()
                    local c 
                    c = game:GetService("RunService").RenderStepped:Connect(function()
                        if plr.Character ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("Head") ~= nil then
                            local Hum = plr.Character
                            local HumPos, vis = Camera:WorldToViewportPoint(Hum.HumanoidRootPart.Position)
                            if vis then
                                oripart.Size = Vector3.new(Hum.HumanoidRootPart.Size.X, Hum.HumanoidRootPart.Size.Y*1.5, Hum.HumanoidRootPart.Size.Z)
                                oripart.CFrame = CFrame.new(Hum.HumanoidRootPart.CFrame.Position, Camera.CFrame.Position)
                                local SizeX = oripart.Size.X
                                local SizeY = oripart.Size.Y
                                local TL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(SizeX, SizeY, 0)).p)
                                local TR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-SizeX, SizeY, 0)).p)
                                local BL = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(SizeX, -SizeY, 0)).p)
                                local BR = Camera:WorldToViewportPoint((oripart.CFrame * CFrame.new(-SizeX, -SizeY, 0)).p)
                                if _G.Settings.Team_Check then
                                    if plr.TeamColor == Player.TeamColor then
                                        Colorize(Library, Color3.fromRGB(0, 255, 0))
                                    else 
                                        Colorize(Library, Color3.fromRGB(255, 0, 0))
                                    end
                                end
                                if _G.Settings.Team_Color then
                                    Colorize(Library, plr.TeamColor.Color)
                                end
                                local ratio = (Camera.CFrame.p - Hum.HumanoidRootPart.Position).magnitude
                                local offset = math.clamp(1/ratio*750, 2, 300)
                                Library.TL1.From = Vector2.new(TL.X, TL.Y)
                                Library.TL1.To = Vector2.new(TL.X + offset, TL.Y)
                                Library.TL2.From = Vector2.new(TL.X, TL.Y)
                                Library.TL2.To = Vector2.new(TL.X, TL.Y + offset)
                                Library.TR1.From = Vector2.new(TR.X, TR.Y)
                                Library.TR1.To = Vector2.new(TR.X - offset, TR.Y)
                                Library.TR2.From = Vector2.new(TR.X, TR.Y)
                                Library.TR2.To = Vector2.new(TR.X, TR.Y + offset)
                                Library.BL1.From = Vector2.new(BL.X, BL.Y)
                                Library.BL1.To = Vector2.new(BL.X + offset, BL.Y)
                                Library.BL2.From = Vector2.new(BL.X, BL.Y)
                                Library.BL2.To = Vector2.new(BL.X, BL.Y - offset)
                                Library.BR1.From = Vector2.new(BR.X, BR.Y)
                                Library.BR1.To = Vector2.new(BR.X - offset, BR.Y)
                                Library.BR2.From = Vector2.new(BR.X, BR.Y)
                                Library.BR2.To = Vector2.new(BR.X, BR.Y - offset)
                                Vis(Library, true)
                                if _G.Settings.Autothickness then
                                    local distance = (Player.Character.HumanoidRootPart.Position - oripart.Position).magnitude
                                    local value = math.clamp(1/distance*100, 1, 4) --0.1 is min thickness, 6 is max
                                    for u, x in pairs(Library) do
                                        x.Thickness = value
                                    end
                                else 
                                    for u, x in pairs(Library) do
                                        x.Thickness = _G.Settings.Box_Thickness
                                    end
                                end
                            else 
                                Vis(Library, false)
                            end
                        else 
                            Vis(Library, false)
                            if game:GetService("Players"):FindFirstChild(plr.Name) == nil then
                                for i, v in pairs(Library) do
                                    v:Remove()
                                    oripart:Destroy()
                                end
                                c:Disconnect()
                            end
                        end
                    end)
                end
                coroutine.wrap(Updater)()
            end
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                if v.Name ~= Player.Name then
                  coroutine.wrap(Main)(v)
                end
            end
            game:GetService("Players").PlayerAdded:Connect(function(newplr)
                coroutine.wrap(Main)(newplr)
            end)
        end
    else -- chatgpt saved me frfr
        _G.ScriptExecuted = false
        _G.Settings = {
            Box_Color = Color3.fromRGB(255, 0, 0),
            Box_Thickness = 0,
            Team_Check = false,
            Team_Color = false,
            Autothickness = false,
            enabled = false
        }
    end
end)

visuals:Slider("Esp box thickness", 1, 20, 1, function(p)
    	_G.Settings = {
        Box_Color = _G.colorpickerthingieidk,
        Box_Thickness = p,
        Team_Check = false,
        Team_Color = false,
        Autothickness = false,
        enabled = false
    }
end)


player:Button("Fent walk", function()
game.Players.LocalPlayer.Character.Animatehalf.Enabled = true
end)

player:Button("Anti-crit", function()
     game:GetService("Players").LocalPlayer.Character:FindFirstChild("Right Leg"):Destroy()
end)

_G.infstamina = false
player:Toggle("Infinite stamina", function(v)
    if v then
        _G.infstamina = true
    else
        _G.infstamina = false
        game.Players.LocalPlayer.Character.Runscript.Stamina.Value = 100
    end
    
    while _G.infstamina do
        if Player.Character:FindFirstChild("Runscript") and _G.infstamina then
           if game.Players.LocalPlayer.Character.Runscript.Stamina.Value <= 30 then
              game.Players.LocalPlayer.Character.Runscript.Stamina.Value = 500
           end
             Player.Character.Runscript.CanRun.Value = 0
            Player.Character.IST.cooldown2.Value = false
        else
            break
        end
        wait(0.01)
    end
end)

_G.infdash = false
player:Toggle("Infinite dash", function(v)
    if v then
        _G.infdash = true
    else
        _G.infdash = false
    end
    
    while _G.infdash do
        if Player.Character:FindFirstChild("IST") and _G.infdash then
            Player.Character.IST.cooldown.Value = false
            Player.Character.IST.Abletoroll.Value = true
        else
            break
        end
        wait(0.1)
    end
end)


player:Toggle("Disable jump cooldown", function(v)
    if v then
     if Player.Character:FindFirstChild("JumpCooldown") then
         Player.Character.JumpCooldown.Enabled = false
     end
     else
     if Player.Character:FindFirstChild("JumpCooldown") then
         Player.Character.JumpCooldown.Enabled = true
     end
    end
end)

_G.sprintf = false
player:Toggle("Sprint fast", function(v)
    if v then
        _G.sprintf = true
    else
        _G.sprintf = false
        if Player.Character:FindFirstChild("Runscript") then
        Player.Character.Runscript.SlowDown.Value = 1
        end
    end
    
    while _G.sprintf do
        if Player.Character:FindFirstChild("Runscript") and _G.sprintf then
            Player.Character.Runscript.CanRun.Value = 0
            Player.Character.Runscript.SlowDown.Value = 1.5
        else
            break
        end
        wait(0.1)
    end
end)


misc:Button("Clear projectiles (removes stuttering)", function()
        for _, obj in pairs(workspace.Explosions:GetChildren()) do
            obj:Destroy()
    end
end)

misc:Button("Anti kick", function()
getgenv().Anti = true 
local Anti
Anti = hookmetamethod(game, "__namecall", function(self, ...)
        if self == Player and getnamecallmethod():lower() == "kick" and getgenv().Anti then
            return warn("XYZ Anti kick: A client script tried to kick you")
        end
        return Anti(self, ...)
    end)
end)

misc:Button("Better graphics", function()
    local sky = game.Lighting.Sky:Clone()
    for _, v in pairs(game.Lighting:GetChildren()) do
        v:Remove()
    end
    wait()
    sky.Parent = game.Lighting
    sky.SunAngularSize = 5
    local ccor = Instance.new("ColorCorrectionEffect", game.Lighting)
    ccor.Saturation = 0.5
    local blur = Instance.new("BlurEffect", game.Lighting)
    blur.Size = 1
    local bloom = Instance.new("BloomEffect", game.Lighting)
    local atmosphere = Instance.new("Atmosphere", game.Lighting)
    atmosphere.Density = 0.4
end)

local tools = "55:55:55:55"

local weapon
local weaponamount = 7

weapons:Dropdown("Weapon", {"Fists", "Mace", "Katana", "Spear", "Axe", "Maul", "Macuahuitl", "Great sword", "Chainsaw", "Brute mace", "Rapier", "Cutlass", "Great axe", "Bow", "Crossbow", "Scissor", "Flail", "Kanabo", "Halberd", "Scythe", "Trident", "Dagger", "Gladius", "Warhammer", "Pickaxe", "Spiked club", "Tekko kagi", "Naginata", "Zweihänder", "Khopesh", "Hatchets", "Flamberge", "Shovel", "Bardiche", "Bo staff", "Caestus", "Dual hammers", "Hook swords", "Sabre", "Lucerne", "Guandao", "Makhaira", "Warpick", "Kamas", "Nunchuks", "Sai"}, function(t)
    weapon = t
end)

weapons:Slider("Amount", 2, 500, 6, function(v)
    weaponamount = v
end)

weapons:Toggle("Get tools", function(v)
    if v then
       tools = "0:0:0:0"
       else
       tools = "55:55:55:55"
    end
end)


weapons:Button("Dupe", function()
    local backpack = Player.Backpack
    local char = Player.Character
    local atool = Instance.new("Tool", backpack)
    atool.Name = "Activate"
    atool.RequiresHandle = false
    atool.Activated:Connect(function()
        for _, v in pairs(backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("swing") or v:FindFirstChild("startup") then
               v.Parent = char
               v:Activate()
            end
        end
        for _, v in pairs(char:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("swing") or v:FindFirstChild("startup") then
               v:Activate()
            end
        end
    end)
    local wvalue = wargs[weapon]
    for i = 1, weaponamount do
        local args = {
            [1] = wvalue,
            [2] = tools
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Item"):FireServer(unpack(args))
    end
end)


weapons:Button("Dupe random", function()
    local backpack = Player.Backpack
    local char = Player.Character
    local atool = Instance.new("Tool", backpack)
    atool.Name = "Activate"
    atool.RequiresHandle = false
    atool.Activated:Connect(function()
        for _, v in pairs(backpack:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("swing") or v:FindFirstChild("startup") then
               v.Parent = char
               v:Activate()
            end
        end
        for _, v in pairs(char:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("swing") or v:FindFirstChild("startup") then
               v:Activate()
            end
        end
    end)
    local wvalue = wargs[weapon]
    for i = 1, weaponamount do
        local args = {
            [1] = math.random(2,41),
            [2] = tools
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Item"):FireServer(unpack(args))
    end
end)
