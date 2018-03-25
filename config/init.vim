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

" Navegador de archivos.
Plug 'scrooloose/nerdtree'

" Snippets
Plug 'SirVer/ultisnips'

" Cambios de git.
Plug 'airblade/vim-gitgutter'

" GIT.
Plug 'tpope/vim-fugitive'

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

" Mostrar nro de lineas.
set nu

" Guardar como superusuario en el contenedor.
" Mapea al usuario que levanto el servicio.
ca w!! w !sudo tee "%"

" Elimina espacio en blanco al final de las lineas en .py
autocmd BufWritePre *.py :%s/\s\+$//e

" Forzar el uso de bash como consola.
set shell=/bin/bash 

" --- nerdtree ---

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap ,t :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.swo$', '\.swp$']

" --- UltiSnips ---
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit='context'
