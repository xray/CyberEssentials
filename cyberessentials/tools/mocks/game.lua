local player = require "cyberessentials/tools/mocks/player"

local game = {}

function game.GetPlayer()
    return player
end

function game.TeleportPlayerToPosition(xCoord, yCoord, zCoord)
    print("[Mock] Fired: Game.TeleportPlayerToPosition(" .. xCoord .. ", " .. yCoord .. ", " .. zCoord .. ")")
    return true
end

return game