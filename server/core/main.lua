FRYLIB.SERVER = {}
local QBCore = exports['qb-core']:GetCoreObject()

-- - Create Call Back with OX_LIB
FRYLIB.SERVER.REGISTERCALLBACK = function(name, cb)
    QBCore.Functions.CreateCallback(name, cb)
end

exports('FRYLIBSERVER', function()
    return FRYLIB.SERVER
end)

FRYLIB.SERVER.REGISTERCALLBACK('jerzys_test', function(source, cb, garage, type, category)
end)