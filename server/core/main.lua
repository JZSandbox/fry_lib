local DEBUG = require('server.utils.debug')
local OBJ = FRYLIB.INITEXPORT()

-- - Create Call Back with OX_LIB
FRYLIB.SERVER.REGISTERCALLBACK = function(name, cb)
    OBJ.Functions.CreateCallback(name, cb)
end

exports('FRYLIBSERVER', function()
    return FRYLIB.SERVER
end)

FRYLIB.SERVER.REGISTERCALLBACK('jerzys_test', function(source, cb, garage, type, category)
end)

CreateThread(function()
    DEBUG.CREATEMESSAGE('RESOURCE IS STARTING', 'SERVER CORE')
end)