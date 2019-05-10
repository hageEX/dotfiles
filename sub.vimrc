"+---+------------------------+
"| # | プラグインインストール |
"+===+========================+
call plug#begin()

"表作成を補助する
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeEnableToggle'}
"ツリー構造を表示する
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
"statuslineを強化
Plug 'itchyny/lightline.vim'
"プログラムコードをvim上で実行する
Plug 'thinca/vim-quickrun'
"対括弧を自動保管
Plug 'Townk/vim-autoclose'
"画面分割幅を変更する
Plug 'simeji/winresizer'
"Git補助機能
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
".jsonファイルを見やすく
Plug 'elzr/vim-json', {'for': 'json'}
"コーディング規約をチェック
Plug 'vim-syntastic/syntastic', {'for': 'java'}
"暗黒の力で補完
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
"検索やらなんやら
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()
"|---+----------------|
"| # | プラグイン設定 |
"|===+================|
"
"| -------------------- |
"| neocomplete, snippet |
"| ==================== |
imap <C-@>     <Plug>(neosnippet_expand_or_jump)
smap <C-@>     <Plug>(neosnippet_expand_or_jump)
xmap <C-@>     <Plug>(neosnippet_expand_target)

" Vim起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 1文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 1
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"
" エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
" タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

"+----------+
"| NERDTree |
"+==========+
nnoremap <space>n :NERDTree<CR>
"|----------|
"| QuickRun |
"|==========|
nnoremap \r :write<CR>:QuickRun -mode n<CR>
xnoremap \r :<C-U>write<CR>gv:QuickRun -mode v<CR>
let g:quickrun_config = {}
let g:quickrun_config={'*': {'split': 'vertical'}}
"let g:quickrun_config._={ 'runner':'job',
"    \       "runner/job/updatetime" : 10,
"    \       "outputter/buffer/close_on_empty" : 1,
"    \ }
set splitright
let g:quickrun_no_default_key_mappings = 1
"+-----------+
"| TableMode |
"+===========+
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
let g:table_mode_corner = '|'
"|---------------------|
"| winresizer:画面分割 |
"|=====================|
let g:winresizer_start_key = '\'
"|---+------------------|
"| # | ステータスライン |
"|===+==================|
set laststatus=2
set showcmd
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'gitbranch' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'separator': {'left': '', 'right': ''},
      \ 'subseparator': {'left': '' , 'right': ''}
      \ }


"'modified'
"

"|---+------------------|
"| # | カラーテーマ設定 |
"|===+==================|
colorscheme despacio
"| ---+---------- +
"| #  | 各種設定  |
"| ===+========== +
filetype plugin indent on
set ruler
set number
set title
syntax on
set belloff=all
set virtualedit=onemore
"set t_Co=256
set term=xterm-256color
"+---+--------------+
"| # | マウス有効化 |
"+===+==============+
set mouse=a
set ttymouse=xterm2
"| ---+------+
"| #  | 配色 |
"| ===+======+
"カーソルライン
set cursorline
hi clear cursorline
"その他
"hi Comment ctermfg=242                "コメント
"hi LineNr ctermfg=darkred             "行番号
hi Normal ctermfg=250                  "文字色
hi Normal ctermbg=232                  "背景色
hi CursorLineNr term=standout ctermfg=109 ctermbg=15
"+---+------------+
"| # | インデント |
"+===+============+
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=8
"+---+--------+
"| # | その他 |
"+===+========+
set directory=/home/SWAP               "swapFileを一箇所に集める
set history=100                        "履歴の保存件数を指定
set encoding=UTF-8                     "文字コードを指定
set fileencoding=UTF-8
set termencoding=UTF-8
set noswapfile                         "swapFileを作らない
set ambiwidth=double                   "全角記号の表示設定
set clipboard+=unnamed,autoselect      "クリップボードを有効化
set backspace=indent,eol,start         "BSを有効化
"+---+------+
"| # | 検索 |
"+===+======+
set hlsearch
set ignorecase                         "検索時に大文字小文字を区別しない
set smartcase                          "検索時に大文字を使った時は区別する
set incsearch                          "検索時に一文字入力毎に検索を行う
"検索によるハイライトを解除
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
"検索時に一般的な正規表現を使用可能する
nmap / /\v
"+---+--------------+
"| # | ちょっと便利 |
"+===+==============+
set showmatch matchtime=1              "対応するカッコを一瞬表示
set whichwrap=b,s,h,l,<,>,[,],~        "カーソルの左右移動で行を移動可能にする
set wildmenu                           "コマンドモードの補完
set scrolloff=5                        "スクロール時に上下５行の視界を確保
"+---+--------------------------------+
"| # | 挿入モード mac emacs カーソル |
"+===+================================+
inoremap<silent> <C-p> <Up>
inoremap<silent> <C-n> <Down>
inoremap<silent> <C-f> <Right>
inoremap<silent> <C-b> <Left>
"inoremap<silent> <c-h> <bs>
inoremap<silent> <C-d> <Del>
"+---+--------------------------+
"| # | ノーマルモード mac emacs |
"+===+==========================+
noremap<silent> <C-p> <Up>
noremap<silent> <C-n> <Down>
noremap<silent> <C-f> <Right>
noremap<silent> <C-b> <Left>
noremap<silent> <C-d> <Del>
"+---+-------------------------+
"| # | 挿入モード vim カーソル |
"+===+=========================+
inoremap<silent> <C-k> <Up>
inoremap<silent> <C-j> <Down>
inoremap<silent> <C-l> <Right>
inoremap<silent> <C-h> <Left>
"+---+-----------------------------+
"| # | ノーマルモード vim カーソル |
"+===+=============================+
noremap<silent> <C-k> <Up>
noremap<silent> <C-j> <Down>
noremap<silent> <C-l> <Right>
noremap<silent> <C-h> <Left>
"+---+------------------+
"| # | 行頭、行末に移動 |
"+===+==================+
inoremap<silent> <C-a> <Esc>^a
inoremap<silent> <C-e> <Esc>$a
nnoremap <C-e> $
"+---+------------------+
"| # | 保存、終了、選択 |
"+===+==================+
"noremap <Space>v <C-v>
nnoremap <Space>s :w<CR>
nnoremap <Space>w :q<CR>
nnoremap <Space>q :q!<CR>
"+---+------------------------------+
"| # | インサートからノーマルへ移動 |
"+===+==============================+
inoremap<silent> jj <ESC>
"inoremap<silent> っj <ESC>
"+---+--------------------+
"| # | バッファの切り替え |
"+===+====================+
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>
"+---+----------------------+
"| # | Exモードの再割り当て |
"+===+======================+
nnoremap Q gq
"+---+----------------------------------+
"| # | カーソルがあるページ以外を閉じる |
"+===+==================================+
nnoremap <Space>o :only<CR>
"+---+----------------------+
"| # | タブの新規作成、移動 |
"+===+======================+
nnoremap <Space>t :tabnew<CR>
nnoremap L gt
nnoremap H gT
"+---+------------+
"| # | 日本語入力 |
"+===+============+
nnoremap い i
noremap<silent> <C-i> i
