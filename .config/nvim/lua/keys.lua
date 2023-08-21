local set = vim.keymap.set

vim.g.mapleader = ','

set('n', '<leader>w', ':write<cr>')
set('n', '<leader>q', ':quit<cr>')
set('n', ';', ':')
set('n', '<cr>', 'o<esc>k')
set('n', '<s-cr>', 'O<esc>j')
set('n', '<tab>', ':bn<cr>')
set('n', '<s-tab>', ':bp<cr>')

-- easymotion
set('n', '<leader>ss', '<plug>(easymotion-s2)')
set('n', '<leader>st', '<plug>(easymotion-t2)')
set('n', '<leader>sw', '<plug>(easymotion-w)')
set('n', '<leader>se', '<plug>(easymotion-e)')
set('n', '<leader>sb', '<plug>(easymotion-b)')

-- chadtree (https://github.com/ms-jpq/chadtree/blob/chad/config/defaults.yml)
set('n', '<leader>e', '<cmd>CHADopen<cr>')
-- set('n', '<leader>l', '<cmd>call setqflist([])<cr>') -- clears quickfix list

-- coc
set('n', '<leader>cc', ':CocConfig<cr>')
