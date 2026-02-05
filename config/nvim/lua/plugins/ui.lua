-- ui plugins: theme, statusline, bufferline, file tree

return {
  -- themes
  {
    "chriskempson/base16-vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.base16colorspace = 256
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
}
