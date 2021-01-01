local headings = {
    north = { min = -22.5, max = 22.5, offsets = { x = 0, y = 1 } },
    northeast = { min = -67.5, max = -22.5, offsets = { x = 0.5, y = 0.5 } },
    east = { min = -112.5, max = -67.5, offsets = { x = 1, y = 0 } },
    southeast = { min = -157.5, max = -112.5, offsets = { x = 0.5, y = -0.5 } },
    southpositive = { min = 157.5, max = 180, offsets = { x = 0, y = -1 } },
    southnegative = { min = -180, max = -157.5, offsets = { x = 0, y = -1 } },
    southwest = { min = 112.5, max = 157.5, offsets = { x = -0.5, y = -0.5 } },
    west = { min = 67.5, max = 112.5, offsets = { x = -1, y = 0 } },
    northwest = { min = 22.5, max = 67.5, offsets = { x = -0.5, y = 0.5 } }
}

function GetOffsets(yaw)
    for heading, data in pairs(headings) do
        if yaw >= data.min and yaw <= data.max then
            print(heading)
            return data.offsets
        end
    end
end
