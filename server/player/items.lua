FRYLIB.SERVER.ITEM = {}
local OBJECT = FRYLIB.INITEXPORT()

-- - @params inventory - source (who belongs that inventory)
-- - @params item - string (which item)
-- - @params count - number how many (which item)
-- - @params metadata - table (dont have to be filled)
-- - @params slot - number (dont have to be filled)
-- - @params cb - callback function (dont have to be filled)
FRYLIB.SERVER.ITEM.ADD = function(source, item, count, metadata, slot, cb)
    local DATA = {}
    DATA.SUCCESS, DATA.RESPONSE = exports.ox_inventory:AddItem(source, item, count, metadata, slot, cb)
    DEBUG.CREATEMESSAGE(DATA, 'ITEMS SERVER')
    return DATA
end

-- - @params inventory - source (who belongs that inventory)
-- - @params item - string (which item)
-- - @params count - number how many (which item)
-- - @params metadata - table (dont have to be filled)
-- - @params slot - number (dont have to be filled)
FRYLIB.SERVER.ITEM.REMOVE = function(inv, item, count, metadata, slot)
    local DATA = {}
    DATA.SUCCESS = exports.ox_inventory:RemoveItem(inv, item, count, metadata, slot)
    DEBUG.CREATEMESSAGE(DATA, 'ITEMS SERVER')
    return DATA
end

-- - @information get total amount of items
-- - @params inventory - source (who belongs that inventory)
-- - @params item - string (which item)
-- - @params metadata - table (dont have to be filled)
-- - @params returnsCount - boolean | If returnsCount is set to true, the returned value will be the count based on how many times the item was found.
FRYLIB.SERVER.ITEM.GET = function(inv, item, metadata, returnsCount)
    local DATA = {}
    DATA =  exports.ox_inventory:GetItem(inv, item, metadata, returnsCount)
    DEBUG.CREATEMESSAGE(DATA, 'ITEMS SERVER')
    return DATA
end

-- - @information check if player can carry that weight
-- - @params inventory - source (who belongs that inventory)
-- - @params item - string (which item)
FRYLIB.SERVER.ITEM.CANCARRY = function(inv, item)
    local DATA = {}
    DATA =  exports.ox_inventory:CanCarryAmount(inv, item)
    DEBUG.CREATEMESSAGE(DATA, 'ITEMS SERVER')
    return DATA
end

-- - @information - get weapon
-- - @params inventory - source (who belongs that inventory)
FRYLIB.SERVER.ITEM.GETWEAPON = function(inv)
    local DATA = {}
    DATA =  exports.ox_inventory:GetCurrentWeapon(inv)
    DEBUG.CREATEMESSAGE(DATA, 'ITEMS SERVER')
    return DATA
end

-- - @information - Search, item
-- - @params search - string ('slots', 'count')
-- - @params items - table or string
-- - @params metadata - table or string
FRYLIB.SERVER.ITEM.SEARCHITEM = function(inv, search, item, metadata)
    local DATA = {}
    DATA =  exports.ox_inventory:Search(inv, search, item, metadata)
    DEBUG.CREATEMESSAGE(DATA, 'ITEMS SERVER')
    return DATA
end