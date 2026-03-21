-- ui plugins

return {
  -- themes
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("monokai-pro").setup({
        filter = "octagon",
        devicons = true,
        transparent_background = false,
        terminal_colors = true,
        -- make certain plugin backgrounds transparent
        background_clear = {
          "float_win",
          "toggleterm",
          "telescope",
          "which-key",
        },
      })
      vim.cmd.colorscheme("monokai-pro")
    end,
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "monokai-pro",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        globalstatus = true,  -- single statusline for all windows
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1 } },  -- relative path (shortens automatically)
        lualine_x = { "diagnostics" },
        lualine_y = { "filetype" },
        lualine_z = { "location" },
      },
    },
  },

  -- bufferline (tabs)
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        offsets = { { filetype = "NvimTree", text = "File Explorer" } },
      },
    },
  },

  -- file tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "toggle nvim-tree" },
      { "<leader>r", "<cmd>NvimTreeRefresh<cr>", desc = "refresh nvim-tree" },
      { "<leader>n", "<cmd>NvimTreeFindFile<cr>", desc = "find file in nvim-tree" },
    },
    opts = {
      filters = {
        dotfiles = false,
      },
    },
  },

  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- trouble (better diagnostics list)
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "diagnostics (trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "buffer diagnostics (trouble)" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "symbols (trouble)" },
      { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "lsp definitions/references (trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "location list (trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "quickfix list (trouble)" },
    },
    opts = {},
  },

  -- indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  }
}
