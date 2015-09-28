set guioptions-=R
set guioptions-=r
set guioptions-=l
set guioptions-=L
" default font
set guifont=Monaco\ for\ Powerline:h12
set columns=140
set lines=40
set sessionoptions=blank,buffers,curdir,folds,localoptions,options,resize,tabpages,winpos,winsize
map <C-Z> :mksession! ~/.vim/.session <CR>
map <C-X> :source ~/.vim/.session <CR>
"colorscheme molokai
"set guioptions=egmt
set fu
set fuopt+=maxhorz                      " grow to maximum horizontal width on entering fullscreen mode
map <D-f> :set invfu<CR>                " toggle fullscreen mode
