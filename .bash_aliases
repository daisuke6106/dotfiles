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
