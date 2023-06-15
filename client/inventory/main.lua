local OBJECT = FRYLIB.INITEXPORT()
FRYLIB.INVENTORY = {}

local PLAYERDATA = nil
local LOADED = false

AddEventHandler(Config.DATAFRAMEWORK[Config.USEFRAMEWORK].PLAYER_LOAD, function()
    PLAYERDATA = OBJECT.Functions.GetPlayerData()
    LOADED = true
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
         if LOADED then
             PLAYERDATA = OBJECT.Functions.GetPlayerData()
         end
    end
end)

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