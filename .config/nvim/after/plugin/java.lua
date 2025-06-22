vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.java",
  callback = function()
    local jdtls = require("jdtls")

    -- Use project root
    local root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" })

    -- Workspace directory
    local home = os.getenv("HOME")
    local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

    -- Setup jdtls
    jdtls.start_or_attach({
      cmd = {
        "jdtls", -- or full path to jdtls script
        "-data",
        workspace_folder,
      },
      root_dir = root_dir,
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
  end,
})
