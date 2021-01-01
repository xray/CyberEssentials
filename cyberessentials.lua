local strHelper = require "scripts/ce_tools/stringhelpers"
local headingCalculator = require "scripts/ce_tools/headingcalculator"


-- local strHelper = require "tools.stringhelpers"
-- local headingCalculator = require "tools.headingcalculator"


print("CyberEssentials activated...")
local previousPosition = {false}


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
    if previousPosition[1] == false then
        print("There is no previous position to move you to.")
    else
        Game.TeleportPlayerToPosition(previousPosition.xCoord, previousPosition.yCoord, previousPosition.zCoord)
        previousPosition = {false}
    end
end

function WhereAmI()
    local player = getPlayerInfo()

    print("x: " .. player.xCoord)
    print("y: " .. player.yCoord)
    print("z: " .. player.zCoord)
    print("yaw: " .. player.yaw)
end
