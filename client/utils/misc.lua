-- GTA5 NATIVES YOU CAN USE
FRYLIB.MISC = {}


-- - @param vector3: On which position to set 3DTEXT
-- - @param text: What should be written on the Text
-- - @param X: Offset of X position
-- - @param Y: Offset of Y position
-- - @param Z: Offset of Z position
-- - @param addonX: if plus or minus (Calculates if offesets)
-- - @param addonY: if plus or minus (Calculates if offesets)
-- - @param addonZ: if plus or minus (Calculates if offesets)
FRYLIB.MISC.DRAW3D = function(vector3, text, offsizeX, offsizeY, offsizeZ, addonX, addonY, addonZ)
    if offsizeX == nil then offsizeX = 0 end
    if offsizeY == nil then offsizeY = 0 end
    if addonX == nil then addonX = 'plus' end
    if addonY == nil then addonY = 'plus' end
    if addonZ == nil then addonY = 'plus' end

    local drawX = vector3.x
    local drawY = vector3.y
    local drawZ = vector3.z

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)

    if addonX == 'plus' then drawX = vector3.x  + offsizeX else drawX = vector3.x  - offsizeX end
    if addonY == 'plus' then drawY = vector3.y + offsizeY else drawY = vector3.y - offsizeY end
    if addonZ == 'plus' then drawZ = vector3.z + offsizeZ else drawZ = vector3.z - offsizeZ end

    SetDrawOrigin(drawX, drawY, drawZ, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
    DEBUG.CREATEMESSAGE('3D TEXT CREATED', 'MISC FUNCTION')
end

--- Create a blip on the map.
-- - @param vector3: vector3 The coordinates of the blip.
-- - @param label: string The label of the blip.
-- - @param blipid: number The ID of the blip sprite. https://docs.fivem.net/docs/game-references/blips/
-- - @param size: number The size of the blip.
-- - @param color: number The color of the blip. https://docs.fivem.net/docs/game-references/blips/#blip-colors
FRYLIB.MISC.CREATEBLIP = function(vector3, label, blipid, size, color)
    local blip = AddBlipForCoord(vector3.x, vector3.y, vector3.z)
    SetBlipSprite(blip, blipid)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, size)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(label)
    EndTextCommandSetBlipName(blip)
end

--- Get pixel coordinates from world coordinates.
-- - @param vec: vector3 The world coordinates.
-- - @return position: table The pixel coordinates.
FRYLIB.MISC.GETPIXELCOORDS = function(vec)
    local success, screenX, screenY = GetScreenCoordFromWorldCoord(vec.X,vec.Y,vec.Z)
    local screenWidth, screenHeight = GetActiveScreenResolution()

    local position = {
        x = screenX * screenWidth,
        y = screenY * screenHeight,
    }
    if not success then DEBUG.CREATEMESSAGE('PIXEL COORDS NOT AVAIBLE DOE TO NOT RENDER/VISIABLE TO SCRIPT CAMERA', 'MISC') return end
    
    DEBUG.CREATEMESSAGE(position, 'MISC')

    return position
end

-- - @information Set Model for current Ped
-- - @params Model string - Model name example : 'ig_oneil'
FRYLIB.MISC.SETMODEL = function(Model)
    local DATA = Model
    local PED = PlayerPedId()
    Model = GetHashKey(DATA)
    Wait(100)
	if IsModelValid(DATA) then
	if not HasModelLoaded(DATA) then
		RequestModel(DATA)
		while not HasModelLoaded(DATA) do
			Citizen.Wait(1000)
		end
	end
	SetPlayerModel(PlayerId(), DATA)
	SetPedDefaultComponentVariation(PED)
	SetModelAsNoLongerNeeded(DATA)
	end
    DEBUG.CREATEMESSAGE('SET PED TO MODEL: '..DATA, 'MISC')
end

-- - @information - Reloadskin for player ped
FRYLIB.MISC.SETNORMALPED = function()
    if Config.INITLIB.SYSTEM.CLOTHING == 'fivemapperance' then
        ExecuteCommand('reloadskin')
        DEBUG.CREATEMESSAGE('SET PED TO NORMAL', 'MISC')
    end
end

-- - @information Create Dispatch mdt-dispatch | Easy integration
-- - @params coords vec3 - send coords for map
-- - @params message string - What message will be shown
-- - @params dipspatchCode string - The dispatch Code
-- - @params description string - What is happening?
-- - @params radius number - if the blip has a radius
-- - @params color number - Blip Color
-- - @params scale numebr - Blip Scale 
-- - @params length numebr - How long it stays on the map
FRYLIB.MISC.CREATEDISPATCH = function(coords, message, dispatchCode, description, radius, sprite, color, scale, length)
    local DATA = {}

    if Config.INITLIB.SYSTEM.DISPATCH == 'mdt-dispatch' then
        if radius == nil then radius = 0 end
        if sprite == nil then sprite = 64 end
        if color == nil then color = 2 end
        if scale == nil then scale = 1.0 end
        if length == nil then scale = 3 end

        DATA.coords = coords
        DATA.message = message
        DATA.dispatchCode = dispatchCode
        DATA.description = description
        DATA.radius = radius
        DATA.sprite = sprite
        DATA.color = color
        DATA.scale = scale
        DATA.length = length

        DEBUG.CREATEMESSAGE('CREATE DISPATCH', 'MISC')
        DEBUG.CREATEMESSAGE(DATA, 'MISC')

        exports["ps-dispatch"]:CustomAlert(DATA)
    end
end