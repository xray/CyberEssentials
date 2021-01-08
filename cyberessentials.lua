local cyberpunk = require "tools.cyberpunk"
local playerTools = require "tools.player"
local headingCalculator = require "tools.headingcalculator"
local repoTools = require "tools.repo"


local game = cyberpunk:new({ game = Game }).game
local player = playerTools:new({ game = game })
local repo = repoTools:new({ path = "data/cyberessentials_data.json"})

local previousPosition = false
print("[CyberEssentials] Mod Activated...")

function RemoveWarp(warp_name)
    local current_warps = repo:GetWarps()

    for warp_number, warp_data in pairs(current_warps) do
        if warp_data.name == warp_name then
            repo:RemoveWarp(current_warps, warp_number)
            print("[CyberEssentials] Removed the warp \"" .. warp_name .. "\".")
            return
        end
    end

    print("[CyberEssentials] No warp named \"" .. warp_name .. "\" to remove.")
end

function SetWarp(warp_name, xCoord, yCoord, zCoord)
    local my_player = player:getPlayerInfo()

    xCoord = xCoord or my_player.xCoord
    yCoord = yCoord or my_player.yCoord
    zCoord = zCoord or my_player.zCoord

    local current_warps = repo:GetWarps()

    for warp_number, warp_data in pairs(current_warps) do
        if warp_data.name == warp_name then
            print("[CyberEssentials] A warp with the name \"" .. warp_name .. "\" already exists, please pick a different name.")
            return
        end
    end

    repo:AddWarp(current_warps, warp_name, xCoord, yCoord, zCoord)
    print("[CyberEssentials] Set the warp \"" .. warp_name .. "\".")
end

function Warp(warp_name)
    local my_player = player:getPlayerInfo()
    local current_warps = repo:GetWarps()

    for warp_number, warp_data in pairs(current_warps) do
        if warp_data.name == warp_name then
            print("[CyberEssentials] Warping player to \"" .. warp_data.name .. "\".")
            previousPosition = my_player
            Game.TeleportPlayerToPosition(warp_data.x, warp_data.y, warp_data.z)
            return
        end
    end

    print("[CyberEssentials] Warp \"" .. warp_name .. "\" not found.")
end

function MoveForward(amount)
    local my_player = player:getPlayerInfo()
    local offsets = headingCalculator.GetOffsets(my_player.yaw)

    local xOffset = amount * offsets.x
    local yOffset = amount * offsets.y

    previousPosition = my_player
    Game.TeleportPlayerToPosition(my_player.xCoord + xOffset, my_player.yCoord + yOffset, my_player.zCoord + 1)
end

function GoUp(amount)
    local my_player = player:getPlayerInfo()

    previousPosition = my_player
    Game.TeleportPlayerToPosition(my_player.xCoord, my_player.yCoord, my_player.zCoord + amount)
end

function GoDown(amount)
    local my_player = player:getPlayerInfo()

    previousPosition = my_player
    Game.TeleportPlayerToPosition(my_player.xCoord, my_player.yCoord, my_player.zCoord - amount)
end

function Back()
    local my_player = player:getPlayerInfo()

    if (not previousPosition) then
        print("[CyberEssentials] There is no previous position to move you to.")
    else
        Game.TeleportPlayerToPosition(previousPosition.xCoord, previousPosition.yCoord, previousPosition.zCoord)
        previousPosition = my_player
    end
end

function WhereAmI()
    local my_player = player:getPlayerInfo()

    print("x: " .. my_player.xCoord)
    print("y: " .. my_player.yCoord)
    print("z: " .. my_player.zCoord)
    print("yaw: " .. my_player.yaw)
end
