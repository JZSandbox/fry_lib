DEBUG = {}
DEBUG.LEVEL = Config.DEBUGLEVEL
DEBUG.INDENTSIZE = Config.DEBUGINDENTSIZE

-- - @params  message:  EITHER TABLE, STRING
-- - @params type: WHAT TYPE IS THE DEBUG EXAMPLE: 'ITEM, VEHICLE, SMTH ELSE'
-- - @params level: - SET LEVEL OF THE DEBUG MESSAGE
-- - @params logger: - EITHER TRUE OR FALSE
DEBUG.CREATEMESSAGE = function(message,types,logger)
    -- CHECK IF LEVEL IS THE SAME AS CONFIG.DEBUGLEVEL
    -- print('[FRY LIB | DEBUG] DATA: CURRENT DEBUGLEVEL '..DEBUG.LEVEL)
    if message == nil then message = 'NO DATA OR MESSAGE SET/AVAIBLE' end
    if DEBUG.LEVEL < 0 then return end
    if types == nil then types = 'NOT DEFINED' end
    if type(message) == "table" and logger == nil then
        print('[FRY LIB | DEBUG] DATA: TABLE DEBUG DETECTED | AREA '..types)
        print(json.encode(message, {indent = true, indent_size = DEBUG.INDENTSIZE}))
        return
    else
        --print('[FRY-LIB | DEBUG] DATA: NO TABLE DETECTED')
        print('[FRY-LIB | DEBUG] DATA: '..message..' | AREA '..types)
        return
    end
end

-- EXPORT DEBUG FUNCTIONS
exports('FRYLIB.DEBUG', DEBUG)