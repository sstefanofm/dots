vim.g.coq_settings = {
  -- ["match.look_ahead"] = 'dog'
}

local lsp = require "lspconfig"
local coq = require "coq" -- add this

require'lspconfig'.lua_ls.setup{}

lsp.lua_ls.setup(coq.lsp_ensure_capabilities())
