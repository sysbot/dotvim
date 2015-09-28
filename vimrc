"         FILE:  .vimrc
"  DESCRIPTION:  Full scale vim setup
"      CREATED:  05.10.2009

"-------------------------------------------------------------------------------
" map - recursive mapping
" noremap - non recursive mapping
" For each of these sets of mappings, there is a mapping that works in normal,
" visual, select and operator modes (:map and :noremap), one that works in normal
" mode (:nmap and :nnoremap), one in visual mode (:vmap and :vnoremap) and so on.
"-------------------------------------------------------------------------------
set shell=/bin/bash\ -i

" required for vbunle
set nocompatible
if has("autocmd")
  filetype indent plugin on
endif
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"-------------------------------------------------------------------------------
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'christoomey/vim-tmux-navigator'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "vadv/vim-chef"
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-surround'
"Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'AndrewRadev/switch.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'altercation/vim-colors-solarized'
Plugin 'benmills/vimux'
Plugin 'skalnik/vim-vroom'
Plugin 'jgdavey/vim-turbux'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'gavinbeatty/vmath.vim'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'elzr/vim-json'
Plugin 'kien/ctrlp.vim'
"Plugin 'h1mesuke/unite-outline'
" Plugin 'basyura/bitly.vim'
" Plugin 'open-browser.vim'
" Plugin 'basyura/twibill.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/InsertChar'
Plugin 'tpope/vim-speeddating'
Plugin 'rstacruz/sparkup'
Plugin 'panozzaj/vim-autocorrect'
Plugin 'ngmy/vim-rubocop'
Plugin 'jamessan/vim-gnupg'
Plugin 'yegappan/mru'
Plugin 'tpope/vim-endwise'
Plugin 'Raimondi/delimitMate'
Plugin 'gregsexton/gitv'
Plugin 'coderifous/textobj-word-column.vim'
" Plugin 'Shougo/vimshell.vim'
Plugin 'farseer90718/vim-taskwarrior'
Plugin 'vim-scripts/bufkill.vim.git'
" Plugin 'vim-scripts/pydoc.vim'
" Plugin 'nvie/vim-flake8'
" Plugin 'alfredodeza/pytest.vim'
Plugin 'bronson/vim-visual-star-search'
Plugin 'airblade/vim-gitgutter'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'tell-k/vim-autopep8'
" Plugin 'dkprice/vim-easygrep'

Plugin 'majutsushi/tagbar'
Plugin 'rbgrouleff/bclose.vim'

call vundle#end()            " required

autocmd BufWritePre * :%s/\s\+$//e

autocmd BufNewFile, BufRead Gemfile set filetype=ruby
autocmd BufNewFile, BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile, BufRead Berksfile set filetype=ruby
autocmd BufNewFile, BufRead *.erb set filetype=eruby
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" clipboard setup
set clipboard^=unnamed

"autocorrection
autocmd filetype text call AutoCorrect()

" matchit
runtime macros/matchit.vim

" Auto Commands
" Source the vimrc file after saving it
augroup vimrc
    autocmd!
    autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

" ==================================================================================
" Abbreviations Commands
" ==================================================================================

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
iabbrev <expr> dts strftime("%c")

" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

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

" gist
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1


" vroom
let g:vroom_map_keys = 0

" notes
let g:notes_directories = ['~/Dropbox/notes']

" ack
nnoremap <leader>a <Esc>:Ack!

" quickly edit a file in current
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>_
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

" tweetvim
let g:tweetvim_display_icon = 1
let g:tweetvim_tweet_per_page = 50
let g:tweetvim_async_post = 1

" note ack
let g:year = system('echo -n "$YEAR"')
let g:module = system('echo -n "$MODULE"')
command! -nargs=1 Nack Ack -i --text --nohtml "<args>" $NOTES_DIR/*/*/*.txt
command! -nargs=1 Note exe "e! " . fnameescape($NOTES_DIR . "/MS". g:year . "/mod" . g:module . "/<args>.txt")

nnoremap <leader>[ :Nls
nnoremap <leader>] :Note

augroup markdown
   au!
   au BufNewFile,BufRead,BufWrite *.txt,*.md,*.mkd,*.markdown,*.mdwn setl ft=markdown
   au BufRead,BufNewFile,BufEnter   */mod*/*.txt let &complete="k$NOTES_DIR/**/*.txt"
   au BufRead,BufNewFile,BufEnter   */mod*/*.txt lcd %:h
   au BufRead,BufWrite,InsertChange */mod*/*.txt syn match ErrorMsg '\%>77v.\+'
augroup end

" unite
" nnoremap <C-p> :Unite file_rec/async<cr>
" nnoremap <Leader>f :Unite -start-insert file<CR>
" nnoremap <space>/ :Unite grep:.<cr>
" let g:unite_source_history_yank_enable = 1
" nnoremap <space>y :Unite history/yank<cr>
" nnoremap <space>s :Unite -quick-match buffer<cr>

nnoremap - :Switch<cr>

" forcing me to stop using arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" split and views
nnoremap vv <C-w>v<CR>
nnoremap ss <C-w>s<CR>

" autopep8
autocmd FileType python map <buffer> '<Leader>pp' :call AutoPep8()<CR>
let g:autopep8_ignore="E501,W293"

" flake8
" autocmd BufWritePost *.py call Autopep8()
let g:flake8_ignore="E501,W293"
autocmd FileType python map <buffer> '<Leader>8' :call Flake8()<CR>
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
"
"let g:UltiSnipsExpandTrigger="<Tab>"
"let g:UltiSnipsJumpForwardTrigger="<Tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
"let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories  = ["snips"]


" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-15451411
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

"let g:ycm_key_select_completion = '<Enter>'

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

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

" sparkup
" let g:sparkupExecuteMapping = '<C-m>'

" spell specking!
set spell spelllang=en_us

" disable default keymap
" " Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"
filetype  plugin on
filetype  indent on
syntax    on

" back up location
set backupdir =$HOME/.vim_backup
set dictionary=$HOME/.vim/wordlists/english.list
"
"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
nnoremap / /\v
vnoremap / /\v
set gdefault
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set browsedir=current           " which directory to use for the file browser
"set complete+=k                 " scan the files given with the 'dictionary' option
set cursorline " Highlight the cursor screen line "
set colorcolumn=80 " Draws a vertical line at column 80 "
set showmatch
nnoremap <tab> %
vnoremap <tab> %
set foldlevel=99
set foldmethod=indent

" String to put at the start of lines that have been wrapped "
let &showbreak='↪ '

" Minimal number of screen lines to keep above and below the cursor "
set scrolloff=3

set history=100                  " keep 50 lines of command line history
set undolevels=100                  " keep 100 undo
set hlsearch                    " highlightthe last used search pattern
set incsearch                   " do incremental searching
set listchars=tab:>.,eol:\$     " strings to use in 'list' mode

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
set nocompatible
" Make our shell interactive
set shellcmdflag=-ic

"editor settings
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
%retab

" system settings
set nobackup            " no backup~ files.
set hidden              " remember undo after quitting

if has("colorcolumn")
  set colorcolumn=80
else
  highlight OverLength ctermbg=gray ctermfg=white guibg=#592929
  "match OverLength /\%81v.\+/
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

nnoremap <Leader>7 :e $NOTES_DIR/Fastly\ networking<CR>
nnoremap <Leader>8 :e $NOTES_DIR/Ruby\ notes<CR>
nnoremap <Leader>9 :e $NOTES_DIR/VIM\ notes<CR>
noremap <leader>v <Esc>:e $MYVIMRC<CR>

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

if $VIM_CRONTAB == "true"
  set nobackup
  set nowritebackup
endif

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

augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.dat     setfiletype csv
augroup END

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
"
" golang
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>d :!godebug run %<cr>
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

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

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

noremap ; :
noremap : <nop>

" Steve Losh
noremap H ^
noremap L g_

" Want Home/End behavior in insert, vim + or - in normal mode
"noremap <C-a> <Home>
"noremap <C-e> <End>
inoremap <C-e> <End>
inoremap <C-$> <End>
inoremap <C-a> <Home>

" Splitting
nmap <leader>v :vsplit<cr>
nmap <leader>s :split<cr>
" Causes split to make it below
set splitbelow

" Causes vsplit to split to the right
set splitright

" Fullscreen
nmap <leader>f :set fu<cr>

" Allows %% to expand to the folder of the current file
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" General cursor moves in insert mode
inoremap <c-k> <esc>O
inoremap <c-l> <esc>A
inoremap <c-h> <esc>I
inoremap <c-j> <esc>o

" Setup ctrlp
let g:ctrlp_max_files = 10000
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>l :CtrlPLine<cr>
nmap <leader>d :bdelete<cr>

" Optimize file searching
let g:ctrlp_custom_ignore = '\\.vagrant\|\\.git\|\\.hg\|\\.svn\|env\|.beam\|ebin\|deps\|\\.eunit\|\\.pyc$\|\\.o$'
if has("unix")
    let g:ctrlp_user_command = {
                \   'fallback': 'find %s -type f | egrep -v ' . g:ctrlp_custom_ignore .' | head -' . g:ctrlp_max_files
                \ }
endif
let g:ctrlp_working_path_mode = 0 " Do not modify my path, bitch
let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlp'  " Put the cache in the vim folder
let g:ctrlp_jump_to_buffer = 1 " Do not jump to new tabs
map <leader>b :CtrlPBuffer<cr>

" Nicer invisibles
set listchars=tab:›\ ,eol:¬,trail:⋅,extends:❯,precedes:❮

vnoremap K k
vnoremap & :s<cr>

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
"
" Autocommands {{{1
augroup markdown " {{{2
    au!
    au BufEnter * let &complete=".,w,b,u,t,i"
    au BufNewFile,BufRead,BufWrite   *.txt,*.md,*.mkd,*.markdown,*.mdwn setl ft=markdown ts=3 sw=3
    au BufNewFile,BufRead,BufWrite   *.txt,*.md,*.mkd,*.markdown,*.mdwn let &complete="k".expand("%:p:h")."/*.md"
    au BufRead,BufWrite,InsertChange *.txt,*.md,*.mkd,*.markdown,*.mdwn syn match ErrorMsg '\%>77v.\+'
    au BufNewFile,BufRead */_posts/*.markdown setl completefunc=TagComplete | cd $BLOG
augroup end

augroup filetypes " {{{2
    au!
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
augroup end

augroup vimrc " {{{2
    au!
    au BufRead todo.txt setl ft=todotxt
    au BufWrite * sil !mkdir -p %:h
    au BufWritePost $MYVIMRC sil so $MYVIMRC
    au BufRead *.session let g:session = getcwd() | so % | bd #
    au VimLeave * if exists("g:session") | call Mks(g:session) | endif
augroup end

" Highlight trailing whitespace " {{{2
highlight ExtraWhitespace guibg=#bd5353 ctermbg=131
augroup whitespace
    au!
    au ColorScheme * highlight ExtraWhitespace guibg=#bd5353 ctermbg=131
    au BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t/
    au BufWrite * match ExtraWhitespace /\s\+$\| \+\ze\t/
augroup end

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++

nnoremap <silent> <PageDown> <C-F>
nnoremap <silent> <PageUp> <C-B>

nnoremap <silent> <D-[> :bprevious<CR>
nnoremap <silent> <D-]> :bnext<CR>

" indentatino
" nmap <D-[> <<
" nmap <D-]> >>
" vmap <D-[> <gv
" vmap <D-]> >gv

" vritualenv packages only
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


colorscheme solarized
set background=dark
highlight clear SignColumn
