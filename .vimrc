"----------基本設定----------
if filereadable( expand( '~/.vim/basic.vimrc' ) )
    source ~/.vim/basic.vimrc
endif

"----------色設定----------
if filereadable( expand( '~/.vim/color.vimrc' ) )
    source ~/.vim/color.vimrc
endif

"----------neobundle----------
if filereadable( expand( '~/.vim/neobundle.vimrc' ) ) && filereadable( expand( '~/.vim/bundle/neobundle.vim/README.md' ) )
    source ~/.vim/neobundle.vimrc
else
    echo "Type 'git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim'."
endif

