-- CREATE LOGGER
FRYLIB.LOGGER = function(type, data)
    TriggerServerEvent('fry_lib:server:createLogger', type, data)
end