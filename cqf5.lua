local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--  Whitelist
local allowedUsers = {
    ["derprollerking"] = true,
    ["justsigma2crazy"] = true,
    ["Layysiakhi"] = true,
    ["elizockt6"] = true
}

-- white
if not allowedUsers[LocalPlayer.Name] then
    return
end

-- NEBULA ASCII
print([[
███╗   ██╗███████╗██████╗ ██╗   ██╗██╗      █████╗ 
████╗  ██║██╔════╝██╔══██╗██║   ██║██║     ██╔══██╗
██╔██╗ ██║█████╗  ██████╔╝██║   ██║██║     ███████║
██║╚██╗██║██╔══╝  ██╔══██╗██║   ██║██║     ██╔══██║
██║ ╚████║███████╗██████╔╝╚██████╔╝███████╗██║  ██║
╚═╝  ╚═══╝╚══════╝╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝

        MADE BY CQF5
]])

-- Apply Settings to Tool
local function applyToTool(tool)
    if tool and tool:IsA("Tool") then
        tool:SetAttribute("AimDelay", 0)
        tool:SetAttribute("Scope", false)
    end
end

-- Loop durch Character
local function updateCharacter(character)
    if not character then return end

    for _, tool in ipairs(character:GetChildren()) do
        applyToTool(tool)
    end

    character.ChildAdded:Connect(function(child)
        applyToTool(child)
    end)
end

-- Respawn
LocalPlayer.CharacterAdded:Connect(function(char)
    updateCharacter(char)
end)

-- Already spawned
if LocalPlayer.Character then
    updateCharacter(LocalPlayer.Character)
end
