"Plugin manager = Vim-plug
"Nerd-fonts = 16pt Literation Mono Nerd Font Complete
"+---+----------------+
"| # | Plugin Install |
"+===+================+
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
"NERDTreeなどでファイルにIconを表示する
Plug 'ryanoasis/vim-devicons', {'on': 'NERDTreeToggle'}
"暗黒の力で補完
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
"非同期実行を可能にする
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"曖昧検索
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
"テスト実行
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
"コードチェック
Plug 'w0rp/ale', {'for': 'java'}
"計り知れない暗黒の力
Plug 'Shougo/denite.nvim'
"Python補完
"Plug 'davidhalter/jedi-vim', {'for': 'python'}
"pythonインデントに自動調整
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
"カーソルの移動を快適にする
Plug 'easymotion/vim-easymotion'

call plug#end()
"+---|----------------+
"| # | Plugin Setting |
"+===|================+
"
"+-------------------+
"| deoplete, snippet |
"+===================+
let g:python3_host_prog = '/Users/user/miniconda3/bin/python3'
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><BS> deoplete#smart_close_popup()."<C-h>"

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-@>     <Plug>(neosnippet_expand_or_jump)
smap <C-@>     <Plug>(neosnippet_expand_or_jump)
xmap <C-@>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"+-------------+
"| easy-motion |
"+=============+
" デフォルトのキーマッピングを無効に
let g:EasyMotion_do_mapping = 0
" f + 2文字 で画面全体を検索してジャンプ
nmap f <plug>(easymotion-overwin-f2)
" 検索時、大文字小文字を区別しない
let g:EasyMotion_smartcase = 1
"+-----+
"| fzf |
"+=====+
nnoremap <Space>f :Files<CR>
"+----------+
"| NERDTree |
"+==========+
nnoremap <space>n :NERDTree<CR>
"+----------+
"| QuickRun |
"+==========+
nnoremap \r :write<CR>:QuickRun -mode n<CR>
xnoremap \r :<C-U>write<CR>gv:QuickRun -mode v<CR>
let g:quickrun_config={'*': {'split': 'vertical'}}
let g:quickrun_config._={ 'runner':'job',
    \       "runner/job/updatetime" : 10,
    \       "outputter/buffer/close_on_empty" : 1,
    \ }
" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

"vimproc -> job
set splitright
let g:quickrun_no_default_key_mappings = 1
"+----------+
"| Devicons |
"+==========+
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:Webdevicons_enable = 1
let g:Webdevicons_enable_nerdtree = 1
let g:Webdevicons_enable_nerdtree_brackets = 1
let g:WebdeviconsUnicodeGlyphDoubleWidth = 1
"+-----------+
"| TableMode |
"+===========+
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='
let g:table_mode_corner = '|'
"+---------------------+
"| winresizer:画面分割 |
"+=====================+
let g:winresizer_start_key = '\'
"+---|------------+
"| # | StatusLine |
"+===|============+
set laststatus=2
set showcmd
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'gitbranch' ] ],
      \   'right': [[''], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
      \ },
      \ 'tab': {
      \     'active': ['', 'filename', 'modified'],
      \     'inactive': ['', 'filename', 'modified']
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'separator': {'left': '', 'right': ''},
      \ 'subseparator': {'left': '' , 'right': ''},
      \ 'tabline_separator': {'left':'', 'right': ''},
      \ 'tabline_subseparator': {'left':'', 'right': ''},
      \ }

"function! () abort
"    if winwidth(0) > 70
"        return ''
"    else
"        return ''
"    endif
"endfunction

"
"+---|------------+
"| # | Colortheme |
"+===|============+
colorscheme despacio
"+---|---------+
"| # | Setting |
"+===|=========+
filetype plugin indent on
set ruler
set number
"相対行番号を表示する
set relativenumber
"<F3>で相対行番号と絶対行番号を切り替える
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>
set title
syntax enable
set belloff=all
set virtualedit=onemore
"set t_Co=256
set term=xterm-256color
"+---+--------------+
"| # | Mouse Enable |
"+===+==============+
set mouse=a
set ttymouse=xterm2
"+---|--------+
"| # | Colors |
"+===|========+
"カーソルライン
set cursorline
hi clear cursorline
"その他
"hi Comment ctermfg=242                "コメント
"hi LineNr ctermfg=darkred             "行番号
hi Normal ctermfg=250                  "文字色
hi Normal ctermbg=232                  "背景色
hi CursorLineNr term=standout ctermfg=109 ctermbg=15
"対括弧強調表示
hi MatchParen ctermbg=21
"+---+--------+
"| # | Indent |
"+===+========+
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=8
"+---+-----+
"| # | etc |
"+===+=====+
set directory=/home/SWAP               "swapFileを一箇所に集める
set history=100                        "履歴の保存件数を指定
set encoding=utf-8                     "文字コードを指定
set fileencodings=utf-8,sjis
set fileformats=unix,dos,mac
set termencoding=utf-8
set noswapfile                         "swapFileを作らない
set ambiwidth=double                   "全角記号の表示設定
set clipboard+=unnamed,autoselect      "クリップボードを有効化
set backspace=indent,eol,start         "BSを有効化
"+---+------------+
"| # | Vim search |
"+===+============+
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
"全角スペースを可視化
hi DoubleByteSpace term=underline ctermbg=245
match DoubleByteSpace /　/
"不可視文字を表示、表示文字を設定
"set list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:»-,trail:-,eol:↵,extends:»,precedes:«,nbsp:%
"不可視文字を非表示にする
"set nolist
"行末の半角スペースを取り除く
autocmd BufWritePre * :%s/\s\+$//ge
"+---+---------------------------+
"| # | Cursor(Insert): mac emacs |
"+===+===========================+
inoremap<silent> <C-p> <Up>
inoremap<silent> <C-n> <Down>
inoremap<silent> <C-f> <Right>
inoremap<silent> <C-b> <Left>
"inoremap<silent> <c-h> <bs>
inoremap<silent> <C-d> <Del>
"+---+---------------------------+
"| # | Cursor(Normal): mac emacs |
"+===+===========================+
noremap<silent> <C-p> <Up>
noremap<silent> <C-n> <Down>
noremap<silent> <C-f> <Right>
noremap<silent> <C-b> <Left>
"noremap<silent> <C-d> <Del>
"+---+---------------------+
"| # | Cursor(Insert): vim |
"+===+=====================+
inoremap<silent> <C-k> <Up>
inoremap<silent> <C-j> <Down>
inoremap<silent> <C-l> <Right>
inoremap<silent> <C-h> <Left>
"+---+---------------------+
"| # | Cursor(Normal): vim |
"+===+=====================+
nnoremap j gj
nnoremap k gk
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
nnoremap <Space>w :w<CR>
nnoremap <Space>q :q!<CR>
"+---+------------------------------+
"| # | インサートからノーマルへ移動 |
"+===+==============================+
inoremap<silent> jj <ESC>
"inoremap<silent> っj <ESC>
"+---+---------------+
"| # | Change Buffer |
"+===+===============+
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
"nnoremap い i
"noremap<silent> <C-i> i
"+---|-------------------+
"| # | Visual more ++ -- |
"+===|===================+
vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv
"+---|--------------------------------+
"| # | 検索時に検索語句を真ん中に表示 |
"+===|================================+
map n nzz
map N Nzz

