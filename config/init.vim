" LibreGOB nvim-config
" Basado en fisadev-nvim-config  http://nvim.fisadev.com
" version: 1.0

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)
" ============================================================================

" Indica que empezamos a declarar nuestros plug-ins.
call plug#begin('~/.config/nvim/plugged')

" CSV
Plug 'chrisbra/csv.vim'

" NAVEGADOR DE ARCHIVOS.
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Snippets
Plug 'SirVer/ultisnips'

" GIT.
Plug 'tpope/vim-fugitive'

" Cambios de git.
Plug 'airblade/vim-gitgutter'

" Realizar diffs sobre directorios.
Plug 'will133/vim-dirdiff'

" Cambios más fáciles de entender en diffs
Plug 'chrisbra/vim-diff-enhanced'

" NAVEGACIÓN Y BÚSQUEDA DE ARCHIVOS
" Búsqueda de archivos 
Plug 'ctrlpvim/ctrlp.vim'

" STATUS BAR
" Agrega una barra de estado mejorada. 
Plug 'vim-airline/vim-airline'

" MARCAS.
" Permite visualizar y listar las marcas.
Plug 'jeetsukumaran/vim-markology'

" Barra lateral con ayudas de navegación.
Plug 'majutsushi/tagbar'

" Indica que terminamos de instalar los plugins.
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
        :PlugInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" Identamos con 4 espacios.
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Mantener el cursos 3 espacios por encima del borde inferiro.
set scrolloff=3

" Mostrar nro de lineas relativos y el número de la línea actual.
set rnu 
set nu

" Guardar como superusuario en el contenedor.
" Mapea al usuario que levanto el servicio.
ca w!! w !sudo tee "%"

" Elimina espacio en blanco al final de las lineas en archivos .py
autocmd BufWritePre *.py :%s/\s\+$//e

" Forzar el uso de bash como consola.
set shell=/bin/bash 

" --- NERDtree ---
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.swo$', '\.swp$']

" --- UltiSnips ---
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit='context'

" --- CntrlP ---
"  Ignorar archivos y directorios.
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|.idea)$',
  \ 'file': '\v\.(pyc|pyo|swo|swp)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" --- gitGutter ---
"  Actualización más rápida de cambios.
:set updatetime=200

" --- EnhancedDiff ---
"  Usar patience algorithm por defecto
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

" --- Airline ---
let g:airline#extensions#tabline#enabled = 1

" --- Tagbar ---
nnoremap <silent> <f10> :TagbarOpenAutoClose <CR>

" --- csv.vim ---
let g:csv_highlight_column = 'y'
let b:csv_headerline = 1
nnoremap <silent> <F9> :HeaderToggle <CR>


" terryma/vim-multiple-cursors
" neomake/neomake
" mileszs/ack.vim
" brooth/far.vim

