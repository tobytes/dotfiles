" Font
set guifont=Inconsolata-dz\ for\ Powerline:h14

" Disable bells
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

" optimize php highlighting
function OptimizePHP()
    set nocursorline
    set nocursorcolumn
    syntax sync minlines=256
endfunction

autocmd BufRead,BufNewFile *.php,*.phtml call OptimizePHP()

" Keine Kombatibilität mehr mit VI
set nocompatible
 
if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
endif
  

" Syntax highlighting and colors
syntax on
set background=dark
colorscheme Zenburn

" automaticaly read file when changed outside
set autoread

" Hide GUI Toolbar
set guioptions-=T

" Disable Filetypes
filetype off
filetype plugin indent on

" Zeilennummern anzeigen
set number

" Leerzeichen anstatt Tablulator
set expandtab

" 4 Leerzeichen pro Tab
set tabstop=4
set softtabstop=4

" 4 Leerzeichen für Einrückung
set shiftwidth=4

" Show current position
set ruler

" Show commands
set showcmd

" Incremental searching
set incsearch

" Highlight searching
set hlsearch

" Remap leader to comma
let mapleader = ","

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Easy split naviagation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Turn off arrow keys for learning
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Indikator für Zeilenlänge 
if exists('+colorcolumn')
  set colorcolumn=120
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
endif

" auto cd to buffer cwd
autocmd BufEnter * lcd %:p:h

" UTF-8 Enkodierung
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Einrückungen
set autoindent
set smartindent 

" Autosave (Speichert beim Wechseln des Buffers etc.)
set autowrite

" Autosave All when buffer or window loose focus
autocmd BufLeave,FocusLost silent! wall

" Farben aktivieren
set t_Co=256

" working directory is always directory of current buffer
set autochdir

" Correct NERDTree directory behaviour
let g:NERDTreeChDirMode=2
" Powerline colorscheme
" let g:Powerline_colorscheme = 'Monokai'
" Buffergator MRU sorting
let g:buffergator_sort_regime='mru'
" Buffergator horizontal split window
let g:buffergator_viewport_split_policy='T'
" Buffergator no autoresize window
let g:buffergator_autoexpand_on_split='0'
" Buffergator split window size
let g:buffergator_split_size='10'

" Author for snipmate
let g:snips_author='Tobias Reinwarth <tobias.reinwarth@unister.de>'
let g:snips_author_firm='Unister GmbH  <teamleitung-dev@unister.de>'

let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=26
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1

" Debugging
let g:dbgPavimPort = 9009
let g:dbgPavimBreakAtEntry = 0

" Getter/Setter
"let b:phpgetset_getterTemplate =
    "\ "\n" .
    "\ "/**\n" .
    "\ " * Gibt %varname% zurück \n" .
    "\ " * @return %varname%\n" .
    "\ " */\n" .
    "\ "public function %funcname%()\n" .
    "\ "{\n" . 
    "\ "return $this->%varname%;\n" .
    "\ "}"

" Shortcuts
noremap <C-T> :TagbarToggle<CR>
map <C-N> :NERDTreeToggle<CR>
map <C-B> :BuffergatorToggle<CR>
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 

"Map escape key to jj -- much faster  
imap jj <esc>
imap kj <esc>
imap jk <esc>

"Saves time; maps the spacebar to colon  
nmap <space> :

" Show statusline constantly
set laststatus=2
