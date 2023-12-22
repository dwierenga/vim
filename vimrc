"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" the basics 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set visualbell 
set laststatus=2 noruler
set number wildmenu wildoptions=pum wildmode=list,longest,full showmatch
set hidden splitright splitbelow autochdir 
set linebreak breakindent showbreak=⮑\  textwidth=120
set shiftwidth=4 softtabstop=4 expandtab shiftround
set encoding=utf8
let mapleader=" "
set listchars=tab:\|_\|,precedes:<,nbsp:+,eol:√,trail:»
filetype plugin on
set mouse=a
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set up the vim-plug plugin to manage our other plugins https://github.com/junegunn/vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use vim-plug as the plugin manager 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'yegappan/mru'
Plug 'github/copilot.vim'
Plug 'hashivim/vim-terraform'
Plug 'preservim/nerdtree'
"below from https://pragmaticpineapple.com/ultimate-vim-typescript-setup/
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors and visual setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=light
colorscheme delek
set statusline=[buf#\ %n\]\ \ %F\ %r%q%m%=ASCII:%b\ HEX:0x%B\|\ %y\ C:%c\ R:%l/%L\ 
hi StatusLine ctermbg=red   " :h cterm-colors
let g:netrw_winsize = 35
let g:netrw_liststyle=3
set signcolumn=yes
if has('gui')
    hi Statusline guifg=#ffffff guibg=#ff0000
    set guifont=hack_nerd_font_mono:h16
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map \w to the window command
nnoremap <Leader>w <C-w>
"jump to the previous/next buffer
nnoremap <Leader><Tab> :bnext<CR>
nnoremap <Leader><S-Tab> :bprevious<CR>
" use ctrl j/k to move a line up/down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
nnoremap <leader>M :e $MYVIMRC<CR>
nnoremap == :Mru<CR>
nnoremap __ :Lexplore<CR>
nnoremap <Leader>e :Lexplore<CR>
nnoremap ++ :ls<CR>:b<Space>
nnoremap <Leader>b :ls<CR>:b<Space>
"keeps the current visual block selection active after changing indent with
"'<' or '>'. Usually the visual block selection is lost after you shift it, which is incredibly annoying.
vnoremap > >gv
vnoremap < <gv
"For quick recordings just type qq to start recording, then q  to stop
"to play back the recording you just type Q
nnoremap Q @q
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands & file/buffer loading 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead *.lst set filetype=sql
" if the cursor is on "create_table", let 'gf' look for "create_table.sql" and "create_table.lst" also
set suffixesadd+=.sql,.lst
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
