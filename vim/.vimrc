source $VIMRUNTIME/defaults.vim
"Plug section
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-current-search-match'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do':'./install --all'}
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/sonokai'
Plug 'raimondi/delimitmate'
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'ap/vim-css-color'
call plug#end()

filetype plugin on
set t_Co=256
set re=1
set termguicolors
set number
set cursorline
set rtp+=~/.fzf

if has('termguicolors')
	set termguicolors
endif

let g:sonokai_style = 'espresso'
let g:sonokai_better_performance = 1
let g:airline_theme = 'sonokai'
colorscheme sonokai
"autocmd ColorScheme * hi Normal guibg=NONE ctermbg=NONE


set wildmenu
set wildmode=longest,list,full

set splitbelow splitright

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_winsize = 20

let mapleader=" "

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
tnoremap <Esc> <C-w>:q!<CR>
nnoremap <silent> <leader>e :Lexplore!<CR>
nnoremap <silent> <leader>s :FZF<CR>
nnoremap <silent> <leader>b :Git blame<CR>
nnoremap <silent> <leader>j :ALENext<CR>
nnoremap <silent> <leader>k :ALEPrevious<CR>
nnoremap <silent> <c-c> :set hlsearch!<CR>
nnoremap S :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>

nnoremap <leader>u :UndotreeToggle<CR>
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-@> coc#refresh()
xnoremap <silent> <leader>p \"dP
vnoremap J :m '<+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
