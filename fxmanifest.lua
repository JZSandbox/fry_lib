fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

author '.JERZY'
description 'FRY LIB'
version '0.0.1'

dependency {
	'ox_lib',
	'ox_inventory',
}

client_scripts {
	'client/player/**.**',
	'client/utils/**.**',
	'client/vehicle/**.**',
	'client/utils/misc.lua',
	'locales/**.**',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/framework.lua',
	'server/utils.lua'
}

shared_scripts {
	'client/core/main.lua',
    '@ox_lib/init.lua',
	'config.lua',
	'shared/**.**',
	'client/utils/debug.lua',
	'client/utils/switch.lua',
	'locales/**.**',
}

exports {
	'FRYLIBINIT',
	'FRYLIB.DEBUG',
}

server_exports {
	'FRYLIB.SERVER',
}


files {

}