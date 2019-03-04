" Plugin manager = Vim-plug
" Nerd-fonts = 16pt Literation Mono Nerd Font Complete
" vim: ft=vim
"+---+----------------+
"| # | Plugin Install |
"+===+================+
call plug#begin()

" 表作成を補助する
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeEnableToggle'}
" ツリー構造を表示する
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
"statuslineを強化
Plug 'itchyny/lightline.vim'
" プログラムコードをvim上で実行する
Plug 'thinca/vim-quickrun'
" 対括弧を自動保管
Plug 'Townk/vim-autoclose'
" 画面分割幅を変更する
Plug 'simeji/winresizer'
" Git補助機能
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" .jsonファイルを見やすく
Plug 'elzr/vim-json', {'for': 'json'}
" NERDTreeなどでファイルにIconを表示する
Plug 'ryanoasis/vim-devicons', {'on': 'NERDTreeToggle'}
" 暗黒の力で補完
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" 非同期実行を可能にする
"Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" 曖昧検索
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
"テスト実行
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
" コードチェック
Plug 'w0rp/ale'
" 計り知れない暗黒の力
Plug 'Shougo/denite.nvim'
" Python補完
" Plug 'davidhalter/jedi-vim', {'for': 'python'}
" pythonインデントに自動調整
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
" カーソルの移動を快適にする
Plug 'easymotion/vim-easymotion'
" vim-lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" TypeScript-lsp?
Plug 'ryanolsonx/vim-lsp-typescript'
" JavaScript-lsp
Plug 'ryanolsonx/vim-lsp-javascript'
" (M)マークダウンをサポート
Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'html', 'js']}
" (M)マークダウンをプレビュー表示
Plug 'kannokanno/previm'
" (M+)vim上のURLや文字列をブラウザで検索
Plug 'tyru/open-browser.vim'
" vimのオートセーブを可能にする
Plug 'vim-scripts/vim-auto-save', {'for': ['markdown', 'html', 'js']}

call plug#end()
"+---|----------------+
"| # | Plugin Setting |
"+===|================+

"+-----+
"| ale |
"+=====+
" シンタックスチェックの表示シンボルを変更する
let g:ale_sign_error = '⌦'
let g:ale_sign_warning = '⚠'
" エラー箇所にジャンプ
nmap <silent> J <Plug>(ale_next_wrap)
nmap <silent> K <Plug>(ale_previous_wrap)
"+---------------+
"| vim-auto-save |
"+===============+
" オートセーブが使いたくなったときはこちらー！（浜田風）
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
"+------------+
"| (M)arkDown |
"+============+
" 折りたたみの禁止
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" プレビューに使用するブラウザを設定
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ''
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1
let g:previm_enable_realtime = 1
autocmd BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a firefox'
" ctrl mでプレビュー
nnoremap <silent> <C-m> :PrevimOpen<CR>

" gxで選択した文字列をブラウザ検索
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"+---------+
"| vim-lsp |
"+=========+
" Syntax Check signs    0=disable, 1=enable
let g:lsp_signs_enabled = 1
let g:lsp_signs_error = {'text': '⌦'}
let g:lsp_signs_warning = {'text': '⚠',}
nmap <silent> J :LspNextError<CR>
nmap <silent> K :LspPreviousError<CR>

" //Python
if executable('pyls')
    au User lsp_setup call lsp#register_server({
                \'name': 'pyls',
                \'cmd': {server_info->['pyls']},
                \'whitelist': ['python'],
                \})
endif

" //Rust
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

" //TypeScript
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
endif

" //JavaScript
 au User lsp_setup call lsp#register_server({
    \ 'name': 'javascript support using typescript-language-server',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
    \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
    \ 'whitelist': ['javascript', 'javascript.jsx'],
    \ })

"+------------+
"| neovim-lsp |
"+============+

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
let NERDTreeWinSize = 25
"+----------+
"| QuickRun |
"+==========+
nnoremap \r :write<CR>:QuickRun -mode n<CR>
xnoremap \r :<C-U>write<CR>gv:QuickRun -mode v<CR>
let g:quickrun_config={'*': {'split': 'vertical'}}
" 左右分割する場合は、下の/buffer/splitの行をコメントアウト
let g:quickrun_config._={ 'runner':'job',
    \       "runner/job/updatetime" : 10,
    \       "outputter/buffer/close_on_empty" : 1,
    \       "outputter/buffer/split" : ":botright 8",
    \ }

" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" vimproc -> job
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
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'filename' ], [ 'fugitive' ] ],
        \   'right': [ [''], ['percent'], ['fileformat', 'fileencoding', 'filetype']]
        \ },
        \ 'tab': {
        \   'active': ['', 'filename', 'modified'],
        \   'inactive': ['', 'filename', 'modified']
        \ },
        \ 'component_function': {
        \   'fugitive': 'LightlineFugitive',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ },
        \ 'separator': {'left': '', 'right': ''},
        \ 'subseparator': {'left': '' , 'right': ''},
        \ 'tabline_separator': {'left':'|', 'right': '|'},
        \ 'tabline_subseparator': {'left':'|', 'right': '|'},
        \ }

function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 50 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


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
" 相対行番号を表示する
set relativenumber
" <F3>で相対行番号と絶対行番号を切り替える
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>
set title
set belloff=all
set virtualedit=onemore
"set t_Co=256
set term=xterm-256color
syntax enable
set termguicolors
"+---+--------------+
"| # | Mouse Enable |
"+===+==============+
set mouse=a
set ttymouse=xterm2
"+---|--------+
"| # | Colors |
"+===|========+
" カーソルライン
set cursorline
hi clear cursorline
" その他
"hi Comment ctermfg=242                "コメント
"hi LineNr ctermfg=darkred             "行番号
hi Normal ctermfg=250                  "文字色
hi Normal ctermbg=232                  "背景色
hi CursorLineNr term=standout ctermfg=109 ctermbg=15
" 対括弧強調表示
hi MatchParen ctermbg=21
" set termguicolors時に反映
hi Normal guibg=#000022                "背景色
hi Normal guifg=#B3ADA5
" hi Normal guibg=#2B2B2B                "背景色
" hi Normal guifg=#CCCCFF                "文字色
hi CursorLineNr guifg=#6b8e23
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

" MarkDown不可視文字くそ
set conceallevel=0
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
" 全角スペースを可視化
hi DoubleByteSpace term=underline ctermbg=245
match DoubleByteSpace /　/
" 不可視文字を表示、表示文字を設定
"set list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:»-,trail:-,eol:↵,extends:»,precedes:«,nbsp:%
" 不可視文字を非表示にする
"set nolist
" 行末の半角スペースを取り除く
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
"| # | カーソルがあるWindow以外を閉じる |
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

