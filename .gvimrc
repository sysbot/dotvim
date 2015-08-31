set fu
set fuopt+=maxhorz                      " grow to maximum horizontal width on entering fullscreen mode
map <D-f> :set invfu<CR>                " toggle fullscreen mode
autocmd VimLeave * :!open -a iterm
