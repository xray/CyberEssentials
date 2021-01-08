local mock_game = require "tools.mocks.game"

Cyberpunk = {}

function Cyberpunk:new(table)
    table = table or { game = mock_game }
    setmetatable(table, self)
    self.__index = self
    return table
end

return Cyberpunk
