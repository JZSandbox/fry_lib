FRYLIB.GANG = {}
local OBJECT = FRYLIB.INITEXPORT()
local PED = nil
local PLAYERDATA = nil

AddEventHandler(Config.DATAFRAMEWORK[Config.USEFRAMEWORK].PLAYER_LOAD, function()
    PLAYERDATA = OBJECT.Functions.GetPlayerData()
end)

FRYLIB.GANG.GET = function()
    local DATA = PLAYERDATA.gang
    DEBUG.CREATEMESSAGE(DATA, 'GANG')
    return DATA
end

FRYLIB.GANG.NAME = function()
    local DATA = PLAYERDATA.gang.name
    DEBUG.CREATEMESSAGE(DATA, 'GANG')
    return DATA
end

FRYLIB.GANG.GRADE = function()
    local DATA = PLAYERDATA.gang.grade.level
    DEBUG.CREATEMESSAGE(DATA, 'GANG')
    return DATA
end



CreateThread(function()
    local show = FRYLIB.CHECKFUNCTIONS(Config.ShowAllData, 'gang')
    if show then
        --FRYLIB.GANG.GET()
        FRYLIB.GANG.NAME()
        FRYLIB.GANG.GRADE()
    end
end)