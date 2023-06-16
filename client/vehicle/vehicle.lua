FRYLIB.VEHICLE = {}
local OBJECT = FRYLIB.INITEXPORT()
local LANG = TRANSLATION.getTrasnlation()
	
FRYLIB.VEHICLE.BONE = {
    WheelBoneName = {
		['0'] = 'wheel_lf',
		['1'] = 'wheel_rf',
		['2'] = 'wheel_lm1',
		['3'] = 'wheel_rm1',
		['4'] = 'wheel_lr',
		['5'] = 'wheel_rr'
	},
	VehicleWheels = {-- Vehicle with 6 wheels.
		['wheel_front_left'] = {label = LANG.wheel.wheel_f_l, bone = 'wheel_lf', index = 0, wheelId = 0},
		['wheel_front_right'] = {label = LANG.wheel.wheel_f_r, bone = 'wheel_rf', index = 1, wheelId = 1},
		['wheel_middle_left'] = {label = LANG.wheel.wheel_m_l, bone = 'wheel_lm1', index = 2, wheelId = 2},
		['wheel_middle_right'] = {label = LANG.wheel.wheel_m_r, bone = 'wheel_rm1', index = 3, wheelId = 3},
		['wheel_left_right'] = {label = LANG.wheel.wheel_b_l, bone = 'wheel_lr', index = 4, wheelId = 4},
		['wheel_left_left'] = {label = LANG.wheel.wheel_b_r, bone = 'wheel_rr', index = 5, wheelId = 5},
	},

	VehicleDoors = {
		['door_f_l'] = {label = LANG.door.door_f_l, bone = 'door_dside_f', bone2 = 'seat_dside_f', index = 0},
		['door_f_r'] = {label = LANG.door.door_f_r, bone = 'door_pside_f', bone2 = 'seat_pside_f', index = 1},
		['door_r_l'] = {label = LANG.door.door_b_l, bone = 'door_dside_r', bone2 = 'seat_dside_r', index = 2},
		['3'] = {label = LANG.door.door_b_r, bone = 'door_pside_r', bone2 = 'seat_pside_r', index = 3},
		['hood'] = {label = LANG.door.hood, bone = 'bonnet', index = 4},
		['trunk'] = {label = LANG.door.trunk, bone = 'boot', index = 5},
	},

	VehicleWindows = {
		['window_lf'] = {label = LANG.window.window_f_l, bone = 'window_lf', index = 0},
		['window_rf'] = {label = LANG.window.window_f_r, bone = 'window_rf', index = 1},
		['window_lr'] = {label = LANG.window.window_b_l, bone = 'window_lr', index = 2},
		['window_rr'] = {label = LANG.window.window_b_r, bone = 'window_rr', index = 3},
		['windscreen'] = {label = LANG.window.window_widescreen_f, bone = 'windscreen', index = 6},
		['windscreen_r'] = {label = LANG.window.window_widescreen_b, bone = 'windscreen_r', index = 7},
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

-- - @information Get Vehicle Bone Position
-- - @params veh - hash
-- - @params type string - VehicleWheels | VehicleDoors | VehicleWindows
-- - @params bonename string - wheel_front_left...
FRYLIB.VEHICLE.GETBONEPOSITION = function(veh,type,bonename)
	local DATA = {}
	local type = FRYLIB.VEHICLE.BONE[type][bonename].index
	DATA = GetWorldPositionOfEntityBone(veh,type)
	DEBUG.CREATEMESSAGE(DATA, 'VEHICEL')
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