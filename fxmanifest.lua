fx_version 'cerulean'
game 'gta5'

shared_script '@ox_lib/init.lua'

client_script 'client/main.lua'

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/commands.lua'
}

lua54 'yes'