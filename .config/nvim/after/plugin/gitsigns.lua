local gitsigns = require 'gitsigns'
local api = vim.api

local function show_git_diff_float()
  -- Get the current buffer and diff text
  local buf = api.nvim_get_current_buf()

   -- Create a scratch buffer for the floating window
  local float_buf = api.nvim_create_buf(false, true)

  -- You can get the diff output by running `git diff` directly as a fallback
  -- But gitsigns.diffthis doesn't return the diff text, so we run git command here:
  local filepath = vim.api.nvim_buf_get_name(buf)
  local git_diff = vim.fn.systemlist("git diff --color=never " .. filepath)

  if vim.tbl_isempty(git_diff) then
    print("No changes to show")
    return
  end

  -- Set buffer lines to git diff output
  api.nvim_buf_set_lines(float_buf, 0, -1, false, git_diff)

  -- Floating window options
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create floating window
  local float_win = api.nvim_open_win(float_buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  -- Optional: set some buffer options
  api.nvim_buf_set_option(float_buf, 'bufhidden', 'wipe')
  api.nvim_buf_set_option(float_buf, 'filetype', 'diff')

  -- Keymap to close the floating window with <Esc> or 'q'
  api.nvim_buf_set_keymap(float_buf, 'n', 'q', '<cmd>close<CR>', { silent = true, noremap = true })
  api.nvim_buf_set_keymap(float_buf, 'n', '<Esc>', '<cmd>close<CR>', { silent = true, noremap = true })
end

vim.keymap.set('n', '<leader>gd', show_git_diff_float, { noremap = true })

gitsigns.setup {
  -- signs = { -- different than default
  --   add = { text = "+" },
  --   change = { text = "~" },
  --   delete = { text = "_" },
  --   topdelete = { text = "‾" },
  --   changedelete = { text = "~" },
  -- },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = true,    -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false,   -- Toggle with `:Gitsigns toggle_linehl`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
}
