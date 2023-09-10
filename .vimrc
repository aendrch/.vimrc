" aendrch vim configuration file
" September 2023 release
" Based on Vim-Plug

-- Preferences ---"
syntax enable
set nu
set clipboard=unnamedplus
set mouse=a
set showcmd
set cmdheight=1
filetype plugin indent on
set ruler
set splitbelow
set splitright
set encoding=UTF-8
set fileencoding=UTF-8
set showmatch
set sw=2
set shell
set wildmenu
set nocompatible
set history=1000
set t_Co=256
set numberwidth=1
set noerrorbells
set visualbell
set laststatus=2
set showmode
set cursorline
set autoindent
set list lcs=tab:\|\ 
set title
set shiftwidth=2
set tabstop=2
set softtabstop=2
set smarttab
set expandtab
set backspace=2
set guioptions-=T
set guioptions-=L
set fileformats=unix,dos,mac
hi CursorLine term=italic cterm=bold guibg=Grey40

packloadall

if has('termguicolors')
  set termguicolors
endif

set background=dark

highlight ColoColumn ctermbg=0 guibg=lightgrey

"*--- Language Support ---*"
au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |

"*--- Vundle Plugins ---*"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 
" Themes
Plugin 'VundleVim/Vundle.vim'
Plugin 'sainnhe/gruvbox-material'
Plugin 'ryanoasis/vim-devicons'
Plugin 'Yggdroot/indentLine'
" IDE
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'zxqfl/tabnine-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
Plugin 'APZelos/blamer.nvim'
" Multicursor
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
" Status
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'enricobacis/vim-airline-clock'
Plugin 'bagrat/vim-buffet'
" FileExplorer
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'gko/vim-coloresque'
" HTML/CSS
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'terryma/vim-multiple-cursors'
" Python Config
Plugin 'valloric/youcompleteme'
Plugin 'vim-python/python-syntax'
" TypeScript Config 
Plugin 'leafgarland/typescript-vim' 
Plugin 'embark-theme/vim', { 'as': 'embark' }
call vundle#end()

" IndentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 1

" Gruvbox (theme-config)
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_palette = 'original'

" Syntastic Recommended-Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:airline#extensions#syntastic#enabled = 1

" Git Lens
let g:blamer_enabled = 1

"Prettier
let b:prettier_exec_cmd = 1

" Netrw
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

"colorscheme dracula
colorscheme gruvbox-material

let NERDTreeQuitOnOpen=1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'tomorrow'
let g:airline#extensions#clock#auto = 1
let g:airline#extensions#clock#format = '%H:%M'


" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
" This will make the ist of non-closing tag self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" Filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled
let g:closetag_filetypes = 'html, xhtml, phtml'
" This will make the the list of non-closing tags self-closing un the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" Disables auto-clos if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, defeault is ' '
let g:closetag_close_shortcut = '<leader>>'

au FileType c,cpp,objc,objcpp call rainbow#load()
au BufNewFile,BufRead *.py
\ set tabstop=2 | 
\ set softtabstop=2 |
\ set shiftwidth=2 |
\ set textwidth=120 | 

let python_highlight_all= 1

let mapleader=" "

" Mapping {Plugins}
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>fq :q! <CR>
nmap <Leader>fw :q! <CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>sr :source %<CR>
nmap <Leader>j :bprev<CR>
nmap <Leader>k :bnext<CR>
nmap <Leader>bd :bd<CR> 

" Open terminal
nmap <Leader>wt :belowright terminal<CR>

"Vim devicons
if exists("g:loaded_webdevicons")
call webdevicons#refresh()
endif

let g:airline_powerline_fonts= 1
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_ctrlp = 1
let g:lightline = {
      \ 'colorscheme': 'gruvbox-material',
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
