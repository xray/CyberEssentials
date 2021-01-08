local player = require "tools.mocks.player"

Game = {}

function Game.GetPlayer()
    return player
end

function Game.TeleportPlayerToPosition(xCoord, yCoord, zCoord)
    print("[Mock] Fired: Game.TeleportPlayerToPosition(" .. xCoord .. ", " .. yCoord .. ", " .. zCoord .. ")")
    return true
end

return Game