Config = {}
-- LEVEL 1 : PRINTS CLIENT | LEVEL 2 : SHOWS TABLE | LEVEL : 3 CLIENT, TABLE, SERVER SIDE PRINTS
Config.DEBUGLEVEL = 2 --
Config.DEBUGINDENTSIZE = 5 -- SET INDENT SIZE FOR JSON.ENCODE PRINT

Config.USEFRAMEWORK = 'qb'
Config.LANGUAGE = 'de'

-- DATA FRAMEWORKSET
Config.DATAFRAMEWORK = {
    ['qb'] = {
        RESOURCE = 'qb-core',
        JOB = 'QBCore:Client:OnJobUpdate',
        OBJ = 'QBCore:GetObject',
        UPDATEOBJ_CL = 'QBCore:Client:UpdateObject',
        UPDATEOBJ_SV = 'QBCore:Server:UpdateObject',
        MANAGEMENT_RESOURCE = 'qbx-management',
    },
}

-- FECHTING DATA
Config.FETCHDATA = {
    JOBS = {'police', 'lssd', 'ambulance'},
}

-- SETUP LIB
Config.INITLIB = {
    SYSTEM = {
        DISPATCH = 'mdt-dispatch', -- DISPATCH SYSTEM
        NOTFICATION = 'ox_lib', -- NOTIFICATIONS SYSTEM
        VEHICLEKEYS = 'mk2',
        TARGET = 'ox_target',
        GARAGE = 'qb',
        CLOTHING = 'fivemapperance',
        ADDONLIB = 'ox_lib',
        FUEL = 'jerzys_fuel',
    },
    PERMISSION = {

        ACE = 'command',
    },
    INVENTORY = 'ox_inventory',
}

-- SHOW ALL AVAIBLE DATA IN CONSOLE
--[[
    'player',
    'gang',
    'item',
    'job',
    'vehicle',
]]--
Config.ShowAllData = {
    --'player',
    --'gang',
    --'item',
    --'job',
    --'item',
    --'vehicle',
}