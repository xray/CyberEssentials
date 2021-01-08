local json = require "cyberessentials/tools/json/json"

Repo = {}

function Repo:new(table)
    setmetatable(table, self)
    self.__index = self
    return table
end

local function loadCyberEssentialsData(path)
    local file = io.open(path, "r")

    local content = file:read("*all")
    local ce_data = json.decode(content)
    file:close()

    return ce_data
end

local function saveCyberEssentialsData(ce_data, path)
    local file = io.open(path, "w+")

    file:write(json.encode(ce_data))
    file:close()
end

local function saveWarps(warps, path)
    local ce_data = loadCyberEssentialsData(path)

    ce_data.warps = warps
    saveCyberEssentialsData(ce_data, path)
end

function Repo:GetWarps()
    local ce_data = loadCyberEssentialsData(self.path)
    return ce_data.warps
end

function Repo:AddWarp(current_warps, name, x, y, z)
    local new_warp = {
        name = name,
        x = x,
        y = y,
        z = z
    }

    table.insert(current_warps, new_warp)
    saveWarps(current_warps, self.path)
end

function Repo:RemoveWarp(current_warps, number)
    table.remove(current_warps, number)
    saveWarps(current_warps, self.path)
end

return Repo
