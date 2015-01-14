"         FILE:  .vimrc
"  DESCRIPTION:  Bao Nguyen
"       AUTHOR:  Bao Nguyen
"      CREATED:  05.10.2009
"===================================================================================
"
"===================================================================================
" GENERAL SETTINGS
"===================================================================================
" Don't forget the power of G
" http://vim.wikia.com/wiki/Power_of_g
"-------------------------------------------------------------------------------
" map - recursive mapping
" noremap - non recursive mapping
" For each of these sets of mappings, there is a mapping that works in normal,
" visual, select and operator modes (:map and :noremap), one that works in normal
" mode (:nmap and :nnoremap), one in visual mode (:vmap and :vnoremap) and so on.
"-------------------------------------------------------------------------------

" required for vunble
set nocompatible
if has("autocmd")
  filetype indent plugin on
endif
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"-------------------------------------------------------------------------------
call vundle#begin()
"-------------------------------------------------------------------------------
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'christoomey/vim-tmux-navigator'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "vadv/vim-chef"
Plugin 'rizzatti/dash.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Bundle "honza/vim-snippets"
Plugin 'tomtom/tcomment_vim'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/unite.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'chrisbra/csv.vim'
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
Plugin 'itchyny/calendar.vim'
Plugin 'elzr/vim-json'
Plugin 'basyura/TweetVim'
Plugin 'h1mesuke/unite-outline'
Plugin 'basyura/bitly.vim'
Plugin 'mattn/favstar-vim'
Plugin 'open-browser.vim'
Plugin 'basyura/twibill.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/InsertChar'
Plugin 'tpope/vim-speeddating'
Plugin 'rstacruz/sparkup'
Plugin 'panozzaj/vim-autocorrect'
Plugin 'kien/ctrlp.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'jamessan/vim-gnupg'
Plugin 'yegappan/mru'
Plugin 'tpope/vim-endwise'
Plugin 'Raimondi/delimitMate'
Plugin 'gregsexton/gitv'
Plugin 'coderifous/textobj-word-column.vim'
Plugin 'vim-scripts/SearchComplete'
Plugin 'nelstrom/vim-textobj-rubyblock'

"-------------------------------------------------------------------------------
" All of your Plugins must be added before the following line
"-------------------------------------------------------------------------------
call vundle#end()            " required

autocmd BufWritePre * :%s/\s\+$//e

autocmd BufNewFile, BufRead Gemfile set filetype=ruby
autocmd BufNewFile, BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile, BufRead Berksfile set filetype=ruby
autocmd BufNewFile, BufRead *.erb set filetype=eruby
autocmd BufNewFile,BufRead *_spec.rb compiler rspec

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
iabbrev ccopy Copyright 2014 Bao Nguyen, all rights reserved.
iabbrev maintenace maintenance
iab enviroment environment

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

" rainbow always on
"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" remap escape
" Map right command key to Esc
inoremap kj <Esc>
inoremap jk <Esc>
" inoremap <Esc> <nop>

" calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" vroom
let g:vroom_map_keys = 0

" notes
let g:notes_directories = ['~/Dropbox/notes']

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

nnoremap <Leader>f :Unite -start-insert file<CR>

let g:ycm_server_keep_logfiles = 0
let g:ycm_server_log_level = 'info'

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

"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
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

" let g:ycm_key_select_completion = '<Enter>'

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
let g:multi_cursor_exit_from_insert_mode = 0

" sparkup
" let g:sparkupExecuteMapping = '<C-m>'

" spell specking!
set spell spelllang=en_us

" disable default keymap
" let g:multi_cursor_use_default_mapping=0
" " Default mapping
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'
"
filetype  plugin on
filetype  indent on
syntax    on
"
" Platform specific items:
" - central backup directory (has to be created)
" - default dictionary
" Uncomment your choice.
if  has("win16") || has("win32") || has("win64") || has("win95")
"
"  runtime mswin.vim
"  set backupdir =$VIM\vimfiles\backupdir
"  set dictionary=$VIM\vimfiles\wordlists/german.list
else
  set backupdir =$HOME/.vim_backup
  set dictionary=$HOME/.vim/wordlists/english.list
endif
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
"set cursorline " Highlight the cursor screen line "
"set colorcolumn=80 " Draws a vertical line at column 80 "
set showmatch
nnoremap <tab> %
vnoremap <tab> %

set background=dark
colorscheme solarized

" String to put at the start of lines that have been wrapped "
let &showbreak='↪ '

" Minimal number of screen lines to keep above and below the cursor "
set scrolloff=3

set history=50                  " keep 50 lines of command line history
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
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode

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

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :e $NOTES_DIR/Fastly\ networking<CR>
nnoremap <Leader>8 :e $NOTES_DIR/Ruby\ notes<CR>
nnoremap <Leader>9 :e $NOTES_DIR/VIM\ notes<CR>
nnoremap <Leader>0 :10b<CR>
" Map for opening the vimrc file
noremap <leader>v <Esc>:e $MYVIMRC<CR>

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

if $VIM_CRONTAB == "true"
  set nobackup
  set nowritebackup
endif

" insert before and after without entering insert mode
"nnoremap <silent>j :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nnoremap <silent>k :set paste<CR>m`O<Esc>``:set nopaste<CR>

"  highlight paired brackets
highlight MatchParen ctermbg=blue guibg=lightyellow

" autocomplete parenthesis, (brackets) and braces
inoremap  (  ()<Left>
inoremap  [  []<Left>
inoremap  {  {}<Left>
vnoremap  (  s()<Esc>P<Right>%
vnoremap  [  s[]<Esc>P<Right>%
vnoremap  {  s{}<Esc>P<Right>%

inoremap  <%  <%  %><Left><Left><Left>
inoremap  ['  ['']<Left><Left>
inoremap  ["  [""]<Left><Left>
inoremap  ('  ('')<Left><Left>
inoremap  ("  ("")<Left><Left>
inoremap  {  {}<Left>
"
"" surround content with additional spaces
"vnoremap  )  s(  )<Esc><Left>P<Right><Right>%
"vnoremap  ]  s[  ]<Esc><Left>P<Right><Right>%
"vnoremap  }  s{  }<Esc><Left>P<Right><Right>%
"
"" autocomplete quotes (visual and select mode)
" xnoremap  '  s''<Esc>P<Right>
" xnoremap  "  s""<Esc>P<Right>
" xnoremap  `  s``<Esc>P<Right>

" Fast switching between buffers
" The current buffer will be saved before switching to the next one.
" Choose :bprevious or :bnext
noremap  <silent> <s-tab>       :if &modifiable && !&readonly &&
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
inoremap  <silent> <s-tab>  <C-C>:if &modifiable && !&readonly &&
     \                      &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.dat     setfiletype csv
augroup END

" leader
nnoremap <leader>\ :w<cr>:mak<cr>
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

" Steve Losh
noremap H ^
noremap L g_

" Want Home/End behavior in insert, vim + or - in normal mode
"noremap <C-a> <Home>
"noremap <C-e> <End>
inoremap <C-e> <End>
inoremap <C-a> <Home>

vnoremap K k
vnoremap & :s<cr>

command! W w !sudo tee % &>/dev/null
command! Mks let g:session = getcwd() <bar> call Mks(g:session)
" Pull last visually selected area onto command-line mode
cnoremap <C-R><C-V> <C-R>=fnameescape(getline("'<")[ getpos("'<")[2]-1 : getpos("'>")[2]-1 ])<CR>

" more
" https://github.com/connermcd/dotfiles/blob/master/.vimrc
" Autocommands {{{1
augroup markdown " {{{2
   au!
   au BufEnter * let &complete=".,w,b,u,t,i"
   au BufNewFile,BufRead,BufWrite   *.txt,*.md,*.mkd,*.markdown,*.mdwn setl ft=markdown ts=3 sw=3
   au BufNewFile,BufRead,BufWrite   *.txt,*.md,*.mkd,*.markdown,*.mdwn let &complete="k".expand("%:p:h")."/*.md"
   au BufRead,BufWrite,InsertChange *.txt,*.md,*.mkd,*.markdown,*.mdwn syn match ErrorMsg '\%>77v.\+'
   au BufNewFile,BufRead */_posts/*.markdown setl completefunc=TagComplete | cd $BLOG/source
augroup end
augroup nonvim " {{{2
   au!
   au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls*,*.scpt sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
   " au BufRead *.ppt*,*.doc*,*.rtf sil exe "!xdg-open " . shellescape(expand("%:p")) | bd | let &ft=&ft | redraw!
   au BufRead *.ppt*,*.doc*,*.rtf let g:output_pdf = shellescape(expand("%:r") . ".pdf")
   au BufRead *.ppt*,*.doc*,*.rtf sil exe "!$HOME/.bin/pdf " . shellescape(expand("%:p"))
   au BufRead *.ppt*,*.doc*,*.rtf sil exe "!xdg-open " . g:output_pdf | bd | let &ft=&ft | redraw!
augroup end

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++

"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_

" indentatino
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv
