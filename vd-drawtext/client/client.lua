-- ============================================================================
-- == vd-drawtext (CLIENT SCRIPT)
-- == Version: 1.0.0
-- == Author: KITSO
-- ==
-- == Please do not remove this credit. This script was created by KITSO.
-- ============================================================================

print("^2vd-drawtext (Client)^7 by ^1KITSO^7 has been loaded! (v1.0.0)")

local isDisplaying = false

-- ============================================================================
-- INTERNAL FUNCTIONS
-- ============================================================================
local function ShowTextUI(key, message)
    if isDisplaying then return end
    isDisplaying = true
    SendNUIMessage({ action = "show", key = key, message = message })
end

local function HideTextUI()
    if not isDisplaying then return end
    isDisplaying = false
    SendNUIMessage({ action = "hide" })
end

-- ============================================================================
-- COMMANDS (FOR TESTING)
-- ============================================================================
RegisterCommand("showtext", function(source, args, rawCommand)
    local key = args[1] or "E"
    table.remove(args, 1)
    local message = table.concat(args, " ")
    TriggerEvent("vd-drawtext:show", key, message)
end, false)

RegisterCommand("hidetext", function()
    TriggerEvent("vd-drawtext:hide")
end, false)

-- ============================================================================
-- EVENT HANDLERS (FOR OTHER SCRIPTS)
-- ============================================================================
RegisterNetEvent("vd-drawtext:show")
AddEventHandler("vd-drawtext:show", ShowTextUI)

RegisterNetEvent("vd-drawtext:hide")
AddEventHandler("vd-drawtext:hide", HideTextUI)

-- ============================================================================
-- EXPORTS (FOR OTHER SCRIPTS)
-- ============================================================================
exports('ShowText', ShowTextUI)
exports('HideText', HideTextUI)

-- ============================================================================
-- INITIALIZATION
-- ============================================================================
Citizen.CreateThread(function()
    HideTextUI()
end)