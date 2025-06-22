local null_ls = require 'null-ls'

vim.keymap.set('n', '<C-s>', function()
  vim.lsp.buf.format({ async = true })
end, {})

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    require 'none-ls.diagnostics.eslint_d',
  }
}
