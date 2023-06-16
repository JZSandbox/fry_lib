fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

author 'JERZY'
discord '.jerzy'
description 'This contains the OxLib+QBCore/QBox Integration Library, a powerful Lua library designed to combine and simplify the functionality of OX and QBCore/QBox frameworks for use in FiveM servers. '
version '0.0.2'

dependency {
	'ox_lib',
	'ox_inventory',
}

client_scripts {
	'client/player/**.**',
	'client/utils/**.**',
	'client/vehicle/**.**',
	'client/inventory/**.**',
	'client/utils/misc.lua',
	'client/core/load.lua',
	'locales/**.**',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/core/main.lua',
	'server/inventory/**.**',
	'server/player/**.**',
}

shared_scripts {
    '@ox_lib/init.lua',
	'config.lua',
	'shared/**.**',
	'locales/**.**',
	'client/core/**.**',
	'client/utils/debug.lua',
}

exports {
	'FRYLIBINIT',
	'FRYLIB.DEBUG',
}

server_exports {
	'FRYLIBSERVER',
}


files {

}