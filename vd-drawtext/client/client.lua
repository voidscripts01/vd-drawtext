-- ============================================================================
-- == vd-drawtext
-- == Version: 1.0.0
-- == Author: KITSO
-- ==
-- == Please do not remove this credit. This script was created by KITSO.
-- ============================================================================

print("^2vd-drawtext^7 by ^1KITSO^7 has been loaded! (v1.0.0)")

local isDisplaying = false

-- ============================================================================
-- NEW: VERSION CHECKER
-- ============================================================================
local function CheckVersion()
    local versionCheckUrl = "https://raw.githubusercontent.com/voidscripts01/vd-drawtext/main/version.txt"
    local updateLink = "https://github.com/voidscripts01/vd-drawtext"
    local localVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
    
    if not localVersion then
        print("^1[vd-drawtext] Could not find 'version' in fxmanifest.lua.^7")
        return
    end


    PerformHttpRequest(versionCheckUrl, function(err, responseText, headers)
        if err ~= 200 then
            print("^1[vd-drawtext] Version check failed. Could not connect to GitHub. (Error: " .. err .. ")^7")
            return
        end
        
        local remoteVersion = string.gsub(responseText, "%s+", "")
        
        if localVersion == remoteVersion then
            print("^2[vd-drawtext] You are running the latest version: " .. localVersion .. "^7")
        else
            print("^1[vd-drawtext] --------------------------------------------------------^7")
            print("^1[vd-drawtext] Your version of vd-drawtext is outdated!^7")
            print("^1[vd-drawtext] Current version: " .. localVersion .. "^7")
            print("^2[vd-drawtext] Newest version:  " .. remoteVersion .. "^7")
            print("^3[vd-drawtext] Update: " .. updateLink .. "^7")
            print("^1[vd-drawtext] --------------------------------------------------------^7")
        end
    end, "GET")
end

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

-- =================================S===========================================
-- EXPORTS (FOR OTHER SCRIPTS)
-- ============================================================================
exports('ShowText', ShowTextUI)
exports('HideText', HideTextUI)

-- ============================================================================
-- INITIALIZATION
-- ============================================================================
Citizen.CreateThread(function()
    Citizen.Wait(1000) 
    CheckVersion()
    HideTextUI()
end)