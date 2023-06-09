-- INIT OBJECT
local OBJECT = FRYLIB.INITEXPORT()

FRYLIB.PLAYER = {}
local PED = nil
local PLAYERDATA = OBJECT.Functions.GetPlayerData()


FRYLIB.PLAYER.GETALLDATA = function()
    local DATA = PLAYERDATA
    DEBUG.CREATEMESSAGE(PLAYERDATA, 'player')
    return DATA
end

-- @params type = 'full' |  'last' | 'first'
FRYLIB.PLAYER.NAME = function(type)
    local name = nil

    switch(type, {
        ["full"] = function()
            name = PLAYERDATA.charinfo.lastname .. ' ' .. PLAYERDATA.charinfo.firstname
            DEBUG.CREATEMESSAGE(name, 'player')
        end,
        ["last"] = function ()
            name = PLAYERDATA.charinfo.lastname
            DEBUG.CREATEMESSAGE(name, 'player')
        end,
        ["first"] = function()
            name = PLAYERDATA.charinfo.firstname
            DEBUG.CREATEMESSAGE(name, 'player')
        end,
    })

    return name
end

-- @params type = 'bank' |  'cash'
FRYLIB.PLAYER.GETMONEY = function(type)
    local DATA = nil
    if type == nil then DEBUG.CREATEMESSAGE('NO TYPE DEFINED FOR MONEY', 'player') return end
    switch(type, {
        ["bank"] = function ()
            DATA = PLAYERDATA.money.bank
        end,
        ["cash"] = function()
            DATA = PLAYERDATA.money.cash
        end,
    })

    DEBUG.CREATEMESSAGE(type..' '..DATA, 'player')
    return DATA
end

FRYLIB.PLAYER.CID = function()
    local DATA = PLAYERDATA.citizenid
    DEBUG.CREATEMESSAGE('CitizendId '..DATA, 'player')
    return DATA
end

FRYLIB.PLAYER.PHONE = function()
    local DATA = PLAYERDATA.charinfo.phone
    DEBUG.CREATEMESSAGE('Phone Number '..DATA, 'player')
    return DATA
end

FRYLIB.PLAYER.FINGERPRINT = function()
    local DATA = PLAYERDATA.metadata.fingerprint
    DEBUG.CREATEMESSAGE('FINGERPRINT '..DATA, 'player')
    return DATA
end

FRYLIB.PLAYER.HUNGER = function()
    local DATA = PLAYERDATA.metadata.hunger
    DEBUG.CREATEMESSAGE('PLAYER HUNGER  '..DATA, 'player')
    return DATA
end

FRYLIB.PLAYER.THIRST = function()
    local DATA = PLAYERDATA.metadata.thirst
    DEBUG.CREATEMESSAGE('PLAYER THIRST'..DATA, 'player')
    return DATA
end

FRYLIB.PLAYER.ISHANDCUFFED = function()
    local DATA = PLAYERDATA.metadata.ishandcuffed
    local MESSAGE = nil
    if DATA then
        MESSAGE = 'IS HANDCUFFED = TRUE'
    else
        MESSAGE = 'IS HANDCUFFED = FALSE'
    end
    DEBUG.CREATEMESSAGE(MESSAGE, 'player')
    return DATA
end

FRYLIB.PLAYER.LASTSTAND = function()
    local DATA = PLAYERDATA.metadata.inlaststand
    local MESSAGE = nil
    if DATA then
        MESSAGE = 'IS IN LASTSTAND = TRUE'
    else
        MESSAGE = 'IS IN LASTSTAND = FALSE'
    end
    DEBUG.CREATEMESSAGE(MESSAGE, 'player')
    return DATA
end

-- @params maxDistance | Number - Max Distance a Player can be
-- @params includePlayer | Boolean - If Includes your Player
FRYLIB.PLAYER.GETCLOSESPLAYER = function(maxDistance, includePlayer)
    local coords = FRYLIB.PLAYER.COORDS()

    if Config.INITLIB.SYSTEM.ADDONLIB == 'ox_lib' then
        local data = lib.getClosestPlayer(coords, maxDistance, includePlayer)
        DEBUG.CREATEMESSAGE(data, 'player')
        return data
    end
end


-- @params maxDistance | Number - Max Distance a Player can be
-- @params includePlayer | Boolean - If Includes your Player
FRYLIB.PLAYER.GETCLOSESID = function(maxDistance, includePlayer)
    local coords = FRYLIB.PLAYER.COORDS()

    if Config.INITLIB.SYSTEM.ADDONLIB == 'ox_lib' then
        local data = lib.getClosestPlayer(coords, maxDistance, includePlayer)
        local player = GetPlayerServerId(data)
        DEBUG.CREATEMESSAGE(player, 'player')
        return player
    end
end

-- @params maxDistance | Number - Max Distance a Player can be
-- @params includePlayer | Boolean - If Includes your Player
FRYLIB.PLAYER.GETNEARPLAYERS = function(maxDistance, includePlayer)
    local coords = FRYLIB.PLAYER.COORDS()

    if Config.INITLIB.SYSTEM.ADDONLIB == 'ox_lib' then
        local data = lib.getNearbyPlayers(coords, maxDistance, includePlayer)
        DEBUG.CREATEMESSAGE(data, 'player')
        return data
    end
end

FRYLIB.PLAYER.COORDS = function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    DEBUG.CREATEMESSAGE(coords, 'player')
    return coords
end

CreateThread(function()
    local show = FRYLIB.CHECKFUNCTIONS(Config.ShowAllData, 'player')
    if show then
        FRYLIB.PLAYER.NAME()
        FRYLIB.PLAYER.GETMONEY('cash')
        FRYLIB.PLAYER.CID()
        FRYLIB.PLAYER.PHONE()
        FRYLIB.PLAYER.FINGERPRINT()
        FRYLIB.PLAYER.HUNGER()
        FRYLIB.PLAYER.THIRST()
        FRYLIB.PLAYER.ISHANDCUFFED()
        FRYLIB.PLAYER.LASTSTAND()
        FRYLIB.PLAYER.COORDS()
    end
end)