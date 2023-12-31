-- Imports the plugin's additional Lua modules.
-- local fetch = require("example-plugin.fetch")
-- local update = require("example-plugin.update")

-- init.lua
local api = vim.api
local keymaps = require('keymaps') -- Assuming keymaps.lua is at the root of the repository

local M = {}
local winnr = nil

function M.show_keymaps()
  -- Create and display the keymap window
  local bufnr = api.nvim_create_buf(false, true)
  local winnr = api.nvim_open_win(bufnr, true, {
    relative = "win",
    width = 70,
    height = 30,
    row = 2,
    col = 2,
    border = "single",
  })

  api.nvim_buf_set_lines(bufnr, 0, -1, true, vim.tbl_flatten(keymaps))
  api.nvim_buf_set_option(bufnr, "modifiable", false)

  api.nvim_win_set_option(winnr, "title", "Keymap Helper")
  api.nvim_win_set_option(winnr, "modifiable", false)

  api.nvim_buf_set_keymap(bufnr, "n", "<Esc>", ':lua require("keymap-helper").close_keymaps()<CR>', { noremap = true, silent = true })
end

function M.close_keymaps()
  -- Close the keymap window
  if winnr and api.nvim_win_is_valid(winnr) then
    api.nvim_win_close(winnr, true)
  end
end

return M
