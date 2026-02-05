-- lsp configuration

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- rust
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            assist = { importGranularity = "module", importPrefix = "by_self" },
            cargo = { loadOutDirsFromCheck = true },
            procMacro = { enable = true },
          },
        },
      })

      -- typescript
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      -- enable servers
      vim.lsp.enable({ "rust_analyzer", "ts_ls" })

      -- keybindings on lsp attach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          local map = vim.keymap.set

          -- navigation
          map("n", "gD", vim.lsp.buf.declaration, opts)
          map("n", "gd", vim.lsp.buf.definition, opts)
          map("n", "gi", vim.lsp.buf.implementation, opts)
          map("n", "gr", vim.lsp.buf.references, opts)
          map("n", "<leader>D", vim.lsp.buf.type_definition, opts)

          -- info
          map("n", "K", vim.lsp.buf.hover, opts)
          map("n", "<C-k>", vim.lsp.buf.signature_help, opts)

          -- actions
          map("n", "<leader>rn", vim.lsp.buf.rename, opts)
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          map("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, opts)

          -- workspace
          map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
          map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)

          -- diagnostics
          map("n", "[d", vim.diagnostic.goto_prev, opts)
          map("n", "]d", vim.diagnostic.goto_next, opts)
          map("n", "<leader>e", vim.diagnostic.open_float, opts)
          map("n", "<leader>q", vim.diagnostic.setloclist, opts)
        end,
      })
    end,
  },
}
