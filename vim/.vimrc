source $VIMRUNTIME/defaults.vim
"Plug section
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do':'./install --all'}
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/sonokai'
Plug 'LunarWatcher/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'
Plug 'dense-analysis/ale'
Plug 'lifepillar/vim-mucomplete'
Plug 'mbbill/undotree'
Plug 'ap/vim-css-color'
Plug 'markonm/traces.vim'
Plug 'mattn/emmet-vim'
call plug#end()

filetype plugin on
set t_Co=256
set re=1
set rnu
set termguicolors
set number
set cursorline
set rtp+=~/.fzf
"mucomplete init
set completeopt+=menuone,noselect
set shortmess+=c
set belloff+=ctrlg

let g:AutoPairsMapBS = 1 


let mapleader=" "

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

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php'
let g:closetag_filetypes = 'html,php'



"ALE settings
let g:ale_lint_delay = 500
nnoremap <leader>ad :ALEDisable<CR>
nnoremap <leader>ae :ALEEnable<CR>
nnoremap <silent> <leader>j :ALENext<CR>
nnoremap <silent> <leader>k :ALEPrevious<CR>

"Mucomplete settings
"let g:mucomplete#enable_auto_at_startup = 1
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
tnoremap <Esc> <C-w>:q!<CR>
nnoremap <silent> <leader>e :Lexplore!<CR>
nnoremap <silent> <leader>t :term<CR>
nnoremap <silent> <leader>~ :so ~/.vimrc<CR>
nnoremap <silent> <leader>r :exec "set rnu!"<CR>
nnoremap <silent> <leader>s :GFiles<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Git blame<CR>
nnoremap <silent> <leader>c :set hlsearch!<CR>
nnoremap <silent> <leader>ws :w \| call SaveStage()<CR>
nnoremap <silent> <leader>wl :w \| call SaveLocal()<CR>
nnoremap <silent> <C-g> :Ag<CR>
command! W write
command! Q quit

nnoremap S :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>

nnoremap <leader>u :UndotreeToggle<CR>
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

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>,
\                 fzf#vim#with_preview('right:60%'),
\                 <bang>0)

def SaveStage()
    var remote = "lshevick@192.168.109.21"
    var local_file = expand('%:p')
    var local_dir = expand('%:p:h')
    var remote_file = ''

    if getcwd() =~ 'Admin'
        remote_file = substitute(local_file, getcwd(), '/var/www/stage/IncentRev-Admin', '')
    elseif getcwd() =~ 'Web' 
        remote_file = substitute(local_file, getcwd(), '/var/www/stage/IncentRev-Web', '')
    else
        echo 'Not in correct dir'
    endif

    var scp_command = 'scp ' .. shellescape(local_file) .. ' ' .. remote .. ':' .. remote_file
    call system(scp_command)
enddef

def SaveLocal()
    var remote = "lshevick@192.168.1.14"
    var local_file = expand('%:p')
    var local_dir = expand('%:p:h')
    var remote_file = ''

    if getcwd() =~ 'Admin'
        remote_file = substitute(local_file, getcwd(), '/var/www/IncentRev-Admin-01', '')
    elseif getcwd() =~ 'Web' 
        remote_file = substitute(local_file, getcwd(), '/var/www/IncentRev-Web-01', '')
    else
        echo 'Not in correct dir'
    endif

    var scp_command = 'scp ' .. shellescape(local_file) .. ' ' .. remote .. ':' .. remote_file
    call system(scp_command)
enddef

