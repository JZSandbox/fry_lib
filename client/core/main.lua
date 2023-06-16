FRYLIB = {}
local QBCore = exports['qb-core']:GetCoreObject()

FRYLIB.CALLBACK = function(name, cb,...)
    QBCore.Functions.TriggerCallback(name, cb,...)
end

FRYLIB.INITEXPORT = function()
    local resource = Config.DATAFRAMEWORK[Config.USEFRAMEWORK].RESOURCE
    return exports[resource]:GetCoreObject()
end

FRYLIB.INITFRAMKEWORK = function()
    DEBUG.CREATEMESSAGE('INIT '..string.upper(Config.USEFRAMEWORK), 'CORE')
    if Config.USEFRAMEWORK == 'qb' then
        while not FRYLIB.INITEXPORT() do
            DEBUG.CREATEMESSAGE('INIT EXPORT'..Config.USEFRAMEWORK, 'CORE')
            Wait(500)
        end
        while not QBCore.Functions.GetPlayerData().job do
            DEBUG.CREATEMESSAGE('INIT PLAYERDATA'..Config.USEFRAMEWORK, 'CORE')
            Wait(500)
        end
        PLAYERDATA = QBCore.Functions.GetPlayerData()
    end
    DEBUG.CREATEMESSAGE('INIT SUCCESSFULL, OBJECT AND PLAYERDATA LOADED '..string.upper(Config.USEFRAMEWORK), 'CORE')
end

-- CHECK WHICH FUNCTIONS SHOULD BE SHOWN IN F8 PRINT
FRYLIB.CHECKFUNCTIONS = function(jobs, name)
    local show = false
    for k, v in ipairs(jobs) do
        if v == name then
            show = true
        end
    end
    return show
end

-- EXPORT TO LIB
exports('FRYLIBINIT', function()
    return FRYLIB
end)

-- - @information On Resource Start the Init Framework function
AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
    FRYLIB.INITFRAMKEWORK()
   end
end)

-- - @information Stopping Resource
AddEventHandler('onResourceStop', function(resource)
   if resource == GetCurrentResourceName() then
      DEBUG.CREATEMESSAGE('STOPPING FRYLIB', 'CORE')
   end
end)