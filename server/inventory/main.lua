FRYLIB.SERVER.INVENTORY = {}
local OBJECT = FRYLIB.INITEXPORT()


-- - @information - Clears a player's inventory and saves it to a stash.
-- - @params source - number source of player
FRYLIB.SERVER.INVENTORY.REMOVEINV = function(source)
    local DATA = {}
    DATA.SUCCESS = exports.ox_inventory:ConfiscateInventory(source)
    DEBUG.CREATEMESSAGE(DATA, 'INVENTORY SERVER')
    return DATA
end

-- - @information - Returns the confiscated inventory back to the player
-- - @params source - number source of player
FRYLIB.SERVER.INVENTORY.RETURNINV = function(source)
    local DATA = {}
    DATA.SUCCESS = exports.ox_inventory:ReturnInventory(source)
    DEBUG.CREATEMESSAGE(DATA, 'INVENTORY SERVER')
    return DATA
end

-- - @information - Clears the specified inventory. The keep argument is either a string or an array of strings containing the name(s) of the item(s) to keep in the inventory after clearing.
-- - @params - source/inventory -
-- - @params - keep - table/string which items will be still available
FRYLIB.SERVER.INVENTORY.CLEARINV = function(source, keep)
    local DATA = {}
    DATA.SUCCESS = exports.ox_inventory:ClearInventory(source, keep)
    DEBUG.CREATEMESSAGE(DATA, 'INVENTORY SERVER')
    return DATA
end

-- - @information - Returns the inventory associated with the ID (and owner if defined). Otherwise returns null.
-- - @params - number/table 
-- - @params - owner boolean if decided
FRYLIB.SERVER.INVENTORY.GETINVENTORY = function(source, owner)
    local DATA = {}
    DATA.SUCCESS = exports.ox_inventory:GetInventory(source, owner)
    DEBUG.CREATEMESSAGE(DATA, 'INVENTORY SERVER')
    return DATA
end