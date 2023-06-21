-- init.lua
local api = vim.api
local keymaps = require('keymaps') -- Assuming keymaps.lua is at the root of the repository

local M = {}

function M.show_keymaps()
  -- Create and display the keymap window
  local bufnr = api.nvim_create_buf(false, true)
  local winnr = api.nvim_open_win(bufnr, true, {
    relative = "win",
    width = 40,
    height = 10,
    row = 2,
    col = 2,
    border = "single",
  })

  api.nvim_buf_set_lines(bufnr, 0, -1, true, vim.tbl_flatten(keymaps))

  api.nvim_buf_set_option(bufnr, "modifiable", false)

  api.nvim_win_set_option(winnr, "title", "Keymap Helper")
  api.nvim_win_set_option(winnr, "modifiable", false)
end

return M
