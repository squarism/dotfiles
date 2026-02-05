-- editor plugins: navigation, search, git, comments

return {
  -- dependencies
  { "nvim-lua/plenary.nvim", lazy = true },

  -- telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "help tags" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- hop (fast navigation)
  {
    "phaazon/hop.nvim",
    branch = "v2",
    keys = {
      { "<Space><Space>", "<cmd>HopWord<cr>", desc = "hop word" },
      { "<Space>s", "<cmd>HopPattern<cr>", desc = "hop pattern" },
    },
    opts = {},
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
        end, { expr = true })
        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true })

        -- actions
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
        map("n", "<leader>hS", gs.stage_buffer)
        map("n", "<leader>hu", gs.undo_stage_hunk)
        map("n", "<leader>hR", gs.reset_buffer)
        map("n", "<leader>hp", gs.preview_hunk)
        map("n", "<leader>ha", function() gs.blame_line({ full = true }) end)
        map("n", "<leader>ta", gs.toggle_current_line_blame)
        map("n", "<leader>hd", gs.diffthis)
        map("n", "<leader>hD", function() gs.diffthis("~") end)
        map("n", "<leader>td", gs.toggle_deleted)

        -- text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
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

  -- cheatsheet
  {
    "sudormrfbin/cheatsheet.nvim",
    cmd = "Cheatsheet",
    keys = {
      { "<leader>?", "<cmd>Cheatsheet<cr>", desc = "cheatsheet" },
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      bundled_cheatsheets = false,
    },
  },

  -- todo list (.tada files)
  { "dewyze/vim-tada", ft = "tada" },
}
