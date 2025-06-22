vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle right<CR>')
vim.keymap.set('n', '<C-g>', ':Neotree git_status focus float<CR>')
vim.keymap.set('n', '<C-b>', ':Neotree buffers focus float<CR>')

require 'neo-tree'.setup {
  filesystem = {
    commands = {
      open_and_close_neotree = function(state)
        require 'neo-tree.sources.filesystem.commands'.open(state)

        local tree = state.tree
        local success, node = pcall(tree.get_node, tree)

        if not success then
          return
        end

        if node.type == 'file' then
          require 'neo-tree.command'.execute({ action = 'close' })
        end
      end
    },
    window = {
      mappings = {
        ['<CR>'] = 'open_and_close_neotree',
        ['P'] = {
          'toggle_preview',
          config = {
            use_float = true,
            use_image_nvim = true,
          }
        },
      }
    },
  },
  git_status = {
    window = {
      mappings = {
        ["A"] = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
        ["i"] = "show_file_details", -- see `:h neo-tree-file-actions` for options to customize the window.
        ["b"] = "rename_basename",
        ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
        ["oc"] = { "order_by_created", nowait = false },
        ["od"] = { "order_by_diagnostics", nowait = false },
        ["om"] = { "order_by_modified", nowait = false },
        ["on"] = { "order_by_name", nowait = false },
        ["os"] = { "order_by_size", nowait = false },
        ["ot"] = { "order_by_type", nowait = false },
      },
    },
  },
}
