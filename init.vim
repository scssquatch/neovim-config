set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
filetype plugin on
set ttyfast                 " Speed up scrolling in Vim

let mapleader = ','

" GENERAL CONFIG -------------------------------------
" default color scheme
set t_Co=256

" don't wrap long lines
set nowrap

" show commands as we type them
set showcmd

" highlight matching brackets
set showmatch

" scroll the window when we get near the edge
set scrolloff=4 sidescrolloff=10

" use 2 spaces for tabs
set expandtab tabstop=2 softtabstop=2 shiftwidth=2
set smarttab

" enable line numbers, and don't make them any wider than necessary
set number numberwidth=2

" show the first match as search strings are typed
set incsearch

" highlight the search matches
set hlsearch

" searching is case insensitive when all lowercase
set ignorecase smartcase

" assume the /g flag on substitutions to replace all matches in a line
set gdefault

" set temporary directory (don't litter local dir with swp/tmp files)
set directory=/tmp/

" pick up external file modifications
set autoread

" don't abandon buffers when unloading
set hidden

" match indentation of previous line
set autoindent

" perform autoindenting based on filetype plugin
filetype plugin indent on

" don't blink the cursor
set guicursor=a:blinkon0

" show current line info (current/total)
set ruler rulerformat=%=%l/%L

" show status line
set laststatus=2

" When lines are cropped at the screen bottom, show as much as possible
set display=lastline

" flip the default split directions to sane ones
set splitright
set splitbelow

" don't beep for errors
set visualbell

" make backspace work in insert mode
set backspace=indent,eol,start

" highlight trailing whitespace
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set list

" have the mouse enabled all the time
set mouse=a

" use tab-complete to see a list of possiblities when entering commands
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*/target/**

" allow lots of tabs
set tabpagemax=20

" make and python use real tabs
au FileType make set noexpandtab

" Gemfile is Ruby
au BufRead,BufNewFile {Gemfile,config.ru} set ft=ruby

" JSON is JS
au BufNewFile,BufRead *.json set ai filetype=javascript

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set spell

" Remove strange characters that trigger auto indent for haml
au BufNewFile,BufRead *.haml set indentkeys=o,O,*<Return>,=else,=elsif,=rescue,=ensure,=when

" Set encoding
set encoding=utf-8

" Use modeline overrides
set modeline
set modelines=10

" strip trailing whitespaces on save
autocmd FileType ruby,python,javascript,java autocmd BufWritePre <buffer> :%s/\s\+$//e

autocmd Filetype gitcommit setlocal spell textwidth=72



" KEY MAPPINGS ------------------------------------------
" easy wrap toggling
nmap <Leader>w :set wrap!<cr>
nmap <Leader>W :set nowrap<cr>

" close all other windows (in the current tab)
nmap gW :only<cr>

" go to the alternate file (previous buffer) with g-enter
nmap g :b#<cr>

" shortcuts for frequenly used files
nmap gs :e db/schema.rb<cr>
nmap gr :e config/routes.rb<cr>
nmap gm :e Gemfile<cr>

" insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>

" mapping the jumping between splits. Hold control while using vim nav.
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" select the lines which were just pasted
nnoremap vv `[V`]

" clean up trailing whitespace
map <Leader>c :StripTrailingWhitespaces<cr>

" compress excess whitespace on current line
map <Leader>e :s/\v(\S+)\s+/\1 /<cr>:nohl<cr>

" delete all buffers
map <Leader>d :bufdo bd<cr>

" map spacebar to clear search highlight
nnoremap <Leader><space> :noh<cr>

" buffer resizing mappings (shift + arrow key)
nnoremap <S-Up> <c-w>+
nnoremap <S-Down> <c-w>-
nnoremap <S-Left> <c-w><
nnoremap <S-Right> <c-w>>

" reindent the entire file
map <Leader>I gg=G``<cr>

" insert the path of currently edited file into a command
" Command mode: Ctrl-P
cmap <C-S-P> <C-R>=expand('%:p:h') . '/' <cr>

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
nnoremap <silent> <leader>cf :let @* = expand('%:~')<CR>

"handy mapping for vertical split windows
map <leader>v :vsplit <cr>

" Map the escape key to
inoremap jj <Esc>
inoremap jk <Esc>

" remap F1 to ESC to stop getting that stupid help text
noremap <F1> <Esc>

"Handy mapping to cd to current files directory
noremap <leader>cd :cd %:p:h <Enter>

" Command-/ to toggle comments
map <D-/> <plug>NERDCommenterToggle<CR>

" PLUGINS ----------------------------------------------------------

if &compatible
  set nocompatible " Be iMproved
endif

" Required:
" Add the dein installation directory into runtimepath
set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.config/nvim/plugins'))

" Let dein manage dein
call dein#add('Shougo/dein.vim')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-endwise')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-haml')
  call dein#add('tpope/vim-rake')
  call dein#add('tpope/vim-repeat')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('vim-scripts/L9')
  call dein#add('vim-scripts/matchit.zip')
  call dein#add('vim-scripts/ruby-matchit')
  call dein#add('tpope/vim-abolish')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('scssquatch/vim-css-color')
  call dein#add('tpope/vim-sleuth')
  call dein#add('Lokaltog/vim-easymotion')

  " Gruvbox theme very good
  call dein#add('morhetz/gruvbox')
  autocmd vimenter * ++nested colorscheme gruvbox

 " Vim airline configs
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  let g:airline_theme='simple'

" Supertab code completion
  call dein#add('ervandew/supertab')
  let g:SuperTabContextDefaultCompletionType = '<c-n>'

" Dash Searching
  call dein#add('rizzatti/funcoo.vim')
  call dein#add('rizzatti/dash.vim')
    nmap <Leader>qs <Plug>DashSearch
    nmap <Leader>qa <Plug>DashGlobalSearch
    nmap <leader>q* <Plug>DashSearch

" Fuzzy Finder
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  call dein#add('pbogut/fzf-mru.vim')
    let g:fzf_command_prefix = 'FZF'
    nnoremap <Leader>b :<C-U>FZFBuffers<CR>
    nnoremap <Leader>t :<C-U>FZFFiles<CR>
    nnoremap <Leader>f :<C-U>FZFRg<CR>
    nnoremap <Leader>B :<C-U>FZFMru<CR>

    let g:fzf_tags_command = 'ctags -R'

" Less
  call dein#add('groenewege/vim-less')
    au BufNewFile,BufRead *.less set filetype=less

" Ripgrep
  call dein#add('mileszs/ack.vim')
  call dein#add('jremmen/vim-ripgrep')
    let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

    nmap g/ :Ack!<space>
    nmap g* :Ack! -w <C-R><C-W><space>
    nmap gn :cnext<CR>
    nmap gp :cprev<CR>

" Tagbar for navigation by tags using CTags
  call dein#add('majutsushi/tagbar')
    let g:tagbar_autofocus = 1
    map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
    map <Leader>. :TagbarToggle<CR>
    map <C-\> :tnext<CR>

" Markdown syntax highlighting
  call dein#add('tpope/vim-markdown')
    augroup mkd
      autocmd BufNewFile,BufRead *.mkd      set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.md       set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
      autocmd BufNewFile,BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:> filetype=markdown
    augroup END

" NERDTree for project drawer
  call dein#add('scrooloose/nerdtree')
    let NERDTreeHijackNetrw = 0
    let NERDTreeIgnore=['\.rbc$', '\~$']
    nmap <leader>g :NERDTreeToggle<CR>
    nmap <leader>G :NERDTreeFind<CR>
    map <Leader>nt :NERDTreeToggle<CR>

" Tabular for aligning text
  call dein#add('godlygeek/tabular')
    function! CustomTabularPatterns()
      if exists('g:tabular_loaded')
        AddTabularPattern! symbols         / :/l0
        AddTabularPattern! hash            /^[^>]*\zs=>/
        AddTabularPattern! chunks          / \S\+/l0
        AddTabularPattern! assignment      / = /l0
        AddTabularPattern! comma           /^[^,]*,/l1
        AddTabularPattern! colon           /:\zs /l0
        AddTabularPattern! options_hashes  /:\w\+ =>/
      endif
    endfunction

    autocmd VimEnter * call CustomTabularPatterns()

    " shortcut to align text with Tabular
    map <Leader>a :Tabularize<space>

" ZoomWin to fullscreen a particular buffer without losing others
  call dein#add('vim-scripts/ZoomWin')
    map <Leader>z :ZoomWin<CR>
    map <Leader><Leader> :ZoomWin<CR>

" Unimpaired for keymaps for quicky manipulating lines and files
  call dein#add('tpope/vim-unimpaired')
    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv

" gundo for awesome undo tree visualization
  call dein#add('sjl/gundo.vim')
    map <Leader>h :GundoToggle<CR>

" rails.vim, nuff' said
  call dein#add('tpope/vim-rails')
    map <Leader>oc :Econtroller<Space>
    map <Leader>ov :Eview<Space>
    map <Leader>om :Emodel<Space>
    map <Leader>oh :Ehelper<Space>
    map <Leader>oj :Ejavascript<Space>
    map <Leader>os :Estylesheet<Space>
    map <Leader>oi :Eintegration<Space>
    " John Papa recommended angular naming conventions
    let g:rails_projections = {
      \  'app/assets/*.js.coffee': {
      \     'alternate': 'spec/{}.spec.js.coffee'
      \   },
      \  'app/assets/*.js': {
      \     'alternate': 'spec/{}.spec.js'
      \   },
      \  'app/assets/*.coffee': {
      \     'alternate': 'spec/{}.spec.coffee'
      \   },
      \  'spec/*.spec.js.coffee': {
      \     'alternate': 'app/assets/{}.js.coffee'
      \   },
      \  'spec/*.spec.js': {
      \     'alternate': 'app/assets/{}.js'
      \   },
      \  'spec/*.spec.coffee': {
      \     'alternate': 'app/assets/{}.coffee'
      \   }
      \}

" surround for adding surround 'physics'
  call dein#add('tpope/vim-surround')
    " # to surround with ruby string interpolation
    let g:surround_35 = '#{\r}'
    " - to surround with no-output erb tag
    let g:surround_45 = '<% \r %>'
    " = to surround with output erb tag
    let g:surround_61 = '<%= \r %>'

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
 call dein#install()
endif
