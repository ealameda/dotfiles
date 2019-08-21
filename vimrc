if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rake'
"Plug 'tpope/vim-endwise'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'elzr/vim-json'
Plug 'tpope/vim-surround'              " Ability to surround objects
                                           " Example: ysiw]         -> yes surround inner word with []
                                           " Example: viwS(         -> visual inner word, surround with ( )
                                           " Example: cs'"          -> change surrounding ' to "
                                           " Example: ds"           -> delete surrounding "
                                           " Note: [ for space, ] for no space
Plug 'michaeljsmith/vim-indent-object' " Adding indent-level as a text object
                                           " Example: dii           -> delete
                                           " inner indent:
Plug 'junegunn/fzf'                    " Fuzzy finder
Plug 'junegunn/fzf.vim'                " Fuzzy finder vim wrapper
Plug 'junegunn/vim-easy-align'         " Easy Align
                                           " Example: gaip=         -> go align inner paragraph around the first =
                                           " Example: gaip-=        -> go align inner paragraph around the last =
                                           " Example: gaip*=        -> go align inner paragraph around all =
                                           " Example: gaip<Enter>*= -> go align inner paragraph, reversed, around all =
Plug 'scrooloose/nerdcommenter'
Plug 'Lokaltog/powerline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rizzatti/dash.vim'
Plug 'mhinz/vim-signify'               " Show git changes in sign column
Plug 'vim-airline/vim-airline'         " vim-airline
Plug 'vim-airline/vim-airline-themes'  " vim-airline
Plug 'honza/vim-snippets'



" Language Server Protocol
    if executable("yarn") && executable("node")
        function! InstallDeps(info)
            if a:info.status == 'installed' || a:info.force
                let extensions = ['coc-gocode', 'coc-json', 'coc-python', 'coc-pyls']
                call coc#util#install()
                call coc#util#install_extension(extensions)
            endif
        endfunction

        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    endif

" Colors
Plug 'joshdick/onedark.vim'            " Colorscheme
Plug 'vim-scripts/Colour-Sampler-Pack'
Plug 'altercation/vim-colors-solarized'
Plug 'twerth/ir_black'
Plug 'tpope/vim-vividchalk'
Plug 'vim-scripts/molokai'
Plug 'vim-scripts/pyte'
Plug 'telamon/vim-color-github'
Plug 'larssmit/vim-getafe'
Plug 'TechnoGate/janus-colors'
Plug 'nanotech/jellybeans.vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'thoughtbot/vim-rspec'
Plug 'mxw/vim-jsx'


" Languages
Plug 'editorconfig/editorconfig-vim' " For filetype management.
Plug 'mrk21/yaml-vim' " For hieradata
Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-git'
Plug 'juvenn/mustache.vim'
Plug 'timcharper/textile.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chrisbra/csv.vim'
Plug 'mmalecki/vim-node.js'
Plug 'vim-ruby/vim-ruby'
Plug 'groenewege/vim-less'
Plug 'slim-template/vim-slim'
Plug 'jimenezrick/vimerl'
Plug 'sunaku/vim-ruby-minitest'
Plug 'guns/vim-clojure-static'
Plug 'elixir-lang/vim-elixir'
Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'fatih/vim-go'
Plug 'tpope/vim-liquid'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'lambdatoast/elm.vim'
call plug#end()



let mapleader = "\<Space>"
set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set encoding=utf-8
set tabstop=2
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set incsearch
set ignorecase
set smartcase
set splitbelow
set splitright
filetype plugin indent on
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
silent! colorscheme onedark
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
set number
set signcolumn=yes
set termguicolors
syntax on
highlight Comment guifg=#6C7380
highlight NonText guifg=#414855
highlight MatchParen ctermbg=180 ctermfg=59 guibg=#E5C07B guifg=#5C6370
set wrap

" Automatic Formating
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e

" Sensible Relative Numbers
autocm InsertEnter * :set number
autocm InsertLeave * :set relativenumber

au BufNewFile * set noeol
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" No show command
autocmd VimEnter * set nosc

" NERDCommenter
map  <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i
map <leader>/ <plug>NERDCommenterToggle<CR>

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p0/bin/ruby'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" CtrlP
nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5

" Vtr Runner
nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

" Vim-Rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

" Fugitive
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" Format JSON
map <leader>jp :%!python -m json.tool<CR>

" Yank from current cursor position to end of line
map Y y$
" Yank content in OS's clipboard. `o` stands for "OS's Clipoard".
vnoremap <leader>yo "*y
" Paste content from OS's clipboard
nnoremap <leader>po "*p

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

"" Backup and swap files
set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

"  Movement shortcuts
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" Map Command-# to switch tabs
map  <D-0> 0gt
imap <D-0> <Esc>0gt
map  <D-1> 1gt
imap <D-1> <Esc>1gt
map  <D-2> 2gt
imap <D-2> <Esc>2gt
map  <D-3> 3gt
imap <D-3> <Esc>3gt
map  <D-4> 4gt
imap <D-4> <Esc>4gt
map  <D-5> 5gt
imap <D-5> <Esc>5gt
map  <D-6> 6gt
imap <D-6> <Esc>6gt
map  <D-7> 7gt
imap <D-7> <Esc>7gt
map  <D-8> 8gt
imap <D-8> <Esc>8gt
map  <D-9> 9gt
imap <D-9> <Esc>9gt

" :nnoremap <CR> :nohlsearch<CR><CR>
command! W :w

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

:set dictionary="/usr/dict/words"
:iabbrev </ </<C-X><C-O>

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

let g:coc_snippet_next = '<tab>'
