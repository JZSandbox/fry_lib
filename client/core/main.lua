FRYLIB = {}

FRYLIB.GETSINGLEINFO = function(args)
    if Config.USEFRAMEWORK == 'qb' then return OBJ.FUNCTION..'.'..args..'()' end
end

FRYLIB.CALLBACK = function(name, delay, cb, ...)
    lib.callback(name, delay, cb, ...)
end

FRYLIB.INITEXPORT = function()
    local resource = Config.DATAFRAMEWORK[Config.USEFRAMEWORK].RESOURCE
    return exports[resource]:GetCoreObject()
end

-- GET LIB FUNCTION
FRYLIB.getLib = function ()
    return FRYLIB
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
exports('FRYLIBINIT', FRYLIB.getLib())
