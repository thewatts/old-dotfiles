"PATHOGEN
execute pathogen#infect()

"Want a different map leader than \
let mapleader = ","

set t_Co=256
"colorscheme lucius
colorscheme smyck
set background=dark

" Control-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_map = '<c-q>'
"jlet g:ctrlp_cmd = 'CtrlQ'

" set default yank register to machine clipboard
set clipboard=unnamed

set backspace=indent,eol,start

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<

"For ERB  & HTML Formatting
autocmd BufRead,BufNewFile *.erb  set filetype=html autoread
autocmd BufRead,BufNewFile *.html set filetype=html autoread

" Trailing Whitespace
match ErrorMsg '\s\+$'

" KILL ALL WHITESPACE!
nnoremap <leader>rtw :%s/\s\+$//e<CR>

syntax on

set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"no swap
set noswapfile

" Toggle paste
" For some reason pastetoggle doesn't redraw the screen (thus the status bar
" doesn't change) while :set paste! does, so I use that instead.
" set pastetoggle=<F6>
nnoremap <F6> :set paste!<cr>
nnoremap <F7> :noh<cr>

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" Resize splits when the window is resized
au VimResized * :wincmd =

"jj escape
:imap jj <Esc>

" POWERLINE
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
let g:Powerline_symbols = 'fancy'

" always show the status
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
"set rtp+=/Users/watts/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings.vim

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in the lower right corner
set ruler

"Color line!
set colorcolumn=80

"We have a fast terminal
set ttyfast

" make vim redraw screen instead of scrolling when there are more than 3 lines to be scrolled
set ttyscroll=999

set so=999

"Backup stuff
set nobackup
set nowritebackup

"Lazy ReDraw!
set lazyredraw

"Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Show command in bottom right portion of the screen
set showcmd

"Show line numbers
set number

"Show cursor line
:set cursorline

"Indent stuff
set smartindent
set autoindent

"Always show last status line
set laststatus=2

"Better line wrapper
set wrap
set textwidth=80
set formatoptions=qrn1

"Set incremental searching
set incsearch

"Highlight searching
set hlsearch

"case insensitive search
set ignorecase
set smartcase

" Insert a hash rocket with <c-l>
imap <c-l> =><space>

"Easy splits and switches over (\v)
nnoremap <leader>v <C-w>v<C-w><C-w>
nnoremap <leader>s <C-w>s<C-w><C-w>

"Map escape key to jj -- much faster
imap jj <esc>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"GitGutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Added SignColumn used by Vim-gutter to match default BG colour
" Background color is the same as the one defined by the “:hi Normal” line
hi SignColumn ctermbg=145 guibg=#252c31 gui=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD TREE TOGGLE
" press F4 to lint!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-k><C-b> :NERDTreeToggle<CR>
" hidden files
let NERDTreeShowHidden=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inline Evaluation of Ruby
" leader + e
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType ruby nmap <buffer> <leader>e <Plug>(xmpfilter-mark) <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <leader>e <Plug>(xmpfilter-mark) <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <leader>e <Plug>(xmpfilter-mark) <Plug>(xmpfilter-run)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Thor syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.thor set filetype=thor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_use_caching = 0

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
nnoremap <leader><leader> <c-^>

" LINE COLOR?
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
"let &colorcolumn="80,".join(range(120,999),",")

" Test Runner
"nnoremap <cr> :!echo "rspec spec" >> .test-commands<cr>

"MACVIM settings
set guifont=Source\ Code\ Pro\ Light:h16            " Font family and font size.
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set guioptions-=r                 " Don't show right scrollbar
set guioptions-=l                 " Don't show left scrollbar

" MARKDOWN
" disable folding
let g:vim_markdown_folding_disabled=1

" Easy Switch from HTML/PHP Indentation
nnoremap <leader>q :call HTMLPHPTemplateToggle()<cr>

let g:php_is_enabled = 0

function! HTMLPHPTemplateToggle()
  if g:php_is_enabled
    :set ft=html
    let g:php_is_enabled = 0
  else
    :set ft=php
    let g:php_is_enabled = 1
  endif
endfunction

" Hopefully fix HTML Indentation
autocmd FileType html setlocal indentkeys-=*<Return>

function! ExecuteGoCode()
  exec ":!clear && go run " . @%
endfunction

" Execute GO with Enter key
function! MapCR()
  if (&ft=='go')
    :call ExecuteGoCode()
  endif
endfunction

:nnoremap <cr> :call MapCR()<cr>
