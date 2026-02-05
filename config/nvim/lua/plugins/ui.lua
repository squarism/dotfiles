-- ui plugins

return {
  -- themes
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme base16-twilight")
    end,
  },
  { "Shatur/neovim-ayu", lazy = true },
  { "LunarVim/horizon.nvim", lazy = true },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "seoul256",
        icons_enabled = false,
        section_separators = "",
        component_separators = "",
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
        dotfiles = true,
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
}
