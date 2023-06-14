local OBJECT = FRYLIB.INITEXPORT()
local PLAYERDATA = OBJECT.Functions.GetPlayerData()
FRYLIB.INVENTORY = {}

-- - @information Opens Inventory of a 'player', 'shop', 'stash'....  (ox_inv)
-- - @params type string - 'player' 'shop' 'stash'  'crafting' 'container' 'drop' 'glovebox'..
-- - @params data table/string/number
FRYLIB.INVENTORY.OPENINV = function(type, data)
    local DATA = {}
    DATA = exports.ox_inventory:openInventory(type, data)
    DEBUG.CREATEMESSAGE(DATA, 'INVENTORY CLIENT')
    return DATA
end
-- - @information If possible opens the nearby player's inventory. (ox_inv)
FRYLIB.INVENTORY.OPENNEARINV = function()
    local DATA = {}
    DATA = exports.ox_inventory:openNearbyInventory()
    DEBUG.CREATEMESSAGE(DATA, 'INVENTORY CLIENT')
    return DATA
end

-- - @information Closes the player's inventory. (ox_inv)
FRYLIB.INVENTORY.CLOSE = function()
    local DATA = {}
    DATA = exports.ox_inventory:closeInventory()
    DEBUG.CREATEMESSAGE(DATA, 'INVENTORY CLIENT')
    return DATA
end

-- -  @information shows all Items
FRYLIB.INVENTORY.ALLITEMS = function()
    local DATA = {}
    DATA = exports.ox_inventory:closeInventory()
    DEBUG.CREATEMESSAGE(DATA, 'INVENTORY CLIENT')
    return DATA
end