
-- reqs
local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vep1032/VepStuff/main/VL"))()

-- set up gui
local s = VLib:Window("1165 HUB", "Southwest Florida", "G")
local ss = s:Tab("Teleports")
local autofarm = s:Tab("Auto-Farm")

local del = s:Tab("Destroy Gui")

-- vars

-- functioons
function getplrcar(player)
    if player == nil then
        player = game.Players.LocalPlayer
    end

    local car -- create the variable nad make it blank

    for i,v in pairs(workspace.Cars:GetChildren()) do -- go through every car inthe workspace
        if v.PlayerLoc.Value == player then -- if the owner of the car is the player
            car = v -- set the car variable to the car
        end
    end

    if car then
        return car
    end

end

function tpplr(pos)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
end

function tpcar(pos)
    local car = getplrcar(game.Players.LocalPlayer)
    car:SetPrimaryPartCFrame(CFrame.new(pos))
end

-- gui functions
-- autofarm
local autocollect = false
autofarm:Toggle("AutoCollect",function(t)
    autocollect = t
end)

local riftautofarm = false
autofarm:Toggle("Rift Auto-Farm",function(t)
    local screengui = game.Players.LocalPlayer.PlayerGui:FindFirstChild('RiftAutofarm')
                
    if screengui ~= nil then
        screengui:Destroy()
    end

    riftautofarm = t
end)

-- teleports
local selectedtp 
ss:Dropdown("Robbables",{"McBloxxer's", "StudRac", "CVC Pharmacy", "Bublix", "StarBlocks","Dippin' Donuts","Bank"},function(t)
    if t == "McBloxxer's" then
        selectedtp = Vector3.new(9615,25,1282)

    elseif t == "StudRac" then
        selectedtp = Vector3.new(3365,25,-327)
        
    elseif t == "CVC Pharmacy" then
        selectedtp = Vector3.new(9561,25,-821)
        
    elseif t == "Bublix" then
        selectedtp = Vector3.new(8812,25,-653)
        
    elseif t == "StarBlocks" then
        selectedtp = Vector3.new(9489,25,-4115)
        
    elseif t == "Dippin' Donuts" then
        selectedtp = Vector3.new(9624,25,760)
        
    elseif t == "Bank" then
        selectedtp = Vector3.new(6366,25,95)
    end
    print(t)
end)

ss:Dropdown("Misc",{"Dealership","Fire Station","Police Station"},function(t)
    if t == "Dealership" then
        selectedtp = Vector3.new(9185,25,1756)

    elseif t == "Fire Station" then
        selectedtp = Vector3.new(7055,23,177)

    elseif t == "Police Station" then
        selectedtp = Vector3.new(5912,23,524)

    end
    print(t)
end)

local players = {}
for i,v in pairs(game.Players:GetChildren()) do
    table.insert(players,v.Name)
end
ss:Dropdown("Players",players,function(t)
    selectedtp = game.Players:FindFirstChild(t).Character.HumanoidRootPart.Position
    print(t)
end)


ss:Button("TP Player",function()
    if selectedtp ~= nil then
        tpplr(selectedtp)
    end
end)

ss:Button("TP Car",function()
    if selectedtp ~= nil then
        tpcar(selectedtp)
    end
end)

-- delete gui
del:Button("Destroy",function()
    game.CoreGui.Library:Destroy()
end)

-- loop

local crimFolder = workspace.crimObjects
local roblist = {"McBloxxer's", "StudRac", "Bublix", "StarBlocks","Dippin' Donuts","Bank"}
local temptp
local tempabrev


spawn(pcall(function()
    local PassengerSpanws = game.ReplicatedStorage.PassengerSpawns
    local PassengerDestinations = game.ReplicatedStorage.PassengerDestinations
    local riftgui = game.Players.LocalPlayer.PlayerGui.RiftGui
    print('poo')
    while wait(1) do
        if riftautofarm == true then
            if riftgui.Enabled == true then
                local screengui = game.Players.LocalPlayer.PlayerGui:FindFirstChild('RiftAutofarm')
                local StatusLabel

                local PlayerCar = getplrcar(game.Players.LocalPlayer)
                
                if screengui ~= nil then
                    screengui:Destroy()
                end

                screengui = Instance.new('ScreenGui')
                screengui.Parent = game.Players.LocalPlayer.PlayerGui

                StatusLabel = Instance.new('TextLabel')
                StatusLabel.Parent = screengui
                StatusLabel.BackgroundTransparency = 1
                StatusLabel.TextScaled = true
                StatusLabel.Text = "Status:"
                StatusLabel.Size = UDim2.new(1,0,.05,0)
                StatusLabel.Position = UDim2.new(0,0,.95,0)
                StatusLabel.Font = Enum.Font.SourceSansBold
                StatusLabel.TextColor3 = Color3.fromRGB(255,255,255)
                screengui.Name = "RiftAutofarm"
                
                StatusLabel.Text = "Status: Picking up"
                tpcar(riftgui.Adornee.Position + Vector3.new(0,5,0),PlayerCar)
                wait(1)
                StatusLabel.Text = "Status: Waiting"
                wait(10)
                StatusLabel.Text = "Status: Dropping Off"

                wait(1)
                tpcar(riftgui.Adornee.Position + Vector3.new(0,5,0),PlayerCar)
                StatusLabel.Text = "Status: Waiting"
            end
        end
    end
end))

spawn(pcall(function()
    print('poo')
    while wait(.5) do
        if autocollect == true then
            for i,fgg in ipairs(roblist) do
                -- teleporting to the places
                if fgg == "McBloxxer's" then
                    temptp = Vector3.new(9615,25,1282) + Vector3.new(Random.new(tick()):NextInteger(1,20),Random.new(tick()):NextInteger(25,150),Random.new(tick()):NextInteger(1,20))
                    tempabrev = "mcBlox"
                elseif fgg == "StudRac" then
                    temptp = Vector3.new(3365,25,-327)+ Vector3.new(Random.new(tick()):NextInteger(1,20),Random.new(tick()):NextInteger(25,150),Random.new(tick()):NextInteger(1,20))
                    tempabrev = "studRac"
                elseif fgg == "Bublix" then
                    temptp = Vector3.new(8812,25,-653)+ Vector3.new(Random.new(tick()):NextInteger(1,20),Random.new(tick()):NextInteger(25,150),Random.new(tick()):NextInteger(1,20))
                    tempabrev = "publixSup"
                elseif fgg == "StarBlocks" then
                    temptp = Vector3.new(9489,25,-4115)+ Vector3.new(Random.new(tick()):NextInteger(1,20),Random.new(tick()):NextInteger(25,150),Random.new(tick()):NextInteger(1,20))
                    tempabrev = "starBlock"
                elseif fgg == "Dippin' Donuts" then
                    temptp = Vector3.new(9624,25,760)+ Vector3.new(Random.new(tick()):NextInteger(1,20),Random.new(tick()):NextInteger(25,150),Random.new(tick()):NextInteger(1,20))
                    tempabrev = "dipdon"
                elseif fgg == "Bank" then
                    temptp = Vector3.new(6366,25,95)+ Vector3.new(Random.new(tick()):NextInteger(1,20),Random.new(tick()):NextInteger(25,150),Random.new(tick()):NextInteger(1,20))
                    tempabrev = "rwBank"
                end

                tpplr(temptp)
                wait(.5)
                if tempabrev == "mcBlox" then
                    fireclickdetector(crimFolder.mcBlox1.collectM.ClickDetector,3)
                    fireclickdetector(crimFolder.mcBlox2.collectM.ClickDetector,3)
                    fireclickdetector(crimFolder.mcBlox3.collectM.ClickDetector,3)
                elseif tempabrev == "studRac" then
                    fireclickdetector(crimFolder.studRac1.collectM.ClickDetector,3)
                    fireclickdetector(crimFolder.studRac2.collectM.ClickDetector,3)
                elseif tempabrev == "publixSup" then
                    fireclickdetector(crimFolder.publixSup1.collectM.ClickDetector,3)
                    fireclickdetector(crimFolder.publixSup2.collectM.ClickDetector,3)
                    fireclickdetector(crimFolder.publixSup3.collectM.ClickDetector,3)
                    fireclickdetector(crimFolder.publixSup4.collectM.ClickDetector,3)
                    fireclickdetector(crimFolder.publixSup5.collectM.ClickDetector,3)
                    fireclickdetector(crimFolder.publixSup6.collectM.ClickDetector,3)
                    fireclickdetector(crimFolder.publixSup7.collectM.ClickDetector,3)
                elseif tempabrev == "starBlock" then
                    fireclickdetector(crimFolder.starBlock1.collectM.ClickDetector,3)
                    fireclickdetector(crimFolder.starBlock2.collectM.ClickDetector,3)
                elseif tempabrev == "dipdon" then
                    fireclickdetector(crimFolder.dipdon1.collectM.ClickDetector,3)
                    fireclickdetector(crimFolder.dipdon2.collectM.ClickDetector,3)
                elseif tempabrev == "rwBank" then
                    fireclickdetector(crimFolder.rwBank1.collectM.ClickDetector,3)
                end
            end
        end
    end
end))

spawn(function() -- player list update
    while wait(5) do
        players = {}
        for i,v in pairs(game.Players:GetChildren()) do
            table.insert(players,v.Name)
        end
    end
end)

--[[

ss:Button("Button",function()
print("Pressed!")
end)

ss:Toggle("Toggle",function(t)
print(t)
    end)

ss:Slider("Slider",0,100,70,function(t)
print(t)
end)


   
ss:Colorpicker("Colorpicker",Color3.fromRGB(255, 1, 1),function(t)
print(t)
    end)
ss:Textbox("Textbox", true,function(t)
print(t)
end)
ss:Label("Label")
s:Tab("Tab 2")
--]]
