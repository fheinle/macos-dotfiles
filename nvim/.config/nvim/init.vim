" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'           " Defaults

" Optics
Plug 'airblade/vim-gitgutter'               " Show git change hunks to the left
Plug 'lifepillar/vim-solarized8'            " Fancy colors
Plug 'vim-airline/vim-airline'              " Statusbar
Plug 'vim-airline/vim-airline-themes'       " Themes

" Behaviour
Plug 'airblade/vim-rooter'                  " Change cwd to .git root of project
Plug 'editorconfig/editorconfig-vim'        " Respect .editorconfig
Plug 'mfussenegger/nvim-lint'               " async linter
Plug 'tpope/vim-commentary'                 " comment in and out stuff

" Integrations
Plug 'junegunn/fzf' ", { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                     " Fuzzy filename entry
Plug 'junegunn/gv.vim'                      " Like tig
Plug 'tpope/vim-fugitive'

call plug#end()
" }}}

" Backup {{{
set backup
set backupdir=~/.local/share/nvim/backup                     " Don't save backup files in cwd
set directory=~/.local/share/nvim/backup
set undofile
set undodir=~/.local/share/nvim/undo                         " Persistent undo history
set history=204
set undolevels=2048
" }}}

" Look {{{
set background=dark
let g:solarized_termtrans=0
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"          " Next 3 lines required for
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"          " Solarized theme in
set termguicolors                               " Tmux sessions
autocmd vimenter * ++nested colorscheme solarized8_flat
set cursorline                                  " Highlight current line
set number relativenumber                       " Line numbers
set colorcolumn=80                              " Should wrap here
set scrolloff=7
set list                                        " Show whitespace. Weird name
" }}}

" Editing {{{
set showmatch                                   " Match pairs of brackets
set matchpairs+=<:>                             " Also on the pointy ones
set smartindent                                 " Guess when indenting is a good idea
set expandtab                                   " Spaces instead of tabs
set softtabstop=4 tabstop=4 shiftwidth=4        " Tab is 4
set shiftround                                  " Round indents to multipes of 4
set spelllang=en                                " Spellcheck in English, if on
set formatoptions=qrn1                          " Comment formatting
" Let < and > keep selection
vnoremap < <gv
" In visual mode
vnoremap > >gv
" }}}

" Folding {{{
set foldmethod=indent                           " Fold by indentation
set foldnestmax=10
set foldlevel=999                               " Folding of by default
" Toggle folding with space
nnoremap <Space> za
vnoremap <Space> za
" }}}

" Keyboard {{{
let mapleader = ","
map , <Leader>
" jj is Escape, for the iPad
imap jj <Esc>
" Write
nnoremap <Leader>w :w<CR>
" Write and Quit
nnoremap <Leader>x :x<CR>
" Operate on visual lines
nnoremap j gj
" Instead of actual lines
nnoremap k gk
noremap j gj
noremap k gk
" Next buffer
nmap <Leader>j :bnext<CR>:redraw<CR>
" Previous Buffer
nmap <Leader>k :bprev<CR>:redraw<CR>
" Close Buffer
nmap <Leader>d :bd<CR>
" Show buffers
nmap <silent><leader>b :Buffers<CR>
" Open file
nmap <silent><leader>f :Files<cr>
" Open quickfix window
map <silent><leader>c :copen<cr>
" Open location window
map <silent><leader>l :lopen<cr>
" Fold unchanged parts
map <silent><leader>G :GitGutterFold<CR>
" Git stage
map <silent><leader>s :GitGutterStageHunk<CR>
" }}}

" Plugins config {{{

" airline {{{
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
" }}}

" rooter {{{
let g:rooter_patterns = ['.editorconfig', '.git', '.git/']
let g:rooter_cd_cmd="lcd"
" }}}

" }}}
