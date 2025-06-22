require 'lualine'.setup {
  tabline = {
    lualine_a = { { -- show opened buffers
      'buffers',
      symbols = {
        alternate_file = '',
        modified = ' ',
      }
    } },
  }
}
