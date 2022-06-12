# set -x
# set +o xtrace
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
# DIRを保持したままコピー
# 引数１に指定したコピー対象ファイルパスを保持した状態で、引数２にコピーする
# 例：「d_cp_with_path ./a/b/c/aaa.txt /x」の場合、
#     /x/a/b/c/aaa.txtへコピー。「/x」にa/b/c/がなければ作る。
# ==================================================================================
function d_cp_with_path() {
	if [ $# != 2 ]; then
		echo "argument fail."
		echo ""
		echo "Usage:"
		echo "d_cp_with_path FROM_FILEPATH TO_FILEPATH"
		return 1
	fi
	FROM_FILEPATH="$1"
	TO_FILEPATH="$2"
	if [ ! -f ${FROM_FILEPATH} ]; then
		echo "[${FROM_FILEPATH}] is not file."
		echo ""
		echo "Usage:"
		echo "d_cp_with_path FROM_FILEPATH TO_FILEPATH"
		return 1
	fi
	if [ ! -d ${TO_FILEPATH} ]; then
		echo "[${TO_FILEPATH}] is not dir."
		echo ""
		echo "Usage:"
		echo "d_cp_with_path FROM_FILEPATH TO_FILEPATH"
		return 1
	fi
	DIRPATH="$(dirname ${FROM_FILEPATH})"
	mkdir -p ${TO_FILEPATH}/${DIRPATH} && cp -p ${FROM_FILEPATH} ${TO_FILEPATH}/${DIRPATH}
}

# ==================================================================================
# DISK
# ==================================================================================
# ==================================================================================
# SSH
# ==================================================================================
# SSH 作成 
# alias daisuke6106.keygen="ssh-keygen -t rsa -b 4096 -C \"daisuke6106@gmail.com\""
# ----------------------------------------------------------------------------------
# 複合時にパスフレーズ入力を強制
# ----------------------------------------------------------------------------------
# 秘密鍵作成
# openssl genrsa -aes256 4096 > ~/.ssh/daisuke6106.rsa4096.key
# 公開鍵作成
# openssl rsa -pubout < ~/.ssh/daisuke6106.rsa4096.key > ~/.ssh/daisuke6106.rsa4096.key.pub
# ----------------------------------------------------------------------------------
# 複合時にパスフレーズ入力なし
# ----------------------------------------------------------------------------------
# 秘密鍵作成
# openssl genrsa 4096 > ~/.ssh/daisuke6106.rsa4096.key
# 公開鍵作成
# openssl rsa -pubout < ~/.ssh/daisuke6106.rsa4096.key > ~/.ssh/daisuke6106.rsa4096.key.pub
# ----------------------------------------------------------------------------------
# 
# ----------------------------------------------------------------------------------
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
alias d_ssh.dev.vitualbox="ssh dev@dev.vitualbox"

# ----------------------------------------------------------------------------------
# パスフレーズを使って暗号化/復号化
# ----------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------
# 暗号化：標準入力を暗号化して標準出力に出力
# ----------------------------------------------------------------------------------
# alias d_enc="openssl enc -e -aes-256-cbc -salt -k ${PASSWORD} 2>/dev/null | xxd -p | tr a-f A-F | tr -d "\n""
# ----------------------------------------------------------------------------------
# 復号化：標準入力を復号化して標準出力に出力
# ----------------------------------------------------------------------------------
# alias d_unenc="xxd -r -p | openssl enc -d -aes-256-cbc -salt -k ${PASSWORD} 2>/dev/null"

# ----------------------------------------------------------------------------------
# 鍵ファイルを使って暗号化/復号化
# ----------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------
# 暗号化：標準入力を暗号化して標準出力に出力
# ----------------------------------------------------------------------------------
alias d_enc="openssl rsautl -encrypt -pubin -inkey ${SSLKEY_PUB_NONPASS} | xxd -p | tr a-z A-Z | tr -d '\n'"
# ----------------------------------------------------------------------------------
# 復号化：標準入力を復号化して標準出力に出力
# ----------------------------------------------------------------------------------
alias d_unenc="xxd -r -p | openssl rsautl -decrypt -inkey ${SSLKEY_PRV_NONPASS}"

# ----------------------------------------------------------------------------------
# password memo
# ----------------------------------------------------------------------------------
# alias d_passwd_encrypt='openssl rsautl -encrypt -pubin -inkey ${GIT_REPO_DOTFILES}/.ssh/daisuke6106.rsa4096.key.pub -in ${GIT_REPO_PRVFILES}/passwd.nonenc -out ${GIT_REPO_PRVFILES}/passwd'
alias d_passwd_encrypt="openssl enc -e -aes256 -in ${GIT_REPO_PRVFILES}/passwd.nonenc -out ${GIT_REPO_PRVFILES}/passwd"
alias d_passwd_unencrypt="openssl enc -d -aes256 -in ${GIT_REPO_PRVFILES}/passwd -out ${GIT_REPO_PRVFILES}/passwd.nonenc"

# ----------------------------------------------------------------------------------
# edit file
# ----------------------------------------------------------------------------------
alias d_vi_vimrc="vi ${GIT_REPO_DOTFILES}/.vimrc"
alias d_vi_bash_path="vi ${GIT_REPO_DOTFILES}/.bash_path"
alias d_vi_bash_aliases="vi ${GIT_REPO_DOTFILES}/.bash_aliases"
alias d_vi_command="vi ${GIT_REPO_PRVFILES}/command"

# ----------------------------------------------------------------------------------
# 削除付加フラグON/OFF系
# ----------------------------------------------------------------------------------
alias d_chi_on="sudo chattr +i -R "
alias d_chi_off="sudo chattr -i -R "

# ----------------------------------------------------------------------------------
# vagrant
# ----------------------------------------------------------------------------------
# 参考：https://www.suzu6.net/posts/221-how-to-install-vagrant-on-ubuntu/
# ==========================
# インストール
# ==========================
# # パッケージリストを更新
# $ sudo apt update
# # Vagrantをダウンロード
# $ curl -O https://releases.hashicorp.com/vagrant/2.2.18/vagrant_2.2.18_x86_64.deb
# # Vagrantをインストール
# $ sudo apt install ./vagrant_2.2.18_x86_64.deb
# # バージョン確認
# $ vagrant --version
# Vagrant 2.2.7

# ----------------------------------------------------------------------------------
# バイナリ／テキスト判断
# ----------------------------------------------------------------------------------
function d_filetype(){
	if [ $# == 0 ]; then
		echo "No arguments set." 1>&2
		return 1
	fi
	local FILEPATH="$1"
	if [ ! -e $FILEPATH ]; then
		echo "Not exists. path=[$FILEPATH]" 1>&2
		return 1
	fi
	if [ ! -f $FILEPATH ]; then
	 	echo "Not such file. path=[$FILEPATH]" 1>&2
	 	return 1
	fi
	if [ $(file --mime "$FILEPATH" | grep "charset=binary" | wc -l) == 1 ]; then
		echo "binary";
	else
		echo "text";
	fi

}
# ----------------------------------------------------------------------------------
# 拡張子取得
# ----------------------------------------------------------------------------------
function d_extname(){
	if [ $# == 0 ]; then
		echo "No arguments set." 1>&2
		return 1
	fi
	if [ $# == 1 -a "$1" == "-" ]; then
		while read line
		do
			# if [ ! -e $line ]; then
			# 	echo "Not exists. path=[$i]" 1>&2
			# 	return 1
			# fi
			# if [ ! -f $line ]; then
			# 	echo "Not such file. path=[$i]" 1>&2
			# 	return 1
			# fi
			basename $line | awk -F '.' '{if(NF > 1){print $NF}}'
		done
	else
		for line in $*
		do
			# if [ ! -e $line ]; then
			# 	echo "Not exists. path=[$i]" 1>&2
			# 	return 1
			# fi
			# if [ ! -f $line ]; then
			# 	echo "Not such file. path=[$i]" 1>&2
			# 	return 1
			# fi
			basename $line | awk -F '.' '{if(NF > 1){print $NF}}'
		done
	fi
}


# ----------------------------------------------------------------------------------
# 日付パーサ
# ----------------------------------------------------------------------------------
function d_export_split_yyyymmddhhmmss {
	if [ $# != 1 ]; then
		echo "only one argument can be specified." 1>&2
		return 1
	fi
	if [ $( echo -n "$1" | wc -m ) != 14 ]; then
		echo "arguments are not yyyymmddhhmmss format. args=[$1]" 1>&2
		return 1
	fi
	yyyymmdd="$( echo $1 | cut -c 1-8 )"
	hhmmss="$( echo $1 | cut -c 9-14 )"
	if [ "$( date +'%Y%m%d' -d "${yyyymmdd}" )" != "${yyyymmdd}" ]; then
		echo "invalid date. args=[$1]" 1>&2
		return 1
	fi

	if [ "$(echo ${hhmmss} | sed -e "s/^[0-2][0-9][0-5][0-9][0-5][0-9]$//g")" != "" ]; then
		echo "invalid time. args=[$1]" 1>&2
		return 1
	fi
	export YYYYMMDD="${yyyymmdd}"
	export YYYY=$(echo "${yyyymmdd}" | cut -c 1-4)
	export MM=$(echo "${yyyymmdd}" | cut -c 5-6)
	export DD=$(echo "${yyyymmdd}" | cut -c 7-8)
	export HHMMSS="${hhmmss}"
	export HH=$(echo "${hhmmss}" | cut -c 1-2)
	export MI=$(echo "${hhmmss}" | cut -c 3-4)
	export SS=$(echo "${hhmmss}" | cut -c 5-6)

}

# ----------------------------------------------------------------------------------
# 画像メタデータ
# ----------------------------------------------------------------------------------
function d_echo_exif_datetime_yyyymmddhhmmss {
	if [ $# == 0 ]; then
		echo "No arguments set." 1>&2
		return 1
	fi
	for i in $*
	do
		if [ ! -e $i ]; then
			echo "Not exists. path=[$i]" 1>&2
			continue
		fi
		if [ ! -f $i ]; then
			echo "Not such file. path=[$i]" 1>&2
			continue
		fi
		# identify -verbose
		echo $(identify -format "%[exif:DateTime]\n" $i | sed -e "s/://g" -e "s/ //g")
	done
}

# ----------------------------------------------------------------------------------
# 画像メタデータ
# ----------------------------------------------------------------------------------
function d_echo_filetimestanmp_yyyymmddhhmmss() {
	if [ $# != 1 ]; then
		"argument fail."
		echo ""
		echo "Usage:"
		echo "d_get_filetimestanmp_info TARGET_FILE"
		return 1
	fi
	TARGET_FILE="$1"
	if [ ! -f ${TARGET_FILE} ]; then
		echo "[${TARGET_FILE}] is not file."
		echo ""
		echo "Usage:"
		echo "d_get_filetimestanmp_info TARGET_FILE"
		return 1
	fi
	echo $(ls -l --time-style=+'%Y%m%d%H%M%S' "${TARGET_FILE}" | awk '{print $6}')
	# export FILETIMESTAMP_YYYYMMDD_HHMMSS=$(ls -l --time-style=+'%Y%m%d_%H%M%S' "${TARGET_FILE}" | awk '{print $6}')
	# export FILETIMESTAMP_YYYYMMDD_HHMM=$(ls -l --time-style=+'%Y%m%d_%H%M' "${TARGET_FILE}" | awk '{print $6}')
	# export FILETIMESTAMP_YYYYMMDD_HH=$(ls -l --time-style=+'%Y%m%d_%H' "${TARGET_FILE}" | awk '{print $6}')
	# export FILETIMESTAMP_YYYYMMDD=$(ls -l --time-style=+'%Y%m%d' "${TARGET_FILE}" | awk '{print $6}')
	# export FILETIMESTAMP_YYYYMM=$(ls -l --time-style=+'%Y%m' "${TARGET_FILE}" | awk '{print $6}')
	# export FILETIMESTAMP_YYYY=$(ls -l --time-style=+'%Y' "${TARGET_FILE}" | awk '{print $6}')
	# export FILETIMESTAMP_HHMMSS=$(ls -l --time-style=+'%H%M%S' "${TARGET_FILE}" | awk '{print $6}')
	# export FILETIMESTAMP_HHMM=$(ls -l --time-style=+'%H%M' "${TARGET_FILE}" | awk '{print $6}')
	# export FILETIMESTAMP_HH=$(ls -l --time-style=+'%H' "${TARGET_FILE}" | awk '{print $6}')
}


# ----------------------------------------------------------------------------------
# GitHub
# ----------------------------------------------------------------------------------
# githubと接続されているリポジトリをssh接続に切り替え
# git remote set-url origin git@github.com:[ユーザID]/[リポジトリ].git
# git remote set-url origin git@github.com:daisuke6106/dotfiles.git
# git remote set-url origin git@github.com:daisuke6106/etcfiles.git
# git remote set-url origin git@github.com:daisuke6106/prvfiles.git

FILES_DIR_LIST=("dotfiles" "etcfiles" "prvfiles")
function d_git_remote_set_url_xfiles() {
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

function d_git_status_xfiles() {
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

function d_git_pull_xfiles() {
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

function d_create_timestanmp_syboliclink() {
	if [ $# != 2 ]; then
		echo "argument fail."
		echo ""
		echo "Usage:"
		echo "d_create_timestanmp_syboliclink SYMBOLICLINK_TARGETFILEPATH OUTPUT_DIR"
		return 1
	fi
	TARGET_FILE="$1"
	if [ ! -f ${TARGET_FILE} ]; then
		echo "[${TARGET_FILE}] is not file."
		echo ""
		echo "Usage:"
		echo "d_create_timestanmp_syboliclink SYMBOLICLINK_TARGETFILEPATH OUTPUT_DIR"
		return 1
	fi
	OUTPUT_DIR="$2"
	if [ ! -d ${OUTPUT_DIR} ]; then
		echo "[${OUTPUT_DIR}] is not dir."
		echo ""
		echo "Usage:"
		echo "d_create_timestanmp_syboliclink SYMBOLICLINK_TARGETFILEPATH OUTPUT_DIR"
		return 1
	fi
	if "${ISERROR}"; then
		echo ""
		echo "Usage:"
		echo "d_create_timestanmp_syboliclink SYMBOLICLINK_TARGETFILEPATH OUTPUT_DIR"
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

# ----------------------------------------------------------------------------------
# GITのブランチ比較結果をファイルに出力
# 
# Gitの対象のブランチＡ、Ｂを比較して、追加／削除された行を抽出しファイルに出力（コメント行などはある程度は削除する）
# 標準出力に全体行、追加、削除の行数などの出力も行う。
# ----------------------------------------------------------------------------------
function d_git_output_diff_all() {
	if [ $# != 4 ]; then
		echo "argument fail."
		echo ""
		echo "Usage:"
		echo "d_git_output_diff_all GIT_REPO_DIR BRANCH_A BRANCH_B DIFFOUTPUTDIR"
		return 1
	fi
	GIT_REPO_DIR="$1"
	if [ ! -d ${GIT_REPO_DIR} ]; then
		echo "[${GIT_REPO_DIR}] is not dir."
		echo ""
		echo "Usage:"
		echo "d_git_output_diff_all GIT_REPO_DIR BRANCH_A BRANCH_B DIFFOUTPUTDIR"
		return 1
	fi
	if [ ! -d ${GIT_REPO_DIR}/.git ]; then
		echo "[${GIT_REPO_DIR}] is not git repository."
		echo ""
		echo "Usage:"
		echo "d_git_output_diff_all GIT_REPO_DIR BRANCH_A BRANCH_B DIFFOUTPUTDIR"
		return 1
	fi
	BRANCH_A="$2"
	BRANCH_B="$3"
	DIFFOUTPUTDIR="$4"
	if [ ! -d ${DIFFOUTPUTDIR} ]; then
		echo "[${DIFFOUTPUTDIR}] is not dir."
		echo ""
		echo "Usage:"
		echo "d_git_output_diff_all GIT_REPO_DIR BRANCH_A BRANCH_B DIFFOUTPUTDIR"
		return 1
	fi

	# 現在のDIRを保持
	local CURRENTDIR=$(pwd)
	
	# サマリ出力ファイルを定義
	local SUMMARYFILE="SUMMARY.txt"

	# GITリポジトリへ移動
	cd ${GIT_REPO_DIR}

	# ヘッダを出力
	echo "対象ファイル,DIFFファイル名,text/binary,拡張子,ステータス,行数（オリジナルA）,行数（ステップのみA）,行数（オリジナルB）,行数（ステップのみB）,追加行数（全量）,追加行数（ステップのみ）,削除行数（全量）,削除行数（ステップのみ）"  | tee -a ${DIFFOUTPUTDIR}/${SUMMARYFILE}
	
	# 差分抽出開始
	# 差分をファイルに出力し、サマリを標準出力とサマリファイルに出力する。
	# ※）RXXX系は左辺に入っているファイル名が入る
	for TARGET_FILE in $(git diff --name-status ${BRANCH_A} ${BRANCH_B} | awk '{print $2}')
	do
		d_git_output_diff ${GIT_REPO_DIR} ${BRANCH_A} ${BRANCH_B} ${TARGET_FILE} ${DIFFOUTPUTDIR} | tee -a ${DIFFOUTPUTDIR}/${SUMMARYFILE}
	done
}
# ----------------------------------------------------------------------------------
# GITのブランチ比較結果をファイルに出力
# 
# Gitの対象のブランチＡ、Ｂを比較して、追加／削除された行を抽出しファイルに出力（コメント行などはある程度は削除する）
# 標準出力に全体行、追加、削除の行数などの出力も行う。
# ----------------------------------------------------------------------------------
function d_git_output_diff() {
	if [ $# != 5 ]; then
		echo "argument fail."
		echo ""
		echo "Usage:"
		echo "d_git_output_diff GIT_REPO_DIR BRANCH_A BRANCH_B TARGET_FILE DIFFOUTPUTDIR"
		return 1
	fi
	GIT_REPO_DIR="$1"
	if [ ! -d ${GIT_REPO_DIR} ]; then
		echo "[${GIT_REPO_DIR}] is not dir."
		echo ""
		echo "Usage:"
		echo "d_git_output_diff GIT_REPO_DIR BRANCH_A BRANCH_B TARGET_FILE DIFFOUTPUTDIR"
		return 1
	fi
	if [ ! -d ${GIT_REPO_DIR}/.git ]; then
		echo "[${GIT_REPO_DIR}] is not git repository."
		echo ""
		echo "Usage:"
		echo "d_git_output_diff GIT_REPO_DIR BRANCH_A BRANCH_B TARGET_FILE DIFFOUTPUTDIR"
		return 1
	fi
	BRANCH_A="$2"
	BRANCH_B="$3"
	TARGET_FILE="$4"
	DIFFOUTPUTDIR="$5"
	if [ ! -d ${DIFFOUTPUTDIR} ]; then
		echo "[${DIFFOUTPUTDIR}] is not dir."
		echo ""
		echo "Usage:"
		echo "d_git_output_diff GIT_REPO_DIR BRANCH_A BRANCH_B TARGET_FILE DIFFOUTPUTDIR"
		return 1
	fi
	# 現在のDIRを保持
	local CURRENTDIR=$(pwd)
	# 対象ファイルの/を_へ変更
	local ESC_TARGET_FILE="$(echo ${TARGET_FILE} | sed -e "s/\//_/g")"

	# 格納ディレクトリを作成
	mkdir ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}

	# 出力先を差し替え
	local DIFFOUTPUTDIR=${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}
	
	# GITリポジトリへ移動
	cd ${GIT_REPO_DIR}
	
	git diff --name-status ${BRANCH_A}:${TARGET_FILE} ${BRANCH_B}:${TARGET_FILE} > /dev/null 2>&1
	
	# このコマンドが正常終了した場合は、RENAMEか変更
	if [ $? == 0 ]; then
		# 追加、変更、削除の分類
		STATUS=$(git diff --name-status ${BRANCH_A}:${TARGET_FILE} ${BRANCH_B}:${TARGET_FILE} 2>/dev/null | sed -e "s/^\(.\).*/\1/g")

	# 異常終了した場合、新規ファイル、もしくは削除されたファイルのどちらかである
	else
		git show ${BRANCH_A}:${TARGET_FILE} > /dev/null 2>&1
		local STATUS_A=$?
		git show ${BRANCH_B}:${TARGET_FILE} > /dev/null 2>&1
		local STATUS_B=$?
		# Aのブランチにあり、Bのブランチにない場合は削除されたファイル
		if [ ${STATUS_A} == 0 -a ${STATUS_B} != 0 ]; then
			STATUS="D"
		# Aのブランチにない、Bのブランチにある場合は新規作成されたファイル
		elif [ ${STATUS_A} != 0 -a ${STATUS_B} == 0 ]; then
			STATUS="A"
		else
			echo "error.unknow status. status=[${STATUS}] target_file:${TARGET_FILE}" 1>&2
			return 1
		fi

	fi
	
	# 拡張子を取得
	local EXTENT=$(d_extname ${TARGET_FILE})
	
	# テキストファイル or バイナリかを取得
	# （判断するために一度showで取り出さざるを得ない・・・なんかいい手ないかな？）	
	case "${STATUS}" in
		[A] )
			git show ${BRANCH_B}:${TARGET_FILE} > ${DIFFOUTPUTDIR}/file.tmp
			;;
		[M] )
			git show ${BRANCH_B}:${TARGET_FILE} > ${DIFFOUTPUTDIR}/file.tmp
			;;
		[D] )
			git show ${BRANCH_A}:${TARGET_FILE} > ${DIFFOUTPUTDIR}/file.tmp
			;;
		* )
			git show ${BRANCH_A}:${TARGET_FILE} > ${DIFFOUTPUTDIR}/file.tmp
			;;
	esac
	local FILETYPE=$(d_filetype ${DIFFOUTPUTDIR}/file.tmp)
	\rm -f ${DIFFOUTPUTDIR}/file.tmp

	case "${STATUS}" in 

	# ----------------------------------------------------------------------------------------------------
	# リネームの場合
	# ----------------------------------------------------------------------------------------------------
	"R"[0-9][0-9][0-9] )
		# echo "対象ファイル,DIFFファイル名,text/binary,拡張子,ステータス,行数（オリジナルA）,行数（ステップのみA）,行数（オリジナルB）,行数（ステップのみB）,追加行数（全量）,追加行数（ステップのみ）,削除行数（全量）,削除行数（ステップのみ）"
		echo "${TARGET_FILE}" \
			",${ESC_TARGET_FILE}"\
			",${FILETYPE}"\
			",${EXTENT}"\
			",${STATUS}"\
			",0"\
			",0"\
			",0"\
			",0"\
			",0"\
			",0"\
			",0"\
			",0"
	;;
	# ----------------------------------------------------------------------------------------------------
	# リネーム以外の場合
	# ----------------------------------------------------------------------------------------------------
	[AMDCU] )
		# テキストファイルは差分を出力
		if [ "${FILETYPE}" == "text" ]; then
			# ----------------------------------------------------------------------------------------------------
			# 01.全量
			# ----------------------------------------------------------------------------------------------------
			# 修正していないファイルを出力する。
			git show ${BRANCH_A}:${TARGET_FILE} > ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_01.a_origin 2>/dev/null
			git show ${BRANCH_B}:${TARGET_FILE} > ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_01.b_origin 2>/dev/null
			# ステップ行のみ抽出
			cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_01.a_origin | egrep -v "^$|^ +$|^[[:space:]]+$|^ *//|^[[:space:]]+//|^ */\*|^ *\*|^import|^ *#.*|^ *--.*" > ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_02.a_steponly
			cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_01.b_origin | egrep -v "^$|^ +$|^[[:space:]]+$|^ *//|^[[:space:]]+//|^ */\*|^ *\*|^import|^ *#.*|^ *--.*" > ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_02.b_steponly
			# コメント行のみ抽出
			cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_01.a_origin | egrep    "^$|^ +$|^[[:space:]]+$|^ *//|^[[:space:]]+//|^ */\*|^ *\*|^import|^ *#.*|^ *--.*" > ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_03.a_commentonly
			cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_01.b_origin | egrep    "^$|^ +$|^[[:space:]]+$|^ *//|^[[:space:]]+//|^ */\*|^ *\*|^import|^ *#.*|^ *--.*" > ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_03.b_commentonly

			if [ "${STATUS}" == "M" ]; then
				# ----------------------------------------------------------------------------------------------------
				# 02.ブランチ間差分
				# ----------------------------------------------------------------------------------------------------
				# ファイルをブランチ間でDIFFし、追加、削除した行のみ取り出す。
				git diff ${BRANCH_A}:${TARGET_FILE} ${BRANCH_B}:${TARGET_FILE} 2>/dev/null | egrep "^\+|^\-" | egrep -v "^[\+\-]{3}" 1> ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.02_01.diff
				
				# ステップ行のみ抽出
				cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.02_01.diff | \
				egrep -v "^\+$|^\+ +$|^\+[[:space:]]+$|^\+ *//|^\+[[:space:]]+//|^\+ */\*|^\+ *\*|import|^\+ *#.*|^\+ *--.*" | \
				egrep -v "^\-$|^\- +$|^\-[[:space:]]+$|^\- *//|^\-[[:space:]]+//|^\- */\*|^\- *\*|import|^\- *#.*|^\- *--.*"   \
				> ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.02_02.diff_steponly
				
				# コメント行のみ抽出
				diff ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.02_01.diff ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.02_02.diff_steponly | \
				egrep "^<" | sed -e "s/^< //g" > ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.02_03.commentonly

				# ----------------------------------------------------------------------------------------------------
				# 03.追加／削除行
				# ----------------------------------------------------------------------------------------------------
				# 追加＋削除行のみ取り出す。
				cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.02_01.diff | egrep "^\+" > ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.03_01.diff_add_only
				cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.02_01.diff | egrep "^\-" > ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.04_01.diff_del_only
				cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.02_02.diff_steponly | egrep "^\+" > ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.03_02.diff_add_steponly
				cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.02_02.diff_steponly | egrep "^\-" > ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.04_02.diff_del_steponly
				# ----------------------------------------------------------------------------------------------------
				# 04.集計結果を出力
				# ----------------------------------------------------------------------------------------------------
				echo "${TARGET_FILE}" \
					",${ESC_TARGET_FILE}"\
					",${FILETYPE}"\
					",${EXTENT}"\
					",${STATUS}"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_01.a_origin          | wc -l)"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_02.a_steponly        | wc -l)"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_01.b_origin          | wc -l)"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_02.b_steponly        | wc -l)"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.03_01.diff_add_only     | wc -l)"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.03_02.diff_add_steponly | wc -l)"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.04_01.diff_del_only     | wc -l)"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.04_02.diff_del_steponly | wc -l)"
			elif [ "${STATUS}" == "A" ]; then
				echo "${TARGET_FILE}" \
					",${ESC_TARGET_FILE}"\
					",${FILETYPE}"\
					",${EXTENT}"\
					",${STATUS}"\
					",0"\
					",0"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_01.b_origin          | wc -l)"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_02.b_steponly        | wc -l)"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_01.b_origin          | wc -l)"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_02.b_steponly        | wc -l)"\
					",0"\
					",0"
			elif [ "${STATUS}" == "D" ]; then
				echo "${TARGET_FILE}" \
					",${ESC_TARGET_FILE}"\
					",${FILETYPE}"\
					",${EXTENT}"\
					",${STATUS}"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_01.a_origin          | wc -l)"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_02.a_steponly        | wc -l)"\
					",0"\
					",0"\
					",0"\
					",0"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_01.a_origin          | wc -l)"\
					",$(cat ${DIFFOUTPUTDIR}/${ESC_TARGET_FILE}.01_02.a_steponly        | wc -l)"
			fi
		# バイナリファイル
		else
			echo "${TARGET_FILE}" \
				",${ESC_TARGET_FILE}"\
				",${FILETYPE}"\
				",${EXTENT}"\
				",${STATUS}"\
				",0"\
				",0"\
				",0"\
				",0"\
				",0"\
				",0"\
				",0"\
				",0"
		fi
	;;
	*)
		echo "unknown status. status=[${STATUS}] target_file=[${TARGET_FILE}]" 2>&1
		return 1
		;;
	esac
	# 元居たDIRに戻る
	cd ${CURRENTDIR}
}

# ==================================================================================
# ファイルのあるディレクトリへのcd
# ==================================================================================
function cdf() {
	cd $(dirname ${1})
}

# ==================================================================================
# 改行コード変換
# ==================================================================================
function d_linebreak_to_lf() {
	if [ $# != 1 ]; then
		echo "argument fail."
		echo ""
		echo "Usage:"
		echo "d_crlf_to_lf FILEPATH"
		return 1
	fi
	FILEPATH="$1"
	# tr -d '\r' < ${FILEPATH} > ${FILEPATH}.tmp
	# \cp ${FILEPATH}.tmp ${FILEPATH}
	# \rm ${FILEPATH}.tmp
	perl -i -e "s/\r//g" ${FILEPATH}
}

# ==================================================================================
# MD5（出力を反転）
# ==================================================================================
function d_md5() {
	if [ $# != 1 ]; then
		echo "argument fail."
		echo ""
		echo "Usage:"
		echo "d_md5 FILEPATH"
		return 1
	fi
	FILEPATH="$1"
	md5sum ${FILEPATH} | sed -e "s/^\(.*\) \*\(.*\)/\2 \1/g"
}

# ==================================================================================
# DIRを保持したままコピー
# 引数１に指定したコピー対象ファイルパスを保持した状態で、引数２にコピーする
# 例：「d_cp_with_path ./a/b/c/aaa.txt /x」の場合、
#     /x/a/b/c/aaa.txtへコピー。「/x」にa/b/c/がなければ作る。
# ==================================================================================
function d_cp_with_path() {
	if [ $# != 2 ]; then
		echo "argument fail."
		echo ""
		echo "Usage:"
		echo "d_cp_with_path FROM_FILEPATH TO_FILEPATH"
		return 1
	fi
	FROM_FILEPATH="$1"
	TO_FILEPATH="$2"
	if [ ! -f ${FROM_FILEPATH} ]; then
		echo "[${FROM_FILEPATH}] is not file."
		echo ""
		echo "Usage:"
		echo "d_cp_with_path FROM_FILEPATH TO_FILEPATH"
		return 1
	fi
	if [ ! -d ${TO_FILEPATH} ]; then
		echo "[${TO_FILEPATH}] is not dir."
		echo ""
		echo "Usage:"
		echo "d_cp_with_path FROM_FILEPATH TO_FILEPATH"
		return 1
	fi
	DIRPATH="$(dirname ${FROM_FILEPATH})"
	mkdir -p ${TO_FILEPATH}/${DIRPATH} && cp -p ${FROM_FILEPATH} ${TO_FILEPATH}/${DIRPATH}
}

# ==================================================================================
# URL
# ==================================================================================
# [シェル] カッコの意味と役割まとめ [Bash, Linux]
# https://webbibouroku.com/Blog/Article/shell-paren-brace-bracket#outline__7
