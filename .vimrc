"= Initial setup ==================================================================================

  " use Vim settings, rather than Vi settings, required for Vundle
  set nocompatible
  filetype off

  " initialize Vundle and rebuild helptags
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

  Plugin 'gmarik/Vundle.vim'                " let Vundle manage Vundle, required
  Plugin 'scrooloose/nerdtree'              " file menu
  Plugin 'ctrlpvim/ctrlp.vim'               " fuzzy file finder
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
  Plugin 'benmills/vimux'                   " Vim + Tmux Goodness
  Plugin 'nathanaelkane/vim-indent-guides'  " Indent guides to keep your code aligned
  Plugin 'groenewege/vim-less'              " Less syntax highlighting / indentation
  Plugin 'hunner/vim-plist'                 " PLIST Syntax Highlighting / indentation
  Plugin 'tpope/vim-endwise'                " auto end addition in ruby
  Plugin 't9md/vim-ruby-xmpfilter'          " inline ruby completion
  Plugin 'wesQ3/vim-windowswap'             " window swapping
  Plugin 'bling/vim-airline'                " nice looking footer bar
  Plugin 'wting/rust.vim'                   " rust syntax & indent
  Plugin 'godlygeek/csapprox'               " better gvim color support
  Plugin 'guns/vim-clojure-static'          " clojure syntax highlighting / indentation
  Plugin 'briancollins/vim-jst'             " JST / EJS syntax
  Plugin 'vim-perl/vim-perl'                " perl syntax highlighting / indentation
  Plugin 'chriskempson/base16-vim'          " base 16 colorscheme
  Plugin 'tfnico/vim-gradle'                " gradle syntax highlighting
  Plugin 'Valloric/YouCompleteMe'           " auto complete, son
  Plugin 'toyamarinyon/vim-swift'           " swift syntax highlighting / indent
  Plugin 'mxw/vim-jsx'                      " vim syntax highlighting / indent for jsx
  Plugin 'mattn/emmet-vim'                  " emmet stuff for vim [http://emmet.io/]
  Plugin 'jordwalke/flatlandia'
  Plugin 'Yggdroot/indentLine'              " Line Indentation Markers
  Plugin 'elzr/vim-json'                    " JSON jazz
  Plugin 'slim-template/vim-slim'           " slim syntax highlighting
  Plugin 'elixir-lang/vim-elixir'           " Elixir

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
    set linebreak
    set formatoptions-=t         " don't automatically hardwrap text (use 'gq' to reflow text)
    set wrapmargin=0             " don't wrap based on terminal size

  "- Indentation ----------------------------------------------------------------------------------

    set autoindent               " indent next line to same level as current line
    set smartindent              "   ↑ but do it smartly
    set smarttab                 " <Tab> in front of a line inserts 'shiftwidth' blanks
    set shiftwidth=2             "   ↑ use 2 blanks for above
    set tabstop=2                " display a <Tab> as 2 spaces
    set softtabstop=2            " use 2 spaces for a <Tab>
    set expandtab

    " for html
    autocmd FileType html setlocal indentkeys-=*<Return>
    autocmd FileType html.handlebars setlocal indentkeys-=*<Return>
    autocmd FileType eruby setlocal indentkeys-=*<Return>

  "- Searching ------------------------------------------------------------------------------------

    set hlsearch                 " highlight searching
    set ignorecase               " case insensitive search
    set smartcase                " case insensitive search
    set incsearch                " incremental search

  "- Theme ----------------------------------------------------------------------------------------

    set background=dark      " dark background
    " set background=light      " dark background
    " colorscheme smyck      " smyck colorscheme
    " colorscheme solarized  " solarized colorscheme
    colorscheme flatlandia   " flatlandia colorscheme
    " colorscheme ocean   " flatlandia colorscheme

    let &colorcolumn=join(range(81,999),",")
    highlight ColorColumn ctermbg=235 guibg=#2c2d27
    highlight SignColumn ctermbg=NONE guibg=NONE gui=NONE

"= Utilities ======================================================================================

  set noswapfile                     " don't create swap files
  set autowrite                      " write the old file out when switching between files
  autocmd BufWritePre * :%s/\s\+$//e " auto strip whitespace on save

"= Keys ===========================================================================================

  let mapleader = ','                       " set <Leader>
  set backspace=indent,eol,start            " make backspace behave as expected

  " easy splits and switches over (\v)
  nnoremap <leader>v <C-w>v<C-w><C-w>
  nnoremap <leader>h <C-w>s<C-w><C-w>

  " map escape key to jj -- much faster, comments above b/c of Vim's interpretation of them jumping my cursor
  imap jj <esc>

  " easier window navigation
  nmap <C-h> <C-w>h
  nmap <C-j> <C-w>j
  nmap <C-k> <C-w>k
  nmap <C-l> <C-w>l

  " kill the trailing whitespace
  nnoremap <leader>rtw :%s/\s\+$//e<CR>

  " toggle Paste mode, comments above b/c of Vim's interpretation of them jumping my cursor
  nnoremap <F6> :set paste!<cr>
  " toggle No Highlight mode, comments above b/c of Vim's interpretation of them jumping my cursor
  nnoremap <F7> :noh<cr>

  " quick edit VIMRC
  nmap <silent> <leader>ev :e $MYVIMRC<CR>
  " quick reload VIMRC
  nmap <silent> <leader>sv :so $MYVIMRC<CR>

  " quick switch file
  nnoremap <leader><leader> <c-^>

  " quick insert hashrocket
  imap <c-l> <space>=><space>

"= Plugin Settings=================================================================================

  "- Syntastic ------------------------------------------------------------------------------------
  let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] } " disable checking for html

  let g:syntastic_javascript_checkers = ['eslint']

  "- Markdown ------------------------------------------------------------------------------------
  let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass']

  "- NerdTree -------------------------------------------------------------------------------------
  " toggle NerdTree (ControlK + ControlB)
  nnoremap <C-k><C-b> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1    " show hidden files
  let NERDTreeQuitOnOpen = 1  " Hide NERDTree when opening a file

  "- Tabularize  ----------------------------------------------------------------------------------
  vmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>{ :Tabularize /{<CR>

  "- Control-P ------------------------------------------------------------------------------------
  " Don't use caching
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = ''

  "- JSX ------------------------------------------------------------------------------------
  let g:jsx_ext_required = 0 " Allow JSX in normal JS files

  " Custom ignore paths
  set wildignore+=*/tmp/*,*/bin/*,*/bower_components/*,*.so,*.swp,*.zip     " MacOSX/Linux
  let g:ctrlp_custom_ignore = {
    \ 'dir':  'node_modules',
    \ }

  "- Ack ------------------------------------------------------------------------------------------
  let g:ackprg = 'ag --nogroup --nocolor --column'

  "- Rspec.vim  -----------------------------------------------------------------------------------
  " let g:rspec_command = '!bundle exec bin/rspec {spec}'  " use spring w/ rspec runner
  let g:rspec_command = '!bundle exec rspec {spec}'      " dont use spring w/ rspec runner
  let g:rspec_runner = 'os_x_iterm'
  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>

  "- XMPFilter  ------------------------------------------------------------------------------------
  map <C-b> <Plug>(xmpfilter-mark)<Plug>(xmpfilter-run)

  "- Indent Guides ---------------------------------------------------------------------------------
  " let g:indent_guides_color_change_percent = 3      " ultra-low-contrast guides
  " let g:indent_guides_guide_size = 2                " between 0 and 'shiftwidth'
  " let g:indent_guides_start_level = 1               " don't show guides until the third indent
  let g:indentLine_enabled = 1
  let g:indentLine_char = '¦'
  let g:indentLine_color_term = 239
  let g:indentLine_noConcealCursor = 1
  " let g:indentLine_faster = 1

  "= Airline ========================================================================================
  let g:airline_powerline_fonts = 1

  "= Goyo & Limelight ===============================================================================
  autocmd User GoyoEnter Limelight
  autocmd User GoyoLeave Limelight!
  let g:goyo_width = 120
  nnoremap <Leader>G :Goyo<CR>

"= Language Specific Settings======================================================================

  "- Golang ---------------------------------------------------------------------------------------
  let g:go_fmt_command = 'goimports'     " use gofmt on save w/ go commands (from go plugin)

  function! ExecuteGoCode()              " for running Golang on enter
    exec ":!clear && go run " . @%
  endfunction

  "- C ---------------------------------------------------------------------------------------
  function! ExecuteCCode()
    exec ':Shell gcc ' . @% . ' -o file && ./file'
  endfunction

  "- Rust-------------------------------------------------------------------------------------
  function! ExecuteRustCode()
    exec ':Shell rustc ' . @% . ' -o file && ./file'
  endfunction

  "- ES6---------------------------------------------------------------------------------------
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript

  "- JavaScript
  autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>
  autocmd FileType javascript inoremap (; ();<Esc>hi

  "- J Builder ------------------------------------------------------------------------------------
  au BufNewFile,BufRead *.json.jbuilder set ft=ruby       " set syntax to ruby for jBuilder files

  "- Fdoc ------------------------------------------------------------------------------------
  au BufNewFile,BufRead *.fdoc set ft=yaml         " set syntax to ruby for jBuilder files

  "- HBARS ------------------------------------------------------------------------------------
  au BufNewFile,BufRead *.hbars set ft=haml       " set syntax to haml, even tho it's not ruby, for hbars files

"= Enter Key ======================================================================================

  function! MapCR()
    if (&ft=='c')
      :call ExecuteCCode()
    endif
    if (&ft=='go')
      :call ExecuteGoCode()
    endif
    if (&ft=='ruby')
      :call RunLastSpec()
    endif
    if (&ft=='haml')
      :call RunLastSpec()
    endif
    if (&ft=='html')
      :call RunLastSpec()
    endif
    if (&ft=='rust')
      :call ExecuteRustCode()
    endif
  endfunction

  :nnoremap <cr> :call MapCR()<cr>

"= For running commands in a new window ========================================================
function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize ' . line('$')
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
  wincmd k
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
