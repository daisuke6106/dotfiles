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
# SSH 作成 
# alias daisuke6106.keygen="ssh-keygen -t rsa -b 4096 -C \"daisuke6106@gmail.com\""
# 秘密鍵作成
# openssl genrsa -aes256 4096 > ~/.ssh/daisuke6106.rsa4096.key
# 公開鍵作成
# openssl rsa -pubout < ~/.ssh/daisuke6106.rsa4096.key > ~/.ssh/daisuke6106.rsa4096.key.pub
# 暗号化
# echo "Hello World" | openssl rsautl -encrypt -pubin -inkey ~/.ssh/daisuke6106.rsa4096.key.pub > message.dat
# 復号化
# cat message.dat | openssl rsautl -decrypt -inkey ~/.ssh/daisuke6106.rsa4096.key
# 参考
# https://weblabo.oscasierra.net/openssl-public-key-crypto/
# https://weblabo.oscasierra.net/openssl-genrsa-secret-1/
# https://weblabo.oscasierra.net/openssl-genrsa-public-1/
# https://qiita.com/suthio/items/2760e4cff0e185fe2db9


# ==================================================================================
# daisuke6106 tools
# ==================================================================================
ALIAS_HEADER="d"

# ----------------------------------------------------------------------------------
# ssh
# ----------------------------------------------------------------------------------
alias ${ALIAS_HEADER}.ssh.dev.vitualbox="ssh dev@dev.vitualbox"

# ----------------------------------------------------------------------------------
# password memo
# ----------------------------------------------------------------------------------
# alias dk.passwd.encrypt='openssl rsautl -encrypt -pubin -inkey ${GIT_REPO_DOTFILES}/.ssh/daisuke6106.rsa4096.key.pub -in ${GIT_REPO_PRVFILES}/passwd.nonenc -out ${GIT_REPO_PRVFILES}/passwd'
alias ${ALIAS_HEADER}.passwd.encrypt="openssl enc -e -aes256 -in ${GIT_REPO_PRVFILES}/passwd.nonenc -out ${GIT_REPO_PRVFILES}/passwd"
alias ${ALIAS_HEADER}.passwd.unencrypt="openssl enc -d -aes256 -in ${GIT_REPO_PRVFILES}/passwd -out ${GIT_REPO_PRVFILES}/passwd.nonenc"

# ----------------------------------------------------------------------------------
# edit file
# ----------------------------------------------------------------------------------
alias ${ALIAS_HEADER}.vi.vimrc="vi ${GIT_REPO_DOTFILES}/.vimrc"
alias ${ALIAS_HEADER}.vi.bash_path="vi ${GIT_REPO_DOTFILES}/.bash_path"
alias ${ALIAS_HEADER}.vi.bash_aliases="vi ${GIT_REPO_DOTFILES}/.bash_aliases"
alias ${ALIAS_HEADER}.vi.command="vi ${GIT_REPO_PRVFILES}/command"

# ----------------------------------------------------------------------------------
# GitHub
# ----------------------------------------------------------------------------------
# githubと接続されているリポジトリをssh接続に切り替え
# git remote set-url origin git@github.com:[ユーザID]/[リポジトリ].git
# git remote set-url origin git@github.com:daisuke6106/dotfiles.git
# git remote set-url origin git@github.com:daisuke6106/etcfiles.git
# git remote set-url origin git@github.com:daisuke6106/prvfiles.git

FILES_DIR_LIST=("dotfiles" "etcfiles" "prvfiles")
d.git.remote_set_url.xfiles() {
	for i in ${FILES_DIR_LIST[@]};
	do
		echo "# --------------------"
		echo "# Target:"${i}
		echo "# --------------------"
		if [ -d ${GIT_WORKSPACE}/${i} ]; then
			cd ${GIT_WORKSPACE}/${i} 1>/dev/null
			git remote set-url origin git@github.com:daisuke6106/${i}.git
			cd -
		else
			echo "dir is not found."
		fi
	done
}

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
d.get_filetimestanmp_info() {
	if [ $# != 1 ]; then
		"argument fail."
		echo ""
		echo "Usage:"
		echo "d.get_filetimestanmp_info TARGET_FILE"
		return 1
	fi
	TARGET_FILE="$1"
	if [ ! -f ${TARGET_FILE} ]; then
		echo "[${TARGET_FILE}] is not file."
		echo ""
		echo "Usage:"
		echo "d.get_filetimestanmp_info TARGET_FILE"
		return 1
	fi
	export FILETIMESTAMP_YYYYMMDD_HHMMSS=$(ls -l --time-style=+'%Y%m%d_%H%M%S' "${TARGET_FILE}" | awk '{print $6}')
	export FILETIMESTAMP_YYYYMMDD_HHMM=$(ls -l --time-style=+'%Y%m%d_%H%M' "${TARGET_FILE}" | awk '{print $6}')
	export FILETIMESTAMP_YYYYMMDD_HH=$(ls -l --time-style=+'%Y%m%d_%H' "${TARGET_FILE}" | awk '{print $6}')
	export FILETIMESTAMP_YYYYMMDD=$(ls -l --time-style=+'%Y%m%d' "${TARGET_FILE}" | awk '{print $6}')
	export FILETIMESTAMP_YYYYMM=$(ls -l --time-style=+'%Y%m' "${TARGET_FILE}" | awk '{print $6}')
	export FILETIMESTAMP_YYYY=$(ls -l --time-style=+'%Y' "${TARGET_FILE}" | awk '{print $6}')
	export FILETIMESTAMP_HHMMSS=$(ls -l --time-style=+'%H%M%S' "${TARGET_FILE}" | awk '{print $6}')
	export FILETIMESTAMP_HHMM=$(ls -l --time-style=+'%H%M' "${TARGET_FILE}" | awk '{print $6}')
	export FILETIMESTAMP_HH=$(ls -l --time-style=+'%H' "${TARGET_FILE}" | awk '{print $6}')
}

d.create_timestanmp_syboliclink() {
	if [ $# != 2 ]; then
		echo "argument fail."
		echo ""
		echo "Usage:"
		echo "d.create_timestanmp_syboliclink SYMBOLICLINK_TARGETFILEPATH OUTPUT_DIR"
		return 1
	fi
	TARGET_FILE="$1"
	if [ ! -f ${TARGET_FILE} ]; then
		echo "[${TARGET_FILE}] is not file."
		echo ""
		echo "Usage:"
		echo "d.create_timestanmp_syboliclink SYMBOLICLINK_TARGETFILEPATH OUTPUT_DIR"
		return 1
	fi
	OUTPUT_DIR="$2"
	if [ ! -d ${OUTPUT_DIR} ]; then
		echo "[${OUTPUT_DIR}] is not dir."
		echo ""
		echo "Usage:"
		echo "d.create_timestanmp_syboliclink SYMBOLICLINK_TARGETFILEPATH OUTPUT_DIR"
		return 1
	fi
	if "${ISERROR}"; then
		echo ""
		echo "Usage:"
		echo "d.create_timestanmp_syboliclink SYMBOLICLINK_TARGETFILEPATH OUTPUT_DIR"
		return 1
	fi
	FILETIMESTAMP_YYYYMMDD_HHMMSS=$(ls -l --time-style=+'%Y%m%d_%H%M%S' "${TARGET_FILE}" | awk '{print $6}')
	FILETIMESTAMP_YYYYMMDD=$(echo ${FILETIMESTAMP_YYYYMMDDHHMMSS} | cut -d "_" -f 1)
	FILETIMESTAMP_HHMMSS=$(echo ${FILETIMESTAMP_YYYYMMDDHHMMSS} | cut -d "_" -f 2)
	FILE_HASH="$(md5sum "${TARGET_FILE}" | awk '{print $1}')"
	TARGET_DIR=$(dirname  "${TARGET_FILE}")
	TARGET_FILENAME=$(basename "${TARGET_FILE}")
	TARGET_FILENAME_EXTENSION=".${TARGET_FILE##*.}"
	if [ ".${TARGET_FILENAME}" == "${TARGET_FILENAME_EXTENSION}" ]; then
		TARGET_FILENAME_EXTENSION=""
	fi
	INDEX=0
	EXIST_MAX_INDEX_FILENAME=$(ls "${OUTPUT_DIR}"/${FILETIMESTAMP_YYYYMMDD_HHMMSS}_${FILE_HASH}_???${TARGET_FILENAME_EXTENSION} 2>/dev/null  | tail -n 1 | xargs basename 2>/dev/null )
	if [ "${EXIST_MAX_INDEX_FILENAME}" != "" ]; then
		MAXINDEX=$(echo "${EXIST_MAX_INDEX_FILENAME}" | sed -e "s/^\(.*\)_\(.*\)_\(.*\)_\([0-9]\{3\}\).*/\4/g")
		INDEX=$(expr ${MAXINDEX} + 1)
	fi
	ZERO_PADED_INDEX=$(printf "%03d" ${INDEX})
	ln -s "${TARGET_FILE}" "${OUTPUT_DIR}/${FILETIMESTAMP_YYYYMMDD_HHMMSS}_${FILE_HASH}_${ZERO_PADED_INDEX}${TARGET_FILENAME_EXTENSION}"
}