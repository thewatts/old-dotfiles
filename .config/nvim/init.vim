"= Initial setup ==================================================================================
  " Scheme Config
  let g:myTheme = "solarized - dark"

  " use Vim settings, rather than Vi settings
  filetype off

  " Setup NeoBundle
  " if not installed, do it first
  let bundleExists = 1
  if (!isdirectory(expand("$HOME/.config/nvim/bundle/neobundle.vim")))
    call system(expand("mkdir -p $HOME/.config/nvim/bundle"))
    call system(expand("git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim"))
    let bundleExists = 0
  endif
  if 0 | endif

  if has('vim_starting')
    if &compatible
      " Be iMproved
    set nocompatible
  endif

" Required:
    set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  endif

" Required:
  call neobundle#begin(expand('~/.config/nvim/bundle/'))
  let pluginsExist = 1
" Let NeoBundle manage NeoBundle
" Required:
  NeoBundleFetch 'Shougo/neobundle.vim'        " The manager of packages

  NeoBundle 'scrooloose/nerdtree'              " file menu
  NeoBundle 'ctrlpvim/ctrlp.vim'               " fuzzy file finder
  NeoBundle 'benekastah/neomake'               " syntax checker
  NeoBundle 'godlygeek/tabular'                " for indentation
  NeoBundle 'airblade/vim-gitgutter'           " git diff in gutter
  NeoBundle 'christoomey/vim-tmux-navigator'   " easy navigation b/w vim & tmux
  NeoBundle 'tpope/vim-commentary'             " easily use comments
  NeoBundle 'terryma/vim-multiple-cursors'     " multiple cursors
  NeoBundle 'kchmck/vim-coffee-script'         " coffeescript syntax & indent
  NeoBundle 'mileszs/ack.vim'                  " searching via :Ack
  NeoBundle 'vim-ruby/vim-ruby'                " ruby syntax & indent
  NeoBundle 'tpope/vim-markdown'               " markdown syntax & indent
  NeoBundle 'pangloss/vim-javascript'          " javascript syntax & indent
  NeoBundle 'othree/html5.vim'                 " html5 syntax & indent
  NeoBundle 'tpope/vim-haml'                   " haml syntax & indent
  NeoBundle 'fatih/vim-go'                     " go syntax / indent / plugins
  NeoBundle 'mustache/vim-mustache-handlebars' " mustache/handlebars syntax & indent
  NeoBundle 'heartsentwined/vim-emblem'        " emblem syntax & indent
  NeoBundle 'thoughtbot/vim-rspec'             " Vim RSPEC runner
  NeoBundle 'benmills/vimux'                   " Vim + Tmux Goodness
  NeoBundle 'hunner/vim-plist'                 " PLIST Syntax Highlighting / indentation
  NeoBundle 'tpope/vim-endwise'                " auto end addition in ruby
  NeoBundle 'nelstrom/vim-textobj-rubyblock'   " adds ruby block knowledge
  NeoBundle 'kana/vim-textobj-user'            " dependency for rubyblock
  NeoBundle 'vim-scripts/matchit.zip'          " dependency for rubyblock
  NeoBundle 't9md/vim-ruby-xmpfilter'          " inline ruby completion
  NeoBundle 'wesQ3/vim-windowswap'             " window swapping
  NeoBundle 'bling/vim-airline'                " nice looking footer bar
  NeoBundle 'vim-airline/vim-airline-themes'
  NeoBundle 'briancollins/vim-jst'             " JST / EJS syntax
  NeoBundle 'mxw/vim-jsx'                      " vim syntax highlighting / indent for jsx
  NeoBundle 'mattn/emmet-vim'                  " emmet stuff for vim [http://emmet.io/]
  NeoBundle 'jordwalke/flatlandia'
  NeoBundle 'Yggdroot/indentLine'              " Line Indentation Markers
  NeoBundle 'elzr/vim-json'                    " JSON jazz
  NeoBundle 'elixir-lang/vim-elixir'           " Elixir
  NeoBundle 'reedes/vim-pencil'                " Rethinking Vim as a tool for writers
  NeoBundle 'reedes/vim-colors-pencil'         " vim-colors-pencil
  NeoBundle 'itspriddle/vim-marked'            " Marked Support
  NeoBundle 'Shougo/deoplete.nvim'             " autocomplete?
  NeoBundle 'chriskempson/base16-vim'          " Base 16 Colors
  NeoBundle 'ryanoasis/vim-devicons'           " Dev Icons

  " end NeoBundle init (required)
  filetype plugin indent on
  call neobundle#end()
  let pluginsExist=1
  NeoBundleCheck

"= Interface ======================================================================================

  "- Appearance -----------------------------------------------------------------------------------
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " True gui colors in terminal

    syntax on                    " turn on syntax highilghting

    filetype plugin on           " enable loading plugins for filetypes
    filetype indent on           " enable loading 'indent files' for filetypes

    set synmaxcol=400            " no syntax highlighting for lines longer than 200 cols

    set laststatus=2             " show status bar

    set number                   " display line numbers
    set relativenumber           " show relative line numbers
    set visualbell               " use visual bell

    set laststatus=2             " Fix for statusbar toggling
    set encoding=utf-8           " Fix special character encoding

    set cursorline               " show cursor line
    set ruler                    " cursor position in the lower right corner

    match ErrorMsg '\s\+$'       " highlight trailing whitespace

    au VimResized * :wincmd =    " resize splits when window is resized

  "- Interaction ----------------------------------------------------------------------------------

    set ttyfast                  " improve screen refresh for terminal vim
    set lazyredraw               " don't redraw while executing macros. async window title update

    set scrolloff=3              " start scrolling 3 lines from bottom
    set sidescrolloff=6          " start scrolling 6 lines from right
    let loaded_match_paren = 1   " highlight matching parens

    set mouse=a                  " allow mouse usage
    set clipboard=unnamed        " set default yank register to machine clipboard

    set nofoldenable             " disable folding

    " disable F1 help, because I keep hitting it when going for ESC
    nmap <F1> <nop>

    if has('nvim')
      nmap <BS> <C-W>h
    endif

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

  "- Tab ---------------------------------------------------------------------------------------------
    function! InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
    endfunction
    inoremap <expr> <tab> InsertTabWrapper()
    inoremap <s-tab> <c-n>

  "- Searching ------------------------------------------------------------------------------------

    set hlsearch                 " highlight searching
    set ignorecase               " case insensitive search
    set smartcase                " case insensitive search
    set incsearch                " incremental search

  "- Theme ----------------------------------------------------------------------------------------

    let &colorcolumn=join(range(81,999),",")
    highlight SignColumn ctermbg=NONE guibg=NONE gui=NONE
    highlight Search guifg=#FFFFFF guibg=#FC0D1B

    if g:myTheme == 'solarized - dark'
      set background=dark
      colorscheme base16-solarized
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight CursorLineNr guifg=#2E8CCF gui=bold
      let g:airline_theme='solarized'
      let g:indentLine_color_gui = '#0A3641'

    elseif g:myTheme == 'solarized - light'
      colorscheme base16-solarized
      set background=light
      highlight CursorLineNr guifg=#2E8CCF gui=bold
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn ctermbg=235 guibg=#EEE8D6
      let g:indentLine_color_gui = '#EEE8D7'
      let g:airline_theme='solarized'

    elseif g:myTheme == 'onedark'
      set background=dark
      colorscheme onedark
      highlight CursorLineNr guifg=#E4BF7F gui=bold
      highlight ColorColumn ctermbg=235 guibg=#1E222A
      let g:indentLine_color_gui = '#515253'
    endif

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
  " nmap <C-h> <C-w>h
  " nmap <C-j> <C-w>j
  " nmap <C-k> <C-w>k
  " nmap <C-l> <C-w>l

  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>

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

  " insert a binding.pry under cursor
  map <Leader>d orequire 'pry'<cr>binding.pry<esc>:w<cr>

"= Bundle Settings=================================================================================

  "- Neomake ------------------------------------------------------------------------------------
  let g:neomake_javascript_enabled_makers = ['jshint']
  autocmd! BufWritePost * Neomake

  "- Markdown ------------------------------------------------------------------------------------
  let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass']

  "- NerdTree -------------------------------------------------------------------------------------
  " toggle NerdTree (Control + b)
  nnoremap <C-b> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1  " show hidden files
  let NERDTreeQuitOnOpen=1  " Hide NERDTree when opening a file

  " NERDTress File highlighting
  " function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  " exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  " exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  " endfunction

  " call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
  " call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
  " call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
  " call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
  " call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
  " call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
  " call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
  " call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
  " call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
  " call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
  " call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
  " call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
  " call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
  " call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
  " call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
  " call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
  " call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
  " call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
  "
  "- RubyBlock  ----------------------------------------------------------------------------------
  runtime macros/matchit.vim

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
  " use spring w/ rspec runner
  let g:rspec_command = 'term bundle exec bin/rspec {spec}'
  " dont use spring w/ rspec runner
  "let g:rspec_command = 'term bundle exec rspec {spec}'
  let g:rspec_runner = 'os_x_iterm'
  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>

  "- XMPFilter  ------------------------------------------------------------------------------------
  " map <C-b> <Plug>(xmpfilter-mark)<Plug>(xmpfilter-run)

  "- Indent Guides ---------------------------------------------------------------------------------
  let g:indentLine_enabled = 1
  let g:indentLine_char = '¦'
  let g:indentLine_noConcealCursor = 1
  let g:indentLine_faster = 1

  "= Airline ========================================================================================
  let g:airline_powerline_fonts = 1

  "= Deoplete ========================================================================================
  let g:deoplete#enable_at_startup = 1

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

"= Terminal ========================================================
  " Terminal color definitions
  let s:cterm00 = "00"
  let s:cterm01 = "236"
  let s:cterm02 = "239"
  let s:cterm03 = "59"
  let s:cterm04 = "145"
  let s:cterm05 = "152"
  let s:cterm06 = "188"
  let s:cterm07 = "15"
  let s:cterm08 = "203"
  let s:cterm09 = "209"
  let s:cterm0A = "221"
  let s:cterm0B = "114"
  let s:cterm0C = "73"
  let s:cterm0D = "68"
  let s:cterm0E = "176"
  let s:cterm0F = "137"

  " Terminal color definitions (24 bits)
  let g:terminal_color_0="#1b2b34"
  let g:terminal_color_1="#ed5f67"
  let g:terminal_color_2="#9ac895"
  let g:terminal_color_3="#fbc963"
  let g:terminal_color_4="#669acd"
  let g:terminal_color_5="#c695c6"
  let g:terminal_color_6="#5fb4b4"
  let g:terminal_color_7="#c1c6cf"
  let g:terminal_color_8="#65737e"
  let g:terminal_color_9="#fa9257"
  let g:terminal_color_10="#343d46"
  let g:terminal_color_11="#4f5b66"
  let g:terminal_color_12="#a8aebb"
  let g:terminal_color_13="#ced4df"
  let g:terminal_color_14="#ac7967"
  let g:terminal_color_15="#d9dfea"
  let g:terminal_color_background="#1b2b34"
  let g:terminal_color_foreground="#c1c6cf"

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

"= Because I save dumb file names.
:autocmd BufWritePre [:;]*
\   try | echoerr 'Forbidden file name: ' . expand('<afile>') | endtry
