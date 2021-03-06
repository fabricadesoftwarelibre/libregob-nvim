# LIBREGOB - NEOVIM

# ¿Qué?

Libregob-nvim es una configuración especial para neovim adaptada a las necesidades de desarrollo del proyecto [LibreGOB](https://minka.gob.ec/fabricadesoftwarelibre/libregob/blob/18.1/README.md).

# ¿Para qué?.

Permite agilizar el desarrollo al incorporar atajos de escritura y a la vez facilita que desarrolladores indepententes adopten las guías de desarrollo de manera sencilla, sin siquiera saberlo.

# Instalación.

La configuración más sencilla es agregar libregob-nvim como alias en nuestro equipo, en nuestro ejemplo estamos usando la palabra `edit`, pero usted puede reemplazarla por otra sin inconveniente.

```console
foo@bar:~$ vim ~/.bash_aliases
```

Agregamos el alias al archivo:

```
alias edit='docker run --rm -it -u $UID:1000 -v $(pwd):/src -w /src fabricadesoftwarelibre/libregob-nvim:18.1'
```

Y le indicamos al sistema que alimente la información recientemente ingresada.

```console
foo@bar:~$ source ~/.bash_aliases
```

Si deseamos tener persistencia de datos o si queremos agregar nuestra configuración de Git, podemos utilizar volúmenes, requerimos principalmente dos:
- `/root/.config/nvim` para almacenar nuestra configuración general de nvim.
- `/etc/gitconfig` para nuestra configuración de git.

Vamos a hacer un ejercicio creándolo en nuestro directorio `/home`, usando los subdirecotios en `Docker/neovim`.

```console
foo@bar:~$ mkdir -p ~/Docker/neovim/etc
foo@bar:~$ mkdir -p ~/Docker/neovim/config
```

Ahora vamos a crear el archivo para la configuración de git, vamos a usar vim en el ejemplo, pero pueden cambiar el editor de texto si aún no lo tienen disponible en sus equipos.

```console
foo@bar:~$ vim ~/Docker/neovim/etc/gitconfig
```

Y agregamos el siguiente contenido al documento:

```console
[user]
    name = Su nombre de usuario de Minka
    mail = sucorreo@deusuariodeminka
```

Una vez abierto el archivo, pegamos nuestro alias:

```
edit='docker run -it --rm -v $(pwd):/src -v ~/Docker/neovim/etc/gitconfig:/etc/gitconfig -v ~/Docker/neovim/config:/root/.config/nvim --workdir /src -t fabricadesoftwarelibre/libregob-nvim:18.1"
```
Si deseamos tener acceso a todos nuestros archivos desde libregob-nvim, podemos agregar nuestro home a los volúmenes del contenedor.

```
edit='docker run -it --rm -v $(pwd):/src -v ~/:/home/ -v ~/Docker/neovim/etc/gitconfig:/etc/gitconfig -v ~/Docker/neovim/config:/root/.config/nvim --workdir /src -t fabricadesoftwarelibre/libregob-nvim:18.1"
```

Una vez instalado, nos movilizamos al directorio que deseamos editar y ejecutamos `edit`, ingresaremos al directorio y podremos empezar a editar cualquier archivo.

Por ejemplo, quisieramos editar un archivo en nuestro directorio libregob-addons, lo haríamos de la siguiente manera:

```console
foo@bar:~$ cd ~/Repositorios/fabricadesoftwarelibre/libregob/libregob-addons/
foo@bar:~$ edit
```
# Instrucciones de uso.

## Navegación y visualización.

La navegación básica de vim:
- `i` = editar.
- `ESC` = dejar el modo edición.
- `:x` = guardar y cerrar.
- `:w` = guardar.
- `:q` = salir.

El navegar entre archivos, buscar líneas de código, abrir nuevos módulos, comparar información, movernos entre archivos abiertos y otras actividades similares consumen una importante parte de nuestro tiempo de desarrollo, por ello, es necesario utilizar atajos y opciones que nos permitan optimizar estas tareas.

Así, para una navegación más eficiente, podemos utilizar las marcas de vim, de la siguiente manera.
- Para agregar una marca presionamos `mx`, donde x es la letra sobre la cual queremos agregar nuestra marca.
- Para movernos hacia la marca creada usamos `'x`.

Las marcas en mayúsculas están disponibles desde todos los buffer abiertos, las marcas en minúscula, son locales a cada buffer.

Gracias a [vim-markology](https://github.com/jeetsukumaran/vim-markology) disponemos de interesantes opciones adicionales, como:
- `m+` agrega una marca con la siguiente letra disponible.
- `m-` borramos la marca de la línea seleccionada.
- `m]` navegamos a la siguiente marca local.
- `m[` navegamos a la marca local anterior.
- `m?` listamos las marcas locales.
- `m^` listamos las marcas en la lista QuickFix.

Para la navegación entre archivos, buffers, tags, rmu (most-recently used files), entre otros, usamos el complemento [CntrlP](https://github.com/ctrlpvim/ctrlp.vim), a través del cual podemos usar los siguientes atajos de búsqueda:
- `Cntrl+p` para buscar archivos en el directorio actual (utiliza búsqueda 'fuzzy').
- `Cntrl+b` para buscar en los nombres de los buffer abiertos.
- `Cntrl+m` para buscar los archivos recientemente abiertos. 
- `Cntrl+t` para buscar en los tags de los buffer actuales.
- `Cntrl+l` para buscar texto en las líneas de los buffer actuales.
- `Cntrl+c` para buscar texto en las líneas modificadas recientemente.

Una de las acciones más comunes es analizar el contenido de módulos que nos son desconocidos. Usamos [Tagbar](https://github.com/majutsushi/tagbar) para navegar por una lista comprensiva de tags presionando la tecla `<F10>`. Se desplegará a nuestra mano derecha una barra con los tags del archivo actual, navegamos por ellos con las flechas del teclado y al presionar `<ENTER>` se cerrará la ventana de tags y nos llevará a la ubicación seleccionada. Si deseamos cerrar la ventana sin elegir una nueva ubicación, deberemos presional la tecla `<F10>` nuevamente.

Adicionalmente, con la ayuda de [vim-gitgutter](https://github.com/airblade/vim-gitgutter) podemos observar, al lado izquierdo de nuestra pantalla, las línas que han sido modificadas, añadidas o eliminadas de nuestro repositorio con los signos ~, + y - respectivamente.

## Autocompletado.
[Ultisnips](https://github.com/SirVer/ultisnips) es nuestro principal aliado, con este complemento podemos utilizar atajos (snippets) para agilizar nuestra escritura, a continuación tenemos una lista de los atajos actualmente implementados:

En archivos xml:
### Vistas
|Atajo|Acción|
|-----|------|
|vam|vistas, acción y menú para un modelo|
|xmlh|encabezado de archivo xml|
|tv|agrega una vista de lista (tree view)|
|itv|hereda una vista de lista (tree view)|
|fv|agrega una vista de formulario (form view)|
|ifv|hereda una vista de formulario (form view)|
|sv|agrega una vista de búsqueda o filtro (search view)|
|cv|agrega una vista de calendario (calendar view)|
|h|agrega un encabezado (header)|
|fo|agrega un pié de página (footer)|
|s|agrega una hoja (sheet)|
|n|agrega una libreta (notebook)|
|p|agrega una página (page)|
|g|agrega un grupo (group)|
|f|agrega un campo (field)|
|ob|agrega un botón de tipo objeto (object button)|
|ab|agrega un botón de tipo acción (action button)|
|cb|agrega un botón de cancelar (special=cancel)|
|pt|password|
|it|invisible|
|rot|readonly="1"|
|nlt|nolabel="1"|
|fst|force\_save="1"|
|xp|xpath|
|xpf|xpath field|
|xpb|xpath button|
|xpd|xpath div|
|xpn|xpath notebook position inside|
|xpp|xpath page|
|pi|position inside|
|pa|position after|
|pb|position before|
|pr|position replace|
|att|attributes|
|attr|atributo required|
|attro|atributo readonly|
|atti|atributo invisible|
|ar|atributo required adicional|
|aro|atributo readonly adicional|
|ai|atributo invisible adicional|
|op|opciones|
|nc|no create|
|nce|no create edit|
|nqc|no quick create|
|eb|editable="buttom"|
|no|no open|
|ws|widget selection|
|wm2m|widget many2many|
|wm2mt|widget many2many tags|
|wm2mc|widget many2many checkboxes|
|wm2mk|widget many2many kanban|
|wm2mb|widget many2many binary|
|wx2mc|widget x2many counter|
|wsb|widget statusbar|
|rmi|menú principal|
|smi|submenu|
|ami|menú que ejecuta una acción|
|act|acción básica|
|uc|categoría de usuarios|
|ug|grupo de usuarios|
|iug|grupo de usuarios con ids implícitas|

### Reportes
|Atajo|Acción|
|-----|------|
|rep|Base completa para un reporte qweb|
|repd|Definición de reporte qweb|
|repc|Plantilla de contenido de reporte qweb|
|rept|Plantilla de reporte qweb|
|t|t|
|ti|t-if|
|te|t-esc|
|tr|t-raw|
|tf|t-field|
|tfe|t-foreach|
|ts|t-set|

En archivos de python:

|Atajo|Acción|
|-----|------|
|pyh|Agrega el encabezado para un archivo python.|
|im|Importar models.|
|imf|Importar models y fields.|
|imfa|Importar models, fields y el api.|
|imfa\_|Importar models, fields, api y traducciones.|
|iex|Importar todas las excepciones.|
|iue|Importar UserError.|
|ive|Importar ValidationError.|
|irw|Importar RedirectWarning.|
|ilog|Importar logging.|
|idp|Importar la presición decimal.|
|mm|Nuevo models.Model|
|mt|Nuevo models.TransientModel|
|ma|Nuevo models.AbstractModel|
|mmi|Nuevo modelo con herencia|
|imm|Heredar modelo|
|imt|Heredar wizard|
|fc|Agregar un campo Char.|
|ft|Agrega un campo Text.|
|fi|Agrega un campo Integer.|
|ff|Agrega un campo Float.|
|fbo|Agrega un campo Boolean.|
|fbi|Agrega un campo Binary.|
|fd|Agrega un campo Date.|
|fdt|Agrega un campo Datetime.|
|fm2o|Agrega un campo Many2one.|
|fo2m|Agrega un campo One2many.|
|fm2m|Agrega dos campos Many2many. El segundo campo generado debe ser cortado y pegado en la clase correspondiente.|
|fs|Agrega un campo de selección con dos opciones.|
|it|invisible=True|
|if|invisible=False|
|rt|required=True|
|rf|required=False|
|rot|readonly=True|
|rof|readonly=False|
|ct|copy=True|
|cf|copy=False|
|st|store=True|
|sf|store=False|
|ixt|index=True|
|ixf|index=False|
|odr|ondelete='restrict'|
|odsn|ondelete='set null'|
|odc|ondelete='cascade'|
|h1|help con una línea|
|h2|help con dos líneas|
|h3|help con tres líneas|
|domf|dominio falso|
|domt|dominio verdadero|
|dom|dominio editable|
|comp|compute a fórmula '\_compute\_$1"|
|d|default a fórmula \_default\_$1"|
|dt|default=True|
|df|default=False|
|d0|default=0|
|du|default relativo al usuario|
|dc|default relativo a la compañía|
|tva|track\_visibility='always'|
|tvo|track\_visibility='onchange'|
|tt|translate=True|
|tf|translate=False|
|srt|campo de solo lectura en estado $1|
|sdrf|campo de solo lectura editable en borrador|
|aocrdom|retornar un dominio a través de un onchange|
|aoc|nueva fun decorada con api.onchange|
|am|nueva función decorada con api.multi|
|amb|nuevo botón decorado con api.multi|
|ad|nueva fun decorada con api.depends|
|sup|Aplicar super a una función y trabajar sobre res|
|supr|Aplicar super a una función y retornar res|
|fil|aplicar filter a un recordset|
|sea|aplicar search a un recordset|
|=se| var\_obj = self.env['var']|
|se| self.env['var']|
|w|Agregar punto de depuración en wdb, usar para iniciar el depurador en la línea.|
|ws|Agregar punto de depuración en wdb, usar para que inicie el depurador en caso de encontrar una exepción|
|rue|Levanta un error de usuario|
|dm|nuevo miembro de un diccionario|
|odm|nuevo miembro de un OrderedDict|
|sm|nuevo miembro de una selección|
|domm|nuevo miembro de un dominio|


Para utilizar los atajos debemos presionar la tecla de tabulador al finalizar el mismo, por ejemplo, para crear un nuevo modelo deberemos digitar `imm<TAB>`.

|Comando|Explicación|
|---|---|
|`i`| Entramos a modo de edición de nvim.|
|`mm`|Nuestro atajo.|
|`<TAB>`|Presionamos la tecla tabulador para expandir nuestro atajo.|

Al expandirse, nuestro atajo nos ubicará en diferentes posiciones, mismas que nos permitirán agregar las variables de nuestro trabajo actual, para pasar a la siguiente variable debemos presionar `<TAB>`, para retornar a la variable anterior, usamos `Shift+<TAB>`.

Los atajos están configurados para utilizar nuestras variables de manera inteligente, por ejemplo, al crear una nueva vista, el atajo nos ubicará en la posición para editar el nombre de la vista, nosotros agregaremos, por ejemplo, account\_invoice, automáticamente el sistema nos agregará form\_view, tree\_view, etc. También utilizará nuestro valor para editar el modelo, reemplazando los \_ (guiones bajos) con . (punto) y agregará el texto a mostrar (string) de la vista capitalizando la primera letra y reemplazando los guiones bajos con espacios.

En el ejemplo anterior, para crear una vista de formulario (form view) en archivo .xml podemos usar el atajo `fw`, tendríamos el siguiente resultado:

|Explicación|Valor|
|---|---|
|Comando completo|`ifw<TAB>`|
|Texto agregado|account\_invoice|
|Nombre completo de la vista|account\_invoice\_form\_view|
|Nombre del modelo|account.invoice|
|String de la vista|Account invoice|

## Archivos CSV.
El manejo de archivos csv es complejo en editores de texto, comunmente recurrimos a herramientas adicionales como LibreOffice o Excel para trabajar con este tipo de arhivo.

Libregob-nvim utiliza el complemento [csv.vim](https://github.com/chrisbra/csv.vim) para facilitar el trabajo con este tipo de archivos. Una de las funciones más importantes es poder mantener el encabezado de nuestro archivo a la vista en todo momento, para ello, podemos presionar la techa `<F9>` para mostrar y ocultar el encabezado de nuestro archivo. Debido a que normalmente vamos a editar archivos con información de objetos, por defecto se ha configurado que la primera línea sea considerada como el encabezado, no como una línea normal.

La mejor manera de conocer todos los atajos es probándolos.

¡suerte!  

