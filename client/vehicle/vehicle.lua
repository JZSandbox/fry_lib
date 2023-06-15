FRYLIB.VEHICLE = {}
local OBJECT = FRYLIB.INITEXPORT()
local LANG = TRANSLATION.getTrasnlation()
local PED = nil
local PLAYERDATA = nil

AddEventHandler(Config.DATAFRAMEWORK[Config.USEFRAMEWORK].PLAYER_LOAD, function()
    PLAYERDATA = OBJECT.Functions.GetPlayerData()
end)
	
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
			['0'] = {label = LANG.wheel.front, bone = 'wheel_lf', index = 0, wheelId = 0},
			['4'] = {label = LANG.wheel.back, bone = 'wheel_lr', index = 4, wheelId = 1},
		},
		['3'] = { -- Vehicle with 3 wheels (get for wheels because some 3 wheels vehicles have 2 wheels on front and one rear or the reverse).
			['0'] = {label = LANG.wheel.wheel_f_l, bone = 'wheel_lf', index = 0, wheelId = 0},
			['1'] = {label = LANG.wheel.wheel_f_r, bone = 'wheel_rf', index = 1, wheelId = 1},
			['4'] = {label = LANG.wheel.wheel_b_l, bone = 'wheel_lr', index = 4, wheelId = 2},
			['5'] = {label = LANG.wheel.wheel_b_r, bone = 'wheel_rr', index = 5, wheelId = 3},
		},
		['4'] = { -- Vehicle with 4 wheels.
			['0'] = {label = LANG.wheel.wheel_f_l, bone = 'wheel_lf', index = 0, wheelId = 0},
			['1'] = {label = LANG.wheel.wheel_f_r, bone = 'wheel_rf', index = 1, wheelId = 1},
			['4'] = {label = LANG.wheel.wheel_b_l, bone = 'wheel_lr', index = 4, wheelId = 2},
			['5'] = {label = LANG.wheel.wheel_b_r, bone = 'wheel_rr', index = 5, wheelId = 3},
		},
		['6'] = { -- Vehicle with 6 wheels.
			['0'] = {label = LANG.wheel.wheel_f_l, bone = 'wheel_lf', index = 0, wheelId = 0},
			['1'] = {label = LANG.wheel.wheel_f_r, bone = 'wheel_rf', index = 1, wheelId = 1},
			['2'] = {label = LANG.wheel.wheel_m_l, bone = 'wheel_lm1', index = 2, wheelId = 2},
			['3'] = {label = LANG.wheel.wheel_m_r, bone = 'wheel_rm1', index = 3, wheelId = 3},
			['4'] = {label = LANG.wheel.wheel_b_l, bone = 'wheel_lr', index = 4, wheelId = 4},
			['5'] = {label = LANG.wheel.wheel_b_r, bone = 'wheel_rr', index = 5, wheelId = 5},
		}
	},

	VehicleDoors = {
		['0'] = {label = LANG.door.door_f_l, bone = 'door_dside_f', bone2 = 'seat_dside_f', index = 0},
		['1'] = {label = LANG.door.door_f_r, bone = 'door_pside_f', bone2 = 'seat_pside_f', index = 1},
		['2'] = {label = LANG.door.door_b_l, bone = 'door_dside_r', bone2 = 'seat_dside_r', index = 2},
		['3'] = {label = LANG.door.door_b_r, bone = 'door_pside_r', bone2 = 'seat_pside_r', index = 3},
		['4'] = {label = LANG.door.hood, bone = 'bonnet', index = 4},
		['5'] = {label = LANG.door.trunk, bone = 'boot', index = 5},
	},

	VehicleWindows = {
		['0'] = {label = LANG.window.window_f_l, bone = 'window_lf', index = 0},
		['1'] = {label = LANG.window.window_f_r, bone = 'window_rf', index = 1},
		['2'] = {label = LANG.window.window_b_l, bone = 'window_lr', index = 2},
		['3'] = {label = LANG.window.window_b_r, bone = 'window_rr', index = 3},
		['6'] = {label = LANG.window.window_widescreen_f, bone = 'windscreen', index = 6},
		['7'] = {label = LANG.window.window_widescreen_b, bone = 'windscreen_r', index = 7},
	},

}

-- INFORMATION
FRYLIB.VEHICLE.TYPE = function()
    local DATA = PLAYERDATA.job.payment
    DEBUG.CREATEMESSAGE(DATA)
    return DATA
end

-- - Get Vehicle ID where current PED is in
FRYLIB.VEHICLE.INSIDE = function()
    local DATA = GetVehiclePedIsIn(PlayerPedId(), false)
    DEBUG.CREATEMESSAGE(DATA, 'VEHICLE')
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
    DEBUG.CREATEMESSAGE(math.floor(DATA), 'VEHICEL')
    return DATA
end

-- - Is Vehicle Impounded
-- - @params - Car license plate
FRYLIB.VEHICLE.ISIMPOUND = function(plate)
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
    DEBUG.CREATEMESSAGE("CAR PROPPERITES SET", 'VEHICLE')
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
        FRYLIB.VEHICLE.PROPERTIES()
    end
end)