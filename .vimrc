set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-commentary'

call vundle#end()

syntax enable
syntax on
colorscheme molokai     " colorscheme
set relativenumber      " show line number
set number
set numberwidth=4
set expandtab
set tabstop=4           " Tabs
set shiftwidth=4        " Tabs
set background=dark     " Background
set cursorline          " highlight current line
set showmatch           " highlight matching {}[]()
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set pastetoggle=<F2>
set autoindent

"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

set mouse=a "enable mouse
set t_Co=256
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline\ Regular

" ctrl+s Save
inoremap <C-s> <esc>:wi<CR>
nnoremap <C-s> :w<CR>

" ctrl+w quit
inoremap <C-w> <esc>:q<CR>
nnoremap <C-w> :q<CR>

" autoindent
filetype plugin indent on

" comment
filetype plugin on
autocmd FileType apache setlocal commentstring=#\ %s

" Backup
set noswapfile
" Backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=syntax   " fold based on syntax level
" set foldmethod=indent   " fold based on indent level
let php_folding=1
let javaScript_fold=1
let xml_syntax_folding=1
autocmd BufWinLeave *.* mkview " Save folds when quitting
autocmd BufWinEnter *.* silent loadview " Save folds when quitting

" indent
nnoremap <C-right> :><CR>
nnoremap <C-left> :<<CR>
inoremap <C-right> <Esc>:><CR>i
inoremap <C-left> <Esc>:<<CR>i
vnoremap <C-right> :><CR>gv
vnoremap <C-left> :<<CR>gv

" move line
nnoremap <C-down> :m .+1<CR>
nnoremap <C-up> :m .-2<CR>
inoremap <C-down> <Esc>:m .+1<CR>
inoremap <C-up> <Esc>:m .-2<CR>
vnoremap <C-down> :m '>+1<CR> gv
vnoremap <C-up> :m '<-2<CR> gv

" highlight overlength 80 character
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/
set textwidth=80

" highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" remove white space
nnoremap <C-m> :%s/\s\+$//g <CR>

" PLUGIN =========================

" NERDTree
let g:NERDTreeDirArrows=0
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeShowHidden=1
" open in tab
let g:nerdtree_tabs_open_on_console_startup=1

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom={
    \ "Modified"  : "✹ ",
    \ "Staged"    : "✚ ",
    \ "Untracked" : "✭ ",
    \ "Renamed"   : "➜ ",
    \ "Unmerged"  : "═ ",
    \ "Deleted"   : "✖ ",
    \ "Dirty"     : "✗ ",
    \ "Clean"     : "✔︎ ",
    \ "Unknown"   : "? "
    \ }
let g:airline_powerline_fonts=1
let g:airline_theme='minimalis'
let g:airline#extensions#tabline#enabled=1

" ack
let g:ackprg='ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" commentary
autocmd FileType apache setlocal commentstring=#\ %s


" ctrlp
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules|bower_components)$'
let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'