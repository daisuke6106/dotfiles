# dotfiles

## VIM設定ファイルの適用

    # 現存ファイルのバックアップ
    mv ~/.vimrc ~/.vimrc.org
    # ファイルをシンボリックリンクで差し替え
    ln -s `pwd`/.vimrc ~/.vimrc
