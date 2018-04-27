set nocompatible " not vi compatible

source ~/.vim/startup/functions.vim " User defined functions
source ~/.vim/startup/settings.vim

let g:platform = GetPlatform()

"--------------
" Load pathogen
"--------------
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jlanzarotta/bufexplorer'

" Linux-Only plug-ins
if g:platform != "AIX"
    function! BuildYCM(info)
        " info is a dictionary with 3 fields
        " - name:   name of the plugin
        " - status: 'installed', 'updated', or 'unchanged'
        " - force:  set on PlugInstall! or PlugUpdate!
        if a:info.status == 'installed' || a:info.force
            !./install.py
        endif
    endfunction

    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
endif

call plug#end()

"------------------
" Plugin config
"------------------

" nerdtree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ack.vim config
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ack.vim do not jump to first result
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" ctrlp.vim config
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"------------------
" Syntax and indent
"------------------
syntax on " turn on syntax highlighting

" highlight current line, but only in active window
augroup CursorLineOnlyInActiveWindow
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" vim can autodetect this based on $TERM (e.g. 'xterm-256color')
" but it can be set to force 256 colors
set t_Co=256
if has('gui_running')
    colorscheme solarized
    let g:lightline = {'colorscheme': 'solarized'}
elseif &t_Co < 256
    colorscheme default
    set nocursorline " looks bad in this mode
else
    set background=dark
    let g:solarized_termcolors=256 " instead of 16 color with mapping in terminal
    colorscheme solarized
    " customized colors
    highlight SignColumn ctermbg=234
    highlight StatusLine cterm=bold ctermfg=245 ctermbg=235
    highlight StatusLineNC cterm=bold ctermfg=245 ctermbg=235
    let g:lightline = {'colorscheme': 'dark'}
    highlight SpellBad cterm=underline
endif

filetype plugin indent on " enable file type detection

"--------------------
" Misc configurations
"--------------------

" unbind keys
map <C-a> <Nop>
map <C-x> <Nop>

" avoid the ESC key
imap jj <Esc>

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" save read-only files
command -nargs=0 Sudow w !sudo tee % >/dev/null

"---------------------
" Local customizations
"---------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
