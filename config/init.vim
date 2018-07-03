" LibreGOB nvim-config
" Basado en fisadev-nvim-config  http://nvim.fisadev.com
" version: 1.0

" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('/home/docker/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p /home/docker/.config/nvim/autoload
    silent !curl -fLo /home/docker/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)
" ============================================================================

" Indica que empezamos a declarar nuestros plug-ins.
call plug#begin('/home/docker/.config/nvim/plugged')

" Autocompletado
Plug 'roxma/nvim-completion-manager'

" --- YouCompleteMe ---
" 'roxma/nvim-completion-manager' se dejó de mantner en 04/2018
" Reemplazar con YouCompleteMe si deja de funcionar.
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_auto_trigger = 1

" Lint de errores
Plug 'https://github.com/w0rp/ale.git'

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
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" Facitita la navegación horizontal.
Plug 'unblevable/quick-scope'

" Facil navegación
Plug 'easymotion/vim-easymotion'
" https://github.com/haya14busa/incsearch.vim

" Mejor flujo en lenguajes identados, fold.
Plug 'tweekmonster/braceless.vim'

" STATUS BAR
" Agrega una barra de estado mejorada. 
Plug 'vim-airline/vim-airline'

" MARCAS.
" Permite visualizar y listar las marcas.
Plug 'jeetsukumaran/vim-markology'

" Barra lateral con ayudas de navegación.
Plug 'majutsushi/tagbar'

" Muestra marcas de identación.
Plug 'Yggdroot/indentLine'

" Busqueda recursiva en directorios.
Plug 'dyng/ctrlsf.vim'
"Plug 'mileszs/ack.vim'

" Navegación mejorada.
Plug 'wellle/targets.vim'

" Facilita agregar tags, util para xml.
Plug 'tpope/vim-surround'

" Mejora el comportamiento de . para repetir acciones.
Plug 'tpope/vim-repeat'

" Mejora el comportamiento de p y P ajustando la identación.
" Plug 'sickill/vim-pasta'

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

" 0 nos lleva al primer caracter de la línea
noremap 0 ^

" Moverse por líneas de la pantalla.
nnoremap j gj
nnoremap k gk

"Evitar la creación de swp y swo
set nobackup
set noswapfile

" Cambiar de buffer sin guardar los cambios.
set hidden

" Confirma si se quiere cerrar la ventana sin guardar.
set confirm

" Select another file from the directory of the current one
nnoremap <leader>F :execute 'edit' expand("%:p:h")<cr>

" Moverse entre ventanas con Control + hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Cambiar el tamaño de la ventana con control + teclas de dirección. 
nnoremap <C-down> <C-w>+
nnoremap <C-up> <C-w>-
nnoremap <C-left> <C-w>>
nnoremap <C-right> <C-w><

" Guardar como superusuario en el contenedor.
" Mapea al usuario que levanto el servicio.
ca w!! w !sudo tee "%"

" Elimina espacio en blanco al final de las lineas en archivos .py
autocmd BufWritePre *.py :%s/\s\+$//e

" Forzar el uso de bash como consola.
set shell=/bin/bash 

" No comparar espacios en blanco.
:set diffopt+=iwhite

" Colores por defecto de differencias.
if &diff
    set cursorline
    map ] ]c
    map [ [c
    hi DiffAdd    ctermfg=233 ctermbg=LightGreen guifg=#003300 guibg=#DDFFDD gui=none cterm=none
    hi DiffChange ctermbg=white  guibg=#ececec gui=none   cterm=none
    hi DiffText   ctermfg=233  ctermbg=yellow  guifg=#000033 guibg=#DDDDFF gui=none cterm=none
endif

"--- 'w0rp/ale.vim' ---
"let g:ale_statusline_format = ['☀️️ %d', '🕯️ %d', '']
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0
"let g:ale_open_list = 1
"let g:ale_completion_enabled = 0
"let g:ale_sign_column_always = 1
"let g:ale_linters = {'xml': ['xmllint']}
"let g:ale_fixers = {'xml' : [ 'xmllint' ]}
"let g:ale_linters = {'python': ['yapf','autopep8','isort']}
"let g:ale_fixers = {'python' : ['yapf','autopep8','isort']}
"let g:ale_fix_on_save = 0
"let g:airline#extensions#ale#enabled = 1
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '!!'

"--- 'roxma/nvim-completion-manager' ---
set shortmess+=c    
imap <c-g> <Plug>(cm_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" --- NERDtree ---
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.pyo$', '\.swo$', '\.swp$']

" --- UltiSnips ---
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsSnippetDirectories = ['/home/docker/.config/nvim/UltiSnips', 'UltiSnips']
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
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_open_multiple_files = '4ijr'
nnoremap <silent> <CR> :CtrlPBuffer <CR>
nnoremap <silent> <C-m> :CtrlPMRU <CR>
nnoremap <silent> <C-t> :CtrlPBufTag <CR>
nnoremap <silent> <C-b> :CtrlPLine <CR>

" --- braceless ---
autocmd FileType python,haml,yaml,coffee BracelessEnable +indent +fold


" --- gitGutter ---
"  Actualización más rápida de cambios.
:set updatetime=200

" --- EnhancedDiff ---
"  Usar patience algorithm por defecto
if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
endif

" --- quick-scope ---
" Activar solo al iniciar navegación.
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" --- ACK ---
" Usar ag en lugar de ACK
"if executable('ag')
"  let g:ackprg = 'ag --vimgrep'
"endif

"cnoreabbrev Ack Ack!
"nnoremap <Leader>a :Ack!<Space>

" evitar conflictos con NERDTree
"let g:ack_mappings = {
"    \  'v':  '<C-W><CR><C-W>L<C-W>p<C-W>J<C-W>p',
"    \ 'gv': '<C-W><CR><C-W>L<C-W>p<C-W>J' }

" --- easymotion ---
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1

" --- Airline ---
let g:airline#extensions#tabline#enabled = 1

" --- Tagbar ---
"nnoremap <silent> <f10> :TagbarOpenAutoClose <CR>
let g:tagbar_autoclose = 1
nnoremap <silent> <F8> :TagbarToggle <CR>

" --- csv.vim ---
let g:csv_highlight_column = 'y'
let b:csv_headerline = 1
nnoremap <silent> <F9> :HeaderToggle <CR>

" --- CtrlFS ---
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
"nnoremap <F7> :CtrlSFToggle <CR>
"nnoremap <C-f> :CtrlSF<Space>

" terryma/vim-multiple-cursors
" neomake/neomake

