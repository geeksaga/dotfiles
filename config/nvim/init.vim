"I usually use Python. Sometimes use Html, Css, Javascript (vue.js) and Markdown.

"================================= General Config ===================================

filetype plugin on

let g:mapleader = ","           "set leader key to comma

set number                      "line numbers
set hlsearch                    "highlight searching result
set ignorecase                  "ignore Case sensitive when searching
set showmatch                   "highlight matched bracket ()

"================================= Optional setting =================================
set relativenumber              "show relative number from current line
                                "Highly recommended
set history=1000                "store :cmd history
set title                       "change the terminal title
set cursorline                  "highlight cursor line
set mouse=h                     "Enable mouse in help mode
                                "'a' to all mode, n, v, i, c to Normal, Visual, Insert, Command mode
set wrap
let g:onedark_terminal_italics = 1

syntax sync minlines=200        "For speed up vim
set clipboard=unnamed           "yank, paste to system clipboard

"================================= Turn of swap =====================================
set noswapfile
set nobackup
set nowb

"================================= Indentation ======================================
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

"================================= Tap & Space ======================================
nmap <leader>l <Esc>:set list!<CR>
highlight SpecialKey cterm=None ctermfg=grey
map <leader>2 <Esc>:retab<CR>:set ts=4<CR>:set noexpandtab<CR>:retab!<CR>:set expandtab<CR>:set ts=2<CR>:set sw=2<CR>:retab!<CR>
map <leader>4 <Esc>:retab<CR>:set ts=2<CR>:set noexpandtab<CR>:retab!<CR>:set expandtab<CR>:set ts=4<CR>:set sw=4<CR>:retab!<CR>
set listchars=tab:>·
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:·
set listchars+=space:·
" set listchars=tab:>·
" set listchars+=trail:·          "show for tab, trail char at the end of the line
" set listchars+=extends:»
" set listchars+=precedes:«
set fillchars+=vert:\│          "Make vertical split separator full line

" ================================ Persistent Undo ===================================
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" ================================ Auto command ===================================


autocmd InsertLeave * :set cul                    "Add cursorline highlight in normal mode
autocmd FileType html setlocal sw=2 ts=2 "Set indentation to 4 for html, css, scss, js
autocmd FileType css setlocal sw=2 ts=2
autocmd FileType scss setlocal sw=2 ts=2
autocmd FileType js setlocal sw=2 ts=2

"================================= Plugins ========================================
call plug#begin('~/.config/nvim/plugged/')
"    if has('nvim')
"        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"    else
"        Plug 'Shougo/deoplete.nvim'
"        Plug 'roxma/nvim-yarp'
"        Plug 'roxma/vim-hug-neovim-rpc'
"     endif
    " ----- For deoplete autocomplete -----
"    Plug 'zchee/deoplete-jedi'
"    Plug 'zchee/deoplete-zsh'
"    Plug 'Shougo/neco-syntax'
"    Plug 'Shougo/neco-vim'
"    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } "https://github.com/carlitux/deoplete-ternjs
    Plug 'davidhalter/jedi-vim'

    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'neoclide/coc.nvim', { 'tag': '*', 'branch': 'release' }
    Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
    " ----- end -----
    Plug 'w0rp/ale', { 'do': 'npm install -g prettier' }

    Plug 'nightsense/simplifysimplify'
    " Plug 'wakatime/vim-wakatime'            "check coding time
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'          "Toggle nerd tree with one key
    Plug 'mattn/emmet-vim'                  "Trigger: <C-y><leader>
    Plug 'tpope/vim-commentary'             "Trigger: gc
    Plug 'jiangmiao/auto-pairs'             "Auto pair for ',), }, ]...
    Plug 'airblade/vim-gitgutter'           "Show git status in vim
    Plug 'tpope/vim-fugitive'               "syntax error
    Plug 'ctrlpvim/ctrlp.vim'               "Ctrl + P for search file
    Plug '~/.fzf'                           "https://github.com/junegunn/fzf.vim
    Plug 'junegunn/fzf.vim'
    Plug 'mhinz/vim-startify'               "fancy start page for empty vim
    Plug 'posva/vim-vue'
    Plug 'tomasiser/vim-code-dark'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-sensible'
    Plug 'junegunn/seoul256.vim'
    Plug 'thaerkh/vim-indentguides'
    Plug 'fatih/vim-go', { 'tag': '*' }
    Plug 'nsf/gocode', { 'tag': 'v.20170907', 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/nvim/symlink.sh' }

    call plug#end()

" User deoplete
"let g:deoplete#enable_at_startup = 1

"================================= Plugins setting ==================================
"----- Nerd Tree -----
map <F3> :NERDTreeToggle<CR>
"map nt <ESC>:NERDTreeToggle<CR>
"map nt <ESC>:NERDTree<CR>
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"----- deoplete -----
" use tab to forward cycle
"inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
"inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" For deoplete-ternjs
"let g:deoplete#sources#ternjs#filetypes = [
"                \ 'vue',
"                \ ]
" ----- jedi vim -----
let g:jedi#show_call_signatures = "0"   "jedi-vim slowdown

" ----- ale -----
let g:ale_lint_on_save = 1              "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
let g:ale_statusline_format =[' %d E ', ' %d W ', '']                           "Status line texts
let g:ale_linters = {'javascript': ['eslint']}                                  "Lint js with eslint
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}                       "Fix eslint errors
" ALEFix, ALEFixSuggest로 fix 사용 가능

let g:indentguides_ignorelist = ['text']
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'

colorscheme codedark

