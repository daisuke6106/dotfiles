# dotfiles

## 初期セットアップ

### github init

```bash
# sshキー生成
cd ~/.ssh
# -t 暗号化方式を指定 , -b 暗号化強度を指定 , -C コメントを設定
ssh-keygen -t rsa -b 4096 -C daisuke6106@gmail.com -f daisuke6106.github

# 接続確認
ssh -T git@github.com

# clone
mkdir ~/github_workspace
cd ~/github_workspace
git clone git@github.com:daisuke6106/dotfiles.git

# config setting
git config --global user.email daisuke6106@gmail.com
git config --global user.name daisuke6106
git config --global core.editor vim
```

## エディタ設定

### VIM設定ファイルの適用

```bash
# インストール
sudo apt-get install vim
# 現存ファイルのバックアップ
mv ~/.vimrc ~/.vimrc.org
# .vimrc設定ファイルをシンボリックリンクで差し替え
ln -s `pwd`/.vimrc ~/.vimrc
# .vim設定ファイルをシンボリックリンクで作成
ln -s $(pwd)/.vim ~/.vim

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
```

### VSCode設定ファイルの設定

```bash
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
```

## シェル設定

### path設定ファイルの適用

```bash
# 現存ファイルのバックアップ mv ~/.bash_path ~/.bash_path.org
# ファイルをシンボリックリンクで差し替え
ln -s `pwd`/.bash_path ~/.bash_path

# .bashrcに追加
vi ~/.bashrc
if [ -f ~/.bash_path ]; then
    . ~/.bash_path
fi
```

### alias設定ファイルの適用

```bash
# 現存ファイルのバックアップ
mv ~/.bash_aliases ~/.bash_aliases.org
# ファイルをシンボリックリンクで差し替え
ln -s `pwd`/.bash_aliases ~/.bash_aliases

# .bashrcに追加
vi ~/.bashrc
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```

## ターミナル設定

### tmux設定ファイルの適用

```bash
# インストール
sudo apt-get install tmux
# 現存ファイルのバックアップ
mv ~/.tmux.conf ~/.tmux.conf.org
# ファイルをシンボリックリンクで差し替え
ln -s `pwd`/.tmux.conf ~/.tmux.conf
```

### terminator設定ファイルの適用

```bash
# インストール
sudo apt-get install terminator
# 現存ファイルのバックアップ
mkdir -p ~/.config/terminator
mv ~/.config/terminator/config ~/.config/terminator/config.org
# ファイルをシンボリックリンクで差し替え
ln -s `pwd`/.config/terminator/config ~/.config/terminator/config
```

## Git関連設定

### GIT設定ファイルの適用

```bash
# インストール
sudo apt-get install git
# 現存ファイルのバックアップ
mv ~/.gitconfig ~/.gitconfig.org
# ファイルをシンボリックリンクで差し替え
ln -s `pwd`/.gitconfig ~/.gitconfig
```

### .sshファイルの適用

```bash
# 現存ファイルのバックアップ
mv ~/.ssh ~/.ssh.org
# ファイルをシンボリックリンクで差し替え
ln -s `pwd`/.ssh ~/.ssh
```

### クローン済のリポジトリがpull,pushできなかった場合

```bash
git remote set-url origin git@github.com:daisuke6106/$(basename $(pwd)).git
```

## Claude Code設定

### Claude Code グローバル設定ファイルの適用

```bash
# 現存ファイルのバックアップ
mv ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.org
# ファイルをシンボリックリンクで差し替え
mkdir -p ~/.claude
ln -s $(pwd)/.claude/CLAUDE.md ~/.claude/CLAUDE.md
```

### Claude Code グローバル設定(settings.json)の適用

```bash
# 現存ファイルのバックアップ
mv ~/.claude/settings.json ~/.claude/settings.json.org
# ファイルをシンボリックリンクで差し替え
mkdir -p ~/.claude
ln -s $(pwd)/.claude/settings.json ~/.claude/settings.json
```

## 環境

### hosts, services

以下参照

[etcfiles](https://github.com/daisuke6106/etcfiles)
