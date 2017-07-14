"= Initial setup ===============================================================

  " Scheme Config
  " let g:myTheme = 'base16 - light'
  " let g:myTheme = 'nova'
  let g:myTheme = 'base16 - ocean'
  " let g:myTheme = 'solarized'

" use Vim settings, rather than Vi settings filetype off
  set nocompatible
  set encoding=utf-8  " Fix special character encoding

  call plug#begin()
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    Plug 'nathanaelkane/vim-indent-guides'  " line indentation - for use with HAML
    Plug 'airblade/vim-gitgutter'           " git diff in gutter
    Plug 'benmills/vimux'                   " Vim + Tmux Goodness
    Plug 'bling/vim-airline'                " nice looking footer bar
    Plug 'vim-airline/vim-airline-themes'   " themes for Airline
    Plug 'chriskempson/base16-vim'          " Base 16 Colors
    Plug 'christoomey/vim-tmux-navigator'   " easy navigation b/w vim & tmux
    Plug 'godlygeek/tabular'                " for indentation
    Plug 'tpope/vim-surround'               " because Will said it's pretty neat
    Plug 'kana/vim-textobj-user'            " dependency for rubyblock
    Plug 'mattn/emmet-vim'                  " emmet stuff for vim [http://emmet.io/]
    Plug 'mileszs/ack.vim'                  " searching via :Ack
    Plug 'sheerun/vim-polyglot'             " A solid language pack for Vim.
    Plug 'scrooloose/nerdtree'              " file menu
    Plug 't9md/vim-ruby-xmpfilter'          " inline ruby completion
    Plug 'terryma/vim-multiple-cursors'     " multiple cursors
    Plug 'tpope/vim-commentary'             " easily use comments
    Plug 'tpope/vim-endwise'                " auto end addition in ruby
    Plug 'vim-scripts/matchit.zip'          " dependency for rubyblock
    Plug 'tpope/vim-fugitive'               " Git in Vim
    Plug 'ryanoasis/vim-devicons'           " Dev Icons
    Plug 'gavocanov/vim-js-indent'
    Plug 'thoughtbot/vim-rspec'             " Vim RSpec Runner
    Plug 'itspriddle/vim-marked'            " Marked
    Plug 'plasticboy/vim-markdown'
    Plug 'lumiliet/vim-twig'
    Plug 'exu/pgsql.vim'
    Plug 'jparise/vim-graphql'             "graphql syntax
    Plug 'elixir-lang/vim-elixir'          " elixir
    Plug 'trevordmiller/nova-vim'
    Plug 'w0rp/ale'                        " code linting

    " == JavaScript syntax highlighting ==
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
  call plug#end()

  "- Appearance -----------------------------------------------------------------------------------
    set term=xterm-256color
    set termguicolors

    syntax on                    " turn on syntax highlighting

    filetype plugin on           " enable loading plugins for filetypes
    filetype indent on           " enable loading 'indent files' for filetypes

    set synmaxcol=1000            " no syntax highlighting for lines longer than 400 cols

    set laststatus=2             " show status bar

    set number                   " display line numbers
    set relativenumber           " show relative line numbers
    set visualbell               " use visual bell

    set laststatus=2             " Fix for statusbar toggling

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

    set splitright " vsplit splits to right side
    set splitbelow " split splits to bottom

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

    let g:indent_guides_color_change_percent = 2
    let g:indent_guides_enable_on_vim_startup = 1

    " for html
    autocmd FileType html setlocal indentkeys-=*<Return>
    autocmd FileType html.handlebars setlocal indentkeys-=*<Return>
    autocmd FileType eruby setlocal indentkeys-=*<Return>
    autocmd FileType blade.php setlocal indentkeys-=*<Return>
    au BufRead,BufNewFile *.blade.php* set filetype=html

    " for json
    au BufNewFile,BufRead .eslintrc set filetype=json

    " for haml
    au BufNewFile,BufRead *.haml.example set filetype=haml

    " for ruby
    autocmd FileType conf set filetype=ruby
    au BufNewFile,BufRead *.rb.example set filetype=ruby

    " git commit
    autocmd Filetype gitcommit set colorcolumn=50,72

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
    let g:indent_guides_auto_colors = 0

    let &colorcolumn=join(range(81,101),",")
    " highlight SignColumn ctermbg=NONE guibg=NONE gui=NONE
    highlight Search guifg=#FFFFFF guibg=#FC0D1B


    if g:myTheme == 'nova'
      set background=dark
      colorscheme nova

      highlight CursorLineNr guifg=#B9E691 gui=bold
      highlight CursorLine ctermbg=235 guibg=#37474F
      highlight ColorColumn ctermbg=235 guibg=#38474F
      highlight SignColumn guifg=#263238 guibg=#263238

      highlight GitGutterAdd guifg=#C4E78D guibg=#263238
      highlight GitGutterChange guifg=#C4E78D guibg=#263238
      highlight GitGutterChangeDelete guifg=#C4E78D guibg=#263238
      highlight GitGutterDelete guifg=#C4E78D guibg=#263238

      highlight IndentGuidesOdd  guibg=#3D4C55
      highlight IndentGuidesEven guibg=#43525B

    elseif g:myTheme == 'base16 - light'
      set background=light
      colorscheme base16-grayscale-light
      highlight CursorLineNr guifg=#2E8CCF gui=bold
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn ctermbg=235 guibg=#EEE8D6
      highlight ColorColumn ctermbg=235 guibg=#EDEDED
      let g:airline_theme='base16_grayscale'
      highlight Comment guifg=#415D84

    elseif g:myTheme == 'base16 - ocean'
      set background=dark
      colorscheme base16-ocean
      highlight CursorLineNr guifg=#EACA89 gui=bold
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn ctermbg=235 guibg=#343d46
      let g:airline_theme='base16_ocean'
    endif

"= Italics =====================================================================
  " From https://www.reddit.com/r/vim/comments/24g8r8/italics_in_terminal_vim_and_tmux/
  " Step #4
  set t_ZH=[3m
  set t_ZR=[23m

  highlight Comment gui=italic
  highlight Comment cterm=italic
  highlight htmlArg gui=italic
  highlight htmlArg cterm=italic
  highlight jsxChild gui=italic
  highlight jsxChild cterm=italic
  highlight xmlAttrib gui=italic " guifg=#60ff60
  highlight xmlAttrib cterm=italic
  highlight jsObjectKey guifg=#60ff60
  highlight jsonKeyword guifg=#FFFD6D

"= Utilities ===================================================================

  set noswapfile                     " don't create swap files
  set autowrite                      " write the old file out when switching between files
  autocmd BufWritePre * :%s/\s\+$//e " auto strip whitespace on save

"= Keys ========================================================================

  let mapleader = ','                       " set <Leader>
  set backspace=indent,eol,start            " make backspace behave as expected

  " easy splits and switches over (\v)
  nnoremap <leader>v <C-w>v
  nnoremap <leader>h <C-w>s<C-w><C-w>
  nnoremap <leader>q :vsplit<cr> :term<cr>

  " map escape key to jj -- much faster, comments above b/c of Vim's interpretation of them jumping my cursor
  imap jj <esc>

  " search navigation
  nnoremap <Space>] :cn<cr>
  nnoremap <Space>[ :cp<cr>

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
  map <Leader>g odebugger;<esc>:w<cr>
  map <Leader>bb :term bundle install<cr>

  " Custom ignore paths
  set wildignore+=*/tmp/*,*/bin/*,*/.git/*,*/node_modules/*,*/bower_components/*,*.so,*.swp,*.zip,*.gitkeep     " MacOSX/Linux

"= Markdown=====================================================================
  let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass']
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_folding_disabled=1
  au BufRead,BufNewFile *.txt set filetype=markdown

"= NerdTree ====================================================================
" toggle NerdTree (Control + b)
nnoremap <C-b> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1  " show hidden files
let NERDTreeQuitOnOpen=1  " Hide NERDTree when opening a file

"= FZF =========================================================================
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_buffers_jump = 1

" Open FZF
noremap <C-p> :FZF<CR>

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~15%' }

"= Ack =========================================================================
let g:ackprg = 'ag --nogroup --nocolor --column'

"= RSpec.vim ===================================================================
let g:rspec_command = '!clear && bin/rspec {spec}'
let g:rspec_runner = 'os_x_iterm2'

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"= Indent Guides ===============================================================
let g:indent_guides_auto_colors = 0

"= Airline =====================================================================
let g:airline_powerline_fonts = 1

"= Emmet =======================================================================
imap kk <C-y>,<ESC>
" imap ll <C-y>j<ESC>
nmap <C-i><C-i> i<C-y>j<ESC>

"= Language Specific Settings===================================================

  "- Golang --------------------------------------------------------------------
  let g:go_fmt_command = 'goimports'     " use gofmt on save w/ go commands (from go plugin)

  function! ExecuteGoCode()              " for running Golang on enter
    exec ":!clear && go run " . @%
  endfunction

  "- Elixir --------------------------------------------------------------------
  function! ExecuteElixirCode()              " for running Elixir on enter
    exec ":split | term elixir " . @%
  endfunction

  "- C -------------------------------------------------------------------------
  function! ExecuteCCode()
    exec ':Shell gcc ' . @% . ' -o file && ./file'
  endfunction

  "- Rust-----------------------------------------------------------------------
  function! ExecuteRustCode()
    exec ':Shell rustc ' . @% . ' -o file && ./file'
  endfunction

  "- ES6------------------------------------------------------------------------
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript

  "- JavaScript
  autocmd FileType javascript inoremap {<CR> {<CR>}<Esc><S-o>
  autocmd FileType javascript inoremap (; ();<Esc>hi

  "- J Builder -----------------------------------------------------------------
  au BufNewFile,BufRead *.json.jbuilder set ft=ruby       " set syntax to ruby for jBuilder files

  "- Fdoc ----------------------------------------------------------------------
  au BufNewFile,BufRead *.fdoc set ft=yaml         " set syntax to ruby for jBuilder files

  "- HBARS ---------------------------------------------------------------------
  au BufNewFile,BufRead *.hbars set ft=haml       " set syntax to haml, even tho it's not ruby, for hbars files

  "- Mustache  -----------------------------------------------------------------
  au BufNewFile,BufRead *.html.mustache set ft=mustache

  "- Mustache  -----------------------------------------------------------------
  au BufNewFile,BufRead *.hbs set ft=mustache

  "- Elm
  au BufNewFile,BufRead *.elm set ft=elm

"= Enter Key ===================================================================
  function! MapCR()
    if (&ft=='c')
      :call ExecuteCCode()
    endif
    if (&ft=='go')
      :call ExecuteGoCode()
    endif
    if (&ft=='elixir')
      :call ExecuteElixirCode()
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

"= Pretty JSON =================================================================
" Requires 'jq' (brew install jq)
function! s:PrettyJSON()
  %!jq .
  set filetype=json
endfunction
command! PrettyJSON :call <sid>PrettyJSON()

"= Press F3 while the cursor is over an attribute - it'll list out the
" attribute name and the color for highlight adjustments
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
