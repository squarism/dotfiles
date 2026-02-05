-- neovim config
-- plugin management: :Lazy (sync, update, clean, profile)

-- leader must be set before lazy
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- core settings
require("core.options")
require("core.keymaps")

-- plugins (lazy.nvim)
require("plugins")
