-- ============================================================================
-- == vd-drawtext (SERVER SCRIPT)
-- == Version: 1.0.0
-- == Author: KITSO
-- ============================================================================

-- ============================================================================
-- VERSION CHECKER
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
-- INITIALIZATION
-- ============================================================================
Citizen.CreateThread(function()
    Citizen.Wait(5000) 
    CheckVersion()
end)