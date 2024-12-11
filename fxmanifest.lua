fx_version 'cerulean'
game 'gta5'

author 'Nexus'
description 'Zombie themed chat'

ui_page 'html/index.html'

client_scripts {
'client/main.lua'
}

server_scripts {
'server/main.lua'
}

shared_scripts {
'shared/config.lua'
}

files {
'html/index.html',
'html/css/style.css',
'html/js/app.js'
}

dependencies {
'qb-core'
}