FRYLIB.SERVER.PLAYER = {}
local OBJECT = FRYLIB.INITEXPORT()

-- - @Get Player Data from Server Id
-- - @params id number - server number
FRYLIB.SERVER.PLAYER.GET = function(id)
    local DATA = {}
    DATA = OBJECT.Functions.GetPlayer(id)
    DEBUG.CREATEMESSAGE(DATA, 'PLAYER.SERVER')
    if DATA == nil then return end
    DEBUG.CREATEMESSAGE('PLAYER DETECTED WITH NAME: '..DATA.PlayerData.name, 'PLAYER.SERVER')
    DEBUG.CREATEMESSAGE('PLAYER DETECTED WITH CITIZENDID: '..DATA.PlayerData.citizenid, 'PLAYER.SERVER')
    return DATA
end

-- - @Get Player Data from CitizenId
-- - @params cid string - CiD String
FRYLIB.SERVER.PLAYER.CID = function(cid)
    local DATA = {}
    DATA = OBJECT.Functions.GetPlayerByCitizenId(cid)
    DEBUG.CREATEMESSAGE(DATA, 'PLAYER DATA')
    return DATA
end

-- - @Get Player Data from Offline CitizenId
-- - @params cid string - CiD String
FRYLIB.SERVER.PLAYER.OFFLINECID = function(cid)
    local DATA = {}
    DATA = OBJECT.Functions.GetOfflinePlayerByCitizenId(cid)
    DEBUG.CREATEMESSAGE(DATA, 'PLAYER DATA')
    return DATA
end
