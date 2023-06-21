" Prevents the plugin from being loaded multiple times.
"
if exists('g:loaded_keymaphelper')
  finish
endif
let g:loaded_keymaphelper = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/keymap-helper/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=0 FetchTodos lua require("keymap-helper").fetch_todos()
command! -nargs=0 InsertTodo lua require("keymap-helper").insert_todo()
command! -nargs=0 CompleteTodo lua require("keymap-helper").complete_todo()
