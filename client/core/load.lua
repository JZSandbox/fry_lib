FRYLIB.INITFRAMKEWORK = function()
    DEBUG.CREATEMESSAGE('INIT '..string.upper(Config.USEFRAMEWORK), 'CORE')
    while not FRYLIB do Wait(500); end
    if Config.USEFRAMEWORK == 'qb' then
        while not FRYLIB.INITEXPORT() do DEBUG.CREATEMESSAGE('INIT EXPORT'..Config.USEFRAMEWORK, 'CORE') Wait(500); end
        while not FRYLIB.INITEXPORT().Functions.GetPlayerData().job do DEBUG.CREATEMESSAGE('INIT PLAYERDATA'..Config.USEFRAMEWORK, 'CORE') Wait(500); end
        PLAYERDATA = FRYLIB.INITEXPORT().Functions.GetPlayerData()
    end
    DEBUG.CREATEMESSAGE(PLAYERDATA, 'CORE')
    DEBUG.CREATEMESSAGE('INIT SUCCESSFULL, OBJECT AND PLAYERDATA LOADED '..string.upper(Config.USEFRAMEWORK), 'CORE')
end

-- - @information On Resource Start the Init Framework function
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
     Wait(500)
     FRYLIB.INITFRAMKEWORK()
    end
 end)
  
 AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
       DEBUG.CREATEMESSAGE('STOPPING FRYLIB', 'CORE')
    end
 end)
 
 -- - @informationen Eventhandler
 AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
     Wait(500)
     FRYLIB.INITFRAMKEWORK()
 end)
