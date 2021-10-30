local Punishment = 1 --1 = kill, 2 = kick

local KickMessage = "" --Message for when the player gets kicked, leave blank if you want no message

local UseRunService = true --Much more efficient but can cause lag sometimes

local MaxValues = { --Maximum values that the player can achieve
    WalkSpeed = 20,
    JumpPower = 55,
    HipHeight = 2, --This is probably wrong just set it to the right value
};

--Custom Code For When The Player Gets Punished
function CustomCode()
    --Type code here

end

-----------------------------------------------------------------------------------------
------------------------I would not edit below but you can ;)----------------------------
-----------------------------------------------------------------------------------------

local Player = game.Players.LocalPlayer;

local Character = Player.Character or Player.CharacterAdded:Wait();

local Humanoid = Character:WaitForChild("Humanoid");

local Kicked = false;

local RunService = game:GetService("RunService")

local function GetHumanoidData()
    local Data = {
        WalkSpeed = Humanoid.WalkSpeed,
        JumpPower = Humanoid.JumpPower,
        HipHeight = Humanoid.HipHeight;
    };
    return Data;
end

function Kick()
    Player:Kick(KickMessage)
    Kicked = true
end

--Main loop
if UseRunService == true then
    RunService.RenderStepped:Connect(function()
        if Kicked ~= true then
            local HumanoidData = GetHumanoidData()
    
            if HumanoidData.WalkSpeed >= MaxValues.WalkSpeed then
                Kick()
                elseif HumanoidData.JumpPower > MaxValues.JumpPower then
                Kick()
                elseif HumanoidData.HipHeight > MaxValues.HipHeight then
                Kick()
            end
        end
    end)
    elseif UseRunService == false then
        coroutine.resume(coroutine.create(function ()
            while Kicked == false do
            local HumanoidData = GetHumanoidData()
    
            if HumanoidData.WalkSpeed >= MaxValues.WalkSpeed then
                Kick()
                elseif HumanoidData.JumpPower > MaxValues.JumpPower then
                Kick()
                elseif HumanoidData.HipHeight > MaxValues.HipHeight then
                Kick()
            end
                wait()
            end
        end))
end
