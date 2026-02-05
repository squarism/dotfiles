-- lsp configuration with language-specific plugins

return {
  -- nvim-lspconfig provides server configs for vim.lsp.config (nvim 0.11+)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- broadcast cmp-nvim-lsp capabilities to all lsp servers
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- elixir (nextls)
      vim.lsp.config("nextls", {
        cmd = { vim.fn.expand("~/.cache/elixir-tools/nextls/bin/nextls"), "--stdio" },
        init_options = {
          experimental = {
            completions = { enable = true },
          },
        },
      })
      vim.lsp.enable("nextls")

      -- keybindings on lsp attach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local map = vim.keymap.set

          -- navigation
          map("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "go to definition" })
          map("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "go to implementation" })
          map("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "references" })
          map("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "type definition" })

          -- info
          map("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "hover docs" })
          map("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "signature help" })

          -- actions
          map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "rename" })
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "code action" })
          map("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
          end, { buffer = ev.buf, desc = "format" })

          -- workspace
          map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "add workspace folder" })
          map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = "remove workspace folder" })

          -- diagnostics
          map("n", "[d", vim.diagnostic.goto_prev, { buffer = ev.buf, desc = "prev diagnostic" })
          map("n", "]d", vim.diagnostic.goto_next, { buffer = ev.buf, desc = "next diagnostic" })
          map("n", "<leader>e", vim.diagnostic.open_float, { buffer = ev.buf, desc = "diagnostic float" })
          map("n", "<leader>q", vim.diagnostic.setloclist, { buffer = ev.buf, desc = "diagnostic list" })
        end,
      })
    end,
  },

  -- rust
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            assist = { importGranularity = "module", importPrefix = "by_self" },
            cargo = { loadOutDirsFromCheck = true },
            procMacro = { enable = true },
            checkOnSave = { command = "clippy" },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
  },

  -- typescript
  {
    "pmizio/typescript-tools.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeCompletionsForModuleExports = true,
        },
      },
    },
  },
}
