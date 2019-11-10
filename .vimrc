set nocompatible              " be iMproved, required
filetype off                  " required

let g:ale_completion_enabled = 1
let g:ale_completion_delay = 150

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'rking/ag.vim'
Plugin 'othree/html5.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'trusktr/seti.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'rust-lang/rust.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'leafgarland/typescript-vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
Plugin 'w0rp/ale'
Plugin 'jebaum/vim-tmuxify'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'janko/vim-test'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-unimpaired'
Plugin 'elzr/vim-json'
Plugin 'kristijanhusak/vim-carbon-now-sh'
Plugin 'colepeters/spacemacs-theme.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'json', 'typescript'] }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'


" Initialize plugin system
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

if has('gui_running')
  set guifont=Fira\ Code
endif

syntax on
set noswapfile
set background=dark
colorscheme spacemacs-theme
set expandtab
set shiftwidth=2
set softtabstop=2
set nu
set exrc
set clipboard=unnamed
set noerrorbells
set ignorecase
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,menuone,preview,noselect,noinsert
set wildmode=longest,list:longest
set backspace=indent,eol,start
hi Visual term=bold cterm=bold ctermbg=205 ctermfg=white
hi MatchParen cterm=none ctermbg=205 ctermfg=white

set statusline+=%{FugitiveStatusline()}
set statusline+=%#warningmsg#
set statusline+=%*

" use ripgrep for ctrlp search
if executable('rg')
  set grepprg=rg\ --color=never\ --vimgrep
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Tags
set tags=.git/tags

set rtp+=/usr/local/opt/fzf

let mapleader='\'

let test#typescript#jest#executable = "SKIP_PREFLIGHT_CHECK=true $(yarn bin)/rescripts test"

" ale syntax linting
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '•'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_linters = {
\   'ruby': ['ruby', 'rubocop', 'brakeman', 'rails_best_practices'],
\   'typescript': ['tsserver', 'tslint'],
\   'javascript': ['eslint', 'tsserver'],
\   'rust': ['cargo', 'rls'],
\}
" let g:ale_linters_ignore = {'typescript': ['tslint']}
let g:ale_typescript_tsserver_use_global = 1
let g:ale_javascript_tsserver_use_global = 1
let g:ale_typescript_tslint_use_global = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt']
\}
let g:ale_fix_on_save = 1
" adjust colors
" highlight link ALEError Error
highlight link ALEStyleError Error
highlight ALEErrorSign guifg=#1E0010
highlight link ALEWarning WarningMsg
highlight link ALEStyleWarning WarningMsg
highlight ALEWarningSign guifg=#FFFFFF

" associate *.es6 with javascript filetype
au BufRead,BufNewFile *.es6 setfiletype javascript
" *.tsx files should be recognized as typescript
au BufRead,BufNewFile *.tsx setfiletype typescript
au BufRead,BufNewFile *.art setfiletype html

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufWritePre *.js,*.jsx,*.json,*.ts,*.tsx Prettier

let test#strategy = 'dispatch'

" test.vim mappings
map <Leader>t :TestFile<CR>
map <Leader>ts :TestNearest<CR>
map <Leader>tl :TestLast<CR>
map <Leader>ta :TestSuite<CR>

nmap <silent> <leader>d <Plug>DashSearch
nmap <leader>ad <Plug>(ale_detail)
nmap <leader>af <Plug>(ale_fix)
nmap <leader>al <Plug>(ale_lint)
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
" overcome the touchbar
inoremap jj <ESC>

nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>wd :pwd<CR>
nnoremap <leader>o :Files<CR>
" nnoremap ]q :cnext<CR>
" nnoremap [q :cprevious<CR>

" ale mappings
nmap <leader>ag <Plug>(ale_go_to_definition_in_split)
nmap <leader>ah <Plug>(ale_go_to_definition)
nmap <leader>ar <Plug>(ale_find_references)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" fugitive.vim mappings
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gh :Gbrowse<CR>

function! MoveTab()
  let n = nr2char(getchar())
  execute n . "tabmove"
endfunction

" handy tab shortcuts
nmap <silent> <C-t>o :tabonly<CR>
nmap <silent> <C-t><C-o> :tabonly<CR>
nmap <silent> <C-t>l :tablast<CR>
nmap <silent> <C-t><C-l> :tablast<CR>
nmap <silent> <C-t>a :tabs<CR>
nmap <silent> <C-t><C-a> :tabs<CR>
nnoremap <silent> <C-t>m :call MoveTab()<CR>
nnoremap <silent> <C-t><C-m> :call MoveTab()<CR>

" fzf shortcuts
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>] :BTags<CR>
nmap <Leader>} :Tags<CR>
nmap <Leader>s :Rg<CR>
