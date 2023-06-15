FRYLIB.JOB = {}
local OBJECT = FRYLIB.INITEXPORT()
local PED = nil
local PLAYERDATA = nil

AddEventHandler(Config.DATAFRAMEWORK[Config.USEFRAMEWORK].PLAYER_LOAD, function()
    PLAYERDATA = OBJECT.Functions.GetPlayerData()
end)

FRYLIB.JOB.GET = function()
    local DATA = PLAYERDATA.job
    DEBUG.CREATEMESSAGE(DATA, 'JOB')
    return DATA
end

FRYLIB.JOB.PAYMENT = function()
    local DATA = PLAYERDATA.job.payment    
    DEBUG.CREATEMESSAGE(DATA, 'JOB')
    return DATA
end

FRYLIB.JOB.NAME = function()
    local DATA = PLAYERDATA.job.name
    DEBUG.CREATEMESSAGE(DATA, 'JOB')
    return DATA
end

FRYLIB.JOB.GRADE = function()
    local DATA = PLAYERDATA.job.grade.level
    DEBUG.CREATEMESSAGE(DATA, 'JOB')
    return DATA
end


CreateThread(function()
    local show = FRYLIB.CHECKFUNCTIONS(Config.ShowAllData, 'job')
    if show then
        FRYLIB.JOB.GET()
        FRYLIB.JOB.PAYMENT()
        FRYLIB.JOB.NAME()
        FRYLIB.JOB.GRADE()
    end
end)