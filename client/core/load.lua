-- - @information On Resource Start the Init Framework function
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
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