Personal dotvim.

##Installation

    git clone https://github.com/sysbot/dotvim
    cd dotvim
    git pull && git submodule update --init --recursive

####Symbolic link for .vimrc
Make a symbolic link of the .vim/vimrc file to the home directory.

    ln -s ~/.vim/vimrc ~/.vimrc

####Using Vundle to get plugins
Start vim and install Plugins using:

    :PluginInstall
