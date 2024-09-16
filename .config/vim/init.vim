lua vim.loader.enable()
let mapleader = " "

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'jreybert/vimagit'
Plug 'ap/vim-css-color'
Plug 'vimwiki/vimwiki'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" general
set nocompatible
filetype plugin indent on
syntax enable

" content
set autoread
set updatecount=0
set hidden
set diffopt=filler,vertical
set nowrap
set clipboard+=unnamedplus
set autoindent smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set splitbelow splitright

" command
set wildmode=longest,list,full

" navigation
set number relativenumber
set cursorline
set colorcolumn=80
set scrolloff=999
set ttyfast
set mouse=a

" theme
set termguicolors
set bg=dark
colorscheme quiet
highlight Keyword gui=bold
highlight Comment gui=italic
highlight Constant guifg=#999999
highlight NormalFloat guibg=#333333

" function
"" vimwiki
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
map <leader>v :VimwikiIndex<cr>
let g:vimwiki_list = [{'path': '~/.local/share/nvim/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

"" save as sudo on root permission file
cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"" remove trailing whitespace
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e " add trailing newline for ANSI C standard
"autocmd BufWritePre *neomutt* %s/^--$/-- /e " dash-dash-space signature delimiter in emails
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

"" toggle hide/show for statusbar
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<cr>

" shortcut
nnoremap te :tabedit<Space>
nnoremap <tab> :tabnext<cr>
nnoremap <s-tab> :tabprev<cr>
nnoremap ss :split<cr>
nnoremap sv :vsplit<cr>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap <leader>pv :Ex<cr>
nnoremap <leader><leader> :so<cr>
nnoremap <C-s> :w<cr>
nnoremap qq :q<cr>
command! -nargs=* T below split | resize 10 | terminal <args>
command! -nargs=* VT below vsplit | terminal <args>
nnoremap T :T<cr>i
tnoremap <C-Q> <C-\><C-N>
nnoremap nj <C-w>-
nnoremap nk <C-w>+
nnoremap nh <C-w>>
nnoremap nl <C-w><
