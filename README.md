# LIBREGOB - NEOVIM

# ¿Qué?

Libregob-nvim es una configuración especial para neovim adaptada a las necesidades de desarrollo del proyecto [LibreGOB](https://minka.gob.ec/fabricadesoftwarelibre/libregob/blob/18.1/README.md).

# ¿Para qué?.

Permite agilizar el desarrollo al incorporar atajos de escritura y a la vez facilita que desarrolladores indepententes adopten las guías de desarrollo de manera sencilla, sin siquiera saberlo.

# Instalación.

La configuración más sencilla es agregar libregob-nvim como alias en nuestro equipo, en nuestro ejemplo estamos usando la palabra `edit`, pero usted puede reemplazarla por otra sin inconveniente:

```console
foo@bar:~$ echo "alias edit='docker run -it --rm -v $(pwd):/src --workdir /src fabricadesoftwarelibre/libregob-nvim:18.1'" >>~/.bash_aliases
foo@bar:~$ source ~/.bash_aliases
```
Una vez instalado, nos movilizamos al directorio que deseamos editar y ejecutamos `edit`, ingresaremos al directorio y podremos empezar a editar cualquier archivo.

Si quisieramos editar un archivo en nuestro directorio libregob-addons, lo haríamos de la siguiente manera:

```console
foo@bar:~$ cd ~/Repositorios/fabricadesoftwarelibre/libregob/libregob-addons/
foo@bar:~$ edit
```
# Instrucciones de uso.

## Navegación y visualización.
[Tagbar](https://github.com/majutsushi/tagbar) se encuentra instalado para una facil navegación, para activarlo, debemos presionar la tecla `<F10>`. Se desplegará una barra al lado derecho de la pantalla con todas las definiciones de nuestro archivo, con ella podemos nagegar hacia la función que deseemos y presionamos `<ENTER>`, la barra se cerrará automáticamente y el cursor se posicionará sobre la definición elegida.

Para una navegación más eficiente, podemos utilizar las marcas de vim, de la siguiente manera.
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

Adicionalmente, con la ayuda de [vim-gitgutter](https://github.com/airblade/vim-gitgutter) podemos observar, al lado izquierdo de nuestra pantalla, las línas que han sido modificadas, añadidas o eliminadas de nuestro repositorio con los signos ~, + y - respectivamente.


## Autocompletado.
[Ultisnips](https://github.com/SirVer/ultisnips) es nuestro principal aliado, con este complemento podemos utilizar atajos (snippets) para agilizar nuestra escritura, a continuación tenemos una lista de los atajos actualmente implementados:

En archivos xml:

|Atajo|Acción|
|-----|------|
|tv|agrega una vista de lista (tree view).|
|fv|agrega una vista de formulario (form view).|
|sv|agrega una vista de búsqueda o filtro (search view).|
|cv|agrega una vista de calendario (calendar view).|
|h|agrega un encabezado (header).|
|fo|agrega un pié de página (footer).|
|s|agrega una hoja (sheet).|
|n|agrega una libreta (notebook).|
|p|agrega una página (page).|
|g|agrega un grupo (group).|
|f|agrega un campo (field).|
|ob|agrega un botón de tipo objeto (object button).|
|ab|agrega un botón de tipo acción (action button).|
|op|opciones|
|nc|no create|
|nce|no create edit|
|nqc|no quick create|
|no|no  open|
|ws|widget selection|
|wm2m|widget many2many|
|wm2mt|widget many2many tags|
|wm2mc|widget many2many checkboxes|
|wm2mk|widget many2many kanban|
|wm2mb|widget many2many binary|
|wx2mc|widget x2many counter|

En archivos de python:

|Atajo|Acción|
|-----|------|
|pyfh|Agrega el encabezado para un archivo python.|
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
|mm|Nuevo modelo.|
|imm|Heredar modelo.|
|tm|Nuevo wizard.|
|itm|Heredar wizard.|
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
|defc|default a fórmula \_compute\_$1"|
|deft|default=True|
|deff|default=False|
|def0|default=0|
|defu|default relativo al usuario|
|tva|track\_visibility='always'|
|tvo|track\_visibility='onchange'|
|tt|translate=True|
|tf|translate=False|
|srt|campo de solo lectura en estado $1|
|sdrf|campo de solo lectura editable en borrador|
|aoc|nueva fun decorada con api.onchange|
|aocrdom|retornar un dominio a través de un onchange|
|ad|nueva fun decorada con api.depends|
|filter|aplicar filter a un recordset|
|search|aplicar search a un recordset|
|sup|Aplicar super a una función y trabajar sobre res.|
|supr|Aplicar super a una función y retornar res.|
|wst|Agregar punto de depuración en wdb.|
|rue|Levanta un error de usuario.|

Para utilizar los atajos debemos presionar la tecla de tabulador al finalizar el mismo, por ejemplo, para crear un nuevo modelo deberemos digitar `imm<TAB>`.

|Comando|Explicación|
|---|---|
|`i`| Entramos a modo de edisión de nvim.|
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

