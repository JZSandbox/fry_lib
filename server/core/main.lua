FRYLIB.SERVER = {}

-- - Create Call Back with OX_LIB
FRYLIB.SERVER.REGISTERCALLBACK = function(name, cb)
    if Config.INITLIB.SYSTEM.ADDONLIB == 'ox_lib' then
        lib.callback.register(name, cb)
    end
end