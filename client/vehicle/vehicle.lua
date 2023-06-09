FRYLIB.VEHICLE = {}
local OBJECT = FRYLIB.INITEXPORT()
local PED = nil
local PLAYERDATA = OBJECT.Functions.GetPlayerData()

-- INFORMATION
FRYLIB.VEHICLE.TYPE = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.INSIDE = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.STATE = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.GETCLOSESBONE = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.CLOSES = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.GETFUEL = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.IMPOUND = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.PROPERTIES = function()
    local DATA = lib.getVehicleProperties(GetVehiclePedIsUsing(PlayerPedId()))
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.SETPROPERTTIES = function(properties)
    local getVehicle = GetVehiclePedIsUsing(PlayerPedId())
    if properties == nil then DEBUG.CREATEMESSAGE('NO PROPERITES FOR VEHICLE') return end
    lib.setVehicleProperties(getVehicle,  properties)
    DEBUG.CREATEMESSAGE("CAR PROPPERITES SET")
end

FRYLIB.VEHICLE.SPAWN = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

CreateThread(function()
    FRYLIB.VEHICLE.SETPROPERTTIES()
end)