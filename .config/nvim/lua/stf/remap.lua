vim.g.mapleader = ','

local map = vim.keymap.set

map('n', ';', ':')

map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- paste without loosing the yanked buffer
map('x', '<leader>p', '"_dP')

-- copy to system clipboard
map({ 'n', 'v' }, '<leader>y', '"+y')
map('n', '<leader>Y', '"+Y')

-- replace word under cursor
map('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- move between panes
map('n', '<C-h>', ':wincmd h<CR>')
map('n', '<C-j>', ':wincmd j<CR>')
map('n', '<C-k>', ':wincmd k<CR>')
map('n', '<C-l>', ':wincmd l<CR>')

-- move between buffers
map('n', '<Tab>', ':bn<CR>')
map('n', '<S-Tab>', ':bp<CR>')
map('n', '<leader>q', ':bd<CR>')
