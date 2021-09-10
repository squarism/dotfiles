" Dein as the plugin manager for vim
" dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state($HOME . '/.vim/bundles')
  call dein#begin($HOME . '/.vim/bundles')
  call dein#add($HOME . '/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " To update, run
  " call dein#update()
  " To cleanup, run echo dein#check_clean() and delete the ones listed from ~/.vim/bundles.  :|

  " General plugins
  " ------------------------------------------------------------------------------
  call dein#add('easymotion/vim-easymotion')
  " call dein#add('itchyny/lightline.vim')
  call dein#add('hoob3rt/lualine.nvim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('chriskempson/base16-vim')
  call dein#add('mike-hearn/base16-vim-lightline')
  call dein#add('janko/vim-test', { 'on_cmd' : [ 'TestFile', 'TestLast', 'TestSuite', 'TestVisit', 'TestNearest' ] })

  " telescope fuzzy finder
  call dein#add('nvim-lua/plenary.nvim')
  call dein#add('nvim-telescope/telescope.nvim')

  " Language Server for autocomplete
  call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})

  call dein#add('godlygeek/tabular', { 'on_cmd' : [ 'Tab', 'Tabularize' ] , 'augroup' : 'tabular' })
  call dein#add('mileszs/ack.vim', { 'on_cmd' : [ 'Ack' ] })
  call dein#add('Shougo/defx.nvim', { 'on_cmd' : [ 'Defx' ] })
  call dein#add('Shougo/denite.nvim', { 'on_cmd' : [ 'Denite' ] })

  " Tim Pope Land
  " ------------------------------------------------------------------------------
  call dein#add('tpope/vim-fugitive', { 'on_cmd': [ 'Git', 'Gstatus', 'Gwrite', 'Glog', 'Gcommit', 'Gblame', 'Ggrep', 'Gdiff', ] })
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-sensible')
  call dein#add('tpope/vim-dispatch')
  call dein#add('tpope/vim-repeat', {'on_map' : '.'})
  call dein#add('tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}, 'depends' : 'vim-repeat'})
  " fix incrementing of dates
  call dein#add('tpope/vim-speeddating')

  " Languages
  " ------------------------------------------------------------------------------
  " Go
  call dein#add('fatih/vim-go', {'on_ft': 'go'})
  call dein#add('zchee/deoplete-go', {'on_ft': 'go'})

  " Rust
  call dein#add('rust-lang/rust.vim', {'on_ft': 'rust'})

  " Crystal
  call dein#add('rhysd/vim-crystal', {'on_ft': 'crystal'})

  " Ruby
  call dein#add('vim-ruby/vim-ruby', {'on_ft': 'ruby'})
  call dein#add('tpope/vim-rails', {'on_ft': 'ruby'})

  " Typescript
  " Elixir
  call dein#add('elixir-lang/vim-elixir', {'on_ft': 'elixir'})

  " TOML
  call dein#add('cespare/vim-toml', { 'lazy': 1, 'on_ft': 'toml' })


  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on

"End dein Scripts-------------------------


" ==============================================================================
"  Options
" ------------------------------------------------------------------------------
syntax enable
set cursorline
set nonumber
set tw=110
set listchars=trail:·
set list
set tabstop=2 shiftwidth=2 expandtab smarttab
set scrolloff=4 " min lines visible when scrolling
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set undodir=~/.vim/undodir
set undofile


" ==============================================================================
"  Key Bindings - Documentation, Explanation and Reminders
" ------------------------------------------------------------------------------
let mapleader=","|                     " define our leader key here
nnoremap <Tab> :bnext!<CR>|            " Tab to change open files forward
nnoremap <S-Tab> :bprev!<CR><Paste>|   " Shift+Tab to change files backward
map <leader>w :w<CR>|                  " save
map <leader>d :bd<CR>|                 " close buffer
map <leader>D :BD<CR>|                 " close buffer, leaves split
map <leader>h :nohl<CR>|               " clear highlight
map <F2>:r !pbpaste<CR>|               " I can't figure out insert paste mode in this config so F2 pastes

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

" Abbreviations
au FileType ruby :iabbr bpry require 'pry'; binding.pry
au FileType python :iabbr pdb import ipdb; ipdb.set_trace()

" Changing panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Reminders
" leader s is search (text)
" leader g is git file search
" 1ctrl-g is print full path of current file

" GitGutter keys
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)


" ==============================================================================
"  Theme and Appearance
" ------------------------------------------------------------------------------
set background=light
let base16colorspace=256
set termguicolors
if !has('gui_running')
  set t_Co=256
endif
colorscheme base16-harmonic-light


" ==============================================================================
"  File Types
" ------------------------------------------------------------------------------
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>T :GoTestFunc<CR>
au FileType go nmap <leader>i :GoImports<CR>
au FileType go set listchars=tab:\|\ ,trail:-,extends:>,precedes:<,nbsp:+

au FileType markdown let b:deoplete_disable_auto_complete = 1


" ==============================================================================
"  Plugin Config
" ------------------------------------------------------------------------------

" easymotion/vim-easymotion
" ------------------------------------------------------------------------------
" Use space and then motion(hjkl) keys to popup easymotion.  For example,
" space+k would give you a motion popup of what lines to jump UP to.
map <SPACE> <Plug>(easymotion-prefix)


" nvim-telescope/telescope.nvim
" ------------------------------------------------------------------------------
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


" hoob3rt/lualine.nvim
" ------------------------------------------------------------------------------
:lua << EOF
require('lualine').setup {
  options = {
    theme = 'ayu_light',
    icons_enabled = false,
    separator = '|'
  }
}
EOF

" godlygeek/tabular
" ------------------------------------------------------------------------------
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:<CR>
vmap <leader>a: :Tabularize /:<CR>


" mileszs/ack.vim
" ------------------------------------------------------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
noremap <Leader>a :Ack <cword><CR>


" Shougo/deoplete.nvim
" ------------------------------------------------------------------------------
" python needs to be in your path.  I use asdf which is currently correct.
" python -V shows python 3 and not system python on mac. Otherwise, override deoplete options
" like let g:python3_host_prog = '/path'
set completeopt+=noselect

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" use tab for autocomplete
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" vim isn't an IDE but an IDE this is
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" neoclide/coc.nvim
" ------------------------------------------------------------------------------
inoremap <silent><expr> <c-space> coc#refresh()
set nobackup
set nowritebackup

set updatetime=300
set shortmess+=c

" always show signcolumns
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" fatih/vim-go
" ------------------------------------------------------------------------------
set autowrite


" gabrielelana/vim-markdown
" ------------------------------------------------------------------------------
let g:markdown_enable_spell_checking = 0


" rust-lang/rust.vim
" ------------------------------------------------------------------------------
let g:rustfmt_autosave = 1


" Shougo/defx.nvim'
" ------------------------------------------------------------------------------
" this config length here is crazy, but here we go anyway
map <leader>x :Defx<CR>

" this is all from `help defx`
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> l
        \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <C-l>
        \ defx#do_action('redraw')
endfunction


" janko/vim-test'
" ------------------------------------------------------------------------------
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = {
  \ 'nearest': 'dispatch',
  \ 'file': 'neovim',
  \ 'suite': 'basic',
  \}


" airblade/vim-gitgutter
" ------------------------------------------------------------------------------
" Jump between hunks
nmap <Leader>gn <Plug>(GitGutterNextHunk)  " git next
nmap <Leader>gp <Plug>(GitGutterPrevHunk)  " git previous
" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>(GitGutterStageHunk)  " git add (chunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)   " git undo (chunk)
