# dotfiles

## VIM設定ファイルの適用

    # インストール
    sudo apt-get install vim
    # 現存ファイルのバックアップ
    mv ~/.vimrc ~/.vimrc.org
    # ファイルをシンボリックリンクで差し替え
    ln -s `pwd`/.vimrc ~/.vimrc

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

## terminator設定ファイルの適用

    # インストール
    sudo apt-get install terminator
    # 現存ファイルのバックアップ
    mkdir -p ~/.config/terminator
    mv ~/.config/terminator/config ~/.config/terminator/config.org
    # ファイルをシンボリックリンクで差し替え
    ln -s `pwd`/.config/terminator/config ~/.config/terminator/config

## GIT設定ファイルの適用

    # インストール
    sudo apt-get install git
    # 現存ファイルのバックアップ
    mv ~/.gitconfig ~/.gitconfig.org
    # ファイルをシンボリックリンクで差し替え
    ln -s `pwd`/.gitconfig ~/.gitconfig

## .sshファイルの適用

    # 現存ファイルのバックアップ
    mv ~/.ssh ~/.ssh.org
    # ファイルをシンボリックリンクで差し替え
    ln -s `pwd`/.ssh ~/.ssh

