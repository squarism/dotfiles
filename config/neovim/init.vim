" Dein Boilerplate
" Boilerplate
" -----------------------------------------------------------------
"   using dein as the plugin manager for vim
"   not for a lack of trying packer and lua
" -----------------------------------------------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin($HOME . '/.vim/bundles')
call dein#add($HOME . '/.vim/bundles/repos/github.com/Shougo/dein.vim')


" Plugins
" -----------------------------------------------------------------
" To update: `call dein#update()`
" To cleanup: `echo dein#check_clean()` and delete the ones listed from ~/.vim/bundles
" To reinstall: `call dein#install()` after deleting everything in ~/.vim/bundles

" dependencies
" .................................................................

" gitsigns and telescope require plenary
call dein#add('nvim-lua/popup.nvim')
call dein#add('nvim-lua/plenary.nvim')


" general
" .................................................................

" status line
call dein#add('hoob3rt/lualine.nvim')

" buffer line at top
call dein#add('akinsho/bufferline.nvim')

" git gutter
call dein#add('lewis6991/gitsigns.nvim')

" tree nav with icons
call dein#add('kyazdani42/nvim-web-devicons')
call dein#add('kyazdani42/nvim-tree.lua')

" modal popup and key reminders
call dein#add('nvim-telescope/telescope.nvim')
call dein#add('sudormrfbin/cheatsheet.nvim')

" fast navigation
call dein#add('phaazon/hop.nvim')

" a todo list plugin (filetype is .tada)
call dein#add('dewyze/vim-tada')

" less large cursor
set guicursor+=n:ver20-Cursor/lCursor


" themes
" .................................................................
call dein#add('chriskempson/base16-vim')
call dein#add('Shatur/neovim-ayu')
call dein#add('LunarVim/horizon.nvim')


" land of tim pope
" .................................................................
call dein#add('tpope/vim-commentary')


" LSP plugins
" .................................................................
call dein#add('neovim/nvim-lspconfig')
call dein#add('hrsh7th/nvim-cmp')
call dein#add('hrsh7th/cmp-nvim-lsp')
call dein#add('hrsh7th/cmp-buffer')
call dein#add('hrsh7th/cmp-path')

lua << EOF
local cmp = require'cmp'

cmp.setup({
  completion = {
    autocomplete = false,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),

  sources = cmp.config.sources({
  {
    name = 'nvim_lsp',
    entry_filter = function(entry, ctx)
      -- Prioritize methods, functions, classes, modules/packages
      local kind = entry:get_kind()
      local priority_kinds = {
        [2] = true,  -- Method
        [3] = true,  -- Function
        [4] = true,  -- Constructor
        [5] = true,  -- Field
        [6] = true,  -- Variable
        [7] = true,  -- Class
        [8] = true,  -- Interface
        [9] = true,  -- Module
        [10] = true, -- Property
      }
      return priority_kinds[kind] or false
    end
   },
  }, {
    { name = 'path' },
  })
})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Rust
lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    }
  }
})

-- TypeScript
lspconfig.ts_ls.setup({
  capabilities = capabilities,
})

-- more servers as needed ...

-- LSP keybindings
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)

    -- Diagnostics
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
  end,
})

-- disable nvim completion to avoid conflicts
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.complete = ''
EOF



" Languages
" .................................................................
call dein#add('preservim/vim-markdown')

" Rust

" Ruby

" Elixir

" Javascript

" Typescript

" Crystal
call dein#add('elbywan/crystalline')
call dein#add('vim-crystal/vim-crystal')

" Zig
call dein#add('ziglang/zig.vim')




call dein#end()
call dein#save_state()
filetype plugin indent on
" end of dein config
" -----------------------------------------------------------------



" Options
" -----------------------------------------------------------------

" duh
syntax enable

" disable mouse
set mouse=

" more colors for themes
set termguicolors

" disable .swap file creation
set noswapfile

" disable backup file creation
set nobackup

" status line plugin shows mode
set noshowmode

" tabs to spaces
set tabstop=2 shiftwidth=2 expandtab smarttab

" textwidth
set tw=110

" min lines visible when scrolling
set scrolloff=4

" setup undo files
set undodir=~/.vim/undodir
set undofile

" show trailing whitespace
set list
set listchars=trail:·

" jury is out on this one
" set relativenumber

" search highlighting tweaks
set nohlsearch
set incsearch

" options to look at
" smartindent?


" Key Bindings - Explanation and Reminders
" but all these should be more quickly referenced with the cheatsheet <leader>?
" ------------------------------------------------------------------------------

" define a leader key
let mapleader=","

" install new or missing plugins with dein
" nmap <leader>di :call dein#install()<CR>

" update plugins with dein (not new or missing)
" nmap <leader>du :call dein#update()<CR>

" list unused plugins here, you have to delete them yourself :(
" TODO: (suddenly not working)
" nmap <leader>dc :call dein#check_clean()<CR>

" Tab to cycle buffers (file tabs) forward
nnoremap <Tab> :BufferLineCycleNext<CR>

" Shift+Tab to cycle buffers (file tabs) backward
nnoremap <S-Tab> :BufferLineCyclePrev<CR>

" close buffer
map <leader>d :bd<CR>

" close buffer and leave split
map <leader>D :BD<CR>

" Insert the date at the top of a dev log
lua <<EOF
function _G.date_at_top()
  local date = string.format("# %s - %s", os.date('%Y-%m-%d'), os.date('%A'))
  vim.api.nvim_win_set_cursor(0, {1,1})
  vim.api.nvim_put({date, "", "", "", ""}, "l", false, true)
  vim.api.nvim_win_set_cursor(0, {3,1})
end
EOF
nmap <leader>N :call v:lua.date_at_top()<CR>


" kyazdani42/nvim-tree.lua
" .................................................................
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>


" nvim-telescope/telescope.nvim
" .................................................................
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" Theme and Appearance
" ------------------------------------------------------------------------------
" set background=light
set background=dark
let base16colorspace=256
set termguicolors
if !has('gui_running')
  set t_Co=256
endif

colorscheme base16-twilight


" Configs for plugins
" ------------------------------------------------------------------------------

" phaazon/hop.nvim
" ------------------------------------------------------------------------------
lua << END
require'hop'.setup()
END
map <SPACE><SPACE> :HopWord<CR>
noremap <SPACE>s :HopPattern<CR>


" hoob3rt/lualine.nvim
" ------------------------------------------------------------------------------
lua << END
require('lualine').setup {
  options = { 
    theme = 'seoul256',
    icons_enabled = false,
    section_separators = '',
    component_separators = '',
  }
}
END


" akinsho/bufferline.nvim
" ------------------------------------------------------------------------------
lua << EOF
require("bufferline").setup{
  options = {
    offsets = {{filetype = "NvimTree", text = "File Explorer"}},
  }
}
EOF


" kyazdani42/nvim-tree.lua
" ------------------------------------------------------------------------------
lua << END
require'nvim-tree'.setup {
  filters = {
    dotfiles = true,
  }
}
END


" lewis6991/gitsigns.nvim
" ------------------------------------------------------------------------------
lua << END
require('gitsigns').setup {
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    -- Navigation
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>ha', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
    map('n', '<leader>ta', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
    map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

    -- Text object
    map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
END
set signcolumn=yes


" sudormrfbin/cheatsheet.nvim
" ------------------------------------------------------------------------------
lua <<END
require("cheatsheet").setup({
  bundled_cheatsheets = false,
})
END

" preservim/vim-markdown
" ------------------------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1


" lsp
" ------------------------------------------------------------------------------
" from https://gist.github.com/jdrouet/bd8965cf13a4dce9d413940d51e57d74
" Code navigation shortcuts as found in :help lsp
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gi    <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>



" dewyze/vim-tada
" ------------------------------------------------------------------------------
let g:tada_todo_switch_status_mapping='<leader>t'

