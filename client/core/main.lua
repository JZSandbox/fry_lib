FRYLIB = {}
PLAYERDATA = {}

FRYLIB.CALLBACK = function(name, cb,...)
    FRYLIB.INITEXPORT().Functions.TriggerCallback(name, cb,...)
end

FRYLIB.INITEXPORT = function()
    local resource = Config.DATAFRAMEWORK[Config.USEFRAMEWORK].RESOURCE
    return exports[resource]:GetCoreObject()
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