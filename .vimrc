"= Initial setup ==================================================================================

  " use Vim settings, rather than Vi settings, required for Vundle
  set nocompatible
  filetype off

  " initialize Vundle and rebuild helptags
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'gmarik/Vundle.vim'                " let Vundle manage Vundle, required
  Plugin 'scrooloose/nerdtree'              " file menu
  Plugin 'kien/ctrlp.vim'                   " fuzzy file finder
  Plugin 'scrooloose/syntastic'             " syntax checker
  Plugin 'godlygeek/tabular'                " for indentation
  Plugin 'airblade/vim-gitgutter'           " git diff in gutter
  Plugin 'christoomey/vim-tmux-navigator'   " easy navigation b/w vim & tmux
  Plugin 'tpope/vim-commentary'             " easily use comments
  Plugin 'terryma/vim-multiple-cursors'     " multiple cursors
  Plugin 'kchmck/vim-coffee-script'         " coffeescript syntax & indent
  Plugin 'mileszs/ack.vim'                  " searching via :Ack
  Plugin 'vim-ruby/vim-ruby'                " ruby syntax & indent
  Plugin 'tpope/vim-markdown'               " markdown syntax & indent
  Plugin 'pangloss/vim-javascript'          " javascript syntax & indent
  Plugin 'othree/html5.vim'                 " html5 syntax & indent
  Plugin 'tpope/vim-haml'                   " haml syntax & indent
  Plugin 'fatih/vim-go'                     " go syntax / indent / plugins
  Plugin 'mustache/vim-mustache-handlebars' " mustache/handlebars syntax & indent
  Plugin 'heartsentwined/vim-emblem'        " emblem syntax & indent
  Plugin 'thoughtbot/vim-rspec'             " Vim RSPEC runner
  Plugin 'nathanaelkane/vim-indent-guides'  " Indent guides to keep your code aligned
  Plugin 'groenewege/vim-less'              " Less syntax highlighting / indentation

  " end Vundle init (required)
  call vundle#end()
  filetype plugin indent on

"= Interface ======================================================================================

  "- Appearance -----------------------------------------------------------------------------------

    syntax on                    " turn on syntax highilghting

    filetype plugin on           " enable loading plugins for filetypes
    filetype indent on           " enable loading 'indent files' for filetypes

    set synmaxcol=400            " no syntax highlighting for lines longer than 200 cols

    set laststatus=2             " show status bar

    set number                   " display line numbers
    set visualbell               " use visual bell

    set background=dark          " Dark background
    set laststatus=2             " Fix for statusbar toggling
    set encoding=utf-8           " Fix special character encoding
    set t_Co=256                 " MOAR COLORS

    set cursorline               " show cursor line
    set ruler                    " cursor position in the lower right corner

    match ErrorMsg '\s\+$'       " highlight trailing whitespace

    au VimResized * :wincmd =    " resize splits when window is resized

  "- Interaction ----------------------------------------------------------------------------------

    set ttyfast                  " improve screen refresh for terminal vim
    set lazyredraw               " don't redraw while executing macros. async window title update
    set ttyscroll=3              " something about scrolling buffer size

    set scrolloff=3              " start scrolling 3 lines from bottom
    set sidescrolloff=6          " start scrolling 6 lines from right
    let loaded_match_paren = 1   " highlight matching parens

    set mouse=a                  " allow mouse usage
    set clipboard=unnamed        " set default yank register to machine clipboard

    set nofoldenable             " disable folding

  "- Wrapping -------------------------------------------------------------------------------------

    set nowrap                   " don't softwrap text
    set formatoptions-=t         " don't automatically hardwrap text (use 'gq' to reflow text)
    set textwidth=100            " wrap at column 100
    set wrapmargin=0             " don't wrap based on terminal size

  "- Indentation ----------------------------------------------------------------------------------

    set autoindent               " indent next line to same level as current line
    set smartindent              "   ↑ but do it smartly
    set smarttab                 " <Tab> in front of a line inserts 'shiftwidth' blanks
    set shiftwidth=2             "   ↑ use 2 blanks for above
    set tabstop=2                " display a <Tab> as 2 spaces
    set softtabstop=2            " use 2 spaces for a <Tab>
    set expandtab

  "- Searching ------------------------------------------------------------------------------------

    set hlsearch                 " highlight searching
    set ignorecase               " case insensitive search
    set smartcase                " case insensitive search
    set incsearch                " incremental search

  "- Theme ----------------------------------------------------------------------------------------

    set background=dark          " dark background
    colorscheme smyck            " colorscheme

    let &colorcolumn=join(range(81,999),",")
    highlight ColorColumn ctermbg=235 guibg=#2c2d27
    highlight SignColumn ctermbg=NONE guibg=NONE gui=NONE

"= Utilities ======================================================================================

  set noswapfile                 " don't create swap files
  set autowrite                  " write the old file out when switching between files

"= Keys ===========================================================================================

  let mapleader = ','                       " set <Leader>
  set backspace=indent,eol,start            " make backspace behave as expected
  nnoremap <leader>v <C-w>v<C-w><C-w>       " easy splits and switches over (\v)
  nnoremap <leader>h <C-w>s<C-w><C-w>

  " map escape key to jj -- much faster, comments above b/c of Vim's interpretation of them jumping my cursor
  imap jj <esc>

  nmap <C-h> <C-w>h                         " easier window navigation
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l

  nnoremap <leader>rtw :%s/\s\+$//e<CR>     " kill the trailing whitespace

  " toggle Paste mode, comments above b/c of Vim's interpretation of them jumping my cursor
  nnoremap <F6> :set paste!<cr>
  nnoremap <F7> :noh<cr>                    " toggle off highlight

  nmap <silent> <leader>ev :e $MYVIMRC<CR>  " quick edit VIMRC
  nmap <silent> <leader>sv :so $MYVIMRC<CR> " quick reload VIMRC

  nnoremap <leader><leader> <c-^>           " quick switch file

  "- Tab Key --------------------------------------------------------------------------------------
  function! InsertTabWrapper()   " tab autocomplete
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
      return "\<tab>"
    else
      return "\<c-p>"
    endif
  endfunction

  inoremap <tab> <c-r>=InsertTabWrapper()<cr>
  inoremap <s-tab> <c-n>

"= Plugin Settings=================================================================================

  "- Powerline ------------------------------------------------------------------------------------

  python from powerline.vim import setup as powerline_setup
  python powerline_setup()
  python del powerline_setup
  let g:Powerline_symbols = 'fancy'
  set fillchars+=stl:\ ,stlnc:\
  set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings.vim

  "- Syntastic ------------------------------------------------------------------------------------
  let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] } " disable checking for html

  "- NerdTree -------------------------------------------------------------------------------------

  nnoremap <C-k><C-b> :NERDTreeToggle<CR> " toggle NerdTree (ControlK + ControlB)
  let NERDTreeShowHidden=1                " show hidden files
  let NERDTreeQuitOnOpen = 1              " Hide NERDTree when opening a file

  "- Control-P ------------------------------------------------------------------------------------

  " Don't use caching
  let g:ctrlp_use_caching = 0

  " Custom ignore paths
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
  let g:ctrlp_custom_ignore = {
    \ 'dir':  'node_modules',
    \ }

  "- Ack ------------------------------------------------------------------------------------------

  let g:ackprg = 'ag --nogroup --nocolor --column'

  "- Rspec.vim  -----------------------------------------------------------------------------------

  let g:rspec_command = "!bundle exec bin/rspec {spec}"         " use spring
  let g:rspec_runner = "os_x_iterm"
  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>

  "- Indent Guides ---------------------------------------------------------------------------------

  let g:indent_guides_color_change_percent = 3      " ultra-low-contrast guides
  let g:indent_guides_guide_size = 2                " between 0 and 'shiftwidth'
  let g:indent_guides_start_level = 1               " don't show guides until the third indent

"= Language Specific Settings======================================================================

  "- Golang ---------------------------------------------------------------------------------------

  let g:go_fmt_command = "gofmt"         " use gofmt on save w/ go commands (from go plugin)

  function! ExecuteGoCode()              " for running Golang on enter
    exec ":!clear && go run " . @%
  endfunction

  "- J Builder ------------------------------------------------------------------------------------

  au BufNewFile,BufRead *.json.jbuilder set ft=ruby       " set syntax to ruby

"= Enter Key ======================================================================================

  function! MapCR()
    if (&ft=='go')
      :call ExecuteGoCode()
    endif
    if (&ft=='ruby')
      :call RunLastSpec()
    endif
  endfunction

  :nnoremap <cr> :call MapCR()<cr>
