" vim-plug as plugin manager
" https://github.com/junegunn/vim-plug
call plug#begin()

" autocomplete engine
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'                                      " status line (bottom)
Plug 'mengelbrecht/lightline-bufferline'                          " buffer status line (top)

Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }                  " file browser
Plug 'Shougo/unite.vim'                                           " vimfiler dependency

Plug 'godlygeek/tabular'                                          " tab alignment
Plug 'mileszs/ack.vim'

" Colors
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'

" Language Server for autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make' }

" Linting and Syntax
Plug 'w0rp/ale'
 
" Tim Pope Land
Plug 'tpope/vim-commentary' " quick commenting lines
Plug 'tpope/vim-sensible'   " sensible defaults
Plug 'tpope/vim-fugitive'   " git

call plug#end()


"┌==============================================================================
"| NeoVIM Defaults 
"└------------------------------------------------------------------------------
set cursorline
set nonumber
set tw=110
set listchars=trail:·
set tabstop=2 shiftwidth=2 expandtab smarttab
set scrolloff=4 " min lines visible when scrolling
syntax enable
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden


"┌==============================================================================
"| Key Bindings - Documentation, Explanation and Reminders
"└------------------------------------------------------------------------------
let mapleader=","                                " define our leader key here
nnoremap <Tab> :bnext!<CR>                       " Tab to change open files forward
nnoremap <S-Tab> :bprev!<CR><Paste>|             " Shift+Tab to change files backward
map ` :VimFilerCurrentDir -explorer -find<CR>|   " ,~ for file browser as last resort
map <leader>d :bd<CR>|                           " close buffer
map <leader>D :BD<CR>|                           " close buffer, leaves split
map <leader><space> :nohl<CR>|                   " clear highlight
map <F2> :r !pbpaste<CR>|                        " I can't figure out insert paste mode in this config so F2 pastes

" Insert the date at the top of a dev log.
nmap <leader>N ggi# <C-R>=strftime("%Y-%m-%d - %A")<CR><CR><CR><CR><CR><esc>3ki<CR>

" pry debugging snippet
iabbr bpry require 'pry'; binding.pry


"┌==============================================================================
"| Theme and Appearance
"└------------------------------------------------------------------------------
set background=light
let base16colorspace=256
if !has('gui_running')
  set t_Co=256
endif
colorscheme PaperColor


"┌==============================================================================
"| File Types
"└------------------------------------------------------------------------------
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>T :GoTestFunc<CR>
au FileType go nmap <leader>i :GoImports<CR>
au FileType markdown let b:deoplete_disable_auto_complete = 1


"┌==============================================================================
"| Plugin Config
"└------------------------------------------------------------------------------


" Plug 'easymotion/vim-easymotion'
" ------------------------------------------------------------------------------
" Use space and then motion(hjkl) keys to popup easymotion.  For example,
" space+k would give you a motion popup of what lines to jump UP to.
map <SPACE> <Plug>(easymotion-prefix)

" Plug 'junegunn/fzf'
" ------------------------------------------------------------------------------
nmap <C-p> :GFiles<CR>
nmap ; :Buffers<CR>

" Plug 'itchyny/lightline.vim'
" ------------------------------------------------------------------------------
let g:lightline = { 
      \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {'gitbranch':'fugitive#head'}
      \ }
set noshowmode  " lightline handles the -- INSERT -- feedback

" Plug 'godlygeek/tabular'
" ------------------------------------------------------------------------------
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:<CR>
vmap <leader>a: :Tabularize /:<CR>

" Plug 'mileszs/ack.vim'
" ------------------------------------------------------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
noremap <Leader>a :Ack <cword><CR>

" Plug 'Shougo/deoplete.nvim'
" ------------------------------------------------------------------------------
set completeopt+=noselect
let g:python3_host_prog  = '/usr/local/bin/python3'
let g:python3_host_skip_check = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Plug 'fatih/vim-go'
" ------------------------------------------------------------------------------
set autowrite

" Plug 'gabrielelana/vim-markdown'
" ------------------------------------------------------------------------------
let g:markdown_enable_spell_checking = 0

" Plug 'mengelbrecht/lightline-bufferline'
" ------------------------------------------------------------------------------
set showtabline=2
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
