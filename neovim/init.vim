" Dein Boilerplate
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
call dein#add('hoob3rt/lualine.nvim')
call dein#add('kyazdani42/nvim-web-devicons')
call dein#add('akinsho/bufferline.nvim')
call dein#add('kyazdani42/nvim-tree.lua')
call dein#add('lewis6991/gitsigns.nvim')
call dein#add('nvim-telescope/telescope.nvim')
call dein#add('sudormrfbin/cheatsheet.nvim')
call dein#add('phaazon/hop.nvim')


" themes
" .................................................................
call dein#add('chriskempson/base16-vim')
call dein#add('folke/tokyonight.nvim')
call dein#add('Shatur/neovim-ayu')
call dein#add('drewtempelmeyer/palenight.vim')


" land of tim pope
" .................................................................
call dein#add('tpope/vim-commentary')


" languages
" .................................................................
" call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})
call dein#add('preservim/vim-markdown')
call dein#add('neovim/nvim-lspconfig')
call dein#add('nvim-lua/lsp_extensions.nvim')
call dein#add('nvim-lua/completion-nvim')

lua <<EOF
local nvim_lsp = require'lspconfig'
-- function to attach completion when setting up lsp

local on_attach = function(client)
require'completion'.on_attach(client)
end

-- Rust
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })
nvim_lsp.crystalline.setup{}


-- Typescript
nvim_lsp.tsserver.setup({})


-- TODO: finish configuring lanugages
-- Go


-- Ruby


-- Elixir


-- Javascript
EOF


call dein#end()
call dein#save_state()
filetype plugin indent on
syntax enable
" end of dein config
" -----------------------------------------------------------------


" Options
" -----------------------------------------------------------------

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

" clear search highlighting
nnoremap <leader><ESC> :nohlsearch<CR>

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

lua <<EOF
require('ayu').setup({
    mirage = true,
    overrides = {}
})
EOF
colorscheme ayu


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
    theme = 'ayu_mirage',
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
  auto_close = true,
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

" Trigger completion with <tab>
" found in :help completion
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

set signcolumn=yes


" 
" ------------------------------------------------------------------------------
