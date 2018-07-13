# dotfiles

## VIM設定ファイルの適用

    # 現存ファイルのバックアップ
    mv ~/.vimrc ~/.vimrc.org
    # ファイルをシンボリックリンクで差し替え
    ln -s `pwd`/.vimrc ~/.vimrc

## alias設定ファイルの適用

    # 現存ファイルのバックアップ
    mv ~/.bash_aliases ~/.bash_aliases.org
    # ファイルをシンボリックリンクで差し替え
    ln -s `pwd`/.bash_aliases ~/.bash_aliases

    # .bashrcに追加
    vi ~/.bashrc
    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

## path設定ファイルの適用

    # 現存ファイルのバックアップ
    mv ~/.bash_path ~/.bash_path.org
    # ファイルをシンボリックリンクで差し替え
    ln -s `pwd`/.bash_path ~/.bash_path

    # .bashrcに追加
    vi ~/.bashrc
    if [ -f ~/.bash_path ]; then
        . ~/.bash_path
    fi
