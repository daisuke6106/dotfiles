# dotfiles

## SSHキー作成

    # ホームディレクトリ移動
    cd $HOME

    # SSHキー作成
    ssh-keygen -t ed25519 -C "daisuke6106@gmail.com" -f ~/.ssh/daisuke6106.github
    
    # SSH プライベートキーを ssh-agent に追加します。
    ssh-add ~/.ssh/daisuke6106.github

    # SSHをクリップボードにコピー（UBUNTU）
    cat /.ssh/daisuke6106.github.pub | xsel --clipboard --input

  
## VIM設定ファイルの適用

    # インストール
    sudo apt-get install vim
    # 現存ファイルのバックアップ
    mv ~/.vimrc ~/.vimrc.org
    # ファイルをシンボリックリンクで差し替え
    ln -s `pwd`/.vimrc ~/.vimrc

    # ----------------------------------------------------------------------------------------------------
    # Windowsの場合
    # ----------------------------------------------------------------------------------------------------
    #（ 管理者権限で実行したgitbashでたたくこと）

    # シンボリックリンクを作れるように設定
    export MSYS=winsymlinks:nativestrict
    
    # .vimrc現存ファイルをバックアップ
    mv /c/Users/daisuke6106/.vimrc /c/Users/daisuke6106/.vimrc.org

    # .vimrc設定ファイルをシンボリックリンクで作成
    ln -s $(pwd)/.vimrc /c/Users/daisuke6106/.vimrc

    # .vim現存フォルダをバックアップ
    mv /c/Users/daisuke6106/.vim /c/Users/daisuke6106/.vim.org

    # .vim設定フォルダをシンボリックリンクで作成
    ln -s $(pwd)/.vim /c/Users/daisuke6106/.vim

## path設定ファイルの適用

    # 現存ファイルのバックアップ mv ~/.bash_path ~/.bash_path.org
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

## VSCode設定ファイルの設定

    # ----------------------------------------------------------------------------------------------------
    # Ubuntuの場合
    # ----------------------------------------------------------------------------------------------------

    # 現存ファイルをバックアップ
    mv ~/.config/Code/User/settings.json ~/.config/Code/User/settings.json.org

    # 設定ファイルをシンボリックリンクで作成
    mkdir -p ~/.config/Code/User/
    ln -s $(pwd)/.vscode/settings.json ~/.config/Code/User/settings.json

    # ----------------------------------------------------------------------------------------------------
    # Macの場合
    # ----------------------------------------------------------------------------------------------------

    # 現存ファイルをバックアップ
    mv "$HOME/Library/Application Support/Code/User/settings.json" "$HOME/Library/Application Support/Code/User/settings.json.org"

    # 設定ファイルをシンボリックリンクで作成
    mkdir -p "$HOME/Library/Application Support/Code/User/"
    ln -s $(pwd)/.vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"

    # ----------------------------------------------------------------------------------------------------
    # Windowsの場合
    # ----------------------------------------------------------------------------------------------------
    #（ 管理者権限で実行したgitbashでたたくこと）

    # シンボリックリンクを作れるように設定
    export MSYS=winsymlinks:nativestrict
    
    # 現存ファイルをバックアップ
    mv /c/Users/daisuke6106/AppData/Roaming/Code/User/settings.json /c/Users/daisuke6106/AppData/Roaming/Code/User/settings.json.org 

    # 設定ファイルをシンボリックリンクで作成
    ln -s $(pwd)/.vscode/settings.json /c/Users/daisuke6106/AppData/Roaming/Code/User/settings.json




## クローン済のリポジトリがpull,pushできなかった場合
git remote set-url origin git@github.com:daisuke6106/$(basename $(pwd)).git
