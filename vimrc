" DESCRIPTION:  Full vim setup, optmized for 24-bit color using neovim
" CREATED:      05.10.2009
"-------------------------------------------------------------------------------
" map - recursive mapping
" noremap - non recursive mapping
" For each of these sets of mappings, there is a mapping that works in normal,
" visual, select and operator modes (:map and :noremap), one that works in normal
" mode (:nmap and :nnoremap), one in visual mode (:vmap and :vnoremap) and so on.
"-------------------------------------------------------------------------------

call plug#begin()
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer./install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer', 'for': ['go', 'ruby', 'python']}
autocmd! User YouCompleteMe call youcompleteme#Enable()

" sensible default
Plug 'tpope/vim-sensible'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux' | Plug 'jgdavey/vim-turbux'

" utility functions
" XXX: which plugin depends on these?
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" ### Appearnace
Plug 'bling/vim-airline'

" ### External intergation
Plug 'mattn/webapi-vim'
Plug 'xolox/vim-notes'
Plug 'rking/ag.vim',                 { 'on': 'Ag' }
Plug 'ledger/vim-ledger', {'for': 'ledger'}
Plug 'ryanss/vim-hackernews', {'on': 'HackerNews'}
Plug 'benekastah/neomake', {'on': 'Neomake'}
Plug 'farseer90718/vim-taskwarrior', { 'on': 'TW'}

" ### Utilities
" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" allowing the use of `.` for surround an speeddating
Plug 'tpope/vim-repeat'

Plug 'vim-scripts/InsertChar'
" working with date using ctrl-a/x
Plug 'tpope/vim-speeddating'

" auto correct comment mistakes
Plug 'panozzaj/vim-autocorrect'

" plugin to work with gpg
Plug 'jamessan/vim-gnupg'

" most recently used
Plug 'yegappan/mru'

" hightlight whitespace
Plug 'ntpeters/vim-better-whitespace'

" multiple line/word selector like Textmate
Plug 'terryma/vim-multiple-cursors'

" automatic comment with `gc`
Plug 'tomtom/tcomment_vim'

" allowing jumping to matching tags
Plug 'tmhedberg/matchit'

" working with surround such as ""
Plug 'tpope/vim-surround'

":Remove: Delete a buffer and the file on disk simultaneously.
":Unlink: Like :Remove, but keeps the now empty buffer.
":Move: Rename a buffer and the file on disk simultaneously.
":Rename: Like :Move, but relative to the current file's containing directory.
":Chmod: Change the permissions of the current file.
":Mkdir: Create a directory, defaulting to the parent of the current file.
":Find: Run find and load the results into the quickfix list.
":Locate: Run locate and load the results into the quickfix list.
":Wall: Write every open window. Handy for kicking off tools like guard.
":SudoWrite: Write a privileged file with sudo.
":SudoEdit: Edit a privileged file with sudo.
Plug 'tpope/vim-eunuch'

" allowing :BD, kill buffer without closing split view
Plug 'qpkorr/vim-bufkill'
Plug 'bronson/vim-visual-star-search'

" table mode
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'}

" automatically closing quotes and brackets
Plug 'Raimondi/delimitMate'
Plug 'coderifous/textobj-word-column.vim'

" math with column, select numbers and `++`
Plug 'gavinbeatty/vmath.vim'

" switch between two words 'should' to 'should_not'
Plug 'AndrewRadev/switch.vim', {'on': 'Switch'}

" grep for vim
Plug 'mileszs/ack.vim', {'on': 'Ac'}

" solarized color
Plug 'altercation/vim-colors-solarized'

" syntax hightlighting
Plug 'slim-template/vim-slim',       { 'for': 'slim' }

" :Bclose (kill buffer without closing split windows)
Plug 'rbgrouleff/bclose.vim'

" spawn off process
Plug 'Shougo/vimproc.vim',      { 'do': 'make' }
Plug 'Lokaltog/vim-easymotion',      { 'on': '<Plug>(easymotion-s)' }

" ctrlp like in Textmate
Plug 'ctrlpvim/ctrlp.vim',      { 'on': 'CtrlP' }

Plug 'mbbill/undotree',              { 'on': 'UndotreeToggle'   }
Plug 'scrooloose/nerdtree',          { 'on': [ 'NERDTreeToggle', 'NERDTreeFind' ] }

" ### Development
" utility snippets
Plug 'SirVer/ultisnips' ", {'for': ['python', 'ruby', 'go']} | Plug 'honza/vim-snippets'

" syntax checking for difference languages
Plug 'scrooloose/syntastic'
Plug 'elzr/vim-json'

"Ruby and ruby testing
" adding 'end` to if/do in ruby
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby',          { 'for': 'ruby' }
Plug 'skalnik/vim-vroom', {'on': 'VroomRunTestFile'}
" ruby static code analyser
Plug 'ngmy/vim-rubocop'
" Chef
Plug 'vadv/vim-chef'

"Golang
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

"Git support
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv', { 'on': 'Gitv'}

"Python things
Plug 'tell-k/vim-autopep8',          { 'for': 'python' }
Plug 'dkprice/vim-easygrep',          { 'for': 'python' }
Plug 'vim-scripts/pydoc.vim',          { 'for': 'python' }
Plug 'nvie/vim-flake8',          { 'for': 'python' }
Plug 'alfredodeza/pytest.vim',          { 'for': 'python' }

"Javascript and HTML
Plug 'kchmck/vim-coffee-script',     { 'for': 'coffee' }
Plug 'gregsexton/MatchTag',          { 'for': 'html' }
Plug 'rstacruz/sparkup',             { 'for': 'html' }
Plug 'othree/html5.vim',             { 'for': 'html' }
Plug 'walm/jshint.vim', {'on': 'JSHint'}
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'vim-scripts/JavaScript-Indent', { 'for': 'javascript' }
" vim with node.js, rail.js
Plug 'moll/vim-node'
Plug 'ternjs/tern_for_vim'

" ctags and tags
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags' | Plug 'xolox/vim-misc'

call plug#end()

" fuzzy finder
set rtp+=/usr/local/opt/fzf

" easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" vipga=
" visual-select inner paragraph
" Start EasyAlign command (ga)
" Align around =
" gaip=
" Start EasyAlign command (ga) for inner paragraph
" Align around =
nmap ga <Plug>(EasyAlign)

" cd current window to parent directory of file
noremap \cd :lcd %:h<cr>:pwd<cr>

" Copy path of current file to clipboard
noremap \cp :let @+ = expand("%")<cr>

" Generate ctags
noremap \ct :!ctags -R .<cr><cr>

" Reload ~/.vimrc
noremap \rc :source ~/.vimrc<cr>

" Sort selection
noremap \s :sort<cr>

" Put contents of parentheses on their own newline and reindent (must position
" cursor inside parentheses in normal mode first).
nmap \( ci(<cr><esc>Pa<cr><esc>Vkk=

" Break a comma-delimited list onto new lines
vmap \, :s/,/,\r/g<cr>

" Ag for string in gem directories, too!
" https://github.com/FergusonSean/dotfiles/blob/master/.vimrc#L109
command! -nargs=* Gag call ag#Ag('grep<bang>', <q-args> . ' . ' . system('bundle show --paths | tr "\n" " "'))

" Replace `:key =>` with `key:`, accommodating extra spaces before the =>
noremap \hr :s/:\(\S\+\)\s*=>/\1:/g<cr>

" airline customizations
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Map right command key to Esc
inoremap kj <Esc>
inoremap jk <Esc>

" calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" task warriror
let g:task_rc_override = 'rc.defaultheight=0'
let g:task_default_prompt = ['description', 'project']

" fugitive shortcuts
noremap \gs :Gstatus<cr>
noremap \gc :Gcommit<cr>
noremap \ga :Gwrite<cr>
noremap \gl :Glog<cr>
noremap \gd :Gdiff<cr>
noremap \gb :Gblame<cr>

" gist
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" vroom
let g:vroom_map_keys = 0

" ack
nnoremap <leader>a <Esc>:Ack!

" quickly edit a file in current
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>_

" tweetvim
let g:tweetvim_display_icon = 1
let g:tweetvim_tweet_per_page = 50
let g:tweetvim_async_post = 1

" note ack
let g:year = system('echo -n "$YEAR"')
let g:module = system('echo -n "$MODULE"')
command! -nargs=1 Nack Ack -i --text --nohtml "<args>" $NOTES_DIR/*/*/*.txt
command! -nargs=1 Note exe "e! " . fnameescape($NOTES_DIR . "/MS". g:year . "/mod" . g:module . "/<args>.txt")

" vim notes
nnoremap <leader>[ :Nls
nnoremap <leader>] :Note
let g:notes_suffix = '.md'
let g:notes_unicode_enabled = 0
let g:notes_smart_quotes = 0
let g:notes_directories = ['~/repos/personal/notes', '~/repos/personal/recipes']

" key to switch
nnoremap - :Switch<cr>

" stop using arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" autopep8
let g:autopep8_ignore="E501,W293"

" python
" XXX: need to detect python bin somehow
let g:python_host_prog = '/Users/bao/Virtualenvs/default/bin/python'

" flake8
let g:flake8_ignore="E501,W293"
let g:flake8_show_in_gutter=1  " show
let g:flake8_show_quickfix=0

" tabulatize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a- :Tabularize /-<CR>
vmap <Leader>a- :Tabularize /-<CR>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" youcompleteme
let g:ycm_server_keep_logfiles = 0
let g:ycm_server_log_level = 'info'
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

" UltiSnips
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories  = ["snips"]

function! InsertSingle()
  sleep 120m|let l:a = getchar(0)
  if l:a != 0
    silent! exec "normal i" . nr2char(l:a)
  else
    silent! exec "normal i "
  endif
endfunction
nnoremap <TAB> :<C-U>call InsertChar#insert(v:count1)<CR>
nnoremap <Space> :<C-U>call InsertChar#insert(v:count1)<CR>

" multiple cursor
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 1
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

nnoremap <leader>f 1z=

" ## editor

" fast scroll
set ttyfast lazyredraw
let loaded_matchparen=1 " Don't load matchit.vim (paren/bracket matching)
set noshowmatch         " Don't match parentheses/brackets
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
let html_no_rendering=1 " Don't render italic, bold, links in HTML

set dictionary=$HOME/.vim/wordlists/english.list
nnoremap / /\v
vnoremap / /\v
filetype  plugin on
filetype  indent on
syntax    on
set gdefault
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set browsedir=current           " which directory to use for the file browser
set cursorline " Highlight the cursor screen line "
set colorcolumn=80 " Draws a vertical line at column 80 "
set showmatch
nnoremap <tab> %
vnoremap <tab> %
" String to put at the start of lines that have been wrapped "
let &showbreak='↪ '
vnoremap . :norm.<CR>
set history=100                  " keep 50 lines of command line history
set undolevels=100                  " keep 100 undo
set listchars=tab:>.,eol:\$     " strings to use in 'list' mode
set hlsearch incsearch ignorecase smartcase               " search
"" all this for linewrap (visually) without linebreaks, unless hit Enter
"" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
set formatoptions+=l
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set visualbell                  " visual bell instead of beeping
set wildignore=*.bak,*.o,*.e,*~,*.pyc,*.swp,*.class " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
"set shellcmdflag=-ic    " Make our shell interactive
set esckeys             " map missed escape sequences (enables keypad keys)
set ignorecase          " case insensitive searching
set smartcase           " but become case sensitive if you type uppercase characters)
set shiftwidth=2                " number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
set smartindent                 " smart autoindenting when starting a new line
set tabstop=2                   " number of spaces that a <Tab> counts for
set softtabstop=2                   " number of spaces that a <Tab> counts for
set expandtab                   " number of spaces that a <Tab> counts for
set shiftround
set listchars=tab:›\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set hidden                                                " don't unload buffer when switching away
set modeline                                              " allow per-file settings via modeline
set secure                                                " disable unsafe commands in local .vimrc files
set nobackup nowritebackup noswapfile autoread            " no backup or swap
set clipboard+=unnamed,unnamedplus                        " use the system clipboard for yank/put/delete
set mouse=a                                               " enable mouse for all modes settings
set nomousehide                                           " don't hide the mouse cursor while typing
set mousemodel=popup                                      " right-click pops up context menu
set number                                                " show absolute line number of the current line
set nofoldenable                                          " don't fold
set scrolloff=10                                          " scroll the window so we can always see 10 lines around the cursor
set textwidth=80                                          " wrap at 80 characters like a valid human
set printoptions=paper:letter                             " use letter as the print output format
set guioptions-=T                                         " turn off GUI toolbar (icons)
set guioptions-=r                                         " turn off GUI right scrollbar
set guioptions-=L                                         " turn off GUI left scrollbar
set winaltkeys=no                                         " turn off alt shortcuts
set laststatus=2                                          " always show status bar
set shell=bash
set nocompatible
%retab

" Splitting
set splitbelow
set splitright
nmap <leader>v :vsplit<cr>
nmap <leader>s :split<cr>
nnoremap vv <C-w>v<CR>
nnoremap ss <C-w>s<CR>

" ## Appearance
colorscheme molokai
set background=dark
highlight clear SignColumn

" keep off random popups in macvim
set guioptions+=c

if (!has('nvim'))
  set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8  " saving and encoding can only be set on startup in NeoVim
endif

" check the parent directories for tags, too.
set tags=./tags,tags;$HOME

if has("colorcolumn")
  set colorcolumn=80
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
else
  highlight ColorColumn ctermbg=235 guibg=#2c2d27
  call matchadd('ColorColumn', '\%81v', 100)
endif

" color settings (if terminal/gui supports it)
if &t_Co > 2 || has("gui_running")
  syntax on          " enable colors
  set hlsearch       " highlight search (very useful!)
  set incsearch      " search incremently (search while typing)
endif

" leader
nnoremap <leader>m :w<cr>:exec '!go run' shellescape(@%, 1)<cr>
nnoremap <leader>. :cd %:h<cr>
nnoremap <leader>c :s/.*/\L&/<bar>:s/\<./\u&/g<cr>
nnoremap <leader>C :Calendar -view=week<cr>
nnoremap <leader>d "_d
nnoremap <leader>e :Errors<cr>
nnoremap <leader>T :TweetVimHomeTimeline<cr>
nnoremap <leader>x :sign unplace *<cr>
nnoremap <leader>w :Gwrite<cr>
nnoremap <leader>[ :SearchNotes <cr>
nnoremap <leader>z :Gcommit<cr>
nnoremap <leader>q <esc>:wq<cr>
nnoremap <leader>s :VimShell<cr>
nnoremap <Leader>7 :e $HOME/repos/finance/personal.journal<CR>
nnoremap <Leader>8 :e $HOME/repos/personal/journal.md<CR>
nnoremap <Leader>9 :e $NOTES_DIR/VIM\ notes<CR>
noremap <leader>v <Esc>:e $MYVIMRC<CR>

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"  highlight paired brackets
highlight MatchParen ctermbg=blue guibg=lightyellow

" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
noremap  <silent> <s-tab>       :if &modifiable && !&readonly &&
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
inoremap  <silent> <s-tab>  <C-C>:if &modifiable && !&readonly &&
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

" ## tmux support
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" pasting without using set paste or set nopaste
" https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif
  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"
  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" golang
let g:go_fmt_command = "goimports"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>d :!godebug run %<cr>
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1

xnoremap p "_dP
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

noremap ; :
noremap : <nop>

" Home/End to ctrl
noremap H ^
noremap L g_
inoremap <C-e> <End>
inoremap <C-$> <End>
inoremap <C-a> <Home>

" Fullscreen
nmap <leader>f :set fu<cr>

" Allows %% to expand to the folder of the current file
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" General cursor moves in insert mode
inoremap <c-k> <esc>O
inoremap <c-l> <esc>A
inoremap <c-h> <esc>I
inoremap <c-j> <esc>o
vnoremap K k
vnoremap & :s<cr>
vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++

nnoremap <silent> <PageDown> <C-F>
nnoremap <silent> <PageUp> <C-B>
nnoremap <silent> <D-[> :bprevious<CR>
nnoremap <silent> <D-]> :bnext<CR>
nnoremap <silent> <M-]> :bnext<CR>

" Setup ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files = 10000
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>l :CtrlPLine<cr>
nmap <leader>d :bdelete<cr>
let g:ctrlp_working_path_mode = 0 " Do not modify my path, bitch
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp'  " Put the cache in the vim folder
let g:ctrlp_jump_to_buffer = 1 " Do not jump to new tabs
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Optimize file searching
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|vagrant|deps|Deps|bin)$',
  \ 'file': '\v\.(exe|so|dll|pyc$|o$)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" tagbar
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

command! Mks let g:session = getcwd() <bar> call Mks(g:session)
" Pull last visually selected area onto command-line mode
cnoremap <C-R><C-V> <C-R>=fnameescape(getline("'<")[ getpos("'<")[2]-1 : getpos("'>")[2]-1 ])<CR>

" https://github.com/connermcd/dotfiles/blob/master/.vimrc
augroup markdown
  au!
  au BufRead,BufNewFile,BufEnter   */mod*/*.txt let &complete="k$NOTES_DIR/**/*.txt"
  au BufRead,BufNewFile,BufEnter   */mod*/*.txt lcd %:h
  au BufRead,BufWrite,InsertChange */mod*/*.txt syn match ErrorMsg '\%>77v.\+'
  au BufEnter * let &complete=".,w,b,u,t,i"
  au BufNewFile,BufRead,BufWrite   *.txt,*.md,*.mkd,*.markdown,*.mdwn setl ft=markdown ts=3 sw=3
  au BufNewFile,BufRead,BufWrite   *.txt,*.md,*.mkd,*.markdown,*.mdwn let &complete="k".expand("%:p:h")."/*.md"
  au BufRead,BufWrite,InsertChange *.txt,*.md,*.mkd,*.markdown,*.mdwn syn match ErrorMsg '\%>77v.\+'
  au BufNewFile,BufRead */_posts/*.markdown setl completefunc=TagComplete | cd $BLOG
augroup end

augroup filetypes
  au!
  " Automatically open, but do not go to (if there are errors) the quickfix /
  " location list window, or close it when is has become empty.
  "
  " Note: Must allow nesting of autocmds to enable any customizations for quickfix
  " buffers.
  " Note: Normally, :cwindow jumps to the quickfix window if the command opens it
  " (but not if it's already open). However, as part of the autocmd, this doesn't
  " seem to happen.
  au QuickFixCmdPost [^l]* nested cwindow
  au QuickFixCmdPost    l* nested lwindow
  au BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
  au FileType python map <buffer> '<Leader>pp' :call AutoPep8()<CR>
  au filetype text call AutoCorrect()
  " Restore cursor position
  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  au FileType python map <buffer> '<Leader>8' :call Flake8()<CR>
  au BufWritePre * :%s/\s\+$//e
  au BufNewFile,BufRead Gemfile set filetype=ruby
  au BufNewFile,BufRead Vagrantfile set filetype=ruby
  au BufNewFile,BufRead Berksfile set filetype=ruby
  au BufNewFile,BufRead *.erb set filetype=eruby
  au BufNewFile,BufRead *_spec.rb compiler rspec
  au BufNewFile,BufRead,BufWrite todo.txt setl ft=todotxt
  au BufNewFile,BufRead,BufWrite *.csv setl ft=csv
  au BufNewFile,BufRead,BufWrite *.ejs setl ft=html
  au FileType ruby    setl sw=2 makeprg=ruby\ % efm=
    \%+E%f:%l:\ parse\ error,
    \%W%f:%l:\ warning:\ %m,
    \%E%f:%l:in\ %*[^:]:\ %m,
    \%E%f:%l:\ %m,
    \%-C%\tfrom\ %f:%l:in\ %.%#,
    \%-Z%\tfrom\ %f:%l,
    \%-Z%p^,
    \%-G%.%#
  au FileType ruby    nnoremap <leader>p Yp^Cbinding.pry<Esc>
  au FileType ruby    set makeprg=clear;\ bundle\ exec\ rake
  au FileType python  setl sw=4 makeprg=python\ % efm=
    \%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
    \%C\ \ \ \ %.%#,
    \%+Z%.%#Error\:\ %.%#,
    \%A\ \ File\ \"%f\"\\\,\ line\ %l,
    \%+C\ \ %.%#,
    \%-C%p^,
    \%Z%m,
    \%-G%.%#
  au FileType python  nnoremap <leader>p Yp^Cinteract()<Esc>
  au FileType xml     set equalprg=xmllint\ --format\ --recover\ -
  au FileType mail    let mapleader = "\\" | let maplocalleader = "," | setl spell fo=wantq1 smc=0
  au FileType cpp     set makeprg=g++\ \-lpcrecpp\ %\ &&\ ./a.out
  au FileType haskell set nocul cocu=in makeprg=ghc\ %
  " highlight white space
  au BufWritePre * StripWhitespace
augroup end

augroup vimrc
  au!
  au BufWrite * sil !mkdir -p %:h
  au BufWritePost $MYVIMRC sil so $MYVIMRC
  au BufRead *.session let g:session = getcwd() | so % | bd #
  au VimLeave * if exists("g:session") | call Mks(g:session) | endif
augroup end

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" ## Abbreviations Commands
iabbrev @@ ngqbao@gmail.com
iabbrev ccopy Copyright 2015 Bao Nguyen, all rights reserved.
iabbrev maintenace maintenance
iab enviroment environment
iab retreive retrieve
iab retreiving retrieving
iab avaiable available
iab syncrohnized synchronized
iab configuraiton configuration
iab intergration integration
iab nessasary necessary
iab intergrated integrated
iab catheral cathedral
iab Catheral Cathedral

" insert date
iabbrev <expr> dts strftime("%c")
