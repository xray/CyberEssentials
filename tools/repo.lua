local json = require "cyberessentials/tools/json/json"

-- local json = require "ce_tools.json.json"


local function loadCyberEssentialsData()
    local file = io.open("cyberessentials/data/cyberessentials_data.json", "r")

    local content = file:read("*all")
    local ce_data = json.decode(content)
    file:close()

    return ce_data
end

local function saveCyberEssentialsData(ce_data)
    local file = io.open("cyberessentials/data/cyberessentials_data.json", "w+")

    file:write(json.encode(ce_data))
    file:close()
end

local function saveWarps(warps)
    local ce_data = loadCyberEssentialsData()

    ce_data.warps = warps
    saveCyberEssentialsData(ce_data)
end

function GetWarps()
    local ce_data = loadCyberEssentialsData()
    return ce_data.warps
end

function AddWarp(current_warps, name, x, y, z)
    local new_warp = {
        name = name,
        x = x,
        y = y,
        z = z
    }

    table.insert(current_warps, new_warp)
    saveWarps(current_warps)
end
