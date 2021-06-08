"================================= General Config ===================================
filetype plugin on

let g:mapleader = ","           " set leader key to comma

set number                      " show line numbers
set showmatch                   " highlight matched bracket [{()}]
"set ruler
"set showcmd                     " show command in bottom bar
set wildmenu                     " visual autocomplete for command menu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set lazyredraw                   " redraw only when we need to

"================================= Serarch setting =================================
set smartcase
set hlsearch                    " highlight searching result
set ignorecase                  " ignore Case sensitive when searching
set incsearch                   " search as characters are entered

"================================= Optional setting =================================
set relativenumber                 " show relative number from current line
set history=1000                   " store :cmd history
set hidden                         " Hide buffers when they are abandoned
set title                          " change the terminal title
set cursorline                     " highlight cursor line
set mouse=h                        " Enable mouse in help mode
                                   "'a' to all mode, n, v, i, c to Normal, Visual, Insert, Command mode
set wrap
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" let g:onedark_terminal_italics = 1

let g:polyglot_disabled = ['markdown']

if has("syntax")
    syntax on                           " Syntax highlight
endif

" syntax enable                       " enable syntax processing
syntax sync minlines=200            " For speed up vim

set encoding=utf8                   " set utf8 as standard encoding

" set clipboard=unnamed             " yank, paste to system clipboard
set clipboard=unnamedplus           " yank, paste to system clipboard

"================================= Turn of swap =====================================
set laststatus=2                     " Always display the statusline in all windows
set showtabline=2                    " Always display the tabline, even if there is only one tab
set noshowmode                       " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"================================= Turn of swap =====================================
set noswapfile
set nobackup
set nowb

"================================= Spaces & Tabs (Indentation) ======================
set smartindent
set autoindent
set shiftwidth=4                  " autoindent witdth
set softtabstop=4                 " number of spaces in tab where editing
set tabstop=4                     " number of visual spaces per TAB
set expandtab                     " tabs are spaces

"================================= Tap & Space ======================================
nmap <leader>l <Esc>:set list!<CR>
highlight SpecialKey cterm=None ctermfg=grey
map <leader>2 <Esc>:retab<CR>:set ts=4<CR>:set noexpandtab<CR>:retab!<CR>:set expandtab<CR>:set ts=2<CR>:set sw=2<CR>:retab!<CR>
map <leader>4 <Esc>:retab<CR>:set ts=2<CR>:set noexpandtab<CR>:retab!<CR>:set expandtab<CR>:set ts=4<CR>:set sw=4<CR>:retab!<CR>
set listchars=tab:>·
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
" set listchars+=nbsp:·
" set listchars+=space:·
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

" ================================ For Java===================================

" map <F6> :!java %:r<SPACE>
" map <F7> :w<ENTER>:make<ENTER>

" set makeprg=javac %\
" set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

" ================================ Auto command ===================================


autocmd InsertLeave * :set cul                    "Add cursorline highlight in normal mode
autocmd FileType html setlocal sw=2 ts=2 "Set indentation to 4 for html, css, scss, js
autocmd FileType css setlocal sw=2 ts=2
autocmd FileType scss setlocal sw=2 ts=2
autocmd FileType js setlocal sw=2 ts=2

"================================= Plugins ========================================
call plug#begin('~/.config/nvim/plugged/')
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'neoclide/coc.nvim', { 'tag': '*', 'branch': 'release' }
    Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }
    " ----- end -----
    Plug 'w0rp/ale', { 'do': 'npm install -g prettier' }

    Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

    Plug 'nightsense/simplifysimplify'
    " Plug 'wakatime/vim-wakatime'            "check coding time

    Plug 'bronson/vim-visual-star-search'

    Plug 'jistr/vim-nerdtree-tabs'          "Toggle nerd tree with one key
    Plug 'scrooloose/nerdtree'              "A tree explorer plugin for vim
    Plug 'scrooloose/syntastic'             "Syntax checking hacks for vim

    " Plug '~/.fzf'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "https://github.com/junegunn/fzf.vim
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/seoul256.vim'
    Plug 'vuciv/vim-bujo'                   "https://github.com/vuciv/vim-bujo

    Plug 'ryanoasis/vim-devicons'
    Plug 'gruvbox-community/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'flazz/vim-colorschemes'
    Plug 'itchyny/lightline.vim'            " https://github.com/itchyny/lightline.vim

    Plug 'airblade/vim-gitgutter'           "Show git status in vim

    Plug 'mattn/emmet-vim'                  "Trigger: <C-y><leader>

    Plug 'tpope/vim-fugitive'               "Git Wrapper
    Plug 'tpope/vim-commentary'             "Trigger: gc, gcc
    Plug 'tpope/vim-surround'               "Trigger: cs'<>, ds'
    Plug 'tpope/vim-sensible'

    Plug 'jiangmiao/auto-pairs'             "Auto pair for ',), }, ]...
    Plug 'ctrlpvim/ctrlp.vim'               "Fuzzy file, buffer, mru, tag, etc finder. Ctrl + P for search file
    Plug 'mhinz/vim-startify'               "fancy start page for empty vim
    Plug 'posva/vim-vue'

"    Plug 'joshdick/onedark.vim'             "One Dark syntax theme https://github.com/joshdick/onedark.vim
    Plug 'sheerun/vim-polyglot'             "A collection of language packs https://github.com/sheerun/vim-polyglot

    Plug 'thaerkh/vim-indentguides'
    Plug 'cespare/vim-toml'

    Plug 'rust-lang/rust.vim'

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

    " For Java
    Plug 'mfussenegger/nvim-jdtls'

    call plug#end()

inoremap jk <Esc>

"================================= Plugins setting ==================================
"----- Nerd Tree -----
map <F3> :NERDTreeToggle<CR>


"----- vim visual start search -----
" xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
" xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" function! s:VSetSearch(cmdtype)
"     let temp = @s
"     norm! gv"sy
"     let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
"     let @s = temp
" endfunction

" vim TODO
nmap <C-S> <Plug>BujoAddnormal
imap <C-S> <Plug>BujoAddinsert
nmap <C-Q> <Plug>BujoChecknormal
imap <C-Q> <Plug>BujoCheckinsert
" nmap <Leader>tu <Plug>BujoChecknormal
" nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
let g:bujo#window_width = 40

" fzf
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>

"----- airline -----
"let g:airline_left_sep='>'
"let g:airline_right_sep='<'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline_theme='hybrid'

nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

"----- gruvbox -----
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

"----- Coc -----
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let g:loaded_ruby_provider = 0
let g:python3_host_prog = '/opt/python3.8.5/bin/python3'

" ----- lightline ----
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

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

" https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|node_modules$\|DS_Store$\|log$\|tmp$',
    \ 'file': '\v\.(pyc|exe|so|dll)$'
    \ }

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']       "Ignore in .gitignore

" colorscheme onedark
colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
