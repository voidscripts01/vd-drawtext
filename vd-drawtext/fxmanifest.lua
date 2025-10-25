-- vd-drawtext/fxmanifest.lua
fx_version 'cerulean'
game 'gta5'

author 'KITSO'
repository 'https://github.com/voidscripts01/vd-drawtext'
description 'vd-drawtext: DrawText system by KITSO'
version '1.0.0'

ui_page 'html/index.html'

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