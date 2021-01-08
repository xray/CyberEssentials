local stringhelpers = require "tools.stringhelpers"

Player = {}

local function rawPositionToList(pos)
    -- Coords Format: "ToVector4{ x = 1784.8895, y = 2323.1487, z = 184.28886, w = 1.0 }"

    local posAsString = tostring(pos)
    local minusPreamble = string.gsub(posAsString, "ToVector4{ x = ", "")
    local yReplaced = string.gsub(minusPreamble, ", y = ", ",")
    local zReplaced = string.gsub(yReplaced, ", z = ", ",")
    local wReplaced = string.gsub(zReplaced, ", w = ", ",")
    local Delimited = string.gsub(wReplaced, " }", "")

    return stringhelpers.splitString(Delimited, ",")
end

function Player:new(game)
    setmetatable(game, self)
    self.__index = self
    return game
end

function Player:getPlayerInfo()
    local player = self.game.GetPlayer()
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

return Player