local OBJECT = FRYLIB.INITEXPORT()
FRYLIB.PLAYER.ITEMS = {}
local PED = nil
local PLAYERDATA = nil

AddEventHandler(Config.DATAFRAMEWORK[Config.USEFRAMEWORK].PLAYER_LOAD, function()
    PLAYERDATA = OBJECT.Functions.GetPlayerData()
end)

-- GET ALL ITEMS OF THE PLAYER
FRYLIB.PLAYER.ITEMS.GETALL = function()
    local DATA = nil
    if Config.INITLIB.INVENTORY == 'ox_inventory' then
        DATA = exports.ox_inventory:GetPlayerItems()
        DEBUG.CREATEMESSAGE(DATA)
        return DATA
    end
    if Config.INITLIB.INVENTORY == 'qb-inventory' then
        DATA = PLAYERDATA.items
        DEBUG.CREATEMESSAGE(DATA)
        return DATA
    end
end


-- @params name - Get Specifi Item
-- @params count - True or False to get Item Count
FRYLIB.PLAYER.ITEMS.GETITEM = function(name, count)
    local getCount = count
    local hasItem = false
    if Config.INITLIB.INVENTORY == 'ox_inventory' and getCount == nil then
        if exports.ox_inventory:Search('count', name) > 0 then 
            hasItem = true
            return hasItem
        end
    elseif Config.INITLIB.INVENTORY == 'ox_inventory' and getCount then
        return exports.ox_inventory:GetItemCount(name)
    end
end

-- - @information Get current weapon
FRYLIB.PLAYER.ITEMS.GETCURRENTWEAPON = function()
    local DATA = {}
    DATA = exports.ox_inventory:getCurrentWeapon()
    DEBUG.CREATEMESSAGE(DATA, 'INVENTORY CLIENT')
    return DATA
end
-- - @information Search items
-- - @params search string | 'slots', 'count'
-- - @params what item string
FRYLIB.PLAYER.ITEMS.SEARCH = function(search, item, metadata)
    local DATA = {}
    DATA = exports.ox_inventory:Search(search, item, metadata)
    DEBUG.CREATEMESSAGE(DATA, 'INVENTORY CLIENT')
    return DATA
end

CreateThread(function()
    local show = FRYLIB.CHECKFUNCTIONS(Config.ShowAllData, 'item')
    if show then
        FRYLIB.PLAYER.GETITEM('cash')
        FRYLIB.PLAYER.ITEMS.GETALL()
    end
end)