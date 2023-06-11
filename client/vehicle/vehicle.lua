FRYLIB.VEHICLE = {}
local OBJECT = FRYLIB.INITEXPORT()
local LANG = translation.getTrasnlation()
local PED = nil
local PLAYERDATA = OBJECT.Functions.GetPlayerData()

FRYLIB.VEHICLE.BONE = {
    WheelBoneName = {
		['0'] = 'wheel_lf',
		['1'] = 'wheel_rf',
		['2'] = 'wheel_lm1',
		['3'] = 'wheel_rm1',
		['4'] = 'wheel_lr',
		['5'] = 'wheel_rr'
	},
	VehicleWheels = {
		['2'] = { -- Bike and cycle.
			['0'] = {label = 'Wheel Front', bone = 'wheel_lf', index = 0, wheelId = 0},
			['4'] = {label = 'Wheel Rear', bone = 'wheel_lr', index = 4, wheelId = 1},
		},
		['3'] = { -- Vehicle with 3 wheels (get for wheels because some 3 wheels vehicles have 2 wheels on front and one rear or the reverse).
			['0'] = {label = 'Wheel Front (L)', bone = 'wheel_lf', index = 0, wheelId = 0},
			['1'] = {label = 'Wheel Front (R)', bone = 'wheel_rf', index = 1, wheelId = 1},
			['4'] = {label = 'Wheel Rear (L)', bone = 'wheel_lr', index = 4, wheelId = 2},
			['5'] = {label = 'Wheel Rear (R)', bone = 'wheel_rr', index = 5, wheelId = 3},
		},
		['4'] = { -- Vehicle with 4 wheels.
			['0'] = {label = 'Wheel Front (L)', bone = 'wheel_lf', index = 0, wheelId = 0},
			['1'] = {label = 'Wheel Front (R)', bone = 'wheel_rf', index = 1, wheelId = 1},
			['4'] = {label = 'Wheel Rear (L)', bone = 'wheel_lr', index = 4, wheelId = 2},
			['5'] = {label = 'Wheel Rear (R)', bone = 'wheel_rr', index = 5, wheelId = 3},
		},
		['6'] = { -- Vehicle with 6 wheels.
			['0'] = {label = 'Wheel Front (L)', bone = 'wheel_lf', index = 0, wheelId = 0},
			['1'] = {label = 'Wheel Front (R)', bone = 'wheel_rf', index = 1, wheelId = 1},
			['2'] = {label = 'Wheel Middle (L)', bone = 'wheel_lm1', index = 2, wheelId = 2},
			['3'] = {label = 'Wheel Middle (R)', bone = 'wheel_rm1', index = 3, wheelId = 3},
			['4'] = {label = 'Wheel Rear (L)', bone = 'wheel_lr', index = 4, wheelId = 4},
			['5'] = {label = 'Wheel Rear (R)', bone = 'wheel_rr', index = 5, wheelId = 5},
		}
	},

	VehicleDoors = {
		['0'] = {label = 'Door Front (L)', bone = 'door_dside_f', bone2 = 'seat_dside_f', index = 0},
		['1'] = {label = 'Door Front (R)', bone = 'door_pside_f', bone2 = 'seat_pside_f', index = 1},
		['2'] = {label = 'Door Rear (L)', bone = 'door_dside_r', bone2 = 'seat_dside_r', index = 2},
		['3'] = {label = 'Door Rear (R)', bone = 'door_pside_r', bone2 = 'seat_pside_r', index = 3},
		['4'] = {label = 'Hood', bone = 'bonnet', index = 4},
		['5'] = {label = 'Trunk', bone = 'boot', index = 5},
	},

	VehicleWindows = {
		['0'] = {label = 'Window Front (L)', bone = 'window_lf', index = 0},
		['1'] = {label = 'Window Front (R)', bone = 'window_rf', index = 1},
		['2'] = {label = 'Window Rear (L)', bone = 'window_lr', index = 2},
		['3'] = {label = 'Window Rear (R)', bone = 'window_rr', index = 3},
		['6'] = {label = 'Windscreen Front', bone = 'windscreen', index = 6},
		['7'] = {label = 'Windscreen Rear', bone = 'windscreen_r', index = 7},
	},

}

-- INFORMATION
FRYLIB.VEHICLE.TYPE = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.INSIDE = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.STATE = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.GETCLOSESBONE = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.CLOSES = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.GETFUEL = function()
    local getVehicle = GetVehiclePedIsUsing(PlayerPedId())
    local DATA = exports[Config.INITLIB.SYSTEM.FUEL]:GetFuel(getVehicle) 
    DEBUG.CREATEMESSAGE(math.floor(DATA))
    return DATA
end

FRYLIB.VEHICLE.IMPOUND = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.PROPERTIES = function()
    local DATA = lib.getVehicleProperties(GetVehiclePedIsUsing(PlayerPedId()))
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

FRYLIB.VEHICLE.SETPROPERTTIES = function(properties)
    local getVehicle = GetVehiclePedIsUsing(PlayerPedId())
    if properties == nil then DEBUG.CREATEMESSAGE('NO PROPERITES FOR VEHICLE') return end
    lib.setVehicleProperties(getVehicle,  properties)
    DEBUG.CREATEMESSAGE("CAR PROPPERITES SET")
end

FRYLIB.VEHICLE.SPAWN = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

-- - @params maxDistance: Number - Max Distance to check
-- - @params includePlayerVehicle:  Boolean - Whether or not to include the player's current vehicle.
FRYLIB.VEHICLE.GETNEARBYCAR = function(maxDistance, includePlayerVehicle)
    local coords = FRYLIB.PLAYER.COORDS()
    if Config.INITLIB.SYSTEM.ADDONLIB == 'ox_lib' then
        local data = lib.getNearbyVehicles(coords, maxDistance, includePlayerVehicle)
        DEBUG.CREATEMESSAGE(data, 'VEHICLE')
        return data
    end
end

CreateThread(function()
    local show = FRYLIB.CHECKFUNCTIONS(Config.ShowAllData, 'vehicle')
    if show then
        --FRYLIB.VEHICLE.SETPROPERTTIES()
        FRYLIB.VEHICLE.GETFUEL()
        --FRYLIB.VEHICLE.GETNEARBYCAR(10,true)
    end
end)