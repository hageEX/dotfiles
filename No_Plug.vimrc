" Color scheme from
" Development build (https://github.com/AlessandroYorba/De
" spacio/tree/nightly)
" Thank you. I like this.
"
" :98 ~ .vimrc

"DESPACIO:
set background=dark

highlight clear
	if exists("syntax_on")
	syntax reset
endif

"COMMON COLORS AND SETTINGS
highlight PreProc guifg=#d7875f guibg=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
highlight Function guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight Identifier guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight Statement guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
highlight Constant guifg=#d78700 guibg=NONE gui=NONE ctermfg=172 ctermbg=NONE cterm=NONE
highlight Type guifg=#d78700 guibg=NONE gui=NONE ctermfg=172 ctermbg=NONE cterm=NONE
highlight String guifg=#5f8787 guibg=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=NONE
highlight Special guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
highlight Conditional guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
highlight Operator guifg=#949494 guibg=NONE gui=NONE ctermfg=246 ctermbg=NONE cterm=NONE
highlight Title guifg=#d7875f guibg=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
highlight StorageClass guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight htmlItalic guifg=#ff875f guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight htmlEndTag guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight cssTagName guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
highlight cssClassName guifg=#ff875f guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight cssIdentifier guifg=#ff875f guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE

"DIFF
highlight DiffAdd guifg=#87afaf guibg=NONE gui=reverse ctermfg=109 ctermbg=NONE cterm=reverse
highlight DiffText guifg=#87afaf guibg=NONE gui=reverse ctermfg=109 ctermbg=NONE cterm=reverse
highlight DiffChange guifg=#5f8787 guibg=NONE gui=reverse ctermfg=66 ctermbg=NONE cterm=reverse
highlight DiffDelete guifg=#af5f5f guibg=NONE gui=reverse ctermfg=131 ctermbg=NONE cterm=reverse

"SPELLING
highlight SpellBad guifg=#d75f5f guibg=NONE gui=undercurl ctermfg=167 ctermbg=NONE cterm=undercurl
highlight SpellLocal guifg=#5f875f guibg=NONE gui=undercurl ctermfg=65 ctermbg=NONE cterm=undercurl
highlight SpellCap guifg=#87afff guibg=NONE gui=undercurl ctermfg=111 ctermbg=NONE cterm=undercurl
highlight SpellRare guifg=#ff8700 guibg=NONE gui=undercurl ctermfg=208 ctermbg=NONE cterm=undercurl

"WINDOW UI
highlight MoreMsg guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
highlight SpecialComment guifg=#767676 guibg=NONE gui=reverse ctermfg=243 ctermbg=NONE cterm=reverse
highlight VimCommentTitle guifg=#767676 guibg=NONE gui=reverse ctermfg=243 ctermbg=NONE cterm=reverse
highlight Underlined guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
highlight FoldColumn guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
highlight Todo guifg=#d78700 guibg=NONE gui=reverse ctermfg=172 ctermbg=NONE cterm=reverse
highlight Visual guifg=#dfaf00 guibg=NONE gui=reverse ctermfg=178 ctermbg=NONE cterm=reverse
highlight Question guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
highlight Search guifg=#dfaf00 guibg=NONE gui=reverse ctermfg=178 ctermbg=NONE cterm=reverse
highlight MatchParen guifg=#87afaf guibg=NONE gui=reverse ctermfg=109 ctermbg=NONE cterm=reverse
highlight Error guifg=#d75f5f guibg=#121212 gui=reverse ctermfg=167 ctermbg=233 cterm=reverse
highlight ErrorMsg guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
highlight WarningMsg guifg=#ff875f guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight netrwExe guifg=#5f8787 guibg=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=NONE
highlight netrwlist guifg=#875f5f guibg=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
highlight Directory guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
highlight Cursor guifg=#000000 guibg=#ffffff gui=NONE ctermfg=16 ctermbg=231 cterm=NONE
highlight CursorLineNr guifg=#c6c6c6 guibg=NONE gui=reverse ctermfg=251 ctermbg=NONE cterm=reverse
highlight WildMenu guifg=#c6c6c6 guibg=NONE gui=reverse ctermfg=251 ctermbg=NONE cterm=reverse
highlight ModeMsg guifg=#dfdfdf guibg=NONE gui=NONE ctermfg=188 ctermbg=NONE cterm=NONE
highlight SignColumn guifg=#87af87 guibg=NONE gui=NONE ctermfg=108 ctermbg=NONE cterm=NONE

"DEFAULT
if 1
	"COLORS
	highlight Normal guifg=#ffffdf guibg=#303030 gui=NONE ctermfg=230 ctermbg=236 cterm=NONE
	highlight Comment guifg=#626262 guibg=NONE gui=NONE ctermfg=241 ctermbg=NONE cterm=NONE

	"WINDOW UI
	highlight StatusLine guifg=#eeeeee guibg=#262626 gui=NONE ctermfg=255 ctermbg=235 cterm=NONE
	highlight StatusLineNC guifg=#767676 guibg=#262626 gui=NONE ctermfg=243 ctermbg=235 cterm=NONE
	highlight StatusLineTerm guifg=#eeeeee guibg=#262626 gui=NONE ctermfg=255 ctermbg=235 cterm=NONE
	highlight StatusLineTermNC guifg=#767676 guibg=#262626 gui=NONE ctermfg=243 ctermbg=235 cterm=NONE
	highlight Pmenu guifg=#767676 guibg=#3a3a3a gui=NONE ctermfg=243 ctermbg=237 cterm=NONE
	highlight PmenuSel guifg=#eeeeee guibg=#3a3a3a gui=NONE ctermfg=255 ctermbg=237 cterm=NONE
	highlight PmenuSbar guifg=#3a3a3a guibg=#3a3a3a gui=NONE ctermfg=237 ctermbg=237 cterm=NONE
	highlight PmenuThumb guifg=#3a3a3a guibg=#3a3a3a gui=NONE ctermfg=237 ctermbg=237 cterm=NONE
	highlight TabLine guifg=#767676 guibg=#262626 gui=NONE ctermfg=243 ctermbg=235 cterm=NONE
	highlight TabLineSel guifg=#eeeeee guibg=#262626 gui=NONE ctermfg=255 ctermbg=235 cterm=NONE
	highlight TabLineFill guifg=NONE guibg=#262626 gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
	highlight CursorLine guifg=NONE guibg=#3a3a3a gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
	highlight CursorColumn guifg=NONE guibg=#3a3a3a gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
	highlight ColorColumn guifg=NONE guibg=#3a3a3a gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
	highlight Folded guifg=#767676 guibg=NONE gui=NONE ctermfg=243 ctermbg=NONE cterm=NONE
	highlight VertSplit guifg=#444444 guibg=#303030 gui=NONE ctermfg=238 ctermbg=236 cterm=NONE
	highlight LineNr guifg=#4e4e4e guibg=#262626 gui=NONE ctermfg=239 ctermbg=235 cterm=NONE
	highlight NonText guifg=#444444 guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
	highlight SpecialKey guifg=#444444 guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
endif

"+---+-------------+
"| # | Status line |
"+===+=============+
" hi statusline guibg=#
hi statusline guifg=#00bb00

function! SetStatusLine()
  if mode() =~ 'i'
    let c = 1
    let mode_name = 'INSERT'
  elseif mode() =~ 'n'
    let c = 2
    let mode_name = 'NORMAL'
  elseif mode() =~ 'R'
    let c = 3
    let mode_name = 'REPLACE'
  else
    let c = 4
    let mode_name = 'VISUAL'
  endif
  return '%' . c . '* ' . mode_name . ' %* %<%F %m%h%=%w%r %18(〈 %{toupper(&ft)} 〈 %{toupper(&enc)}  ⏣  [%l/%L]%)'
endfunction

" return '%' . c . '* ' . mode_name . ' %* %<%F%m%h%=%w%r %18([%{toupper(&ft)}][%l/%L]%)'

hi User1 gui=bold guibg=darkgreen guifg=gray " Insert Mode
hi User2 gui=bold guibg=blue guifg=gray      " Normal Mode
hi User3 gui=bold guibg=coral guifg=gray     " Replace Mode
hi User4 gui=bold guibg=orange guifg=black   " Visual Mode

set statusline=%!SetStatusLine()

" set statusline=\ \%<%F\ %m%r\%h%w
" set statusline+=%{'〉\ \ \ \'.(&fenc!=''?&fenc:&enc).'\ \ 〉\ \'.&fileformat.'\ \ \〉'}
" set statusline+=%=%l/%L,%c%V%8P
" 〈

"+---+-----------+
"| # | Set Basic |
"+===+===========+
set laststatus=2
set showcmd
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
" hi Number guifg=#cd5c5c
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
"+---+------------------------------------------+
"| # | カーソルがあるウインドウ以外を全て閉じる |
"+===+==========================================+
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

