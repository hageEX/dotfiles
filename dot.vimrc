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
"検索やらなんやら
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
"テスト実行
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
"コードチェック
"Plug 'w0rp/ale'

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
"vimproc -> job
set splitright
let g:quickrun_no_default_key_mappings = 1
"+----------+
"| Devicons |
"+==========+
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
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
      \             [ 'readonly', 'filename', 'gitbranch' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'separator': {'left': '', 'right': ''},
      \ 'subseparator': {'left': '' , 'right': ''}
      \ }

"'modified' 
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
set title                              
syntax on                               
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
set encoding=UTF-8                     "文字コードを指定
set fileencoding=UTF-8
set termencoding=UTF-8
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
"+---+-----------------------------+
"| # | Cursor(Insert): mac emacs　 |
"+===+=============================+
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
noremap<silent> <C-d> <Del>
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
"+---+----------------+
"| # | タブを表示する |
"+===+================+
function! MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " ラベルは MyTabLabel() で作成する
        let my_tab_label = '%{MyTabLabel(' . (i + 1) . ')}'
        " 強調表示グループの選択
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " タブ番号 : [ファイル名] のフォーマットになるように設定
        let s .= (i + 1) . ':[' . my_tab_label .'] '
    endfor

    " 最後のタブページの後は TabLineFill で埋め、タブページ番号をリセットする
    let s .= '%#TabLineFill#%T'

    return s
endfunction                                                                     
function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return fnamemodify(bufname(buflist[winnr - 1]), ":t")
endfunction
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
"+---|-------------------+
"| # | Visual more ++ -- |
"+===|===================+
vnoremap <c-a> <c-a>gv
vnoremap <c-x> <c-x>gv
