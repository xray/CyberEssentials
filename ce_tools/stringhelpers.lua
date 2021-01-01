local function combineStringTable(stringTable)
    local combined = ""

    for key, value in pairs(stringTable) do
        combined = combined .. value
    end

    return combined
end

function SplitString(str, delimiter)
    local length = string.len(str)
    local charTable = {}
    local stringTable = {}
    local stringTableCount = 0
    for i = 1, length, 1 do
        local currentChar = str:sub(i, i)
        if i == length or currentChar == delimiter then
            stringTable[stringTableCount] = combineStringTable(charTable)
            stringTableCount = stringTableCount + 1
            charTable = {}
        else
            table.insert(charTable, currentChar)
        end
    end

    return stringTable
end