-- vd-drawtext/fxmanifest.lua
fx_version 'cerulean'
game 'gta5'

author 'KITSO'
repository 'https://github.com/voidscripts01/vd-drawtext'
description 'vd-drawtext: An amazing NUI-based DrawText system. Exports: ShowText(key, message), HideText()'
version '1.0.0'

ui_page 'html/index.html'

server_scripts {
    'server/server.lua'
}

client_scripts {
    'client/client.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

exports {
    'ShowText',
    'HideText'
}