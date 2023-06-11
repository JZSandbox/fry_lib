-- GTA5 NATIVES YOU CAN USE
FRYLIB.MISC = {}


-- @params vector3 - On which position to set 3DTEXT
-- @params text - What should be written on the Text
-- @params X - Offset of X position
-- @params Y - Offset of Y position
-- @params Z - Offset of Z position
-- @params addonX - if plus or minus (Calculates if offesets)
-- @params addonY - if plus or minus (Calculates if offesets)
-- @params addonZ - if plus or minus (Calculates if offesets)
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


-- @params vector3 - Vector3 Coord to set Blip
-- @params label - Create Name for blip
-- @params blipid - Give the Specific Blip Id | https://docs.fivem.net/docs/game-references/blips/
-- @params size - Which size the Blip should be | 0 - 1
-- @params color - Which color should be blip have | https://docs.fivem.net/docs/game-references/blips/#blip-colors
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

-- @params vector3 - Get PixelCoords relative to screen 
-- @information you get table back with x,y coords for your frontend
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

CreateThread(function ()
   
end)