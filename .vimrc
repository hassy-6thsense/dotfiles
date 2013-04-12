"-----vi互換性Off-----
set nocompatible

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
	echo "NeoBundle isn't installed!"
endif


"set runtimepath+=~/.vim/
"runtime! *.vimrc
"if filereadable(expand('~/.vim/s.vimrc'))
"	source ~/.vim/s.vimrc
"endif
