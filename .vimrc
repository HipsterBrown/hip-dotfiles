runtime macros/matchit.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" let g:ale_completion_enabled = 1
" let g:ale_completion_delay = 100

" coc.nvim config
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=number

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
" Plugin 'leafgarland/typescript-vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-commentary'
" Plugin 'w0rp/ale'
Plugin 'jebaum/vim-tmuxify'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'janko/vim-test'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-eunuch'
Plugin 'elzr/vim-json'
Plugin 'kristijanhusak/vim-carbon-now-sh'
Plugin 'plasticboy/vim-markdown'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'chrisbra/csv.vim'

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
  \ 'branch': 'release/1.x',
  \ 'for': ['javascript', 'json', 'typescript', 'html'] }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'alok/notational-fzf-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

if (has("termguicolors"))
  set termguicolors
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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

let g:prettier#exec_cmd_path = "~/.volta/bin/prettier"
let g:prettier#exec_cmd_async = 1

" ale syntax linting
" let g:ale_ignore_2_7_warnings = 1
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '!'
" let g:ale_sign_warning = '•'
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 1
" let g:ale_ruby_rubocop_executable = 'bundle'
" let g:ale_ruby_rubocop_options = '--auto-correct'
" let g:ale_linters = {
" \   'ruby': ['ruby', 'rubocop', 'brakeman', 'rails_best_practices'],
" \   'typescript': ['tsserver', 'eslint'],
" \   'typescriptreact': ['tsserver', 'eslint'],
" \   'javascript': ['tsserver', 'eslint'],
" \   'rust': ['cargo', 'rls'],
" \   'dart': ['dartanalyzer', 'language_server'],
" \}
" " let g:ale_linters_ignore = {'typescript': ['tslint']}
" let g:ale_typescript_tsserver_use_global = 1
" let g:ale_javascript_tsserver_use_global = 1
" let g:ale_typescript_tslint_use_global = 1
" let g:ale_rust_rls_executable = 'rust-analyzer'
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'rust': ['rustfmt'],
" \   'dart': ['dartfmt']
" \}
" let g:ale_fix_on_save = 1
" " adjust colors
" " highlight link ALEError Error
" highlight link ALEStyleError Error
" highlight ALEErrorSign guifg=#1E0010
" highlight link ALEWarning WarningMsg
" highlight link ALEStyleWarning WarningMsg
" highlight ALEWarningSign guifg=#FFFFFF


" associate *.es6 with javascript filetype
au BufRead,BufNewFile *.es6 setfiletype javascript
" *.tsx files should be recognized as typescript
au BufRead,BufNewFile *.jsx set filetype=javascriptreact
au BufRead,BufNewFile *.tsx set filetype=typescriptreact
au BufRead,BufNewFile *.art setfiletype html
au BufRead,BufNewFile *.svg setfiletype html
augroup filetype javascript syntax=javascript

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufWritePre *.js,*.jsx,*.json,*.ts,*.tsx PrettierAsync

autocmd VimResized * :wincmd =

nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

let test#strategy = 'dispatch'

" notational search paths
let g:nv_search_paths = ['~/notes', '~/Documents']
let g:nv_create_note_window = 'tabedit'

" test.vim mappings
map <Leader>t :TestFile<CR>
map <Leader>ts :TestNearest<CR>
map <Leader>tl :TestLast<CR>
map <Leader>ta :TestSuite<CR>

nmap <silent> <leader>d <Plug>DashSearch
" nmap <leader>ad <Plug>(ale_detail)
" nmap <leader>af <Plug>(ale_fix)
" nmap <leader>al <Plug>(ale_lint)
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
" nmap <leader>ag <Plug>(ale_go_to_definition_in_split)
" nmap <leader>at <Plug>(ale_go_to_definition_in_tab)
" nmap <leader>ah <Plug>(ale_go_to_definition)
" nmap <leader>ar <Plug>(ale_find_references)
" nmap <silent> <C-i> <Plug>(ale_hover)
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" coc mappings
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" GoTo code navigation.
nmap <leader>ad <Plug>(coc-definition)
nmap <leader>at :call CocActionAsync('jumpDefinition', 'tab drop')<CR>
nmap <leader>as :call CocActionAsync('jumpDefinition', 'split')<CR>
xmap <leader>av :call CocActionAsync('jumpDefinition', 'vsplit')<CR>
nmap <leader>av :call CocActionAsync('jumpDefinition', 'vsplit')<CR>
nmap <leader>ay <Plug>(coc-type-definition)
nmap <leader>ai <Plug>(coc-implementation)
nmap <leader>ar <Plug>(coc-references)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>af  <Plug>(coc-fix-current)
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocActionAsync('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Symbol renaming.
nmap <leader>an <Plug>(coc-rename)
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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

function! s:NameDailyNote()
  let tstamp = strftime('%Y-%m-%d')
  exe "Rename " . tstamp . "-daily-notes.md"
endfunction
command! NameDailyNote call s:NameDailyNote()

" notional shortcut
nmap <Leader>nv :NV<CR>
nmap <Leader>rn :NameDailyNote<CR>
