" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'           " Defaults

" Optics
Plug 'airblade/vim-gitgutter'               " Show git change hunks to the left
Plug 'arcticicestudio/nord-vim'             " Matching theme
Plug 'kyazdani42/nvim-web-devicons'         " Icons for file picker
Plug 'vim-airline/vim-airline'              " Statusbar
Plug 'vim-airline/vim-airline-themes'       " Themes

" Behaviour
Plug 'airblade/vim-rooter'                  " Change cwd to .git root of project
Plug 'editorconfig/editorconfig-vim'        " Respect .editorconfig
Plug 'folke/trouble.nvim'                   " Nicer diagnostics
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'neovim/nvim-lspconfig'                " language servers
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-commentary'                 " comment in and out stuff

" Integrations
Plug 'nvim-lua/plenary.nvim'                " Lua functions
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " instead of FZF
Plug 'junegunn/gv.vim'                      " Like tig
Plug 'tpope/vim-fugitive'                   " Git shit

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
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"          " Next 3 lines required for
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"          " Solarized theme in
set termguicolors                               " Tmux sessions
colorscheme nord
set cursorline                                  " Highlight current line
set number relativenumber                       " Line numbers
set colorcolumn=80                              " Should wrap here
set scrolloff=7
set list                                        " Show whitespace. Weird name
" }}}

" Editing {{{
set showmatch                                   " Match pairs of brackets
set inccommand=split                            " preview replacing
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
" find references to object under cursor
nmap + :Trouble lsp_references<CR>
" Next buffer
nmap <Leader>j :bnext<CR>:redraw<CR>
" Previous Buffer
nmap <Leader>k :bprev<CR>:redraw<CR>
" Close Buffer
nmap <Leader>d :bd<CR>
" Show buffers
nnoremap <silent><leader>b <cmd>Telescope buffers<cr>
" Open file
nnoremap <silent><leader>f <cmd>Telescope find_files<cr>
" Grep
nnoremap <silent><leader>g <cmd>Telescope live_grep<cr>
" Open quickfix window
map <silent><leader>c :copen<cr>
" Open location window
map <silent><leader>l :lopen<cr>
" Open trouble window
map <silent><leader>t :TroubleToggle<cr>
" Fold unchanged parts
map <silent><leader>G :GitGutterFold<CR>
" Git stage
map <silent><leader>s :GitGutterStageHunk<CR>
" }}}

" Plugins config {{{

" airline {{{
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
" }}}

" rooter {{{
let g:rooter_patterns = ['.editorconfig', '.git', '.git/']
let g:rooter_cd_cmd="lcd"
" }}}

" }}}

" {{{ lua starts here

" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "python",
    "yaml",
    "bash",
    "ruby",
    "latex",
  },
  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- List of parsers to ignore installing
  ignore_install = { "haskell" },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- list of language that will be disabled
    disable = { "" },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    -- dont enable this, messes up python indentation
    enable = false,
    disable = {},
  },
}
EOF

" LSP
lua << EOF
require('lspconfig')['pyright'].setup{}
require('lspconfig')['yamlls'].setup{}
require('lspconfig')['solargraph'].setup{}

local opts = { noremap=true, silent=true }
EOF

" }}}
