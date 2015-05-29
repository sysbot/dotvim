Personal dotvim.

##Installation

    git clone https://github.com/sysbot/dotvim
    cd dotvim
    git pull && git submodule update --init --recursive

##Symbolic link for .vimrc
Make a symbolic link of the .vim/vimrc file to the home directory.

    ln -s ~/.vim/vimrc ~/.vimrc

##Using Vundle to get plugins
Start vim and install Plugins using:

    :PluginInstall

## YouCompleteMe

Quick install
```
brew install python --framework
brew install vim
otool -L /usr/local/bin/vim # (required xcode command line tools)
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

```

Note you might encounter problems starting up Vim after YCM. This is because the Vim's Python
and YCM's python are difference. Use this (comment)[https://github.com/Valloric/YouCompleteMe/issues/8#issuecomment-34374807] to help install properly.
