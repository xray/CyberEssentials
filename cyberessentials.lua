local strHelper = require "cyberessentials/tools/stringhelpers"
local headingCalculator = require "cyberessentials/tools/headingcalculator"
local warps = require "cyberessentials/tools/repo"


-- local strHelper = require "ce_tools.stringhelpers"
-- local headingCalculator = require "ce_tools.headingcalculator"
-- local warps = require "ce_tools.repo"


print("[CyberEssentials] Mod activated...")
local previousPosition = false


local function rawPositionToList(pos)
    -- Coords Format: "ToVector4{ x = 1784.8895, y = 2323.1487, z = 184.28886, w = 1.0 }"

    local posAsString = tostring(pos)
    local minusPreamble = string.gsub(posAsString, "ToVector4{ x = ", "")
    local yReplaced = string.gsub(minusPreamble, ", y = ", ",")
    local zReplaced = string.gsub(yReplaced, ", z = ", ",")
    local wReplaced = string.gsub(zReplaced, ", w = ", ",")
    local Delimited = string.gsub(wReplaced, " }", "")

    return SplitString(Delimited, ",")
end

local function getPlayerInfo()
    local player = Game.GetPlayer()
    local rawplayerPosition = player:GetWorldPosition()

    local playerPosition = rawPositionToList(rawplayerPosition)
    local playerDirection = player:GetWorldYaw()

    return {
        xCoord = playerPosition[0],
        yCoord = playerPosition[1],
        zCoord = playerPosition[2],
        yaw = playerDirection
    }
end

function SetWarp(name, xCoord, yCoord, zCoord)
    -- local player = {xCoord = 50, yCoord = 60, zCoord = 70}
    local player = getPlayerInfo()
    local current_warps = GetWarps()
    
    -- keep coordinate arguments if present, use current position as default if absent
	xCoord = xCoord or player.xCoord
	yCoord = yCoord or player.yCoord
	zCoord = zCoord or player.zCoord

    for warp_number, warp_data in pairs(current_warps) do
        if warp_data.name == name then
            print("[CyberEssentials] A warp with the name \"" .. name .. "\" already exists, please pick a different name.")
            return
        end
    end

    AddWarp(current_warps, name, xCoord, yCoord, zCoord)
end

function Warp(warp_name)
    local player = getPlayerInfo()
    local current_warps = GetWarps()

    for warp_number, warp_data in pairs(current_warps) do
        if warp_data.name == warp_name then
            print("[CyberEssentials] Warping player to \"" .. warp_data.name .. "\".")
            previousPosition = player
            Game.TeleportPlayerToPosition(warp_data.x, warp_data.y, warp_data.z)
            return
        end
    end

    print("[CyberEssentials] Warp \"" .. warp_name .. "\" not found.")
end

function MoveForward(amount)
    local player = getPlayerInfo()
    local offsets = GetOffsets(player.yaw)

    local xOffset = amount * offsets.x
    local yOffset = amount * offsets.y

    previousPosition = player
    Game.TeleportPlayerToPosition(player.xCoord + xOffset, player.yCoord + yOffset, player.zCoord + 1)
end

function GoUp(amount)
    local player = getPlayerInfo()

    previousPosition = player
    Game.TeleportPlayerToPosition(player.xCoord, player.yCoord, player.zCoord + amount)
end

function GoDown(amount)
    local player = getPlayerInfo()

    previousPosition = player
    Game.TeleportPlayerToPosition(player.xCoord, player.yCoord, player.zCoord - amount)
end

function Back()
    local player = getPlayerInfo()
    
    if (not previousPosition) then
        print("[CyberEssentials] There is no previous position to move you to.")
    else
        Game.TeleportPlayerToPosition(previousPosition.xCoord, previousPosition.yCoord, previousPosition.zCoord)
        previousPosition = player
    end
end

function WhereAmI()
    local player = getPlayerInfo()

    print("x: " .. player.xCoord)
    print("y: " .. player.yCoord)
    print("z: " .. player.zCoord)
    print("yaw: " .. player.yaw)
end
