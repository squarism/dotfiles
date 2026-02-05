-- core keymaps (non-plugin)

local map = vim.keymap.set

-- buffer navigation
map("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true, desc = "next buffer" })
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true, desc = "previous buffer" })
map("n", "<leader>d", ":bd<CR>", { silent = true, desc = "close buffer" })

-- dev log date header
local function date_at_top()
  local date = string.format("# %s - %s", os.date("%Y-%m-%d"), os.date("%A"))
  vim.api.nvim_win_set_cursor(0, { 1, 1 })
  vim.api.nvim_put({ date, "", "", "", "" }, "l", false, true)
  vim.api.nvim_win_set_cursor(0, { 3, 1 })
end

map("n", "<leader>N", date_at_top, { desc = "insert dev log date" })
