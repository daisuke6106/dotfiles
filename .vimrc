" ==================================================
" 基本設定
" ==================================================
"文字コードをUFT-8に設定
set fenc=utf-8
" 入力中のコマンドをステータスに表示する
set showcmd

" ==================================================
" キーバインド設定
" ==================================================
" 所定のキー押下にESCに割り当て
inoremap <silent> jj <ESC>

" 移動キーをずらす
" nnoremap j h
" nnoremap k j
" nnoremap l k
" nnoremap ; l

" 折り返し時に表示行単位での移動できるようにする
" nnoremap j gj
" nnoremap k gk

" ==================================================
" 保存関連
" ==================================================
" スワップファイルを作成しない
set noswapfile

" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
set nobackup

" ==================================================
" ヤンク関連
" ==================================================
" yでコピーした時にクリップボードに入る
set guioptions+=a
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect

" ==================================================
" 表示関連
" ==================================================
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
" set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" カーソルの位置表示を行う
set ruler
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/
colorscheme desert
" ステータスバーに文字コード、改行コードを表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" 自動改行させない
set nowrap
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block

" ==================================================
" タブ関連
" ==================================================
" 不可視文字を可視化(タブが「^   」と表示される)
set list listchars=tab:»-,eol:↲
" Tab文字を半角スペースにする
" set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
" set tabstop=2
" 行頭でのTab文字の表示幅
" set shiftwidth=2

" ==================================================
" 検索関連
" ==================================================
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
