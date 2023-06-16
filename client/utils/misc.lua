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
FRYLIB.MISC.DRAW3D = function(vec, text, offsizeX, offsizeY, offsizeZ)
    local TABLE = {}
    TABLE.VEC = vec
    TABLE.TEXT = text

    TABLE.offsizeX = offsizeX or 0
    TABLE.offsizeY = offsizeY or 0
    TABLE.offsizeZ = offsizeZ or 0
    
    DEBUG.CREATEMESSAGE(TABLE, 'MISC')

    local drawX = nil
    local drawY = nil
    local drawZ = nil

    SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)

    drawX = TABLE.VEC.x + TABLE.offsizeX

    drawY = TABLE.VEC.y + TABLE.offsizeY

    drawZ = TABLE.VEC.z + TABLE.offsizeZ

	SetDrawOrigin(drawX,drawY,drawZ, 0)
	local factor = (string.len(text)) / 370
	DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
	ClearDrawOrigin()

    SetDrawOrigin(drawX, drawY, drawZ, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(TABLE.TEXT)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
    DEBUG.CREATEMESSAGE('3D TEXT CREATED', 'MISC FUNCTION')
end

FRYLIB.MISC.DRAW2D = function(coords, text, width, height, scale, font, r, g, b, a)
    r = r or 255
    g = g or 255
    b = b or 255
    a = a or 215
    width = width or 1.0
    height = height or 1.0
    scale = scale or 0.35
    font = font or 4

    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(coords.x - width / 2, coords.y - height / 2 + 0.005)
    DEBUG.CREATEMESSAGE('2D TEXT CREATED', 'MISC FUNCTION')
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

-- - @information Notifications
-- - @params title string - String title
-- - @params title description - String description
-- - @params title type - String type
-- - @params title icon - String icon
FRYLIB.MISC.NOTIFY = function(data)
    lib.notify({titel = data.title, description = data.description, type = data.type, icon = data.icon })
    DEBUG.CREATEMESSAGE('GENERATE NOTIFICATION', 'MISC')
end

-- - @information SHOW UI FUNCTION
-- - @params input - table input.HASFOCUS = false, input.HASCURSOR false
-- - @params data - table send data to UI
FRYLIB.MISC.SHOWNUI = function(input, data)
    local DATA = data
    local NUI_SETTINGS = {}
    NUI_SETTINGS.HASFOCUS  = input.focus
    NUI_SETTINGS.HASCURSOR  = input.cursor
    if input then NUI_SETTINGS.HASFOCUS = false else NUI_SETTINGS.HASCURSOR = false end
    DEBUG.CREATEMESSAGE('NUI HAS FOCUS'.. NUI_SETTINGS.HASFOCUS)
    DEBUG.CREATEMESSAGE('NUI HAS CURSOR'.. NUI_SETTINGS.HASFOCUS)
    SetNuiFocus(NUI_SETTINGS.HASFOCUS,NUI_SETTINGS.HASCURSOR)
    DEBUG.CREATEMESSAGE(DATA, 'MISC')
    SendNuiMessage(json.encode(DATA))
end

-- - @information HIDE UI FUNCTION
FRYLIB.MISC.HIDENUI = function()
    local NUI_SETTINGS = {}
    NUI_SETTINGS.HASFOCUS  = false
    NUI_SETTINGS.HASCURSOR  = false
    SendNuiMessage(json.encode({action = 'hide'}))
    SetNuiFocus(NUI_SETTINGS.HASFOCUS,NUI_SETTINGS.HASCURSOR)
    DEBUG.CREATEMESSAGE('CLOSE NUI', 'MISC')
end