-- INIT OBJECT
local OBJECT = FRYLIB.INITEXPORT()

FRYLIB.PLAYER = {}
local PED = nil
local PLAYERDATA = nil

AddEventHandler(Config.FRAMEWORK[Config.USEFRAMEWORK].PLAYER_LOAD, function()
    PLAYERDATA = OBJECT.Functions.GetPlayerData()
end)


FRYLIB.PLAYER.GETALLDATA = function()
    local DATA = PLAYERDATA
    DEBUG.CREATEMESSAGE(PLAYERDATA, 'PLAYER')
    return DATA
end

-- - @params type: 'full' |  'last' | 'first'
FRYLIB.PLAYER.NAME = function(type)
    local name = nil

    switch(type, {
        ["full"] = function()
            name = PLAYERDATA.charinfo.lastname .. ' ' .. PLAYERDATA.charinfo.firstname
            DEBUG.CREATEMESSAGE(name, 'PLAYER')
        end,
        ["last"] = function ()
            name = PLAYERDATA.charinfo.lastname
            DEBUG.CREATEMESSAGE(name, 'PLAYER')
        end,
        ["first"] = function()
            name = PLAYERDATA.charinfo.firstname
            DEBUG.CREATEMESSAGE(name, 'PLAYER')
        end,
    })

    return name
end

-- - @params type: 'bank' |  'cash'
FRYLIB.PLAYER.GETMONEY = function(type)
    local DATA = nil
    if type == nil then DEBUG.CREATEMESSAGE('NO TYPE DEFINED FOR MONEY', 'PLAYER') return end

    switch(type, {
        ["bank"] = function ()
            DATA = PLAYERDATA.money.bank
        end,
        ["cash"] = function()
            DATA = PLAYERDATA.money.cash
        end,
    })

    DEBUG.CREATEMESSAGE(type..' '..DATA, 'PLAYER')
    return DATA
end

FRYLIB.PLAYER.CID = function()
    local DATA = PLAYERDATA.citizenid
    DEBUG.CREATEMESSAGE('CitizendId '..DATA, 'PLAYER')
    return DATA
end

FRYLIB.PLAYER.PHONE = function()
    local DATA = PLAYERDATA.charinfo.phone
    DEBUG.CREATEMESSAGE('Phone Number '..DATA, 'PLAYER')
    return DATA
end

FRYLIB.PLAYER.FINGERPRINT = function()
    local DATA = PLAYERDATA.metadata.fingerprint
    DEBUG.CREATEMESSAGE('FINGERPRINT '..DATA, 'PLAYER')
    return DATA
end

FRYLIB.PLAYER.HUNGER = function()
    local DATA = PLAYERDATA.metadata.hunger
    DEBUG.CREATEMESSAGE('PLAYER HUNGER  '..DATA, 'PLAYER')
    return DATA
end

FRYLIB.PLAYER.THIRST = function()
    local DATA = PLAYERDATA.metadata.thirst
    DEBUG.CREATEMESSAGE('PLAYER THIRST'..DATA, 'PLAYER')
    return DATA
end

FRYLIB.PLAYER.ISHANDCUFFED = function()
    local DATA = PLAYERDATA.metadata.ishandcuffed
    local MESSAGE = nil
    if DATA then
        MESSAGE = 'IS HANDCUFFED = TRUE'
    else
        MESSAGE = 'IS HANDCUFFED = FALSE'
    end
    DEBUG.CREATEMESSAGE(MESSAGE, 'PLAYER')
    return DATA
end

FRYLIB.PLAYER.LASTSTAND = function()
    local DATA = PLAYERDATA.metadata.inlaststand
    local MESSAGE = nil
    if DATA then
        MESSAGE = 'IS IN LASTSTAND = TRUE'
    else
        MESSAGE = 'IS IN LASTSTAND = FALSE'
    end
    DEBUG.CREATEMESSAGE(MESSAGE, 'PLAYER')
    return DATA
end

-- - @params maxDistance: Number - Max Distance a Player can be
-- - @params includePlayer: Boolean - If Includes your Player
FRYLIB.PLAYER.GETCLOSESPLAYER = function(maxDistance, includePlayer)
    local coords = FRYLIB.PLAYER.COORDS()

    if Config.INITLIB.SYSTEM.ADDONLIB == 'ox_lib' then
        local data = lib.getClosestPlayer(coords, maxDistance, includePlayer)
        DEBUG.CREATEMESSAGE(data, 'PLAYER')
        return data
    end
end


-- - @params maxDistance: Number - Max Distance a Player can be
-- - @params includePlayer: Boolean - If Includes your Player
FRYLIB.PLAYER.GETCLOSESID = function(maxDistance, includePlayer)
    local coords = FRYLIB.PLAYER.COORDS()

    if Config.INITLIB.SYSTEM.ADDONLIB == 'ox_lib' then
        local data = lib.getClosestPlayer(coords, maxDistance, includePlayer)
        local player = GetPlayerServerId(data)
        DEBUG.CREATEMESSAGE(player, 'PLAYER')
        return player
    end
end

-- - @params maxDistance: Number - Max Distance a Player can be
-- - @params includePlayer: Boolean - If Includes your Player
FRYLIB.PLAYER.GETNEARPLAYERS = function(maxDistance, includePlayer)
    local coords = FRYLIB.PLAYER.COORDS()

    if Config.INITLIB.SYSTEM.ADDONLIB == 'ox_lib' then
        local data = lib.getNearbyPlayers(coords, maxDistance, includePlayer)
        DEBUG.CREATEMESSAGE(data, 'PLAYER')
        return data
    end
end

FRYLIB.PLAYER.COORDS = function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    DEBUG.CREATEMESSAGE(coords, 'PLAYER')
    return coords
end

-- - @params string: bonename 
-- - @information: Get Bones pastebin.com/D7JMnX1g  
FRYLIB.PLAYER.GETBONEPOSITION = function(bonename)
    local ped = PlayerPedId()
    local boneNumber = FRYLIB.PLAYER.GETBONEINDEX(bonename)
    local bonePosition = GetPedBoneCoords(ped, boneNumber, 0, 0, 0)
    DEBUG.CREATEMESSAGE(bonePosition, 'PLAYER')
    return bonePosition
end

-- - @params string: Bone Name 
FRYLIB.PLAYER.GETBONEINDEX = function(bone)
    local bones = {
        ["SKEL_ROOT"] = 0,
        ["FB_R_Brow_Out_000"] = 1356,
        ["SKEL_L_Toe0"] = 2108,
        ["MH_R_Elbow"] = 2992,
        ["SKEL_L_Finger01"] = 4089,
        ["SKEL_L_Finger02"] = 4090,
        ["SKEL_L_Finger31"] = 4137,
        ["SKEL_L_Finger32"] = 4138,
        ["SKEL_L_Finger41"] = 4153,
        ["SKEL_L_Finger42"] = 4154,
        ["SKEL_L_Finger11"] = 4169,
        ["SKEL_L_Finger12"] = 4170,
        ["SKEL_L_Finger21"] = 4185,
        ["SKEL_L_Finger22"] = 4186,
        ["RB_L_ArmRoll"] = 5232,
        ["IK_R_Hand"] = 6286,
        ["RB_R_ThighRoll"] = 6442,
        ["SKEL_R_Clavicle"] = 10706,
        ["FB_R_Lip_Corner_000"] = 11174,
        ["SKEL_Pelvis"] = 11816,
        ["IK_Head"] = 12844,
        ["SKEL_L_Foot"] = 14201,
        ["MH_R_Knee"] = 16335,
        ["FB_LowerLipRoot_000"] = 17188,
        ["FB_R_Lip_Top_000"] = 17719,
        ["SKEL_L_Hand"] = 18905,
        ["FB_R_CheekBone_000"] = 19336,
        ["FB_UpperLipRoot_000"] = 20178,
        ["FB_L_Lip_Top_000"] = 20279,
        ["FB_LowerLip_000"] = 20623,
        ["SKEL_R_Toe0"] = 20781,
        ["FB_L_CheekBone_000"] = 21550,
        ["MH_L_Elbow"] = 22711,
        ["SKEL_Spine0"] = 23553,
        ["RB_L_ThighRoll"] = 23639,
        ["PH_R_Foot"] = 24806,
        ["SKEL_Spine1"] = 24816,
        ["SKEL_Spine2"] = 24817,
        ["SKEL_Spine3"] = 24818,
        ["FB_L_Eye_000"] = 25260,
        ["SKEL_L_Finger00"] = 26610,
        ["SKEL_L_Finger10"] = 26611,
        ["SKEL_L_Finger20"] = 26612,
        ["SKEL_L_Finger30"] = 26613,
        ["SKEL_L_Finger40"] = 26614,
        ["FB_R_Eye_000"] = 27474,
        ["SKEL_R_Forearm"] = 28252,
        ["PH_R_Hand"] = 28422,
        ["FB_L_Lip_Corner_000"] = 29868,
        ["SKEL_Head"] = 31086,
        ["IK_R_Foot"] = 35502,
        ["RB_Neck_1"] = 35731,
        ["IK_L_Hand"] = 36029,
        ["SKEL_R_Calf"] = 36864,
        ["RB_R_ArmRoll"] = 37119,
        ["FB_Brow_Centre_000"] = 37193,
        ["SKEL_Neck_1"] = 39317,
        ["SKEL_R_UpperArm"] = 40269,
        ["FB_R_Lid_Upper_000"] = 43536,
        ["RB_R_ForeArmRoll"] = 43810,
        ["SKEL_L_UpperArm"] = 45509,
        ["FB_L_Lid_Upper_000"] = 45750,
        ["MH_L_Knee"] = 46078,
        ["FB_Jaw_000"] = 46240,
        ["FB_L_Lip_Bot_000"] = 47419,
        ["FB_Tongue_000"] = 47495,
        ["FB_R_Lip_Bot_000"] = 49979,
        ["SKEL_R_Thigh"] = 51826,
        ["SKEL_R_Foot"] = 52301,
        ["IK_Root"] = 56604,
        ["SKEL_R_Hand"] = 57005,
        ["SKEL_Spine_Root"] = 57597,
        ["PH_L_Foot"] = 57717,
        ["SKEL_L_Thigh"] = 58271,
        ["FB_L_Brow_Out_000"] = 58331,
        ["SKEL_R_Finger00"] = 58866,
        ["SKEL_R_Finger10"] = 58867,
        ["SKEL_R_Finger20"] = 58868,
        ["SKEL_R_Finger30"] = 58869,
        ["SKEL_R_Finger40"] = 58870,
        ["PH_L_Hand"] = 60309,
        ["RB_L_ForeArmRoll"] = 61007,
        ["SKEL_L_Forearm"] = 61163,
        ["FB_UpperLip_000"] = 61839,
        ["SKEL_L_Calf"] = 63931,
        ["SKEL_R_Finger01"] = 64016,
        ["SKEL_R_Finger02"] = 64017,
        ["SKEL_R_Finger31"] = 64064,
        ["SKEL_R_Finger32"] = 64065,
        ["SKEL_R_Finger41"] = 64080,
        ["SKEL_R_Finger42"] = 64081,
        ["SKEL_R_Finger11"] = 64096,
        ["SKEL_R_Finger12"] = 64097,
        ["SKEL_R_Finger21"] = 64112,
        ["SKEL_R_Finger22"] = 64113,
        ["SKEL_L_Clavicle"] = 64729,
        ["FACIAL_facialRoot"] = 65068,
        ["IK_L_Foot"] = 65245
    }
    if bones[bone] then
        DEBUG.CREATEMESSAGE('BONE FOUND', 'PLAYER')
        DEBUG.CREATEMESSAGE(bones[bone], 'PLAYER')
        return bones[bone]
    end
end

CreateThread(function()
    local show = FRYLIB.CHECKFUNCTIONS(Config.ShowAllData, 'PLAYER')
    if show then
        FRYLIB.PLAYER.NAME()
        FRYLIB.PLAYER.GETMONEY('cash')
        FRYLIB.PLAYER.CID()
        FRYLIB.PLAYER.PHONE()
        FRYLIB.PLAYER.FINGERPRINT()
        FRYLIB.PLAYER.HUNGER()
        FRYLIB.PLAYER.THIRST()
        FRYLIB.PLAYER.ISHANDCUFFED()
        FRYLIB.PLAYER.LASTSTAND()
        FRYLIB.PLAYER.COORDS()
    end
end)