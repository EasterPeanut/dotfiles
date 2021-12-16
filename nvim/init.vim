set autoindent
set autoread " reload files when changed on disk, i.e. via `git checkout`
set background=dark
set backspace=2 " fix broken backspace in some setups
set backupcopy=yes " see :help crontab
set clipboard=unnamed " yank and paste with the system clipboard
set cursorcolumn
set cursorline
set directory-=. " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab " expand tabs to spaces
set hlsearch
set ignorecase " case-insensitive search
set incsearch " search as you type
set laststatus=2 " always show statusline
set list  " show trailing whitespace
set listchars=tab:▸\ ,trail:▫ " visualize characters
set mouse= " disable mouse
" set ttymouse= " disable mouse
set number " display line numbers in gutter
set relativenumber " use relative numbers in gutter
set ruler " show where you are
set scrolloff=3 " show context above/below cursorline when in top/bottom
set shiftwidth=2 " normal mode indentation commands use 2 spaces
set showcmd " show command history
set smartcase " case-sensitive search if any caps
set softtabstop=2 " insert mode tab and backspace use 2 spaces
set tabstop=2
set title " set title to currently opened filename
set termguicolors
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu " show a navigable menu for tab completion

let g:mapleader=','
nmap <leader>p :FZF<CR>
nmap <leader>f :Rg<CR>
nmap <leader>n :noh<CR>
nmap <leader>g :vert G<CR>
nmap <leader>d <Plug>DashSearch<CR>
" nmap <leader>py :!python %<CR>

" set jj as the Esc key
inoremap jj <Esc>
" scale windows more easily
nmap w> <C-w>10>
nmap w< <C-w>10<
nmap w= <C-w>10+
nmap w- <C-w>10-

call plug#begin('~/.vim/plugged')

Plug 'blueyed/vim-diminactive' " this plugin is slow

Plug 'gruvbox-community/gruvbox' " forked from: Plug 'morhetz/gruvbox'

Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
" needed for finding python3
let g:python3_host_prog = '/usr/local/bin/python3.9'
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

Plug 'slashmili/alchemist.vim'
let g:alchemist#elixir_erlang_src = "/usr/local/share/src"

Plug 'rizzatti/dash.vim'

Plug 'janko/vim-test'
let test#strategy = "neovim"
let g:test#preserve_screen = 1
let g:test#filename_modifier = ":."
let test#javascript#mocha#options = '--config .mocharc'
nmap <silent> tt :TestNearest<CR>
nmap <silent> <leader>tt :TestNearest<CR><C-\><C-n>
nmap <silent> tf :TestFile<CR><C-\><C-n>
nmap <silent> ta :TestSuite<CR><C-\><C-n>
nmap <silent> te :TestLast<CR>
nmap <silent> tg :TestVisit<CR>
" will leave terminal insert mode in the tests
tmap <C-o> <C-\><C-n>

Plug 'dense-analysis/ale'
let g:ale_fixers = { 'scss': ['stylelint'], 'css': ['stylelint'], 'javascript': ['eslint'] }
let g:ale_fix_on_save = 1

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" let g:fzf_preview_window = 'bottom:40%'
let $FZF_DEFAULT_COMMAND = 'rg --hidden -l "" -g "!{.git,node_modules,vendor}/*"'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --hidden -g "!{.git,node_modules,vendor}/*" --column --no-heading --line-number --color=always --smart-case '.shellescape(<q-args>),
  \ 1,
  \ fzf#vim#with_preview(),
  \ <bang>0)

Plug 'wsdjeg/vim-fetch'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'airblade/vim-gitgutter'
autocmd BufWritePost * GitGutter

Plug 'wakatime/vim-wakatime'

call plug#end()

" ---------------------------------------------

set completeopt=menu,menuone,noselect

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_colors = { 'bg0': ['#21151c', 0] }
colorscheme gruvbox

" syntax enable " switch on syntax highlighting, with wich you can set colors like:
" :highlight normal ctermbg=0 guibg=#21151c

" filetype plugin indent on

