alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias lt='ls -ltr'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias g='grep'

alias gs='git status'
alias gd='git diff'

# alias cd='pushd'
# alias bk='popd'

alias vi='vim'
alias v='vim'

# ==================================================================================
# SSH
# ==================================================================================
# SSH SAKUSEI 
# alias daisuke6106.keygen="ssh-keygen -t rsa -b 4096 -C \"daisuke6106@gmail.com\""


# himitukagisakusei
# openssl genrsa -aes256 4096 > ~/.ssh/daisuke6106.rsa4096.key

# kouikaikagisakusei
# openssl rsa -pubout < ~/.ssh/daisuke6106.rsa4096.key > ~/.ssh/daisuke6106.rsa4096.key.pub

# anngouka
# echo "Hello World" | openssl rsautl -encrypt -pubin -inkey ~/.ssh/daisuke6106.rsa4096.key.pub > message.dat

# fukugouka
# cat message.dat | openssl rsautl -decrypt -inkey ~/.ssh/daisuke6106.rsa4096.key

# sannkou
# https://weblabo.oscasierra.net/openssl-public-key-crypto/
# https://weblabo.oscasierra.net/openssl-genrsa-secret-1/
# https://weblabo.oscasierra.net/openssl-genrsa-public-1/

# https://qiita.com/suthio/items/2760e4cff0e185fe2db9


# ==================================================================================
# daisuke6106 tools
# ==================================================================================
ALIAS_HEADER="d"

# ----------------------------------------------------------------------------------
# password memo
# ----------------------------------------------------------------------------------
# alias dk.passwd.encrypt='openssl rsautl -encrypt -pubin -inkey ${GIT_REPO_DOTFILES}/.ssh/daisuke6106.rsa4096.key.pub -in ${GIT_REPO_PRVFILES}/passwd.nonenc -out ${GIT_REPO_PRVFILES}/passwd'
alias ${ALIAS_HEADER}.passwd.encrypt="openssl enc -e -aes256 -in ${GIT_REPO_PRVFILES}/passwd.nonenc -out ${GIT_REPO_PRVFILES}/passwd"
alias ${ALIAS_HEADER}.passwd.unencrypt="openssl enc -d -aes256 -in ${GIT_REPO_PRVFILES}/passwd -out ${GIT_REPO_PRVFILES}/passwd.nonenc -md md5"

# ----------------------------------------------------------------------------------
# edit file
# ----------------------------------------------------------------------------------
alias ${ALIAS_HEADER}.vi.bash_vimrc="vi ${GIT_REPO_DOTFILES}/.bash_aliases"
alias ${ALIAS_HEADER}.vi.bash_path="vi ${GIT_REPO_DOTFILES}/.bash_aliases"
alias ${ALIAS_HEADER}.vi.bash_aliases="vi ${GIT_REPO_DOTFILES}/.bash_aliases"
alias ${ALIAS_HEADER}.vi.command="vi ${GIT_REPO_PRVFILES}/command"

# ----------------------------------------------------------------------------------
# GitHub
# ----------------------------------------------------------------------------------
FILES_DIR_LIST=("dotfiles" "etcfiles" "prvfiles")
d.git.status.xfiles() {
	for i in ${FILES_DIR_LIST[@]};
	do
		echo "# --------------------"
		echo "# Target:"${i}
		echo "# --------------------"
		if [ -d ${GIT_WORKSPACE}/${i} ]; then
			cd ${GIT_WORKSPACE}/${i} 1>/dev/null
			git status
			cd -
		else
			echo "dir is not found."
		fi
	done
}

d.git.pull.xfiles() {
	for i in ${FILES_DIR_LIST[@]};
	do
		echo "# --------------------"
		echo "# Target:"${i}
		echo "# --------------------"
		if [ -d ${GIT_WORKSPACE}/${i} ]; then
			cd ${GIT_WORKSPACE}/${i}
			git pull origin
			cd -
		else
			echo "dir is not found."
		fi
	done
}

