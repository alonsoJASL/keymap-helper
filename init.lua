-- init.lua
require('keymap-helper.keymap-helper')

-- Create a Vim command to invoke the keymap helper
vim.cmd("command! KeymapHelper lua KeymapHelper.show_keymaps()")

