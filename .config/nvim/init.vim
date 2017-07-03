"= Initial setup ==================================================================================
  " Scheme Config
  " let g:myTheme = 'material'
  " let g:myTheme = 'base16-oceanicnext'
  " let g:myTheme = 'gotham'
" let g:myTheme = 'solarized - light'
  let g:myTheme = 'base16 - light'
  " let g:myTheme  = 'flatlandia'
  " let g:myTheme  = 'nova'
" use Vim settings, rather than Vi settings filetype off
  set nocompatible
  set encoding=utf-8  " Fix special character encoding

  call plug#begin()
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    " Plug 'Yggdroot/indentLine'              ' Line Indentation Markers
    Plug 'nathanaelkane/vim-indent-guides'  " line indentation - for use with HAML
    Plug 'airblade/vim-gitgutter'           " git diff in gutter
    Plug 'benekastah/neomake'               " syntax checker
    Plug 'benmills/vimux'                   " Vim + Tmux Goodness
    Plug 'bling/vim-airline'                " nice looking footer bar
    Plug 'chriskempson/base16-vim'          " Base 16 Colors
    Plug 'christoomey/vim-tmux-navigator'   " easy navigation b/w vim & tmux
    " Plug 'ctrlpvim/ctrlp.vim'               ' fuzzy file finder
    Plug 'godlygeek/tabular'                " for indentation
    Plug 'tpope/vim-surround'               " because Will said it's pretty neat
    Plug 'jordwalke/flatlandia'
    Plug 'kana/vim-textobj-user'            " dependency for rubyblock
    Plug 'mattn/emmet-vim'                  " emmet stuff for vim [http://emmet.io/]
    Plug 'mileszs/ack.vim'                  " searching via :Ack
    Plug 'sheerun/vim-polyglot'             " A solid language pack for Vim.
    Plug 'reedes/vim-colors-pencil'         " vim-colors-pencil
    Plug 'reedes/vim-pencil'                " Rethinking Vim as a tool for writers
    Plug 'scrooloose/nerdtree'              " file menu
    Plug 't9md/vim-ruby-xmpfilter'          " inline ruby completion
    Plug 'terryma/vim-multiple-cursors'     " multiple cursors
    Plug 'tpope/vim-commentary'             " easily use comments
    Plug 'tpope/vim-endwise'                " auto end addition in ruby
    Plug 'tpope/vim-dispatch'               " asynchronous build and test dispatcher
    Plug 'jacekd/vim-iawriter'              " iA Writer Theme
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/matchit.zip'          " dependency for rubyblock
    Plug 'wesQ3/vim-windowswap'             " window swapping
    Plug 'sjl/badwolf/'                     " badwolf theme
    Plug 'tpope/vim-fugitive'               " Git in Vim
    Plug 'ryanoasis/vim-devicons'           " Dev Icons
    Plug 'gavocanov/vim-js-indent'
    Plug 'thoughtbot/vim-rspec'             " Vim RSpec Runner
    " Plug 'janko-m/vim-test'
    Plug 'itspriddle/vim-marked'            " Marked
    Plug 'plasticboy/vim-markdown'
		Plug 'kylef/apiblueprint.vim'           " Apiary
    Plug 'whatyouhide/vim-gotham'           " Gotham Color Theme
    Plug 'tyrannicaltoucan/vim-deep-space'  " Deep Space Color Theme
    Plug 'xolox/vim-misc'                   " needed for colorscheme-switcher
    Plug 'xolox/vim-colorscheme-switcher'
    Plug 'lumiliet/vim-twig'
    Plug 'jdkanani/vim-material-theme'
    Plug 'mhartington/oceanic-next'
    Plug 'dsawardekar/wordpress.vim'
    Plug 'exu/pgsql.vim'
    Plug 'jparise/vim-graphql'             "graphql syntax
    Plug 'elixir-lang/vim-elixir'          " elixir
    Plug 'sunaku/vim-ruby-minitest'
    Plug 'trevordmiller/nova-vim'
    " Plug 'kevinsjoberg/vim-test-neovim-error-only'

    " Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
    " Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
    " Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
    " Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
      Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': ['javascript', 'javascript.jsx'] }
    endif

    " == JavaScript syntax highlighting ==
    Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

  call plug#end()

  let g:python3_host_prog = '/usr/local/bin/python3'


"= Interface ======================================================================================

  "- Appearance -----------------------------------------------------------------------------------
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1 " True gui colors in terminal
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

    if (has('termguicolors'))
      set termguicolors
    endif

    syntax on                    " turn on syntax highilghting

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

    " for php
    " autocmd FileType php set tabstop=4
    " autocmd FileType php set softtabstop=4
    " autocmd FileType php set shiftwidth=4

    " for haml
    " autocmd Filetype * if &ft!="haml"|IndentGuidesDisable|endif
    " autocmd Filetype * if &ft!="haml"|let g:indentLine_enabled = 1|endif
    " autocmd FileType haml let g:indentLine_enabled = 0
    " autocmd FileType haml IndentGuidesEnable
    " autocmd FileType haml let g:indentLine_leadingSpaceEnabled = 0
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
    " let g:airline#extensions#tabline#enabled = 1

    let &colorcolumn=join(range(81,101),",")
    " highlight SignColumn ctermbg=NONE guibg=NONE gui=NONE
    highlight Search guifg=#FFFFFF guibg=#FC0D1B

    if g:myTheme == 'solarized - dark'
      set background=dark
      colorscheme base16-solarized
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight CursorLineNr guifg=#2E8CCF gui=bold
      let g:airline_theme='solarized'
      let g:indentLine_color_gui = '#0A3641'

    elseif g:myTheme == 'solarized - light'
      colorscheme base16-solarized-light
      set background=light
      highlight CursorLineNr guifg=#2E8CCF gui=bold
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn ctermbg=235 guibg=#EEE8D6
      let g:indentLine_color_gui = '#EEE8D7'
      let g:airline_theme='solarized'

    elseif g:myTheme == 'base16 - light'
      colorscheme base16-grayscale-light
      " colorscheme base16-github
      " colorscheme base16-flat
      " colorscheme base16-cupcake
      " colorscheme base16-harmonic16-light
      " colorscheme base16-google-light
      set background=light
      highlight CursorLineNr guifg=#2E8CCF gui=bold
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn ctermbg=235 guibg=#EEE8D6
      highlight ColorColumn ctermbg=235 guibg=#EDEDED
      let g:indentLine_color_gui = '#EEE8D7'
      let g:airline_theme='base16_grayscale'
      " highlight Comment guifg=#A32B2E
      " highlight Comment guifg=#348DCD
      highlight Comment guifg=#415D84

    elseif g:myTheme == 'base16-ocean-dark'
      colorscheme base16-ocean
      set background=dark
      highlight CursorLineNr guifg=#EBCB8B gui=bold
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn ctermbg=235 guibg=#343D46
      let g:indentLine_color_gui = '#343D46'
      let g:airline_theme='base16'

    elseif g:myTheme == 'base16-oceanicnext'
      " colorscheme base16-oceanicnext
      colorscheme OceanicNext
      set background=dark
      highlight CursorLineNr guifg=#EBCB8B
      highlight LineNr guibg=#17272F
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn guibg=#17272F
      highlight SignColumn guifg=#17272F guibg=#17272F
      highlight GitGutterAdd guifg=#DBA94E guibg=#17272F
      highlight GitGutterChange guifg=#DBA94E guibg=#17272F
      highlight GitGutterChangeDelete guifg=#DBA94E guibg=#17272F
      highlight GitGutterDelete guifg=#DBA94E guibg=#17272F
      " highlight Comment guifg=#629ACA
      highlight Comment guifg=#FFFD6D

      " Git Gutter
      let g:indentLine_color_gui = '#343D46'
      let g:airline_theme='base16'
      let g:gitgutter_override_sign_column_highlight = 1
      let g:airline_theme='oceanicnext'

    elseif g:myTheme == 'gotham'
      colorscheme gotham
      set background=dark
      highlight CursorLineNr guifg=#EBCB8B
      highlight LineNr guibg=#17272F
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn guibg=#17272F
      highlight SignColumn guifg=#17272F guibg=#17272F
      highlight GitGutterAdd guifg=#DBA94E guibg=#17272F
      highlight GitGutterChange guifg=#DBA94E guibg=#17272F
      highlight GitGutterChangeDelete guifg=#DBA94E guibg=#17272F
      highlight GitGutterDelete guifg=#DBA94E guibg=#17272F

      " Git Gutter
      let g:indentLine_color_gui = '#343D46'
      let g:airline_theme='gotham'
      let g:gitgutter_override_sign_column_highlight = 1

    elseif g:myTheme == 'deep-space'
      colorscheme deep-space
      set background=dark
      highlight CursorLineNr guifg=#EBCB8B
      highlight LineNr guibg=#17272F
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn guibg=#17272F
      highlight SignColumn guifg=#17272F guibg=#17272F
      highlight GitGutterAdd guifg=#DBA94E guibg=#17272F
      highlight GitGutterChange guifg=#DBA94E guibg=#17272F
      highlight GitGutterChangeDelete guifg=#DBA94E guibg=#17272F
      highlight GitGutterDelete guifg=#DBA94E guibg=#17272F

      " Git Gutter
      let g:indentLine_color_gui = '#343D46'
      let g:airline_theme='deep_space'
      let g:gitgutter_override_sign_column_highlight = 1

    elseif g:myTheme == 'lucario'
      colorscheme lucario
      set background=dark
      highlight CursorLineNr guifg=#EBCB8B
      highlight LineNr guibg=#17272F
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn guibg=#17272F
      highlight SignColumn guifg=#17272F guibg=#17272F
      highlight GitGutterAdd guifg=#DBA94E guibg=#17272F
      highlight GitGutterChange guifg=#DBA94E guibg=#17272F
      highlight GitGutterChangeDelete guifg=#DBA94E guibg=#17272F
      highlight GitGutterDelete guifg=#DBA94E guibg=#17272F

      " Git Gutter
      let g:indentLine_color_gui = '#343D46'
      let g:airline_theme='solarized'
      let g:gitgutter_override_sign_column_highlight = 1

    elseif g:myTheme == 'gruvbox'
      let g:gruvbox_italic=1
      let g:gruvbox_contrast_light="hard"
      colorscheme gruvbox
      set background=light
      highlight CursorLineNr guifg=#2E8CCF gui=bold
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn ctermbg=235 guibg=#EEE8D6
      let g:indentLine_color_gui = '#EEE8D7'
      let g:airline_theme='solarized'

    elseif g:myTheme == 'badwolf'
      colorscheme badwolf
      set background=light
      highlight CursorLineNr guifg=#2E8CCF gui=bold
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn ctermbg=235 guibg=#EEE8D6
      let g:indentLine_color_gui = '#EEE8D7'
      let g:airline_theme='base16'

    elseif g:myTheme == 'base16-railscasts'
      colorscheme base16-railscasts
      set background=dark
      highlight CursorLineNr guifg=#EBCB8B gui=bold
      highlight Search guifg=#FFFFFF guibg=#FC0D1B
      highlight ColorColumn ctermbg=235 guibg=#343D46
      let g:indentLine_color_gui = '#343D46'
      let g:airline_theme='base16'

    elseif g:myTheme == 'flatlandia'
      colorscheme flatlandia
      set background=dark
      highlight CursorLineNr guifg=#6DAAC8 gui=bold
      highlight Search guifg=#FFFFFF guibg=#B9D87C
      highlight ColorColumn ctermbg=235 guibg=#2C2F31
      let g:indentLine_color_gui = '#2C2F31'

      highlight NeomakeErrorSign ctermfg=white ctermbg=235 guibg=#2C2F31
      highlight NeomakeWarningSign ctermfg=white ctermbg=235 guibg=#2C2F31

    elseif g:myTheme == 'material'
      set background=dark
      colorscheme material-theme
      " highlight CursorLineNr guifg=#E4BF7F gui=bold
      highlight CursorLineNr guifg=#B9E691 gui=bold
      highlight CursorLine ctermbg=235 guibg=#37474F
      " highlight ColorColumn ctermbg=235 guibg=#1E222A
      highlight ColorColumn ctermbg=235 guibg=#22252B
      highlight SignColumn guifg=#263238 guibg=#263238

      highlight GitGutterAdd guifg=#C4E78D guibg=#263238
      highlight GitGutterChange guifg=#C4E78D guibg=#263238
      highlight GitGutterChangeDelete guifg=#C4E78D guibg=#263238
      highlight GitGutterDelete guifg=#C4E78D guibg=#263238

      let g:indentLine_color_gui = '#515253'

    elseif g:myTheme == 'nova'
      set background=dark
      colorscheme nova
      " highlight CursorLineNr guifg=#E4BF7F gui=bold
      highlight CursorLineNr guifg=#B9E691 gui=bold
      highlight CursorLine ctermbg=235 guibg=#37474F
      " highlight ColorColumn ctermbg=235 guibg=#1E222A
      highlight ColorColumn ctermbg=235 guibg=#38474F
      highlight SignColumn guifg=#263238 guibg=#263238

      highlight GitGutterAdd guifg=#C4E78D guibg=#263238
      highlight GitGutterChange guifg=#C4E78D guibg=#263238
      highlight GitGutterChangeDelete guifg=#C4E78D guibg=#263238
      highlight GitGutterDelete guifg=#C4E78D guibg=#263238

      let g:indentLine_color_gui = '#515253'
    endif


    " For Italics
    "
    highlight Comment gui=italic
    highlight Comment cterm=italic
    highlight htmlArg gui=italic
    highlight htmlArg cterm=italic
    highlight jsxChild gui=italic
    highlight jsxChild cterm=italic
    highlight xmlAttrib gui=italic guifg=#60ff60
    highlight jsObjectKey guifg=#60ff60
    " highlight xmlAttrib cterm=italic

    highlight jsonKeyword guifg=#FFFD6D

    set t_ZH=^[[3m
    set t_ZR=^[[23m



"= Utilities ======================================================================================

  set noswapfile                     " don't create swap files
  set autowrite                      " write the old file out when switching between files
  autocmd BufWritePre * :%s/\s\+$//e " auto strip whitespace on save

"= Keys ===========================================================================================

  let mapleader = ','                       " set <Leader>
  set backspace=indent,eol,start            " make backspace behave as expected

  " easy splits and switches over (\v)
  nnoremap <leader>v <C-w>v
  nnoremap <leader>h <C-w>s<C-w><C-w>
  nnoremap <leader>q :vsplit<cr> :term<cr>

  " map escape key to jj -- much faster, comments above b/c of Vim's interpretation of them jumping my cursor
  imap jj <esc>

  " easier window navigation
  " nmap <C-h> <C-w>h
  " nmap <C-j> <C-w>j
  " nmap <C-k> <C-w>k
  " nmap <C-l> <C-w>l
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

"= Bundle Settings=================================================================================

  "- Neomake ------------------------------------------------------------------------------------
  autocmd! BufWritePost * Neomake
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_jsx_enabled_makers = ['eslint']
  let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')

  "- Markdown ------------------------------------------------------------------------------------
  let g:markdown_fenced_languages = ['coffee', 'css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass']
  let g:vim_markdown_conceal = 0
  let g:vim_markdown_folding_disabled=1
  au BufRead,BufNewFile *.txt set filetype=markdown

  let g:pencil#wrapModeDefault = 'soft'

  augroup pencil
    autocmd!
    autocmd FileType markdown,mkd call pencil#init()
    autocmd FileType text         call pencil#init()
    " autocmd FileType markdown,mkd colorscheme iawriter
    " autocmd FileType markdown,mkd set background=light
    " autocmd FileType markdown,mkd set guifont=Cousine:h12

    let g:pencil_terminal_italics = 1
    let g:pencil_neutral_code_bg = 1
    let g:pencil#conceallevel = 0
  augroup END

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
  " let g:ctrlp_use_caching = 0           " Use caching
  " let g:ctrlp_clear_cache_on_exit = 0   " Persist cache across sessions
  " let g:ctrlp_show_hidden = 1           " Show hidden files

  " Ignore files in `.gitignore`
  " let g:ctrlp_user_command = {
  "   \ 'types': {
  "     \ 1: ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'],
  "     \ },
  "   \ 'fallback': 'find %s -type f'
  "   \ }

  " let g:ctrlp_working_path_mode = ''
  " let g:ctrlp_match_window = 'top,order:ttb'
  " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " " Ignore specific files and folders
  " let g:ctrlp_custom_ignore = {
  "   \ 'dir': '(log|node_modules/\.*/|vendor/bundle|tmp|components/\.*/(vendor/bundle|tmp|spec/dummy|log)|ios/build)',
  "   \ 'file': '\v\.(jpg|png|gif|db)'
  "   \ }

  "- JSX ------------------------------------------------------------------------------------
  let g:jsx_ext_required = 0 " Allow JSX in normal JS files

  " Custom ignore paths
  set wildignore+=*/tmp/*,*/bin/*,*/.git/*,*/node_modules/*,*/bower_components/*,*.so,*.swp,*.zip,*.gitkeep     " MacOSX/Linux

  "- Ack ------------------------------------------------------------------------------------------
  let g:ackprg = 'ag --nogroup --nocolor --column'

  "- Rspec.vim  -----------------------------------------------------------------------------------
  " use spring w/ rspec runner
  " let g:rspec_command = 'term bin/spring rspec {spec}'
  " dont use spring w/ rspec runner
  " let g:rspec_command = 'term bundle exec rspec {spec}'
  " let g:rspec_command = 'vsplit | term bundle exec rspec {spec} --format=progress'
  " let g:rspec_command = 'vsplit | term bin/rspec {spec}'
  " let g:rspec_command = 'vsplit | term bundle exec rspec {spec}'
  " let g:rspec_command = 'tabnew | term bundle exec bin/rspec {spec}'
  "
  let g:rspec_runner = 'os_x_iterm2'
  "
  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>

  " nmap <silent> <leader>t :TestFile<CR>
  " nmap <silent> <leader>s :TestNearest<CR>
  " nmap <silent> <leader>a :TestSuite<CR>
  " nmap <silent> <leader>l :TestLast<CR>

  let test#strategy = "neovim"
  let test#strategy = 'neovim_error_only'

  if has("nvim")
    let g:rspec_command = 'vsplit | term bin/rspec {spec}'
  endif

  "- ENV
  au BufRead,BufNewFile *.env.* set filetype=sh
  au BufRead,BufNewFile env.sample set filetype=sh

  "- XMPFilter  ------------------------------------------------------------------------------------
  " map <C-b> <Plug>(xmpfilter-mark)<Plug>(xmpfilter-run)

  "- Indent Guides ---------------------------------------------------------------------------------
  let g:indentLine_enabled = 1
  let g:indentLine_char = '¦'
  let g:indentLine_noConcealCursor = 1
  let g:indentLine_faster = 1

  "= Airline ========================================================================================
  let g:airline_powerline_fonts = 1
  " let g:airline#extensions#tabline#enabled = 1
  " let g:airline#extensions#tabline#show_buffers = 0
  " let g:airline_section_a = airline#section#create(['mode'])
  " let g:airline_section_b = airline#section#create(['%f'])

  "= Deoplete ========================================================================================
  let g:deoplete#enable_at_startup = 1

  "= Emmet ===========================================================================================
  imap kk <C-y>,<ESC>
  " imap ll <C-y>j<ESC>
  nmap <C-i><C-i> i<C-y>j<ESC>

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

  "- Elixir ---------------------------------------------------------------------------------------
  function! ExecuteElixirCode()              " for running Elixir on enter
    exec ":split | term elixir " . @%
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

  "- Mustache  ------------------------------------------------------------------------------------
  au BufNewFile,BufRead *.html.mustache set ft=mustache

  "- Mustache  ------------------------------------------------------------------------------------
  au BufNewFile,BufRead *.hbs set ft=mustache

  "- Elm
  au BufNewFile,BufRead *.elm set ft=elm

"= Enter Key ======================================================================================

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
      " :call RunLastSpec()
      TestLast
    endif
    if (&ft=='haml')
      " :call RunLastSpec()
      TestLast
    endif
    if (&ft=='html')
      RunLastSpec
    endif
    if (&ft=='rust')
      :call ExecuteRustCode()
    endif
  endfunction

  :nnoremap <cr> :call MapCR()<cr>

"= Terminal ========================================================
  :tnoremap qq <C-\><C-n>

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

" Requires 'jq' (brew install jq)
function! s:PrettyJSON()
  %!jq .
  set filetype=json
endfunction
command! PrettyJSON :call <sid>PrettyJSON()

" Prevent the terminal from taking the window with it when it closes.
"
" The last two screens worth of text is stored in register `t`
" function! s:termclose() abort
"   let first = max([1, line('w0') - winheight(0)])
"   call setreg('t', getline(first, line('$')), 'V')
"   let buf = expand('#')
"   if !empty(buf) && buflisted(buf) && bufnr(buf) != bufnr('%')
"     execute 'autocmd BufWinLeave <buffer> split' buf
"     execute 'doautocmd FileType' getbufvar(buf, '&filetype')
"   endif

"   execute ':edit'
" endfunction

" function! s:tmuxnav(dir) abort
"   let b:_tmuxnav = 1
"   let buf = bufnr('%')
"   execute 'TmuxNavigate'.a:dir

"   if bufnr('%') == buf
"     " Buffer didn't actually change.
"     startinsert
"   endif
" endfunction

" function! s:termopen() abort
"   setlocal nospell
"   tnoremap <silent><buffer> <m-h> <c-\><c-n>:<c-u>call <sid>tmuxnav('Left')<cr>
"   tnoremap <silent><buffer> <m-j> <c-\><c-n>:<c-u>call <sid>tmuxnav('Down')<cr>
"   tnoremap <silent><buffer> <m-k> <c-\><c-n>:<c-u>call <sid>tmuxnav('Up')<cr>
"   tnoremap <silent><buffer> <m-l> <c-\><c-n>:<c-u>call <sid>tmuxnav('Right')<cr>

"   autocmd BufEnter <buffer>
"         \ if exists('b:_tmuxnav') |
"         \   unlet! b:_tmuxnav |
"         \   startinsert |
"         \ endif
" endfunction

" augroup vimrc_term
"   autocmd!
"   autocmd TermOpen * call s:termopen()
"   autocmd TermClose *:$SHELL,*:\$SHELL call s:termclose()
" augroup END
"
"

" -- FZF
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

function! Lint()
  if &filetype =~ 'javascript'
    Neomake eslint
  else
    Neomake
  end
endfunction

augroup lint_events
  autocmd!
  autocmd BufWritePost * call Lint()
augroup end


"= Because I save dumb file names.
:autocmd BufWritePre [:;]*
\   try | echoerr 'Forbidden file name: ' . expand('<afile>') | endtry

map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
