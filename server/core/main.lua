FRYLIB.SERVER = {}
local OBJ = FRYLIB.SERVER.INITEXPORT()

FRYLIB.SERVER.INITEXPORT = function()
    local resource = Config.DATAFRAMEWORK[Config.USEFRAMEWORK].RESOURCE
    return exports[resource]:GetCoreObject()
end

-- - Create Call Back with OX_LIB
FRYLIB.SERVER.REGISTERCALLBACK = function(name, cb)
    OBJ.Functions.CreateCallback(name, cb)
end

exports('FRYLIBSERVER', function()
    return FRYLIB.SERVER
end)

FRYLIB.SERVER.REGISTERCALLBACK('jerzys_test', function(source, cb, garage, type, category)
end)
