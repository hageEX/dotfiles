"=======================================
"|           _                         |
"|    __   _(_)_ __ ___  _ __ ___      |
"|    \ \ / / | '_ ` _ \| '__/ __|     |
"|     \ V /| | | | | | | | | (__      |
"|    (_)_/ |_|_| |_| |_|_|  \___|     |
"|                                     |
"=======================================
" Plugin manager = Vim-plug
" Nerd-fonts = 16pt Literation Mono Nerd Font Complete
" vim: ft=vim

" 折りたたみ機能を有効にする
au FileType vim setlocal foldmethod=marker
" Note:[-折りたたみの有効無効切り替え-]
" zi 全てを表示 非表示
" za 個別に表示 非表示

" 範囲選択の始まりと終わりに折りたたみマーカーを追加する
" zf
"+---+------------------+
"| # | "Plugin Install" |
"+===+==================+

call plug#begin()
" {{{
" ツリー構造を表示する
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
" statuslineを強化
"Plug 'itchyny/lightline.vim'
" StatusLineを強化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'ryanoasis/vim-devicons'  ", {'on': 'NERDTreeToggle'}
" 暗黒の力で補完, ファイルエクスプローラー
if has('nvim')
    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
"    Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" 非同期実行を可能にする
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
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
Plug 'prabirshrestha/async.vim', {'for': ['python', 'rust', 'javascript']}
Plug 'prabirshrestha/vim-lsp', {'for': ['python', 'rust', 'javascript']}
Plug 'prabirshrestha/asyncomplete.vim', {'for': ['python', 'rust', 'javascript']}
Plug 'prabirshrestha/asyncomplete-lsp.vim', {'for': ['python', 'rust', 'javascript']}
" TypeScript-lsp
Plug 'ryanolsonx/vim-lsp-typescript'
" JavaScript-lsp
Plug 'ryanolsonx/vim-lsp-javascript'
" (M)マークダウンをサポート
Plug 'plasticboy/vim-markdown', {'for': ['markdown', 'html', 'js']}
" (M)マークダウンをプレビュー表示
Plug 'kannokanno/previm', {'for': ['markdown', 'html', 'js']}
" (M+)vim上のURLや文字列をブラウザで検索
Plug 'tyru/open-browser.vim'
" vimのオートセーブを可能にする
Plug 'vim-scripts/vim-auto-save', {'for': ['markdown', 'html', 'js']}
" コロンの位置を揃えるなど
Plug 'junegunn/vim-easy-align'
" 文字列マーキング機能
Plug 't9md/vim-quickhl'
" マルチカーソル
Plug 'terryma/vim-multiple-cursors'


"}}}
call plug#end()

"+---+------------------+
"| # | "Plugin Setting" |
"+===+==================+

"+------------------------+
"| "vim-multiple-cursors" |
"+------------------------+
"{{{
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key      = '<C-k>'
let g:multi_cursor_select_all_word_key = '<C-l>'
" let g:multi_cursor_start_key           = 'g<C-n>'
" let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-j>'
let g:multi_cursor_prev_key            = '<C-k>'
let g:multi_cursor_skip_key            = '<Space>'
let g:multi_cursor_quit_key            = '<C-c>'
"}}}
"+---------------+
"| "vim-quickhl" |
"+---------------+
"{{{
nmap <Space>l <Plug>(quickhl-manual-this)
xmap <Space>l <Plug>(quickhl-manual-this)
nmap <Space>L <Plug>(quickhl-manual-reset)
xmap <Space>L <Plug>(quickhl-manual-reset)
"}}}
"+------------------+
"| "vim-easy-align" |
"+------------------+
"{{{
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
"}}}
"+-------+
"| "ale" |
"+-------+
"{{{
" シンタックスチェックの表示シンボルを変更する
let g:ale_sign_error = '⌦'
let g:ale_sign_warning = '⚠'
" エラー箇所にジャンプ
nmap <silent> J <Plug>(ale_next_wrap)
nmap <silent> K <Plug>(ale_previous_wrap)
"}}}
"+-----------------+
"| "vim-auto-save" |
"+-----------------+
" オートセーブはこちらー！（浜田風）
"{{{
let g:auto_save = 0
let g:auto_save_in_insert_mode = 0
"}}}
"+--------------+
"| "(M)arkDown" |
"+--------------+
"{{{
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
" Shift + m でプレビュー
nnoremap <silent> M :PrevimOpen<CR>

" gxで選択した文字列をブラウザ検索
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"}}}
"+-----------+
"| "vim-lsp" |
"+-----------+
"{{{
" Syntax Check signs    0=disable, 1=enable
let g:lsp_signs_enabled = 1
let g:lsp_signs_error = {'text': '⌦'}
let g:lsp_signs_warning = {'text': '⚠',}
" nmap <silent> J :LspNextError<CR>
" nmap <silent> K :LspPreviousError<CR>

" //Python
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
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

"}}}
"+--------------+
"| "neovim-lsp" |
"+--------------+
"+---------------------+
"| "deoplete, snippet" |
"+---------------------+
"{{{
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

"}}}
"+---------------+
"| "easy-motion" |
"+---------------+
"{{{
" デフォルトのキーマッピングを無効に
let g:EasyMotion_do_mapping = 0
" f + 1文字 で画面内を検索してジャンプ
nmap f <plug>(easymotion-s)
" 検索時、大文字小文字を区別しない
let g:EasyMotion_smartcase = 1
"}}}
"+----------+
"| "Denite" |
"+----------+
"{{{
nnoremap <Space>f :Denite file<CR>
"}}}
"+------------+
"| "NERDTree" |
"+------------+
"{{{
nnoremap <space>n :NERDTree<CR>
let NERDTreeWinSize = 28
"}}}
"+------------+
"| "QuickRun" |
"+------------+
"{{{
nnoremap \r :write<CR>:QuickRun -mode n<CR>
nnoremap <F5> :write<CR>:QuickRun -mode n<CR>
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
"}}}
"+------------+
"| "Devicons" |
"+------------+
"{{{
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:Webdevicons_enable = 1
let g:Webdevicons_enable_nerdtree = 1
let g:Webdevicons_enable_nerdtree_brackets = 1
let g:WebdeviconsUnicodeGlyphDoubleWidth = 1
"}}}
"+-----------------------+
"| "winresizer:画面分割" |
"+-----------------------+
"{{{
let g:winresizer_start_key = '\\'
"}}}
"+---------------+
"| "vim-airline" |
"+---------------+
"{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" tablineの区切り文字を設定
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" 左側に使用されるセパレータ
let g:airline_left_sep = '' "
let g:airline_left_alt_sep = ''
" 右側に使用されるセパレータ
let g:airline_right_sep = '' "
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = ''		"暗号化されたファイル🔒
let g:airline_symbols.linenr = ''		"行 ¶
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '' 		"gitブランチ ⭠
let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
let g:airline_section_x =
            \airline#section#create(['filetype'])
let g:airline_section_a =
            \airline#section#create(['mode', 'crypt'])
" let g:airline_section_z =
"             \airline#section#create(['linenr', 'maxlinenr'])
let g:airline#extensions#default#layout = [
            \ [ 'a', 'c', 'b' ],
            \ [ 'x', 'y', 'z' ]
            \ ]
let g:airline_theme = 'simple'
let g:airline_mode_map = {
            \ 'n'  : 'Normal',
            \ 'i'  : 'Insert',
            \ 'R'  : 'Replace',
            \ 'c'  : 'Command',
            \ 'v'  : 'Visual',
            \ 'V'  : 'visual',
            \ '⌃V' : 'V(Block)',
            \ }
let g:airline#extensions#branch#enabled = 1
let g:airline_extensions = ['branch', 'tabline']
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
let g:airline#extensions#default#section_truncate_width = {
            \ 'b': 70,
            \ 'y': 88,
            \ 'z': 20,
            \ }
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1

" モード切り替え時の遅延を無くす？
set ttimeoutlen=50
"}}}


"+---+--------------+
"| # | "StatusLine" |
"+===+==============+
"{{{
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
"}}}
"+---+--------------+
"| # | "Colortheme" |
"+===+==============+
colorscheme despacio
"+---+-------------------+
"| # | "Default Setting" |
"+===+===================+
"{{{
filetype plugin on
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
"}}}
"+---+----------------+
"| # | "Mouse Enable" |
"+===+================+
"{{{
set mouse=a
set ttymouse=xterm2
"}}}
"+---+----------+
"| # | "Colors" |
"+===+==========+
"{{{
" カーソルライン
hi clear cursorline
" その他
hi Normal ctermfg=250 ctermbg=232
hi CursorLineNr term=standout ctermfg=109 ctermbg=15
" 対括弧強調表示
hi MatchParen ctermbg=21
" set termguicolors時に反映
hi Normal guifg=#b8b8a5 "#C6C6C6
hi CursorLineNr guifg=#262626 guibg=#c6c6c6
" 行の背景色
set cursorline
hi CursorLine guibg=#424242 "#330033
" 列の背景色
" set cursorcolumn
" hi CursorColumn guibg=#424242 "#220000

hi String gui=bold
hi Special gui=bold
hi Conditional gui=bold

" 行番号の振られていない、テキストのない場所の色
"hi NonText guibg=#111000
" 分割の区切りの色
hi VertSplit guifg=#0d160c guibg=#0d160c

hi Normal guibg=#0d160c
hi LineNr guibg=#262626
hi LineNr guifg=#b3ada5

"hi Number guifg=#cd5c5c
hi Error guifg=#262626 guibg=red
hi Todo guifg=#262626 guibg=#DDA0DD

" win風フォルダ
hi NerdTreeFlags guifg=#999900 "cccc00
" マック風フォルダ
hi NerdTreeFlags guifg=#59a8d0
hi Directory guifg=#708090
hi NerdTreeClosable guifg=magenta

" IntellJ風
" hi Normal guifg=#94b0c0 guibg=#2b2b2b
" hi Number guifg=#4f8cb9
" hi String guifg=#6a8758
" hi VertSplit guifg=#2b2b2b guibg=#2b2b2b
"}}}
"+---+----------+
"| # | "Indent" |
"+===+==========+
"{{{
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=8
"}}}
"+---+-------+
"| # | "etc" |
"+===+=======+
"{{{
set hidden                             "保存せずにファイルを切り替え可能に
set directory=/home/SWAP               "swapFileを一箇所に集める
set history=10000                      "履歴の保存件数を指定
set encoding=utf-8                     "文字コードを指定
set fileencodings=utf-8,sjis
set fileformats=unix,dos,mac
set termencoding=utf-8
set noswapfile                         "swapFileを作らない
set ambiwidth=double                   "全角記号の表示設定
set clipboard+=unnamed,autoselect      "クリップボードを有効化
set backspace=indent,eol,start         "BSを有効化

" 不可視文字機能をおっふ
set conceallevel=0
"}}}
"+---+--------------+
"| # | "Vim search" |
"+===+==============+
"{{{
set hlsearch
set ignorecase                         "検索時に大文字小文字を区別しない
set smartcase                          "検索時に大文字を使った時は区別する
set incsearch                          "検索時に一文字入力毎に検索を行う
"検索によるハイライトを解除
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
"検索時に一般的な正規表現を使用可能する
nmap / /\v
"}}}
"+---+----------------+
"| # | "ちょっと便利" |
"+===+================+
"{{{
set shortmess-=S                       " 検索時の総マッチ数と現在の位置を表示する
set showmatch matchtime=1              "対応するカッコを一瞬表示
set whichwrap=b,s,h,l,<,>,[,],~        "カーソルの左右移動で行を移動可能にする
set wildmenu                           "コマンドモードの補完
set scrolloff=5                        "スクロール時に上下５行の視界を確保
" 全角スペースを可視化
hi DoubleByteSpace term=underline ctermbg=245
match DoubleByteSpace /　/
" 不可視文字を表示、表示文字を設定
"set list
" 変更用 [ ↲  ]
set listchars=tab:»-,trail:-,eol:↵,extends:»,precedes:«,nbsp:%
" 不可視文字を非表示にする
"set nolist
" 行末の半角スペースを取り除く
autocmd BufWritePre * :%s/\s\+$//ge
" vimgrepの検索結果をquickfixに自動的に送る
autocmd QuickFixCmdPost *grep* cwindow
"}}}
"+---+--------------+
"| # | "KeyMapping" |
"+===+==============+
"{{{
"+---+---------------------------+
"| # | Cursor(Insert): mac emacs |
"+===+===========================+
inoremap<silent> <C-p> <Up>
inoremap<silent> <C-n> <Down>
inoremap<silent> <C-f> <Right>
inoremap<silent> <C-b> <Left>
inoremap<silent> <c-h> <bs>
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
"inoremap<silent> <C-k> <Up>
"inoremap<silent> <C-j> <Down>
"inoremap<silent> <C-l> <Right>
"inoremap<silent> <C-h> <Left>
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
"inoremap<silent> jj <ESC>
"inoremap<silent> っj <ESC>
"+---+---------------+
"| # | Change Buffer |
"+===+===============+
nnoremap H :bprev<CR>
nnoremap L :bnext<CR>
noremap <C-left> :bprev<CR>
noremap <C-right> :bnext<CR>
" Delete buffer
nnoremap <Space>d :bd!<CR>
" New buffer
nnoremap <Space>t :enew<CR>
"+---+----------------------+
"| # | Exモードの再割り当て |
"+===+======================+
nnoremap Q q:
"+---+----------------------------------+
"| # | カーソルがあるWindow以外を閉じる |
"+===+==================================+
nnoremap <Space>o :only<CR>
"+---+----------------------+
"| # | タブの新規作成、移動 |
"+===+======================+
" bufferがメインでの使用になるため未割り当て
"nnoremap <Space>  :tabnew<CR>
nnoremap <f1> gt
nnoremap <f2> gT
"+---|-------------------+
"| # | Visual more ++ -- |
"+===|===================+
vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv
"+---|---------------------------------+
"| # |  <C-c>に<Esc>の機能を割り当てる |
"+===|=================================+
noremap! <C-c> <Esc>
"+---|--------------------------------+
"| # | 検索時に検索語句を真ん中に表示 |
"+===|================================+
map n nzz
map N Nzz
"}}}
"+---+--------------------------------+
"| # | "window分割時に新規で作成する" |
"+===+================================+
"{{{
" 通常、無名で作成した場合、カレントファイルのクローンとして作成させる
nnoremap <C-w>v :vnew<CR>
nnoremap <C-w>s :new<CR>
"}}}
"+---+--------------------------------------+
"| # | "プロジェクト固有の設定を可能にする" |
"+===+======================================+
"{{{
" .vimrc.localをプロジェクトディレクトリに作成することで使用可能
augroup vimrc-local
    autocmd!
    autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
    let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
    for i in reverse(filter(files, 'filereadable(v:val)'))
        source `=i`
    endfor
endfunction
"}}}
"+---+-----------------------------------------+
"| # | "ノーマルモード移動時にIMEをオフにする" |
"+===+=========================================+
"{{{
" Mac用
if has('mac')
    let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
    augroup MyIMEGroup
        autocmd!
        autocmd InsertLeave * :call system(g:imeoff)
    augroup END
endif

" Linux用 fcitx
if has('linux')
    function! ImInActivate()
        call system('fcitx-remote -c')
    endfunction
    inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>
    inoremap <silent> <C-c> <ESC>:call ImInActivate()<CR>
    inoremap <silent> <ESC> <ESC>:call ImInActivate()<CR>
endif

" 共通 ノーマルモードでIMEが有効な場合でも、い <Enter>でインサートモードに入る
nnoremap い i
"}}}

