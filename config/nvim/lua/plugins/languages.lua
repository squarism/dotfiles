-- treesitter: parser management + highlighting + textobjects
-- nvim 0.11's nvim-treesitter is just a parser manager.
-- highlighting must be enabled per-buffer via vim.treesitter.start()

-- parsers to auto-install on startup
-- add/remove languages here as needed. run :TSInstall <lang> to add one manually.
local ensure_installed = {
  "css",
  "diff",
  "elixir",
  "eex",
  "heex",
  "html",
  "javascript",
  "json",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "regex",
  "rust",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      -- enable treesitter highlighting for any buffer that has a parser
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ok = pcall(vim.treesitter.start, args.buf)
          if ok then
            -- disable old regex syntax highlighting when treesitter is active
            vim.bo[args.buf].syntax = ""
          end
        end,
      })

      -- install missing parsers on startup
      local installed = require("nvim-treesitter.config").get_installed()
      local missing = vim.tbl_filter(function(lang)
        return not vim.tbl_contains(installed, lang)
      end, ensure_installed)
      if #missing > 0 then
        vim.cmd("TSInstall " .. table.concat(missing, " "))
      end
    end,
  },

  -- textobjects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    config = function()
      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")
      local swap = require("nvim-treesitter-textobjects.swap")

      require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
        move = { set_jumps = true },
      })

      -- select
      local sel = function(query)
        return function()
          select.select_textobject(query)
        end
      end
      vim.keymap.set({ "x", "o" }, "af", sel("@function.outer"), { desc = "around function" })
      vim.keymap.set({ "x", "o" }, "if", sel("@function.inner"), { desc = "inside function" })
      vim.keymap.set({ "x", "o" }, "ac", sel("@class.outer"), { desc = "around class" })
      vim.keymap.set({ "x", "o" }, "ic", sel("@class.inner"), { desc = "inside class" })

      -- move
      vim.keymap.set({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer") end, { desc = "next function" })
      vim.keymap.set({ "n", "x", "o" }, "]F", function() move.goto_next_end("@function.outer") end, { desc = "next function end" })
      vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@class.outer") end, { desc = "next class" })
      vim.keymap.set({ "n", "x", "o" }, "][", function() move.goto_next_end("@class.outer") end, { desc = "next class end" })
      vim.keymap.set({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer") end, { desc = "prev function" })
      vim.keymap.set({ "n", "x", "o" }, "[F", function() move.goto_previous_end("@function.outer") end, { desc = "prev function end" })
      vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@class.outer") end, { desc = "prev class" })
      vim.keymap.set({ "n", "x", "o" }, "[]", function() move.goto_previous_end("@class.outer") end, { desc = "prev class end" })

      -- swap parameters
      vim.keymap.set("n", "<leader>a", function() swap.swap_next("@parameter.inner") end, { desc = "swap next param" })
      vim.keymap.set("n", "<leader>A", function() swap.swap_previous("@parameter.inner") end, { desc = "swap prev param" })
    end,
  },
}
