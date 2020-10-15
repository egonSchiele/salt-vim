" Language:    Salty
" Maintainer:  Adit <bluemangroupie@gmail.com>
" Based On:    MoonScript by leafo <leafot@gmail.com>
" URL:         http://github.com/adit/salty-vim
" License:     WTFPL

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal formatoptions-=t
setlocal comments=:#
setlocal commentstring=#\ %s

let b:undo_ftplugin = "setlocal commentstring< comments< formatoptions<"
