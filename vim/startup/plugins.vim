set nocompatible " not vi compatible

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-sensible'

Plug 'scrooloose/nerdtree'

" nerdtree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeIgnore = ['\.d$', '\.o$']

Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'

Plug 'mileszs/ack.vim'
" ack.vim config
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ack.vim do not jump to first result
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

Plug 'ctrlpvim/ctrlp.vim'

" ctrlp.vim config
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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

    Plug 'Valloric/YouCompleteMe'
endif

" Airline for pretty status/tab lines
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1 " git gutter

" Add support to switch between cpp/h files
Plug 'vim-scripts/a.vim'

map <F4> :A<CR>
map <F5> :AV<CR>

" Highlights whitespace 
Plug 'ntpeters/vim-better-whitespace'

call plug#end()
