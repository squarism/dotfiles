-- editor plugins: navigation, search, git, comments, terminal

return {
  -- dependencies
  { "nvim-lua/plenary.nvim", lazy = true },

  -- telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "help tags" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "diagnostics" },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "document symbols" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- flash (fast navigation - replaces hop)
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "<space><space>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "flash jump" },
    },
    opts = {
      search = {
        multi_window = false,  -- only current window
        incremental = false,   -- don't update while typing
      },
      modes = {
        search = { enabled = false },  -- don't hijack /
        char = { enabled = false },    -- don't hijack f/t
      },
      label = {
        uppercase = false,
        after = true,
        before = false,
      },
    },
  },

  -- which-key (keybinding hints)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "minimal",
      spec = {
        { "<leader>f", group = "find" },
        { "<leader>h", group = "git hunk" },
        { "<leader>x", group = "trouble" },
      },
    },
  },

  -- cheatsheet (searchable keybindings via telescope)
  {
    "doctorfree/cheatsheet.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      { "<leader>?", "<cmd>Cheatsheet<cr>", desc = "cheatsheet" },
    },
  },

  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- navigation
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "next hunk" })
        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "prev hunk" })

        -- actions
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "stage hunk" })
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "reset hunk" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "stage buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "reset buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "preview hunk" })
        map("n", "<leader>ha", function() gs.blame_line({ full = true }) end, { desc = "blame line" })
        map("n", "<leader>ta", gs.toggle_current_line_blame, { desc = "toggle blame" })
        map("n", "<leader>hd", gs.diffthis, { desc = "diff this" })
        map("n", "<leader>hD", function() gs.diffthis("~") end, { desc = "diff this ~" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "toggle deleted" })

        -- text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "select hunk" })
      end,
    },
  },

  -- comments
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "toggle comment" },
      { "gcc", mode = "n", desc = "toggle line comment" },
    },
    opts = {},
  },

  -- oil (file management as buffer)
  {
    "stevearc/oil.nvim",
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "open parent directory" },
    },
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
  },

  -- toggleterm (better terminal)
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-\\>", desc = "toggle terminal" },
      { "<leader>gg", function()
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
        lazygit:toggle()
      end, desc = "lazygit" },
    },
    opts = {
      open_mapping = [[<C-\>]],
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
  },

  -- mini.pairs (auto close brackets)
  {
    "echasnovski/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },

  -- mini.surround (change surrounding chars)
  {
    "echasnovski/mini.surround",
    keys = {
      { "sa", mode = { "n", "v" }, desc = "add surrounding" },
      { "sd", desc = "delete surrounding" },
      { "sr", desc = "replace surrounding" },
    },
    opts = {},
  },

  -- todo list (.tada files)
  { "dewyze/vim-tada", ft = "tada" },
}
