fx_version 'bodacious'

game 'gta5'

author 'Illumiinati'
description 'PMA-RP 911 EMERGENCY SCRIPT'

version '1.0.0'

files {
}

server_script "./server/server.lua"
client_script "./client/client.lua"

server_scripts {

    '@mysql-async/lib/MySQL.lua',
    'server/main.lua'
  
  }