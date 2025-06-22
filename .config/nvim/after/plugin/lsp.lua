local lsp = require 'lspconfig'
local capabilities = require 'cmp_nvim_lsp'.default_capabilities()

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'K',  vim.lsp.buf.hover, {})
vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})

lsp.lua_ls.setup {
  capabilities = capabilities
}

lsp.clangd.setup {
  capabilities = capabilities
}

lsp.tsserver.setup {
  capabilities = capabilities
}
