**Proyecto:** Proyecto Intermodular 1º ASIR<br>
**Módulo:** Lenguaje de Marcas<br>
**Alumno:** Joaquín Luis García García

---

## Índice

- [Datos representados en el XML](#1-datos-representados-en-el-xml)
- [Validación del XML mediante DTD](#2-validación-del-xml-mediante-dtd)
- [Evidencia de que el DTD funciona](#evidencia-de-que-el-dtd-funciona)
- [Transformación XSL para visualizar HTML](#transformación-xsl-para-visualizar-html)
- [Proceso de transformación XLST](#proceso-de-transformación)

Este directorio recoge los documentos correspondientes al módulo de **Lenguaje de Marcas**, dentro del proyecto intermodular de **1º ASIR**.

En este apartado se muestra la documentación de un repositorio relacionado con la representación, validación y transformación de datos mediante XML, DTD y XSLT dentro del inventario tecnológico del club.

# Datos representados en el XML

El archivo [inventario.xml](../xml/inventario.xml) representa el **inventario tecnológico del Almería CF**, es decir, la infraestructura informática utilizada por un club ficticio para dar soporte a sus diferentes departamentos.

Este inventario forma parte del **proyecto intermodular** y se utiliza en varios módulos del ciclo formativo, como **Redes**, **Bases de Datos** y **Hardware**.

Además, constituye una pieza fundamental de la **intranet del club**, también incluida en este módulo. Esta intranet está integrada en el módulo de **Implantación de Sistemas Operativos** mediante **Active Directory**, lo que permite gestionar el acceso de los usuarios. De este modo, cada usuario puede acceder a la página de su departamento en la intranet con sus credenciales y, dependiendo de los permisos, podrá o no visualizar la web del departamento. 

Debido a esta conexión con **Active Directory**, se incluye una página de error personalizada para cuando un usuario accede de manera incorrecta en un sitio al que no tiene acceso por permisos. Esta página se encuentra en la carpeta [errors](../errors/403.html).


Esta estructura de XML se organiza mediante el elemento raíz:

```bash
<inventario>
```

Este elemento contiene información sobre los diferentes componentes de la infraestructura tecnológica.

De esta forma, el documento XML contiene:

- Información general del inventario  
- Equipamiento de red (routers, switches y puntos de acceso)  
- Servidores  
- Equipos informáticos  
- Dispositivos de infraestructura (WLC, impresoras y otros dispositivos de red)

A continuación se muestra una pequeña muestra de como está organizado:

```bash
<inventario club="Almería CF" fecha="2026-03-18">

    <item id="pccorp01" tipoRef="t08" ubicacionRef="u05" proveedorRef="p01" estado="operativo">
      <nombre>Equipos corporativos</nombre>
      <modelo>Dell Pro Desktop</modelo>
      <cantidad>17</cantidad>
      <funcion>Puestos de trabajo corporativos</funcion>
      <costeUnidad moneda="EUR">800</costeUnidad>
    </item>

</inventario>
```
Este formato permite representar los datos de forma estructurada, jerárquica y fácilmente procesable, lo que facilita su validación y transformación.

# Validación del XML mediante DTD

Para asegurar que el documento XML tiene una estructura correcta, se utiliza un DTD (Document Type Definition).

El archivo utilizado se llama:


[modelo.dtd](../xml/modelo.dtd)


Este archivo define:

- Qué elementos pueden aparecer

- En qué orden

- Qué atributos tienen

- Qué tipo de contenido pueden tener

Ejemplo de definición en el DTD:

```bash
<!ELEMENT inventario (tipos, ubicaciones, proveedores, items)>
<!ATTLIST inventario
  club CDATA #REQUIRED
  fecha CDATA #REQUIRED
>
```
Esto indica que el elemento inventario debe contener ciertos elementos y atributos obligatorios.

Vinculación del XML con el DTD

Dentro del archivo XML se declara el DTD mediante:

<!DOCTYPE inventario SYSTEM "modelo.dtd">

Nuestro inventario.xml está perfectamente validado tal y como se [muestra](../docs/validacion-correcta.png), ya no existe ningún error por parte del editor.

## Evidencia de que el DTD funciona

Para comprobar que nuestro DTD funciona correctamente, se ha añadido un inventario falso en el que se han cometido errores adrede y así ver como el DTD trabaja. [Aqui](../docs/validacion-nula.png) se muestra una prueba de ello.
En esta captura, tomada desde Visual Studio Code, el mismo editor informa de los problemas: 

### 1- La ubicación u99 no existe

El XML pone esta referencia:

```bash
ubicacionRef="u99"
```

Pero en la lista de ubicaciones solo están definidas u01 y u02.

Eso significa que el segundo item está apuntando a una ubicación que no existe en el documento, y por eso el validador da error.

### 2- Falta el elemento <nombre> dentro del item

Según el DTD, cada item tiene que tener exactamente estos elementos y en este orden:

(nombre, modelo, cantidad, funcion, costeUnidad)

Sin embargo, en el XML falso, los item empiezan directamente por:

```bash
<modelo>...</modelo>
```

Como falta <nombre>, el contenido del item no cumple la estructura obligatoria y aparece ese error.

### 3- El segundo item también tiene mal la estructura

Este error sale otra vez porque en el segundo item pasa lo mismo que en el primero: también falta el elemento <nombre>.

No es un error distinto en realidad, sino el mismo problema repetido en otro bloque item.

### 4- El valor roto no está permitido en estado

En el DTD, el atributo 'estado' solo puede tener uno de estos valores:

operativo | mantenimiento | averiado | retirado


Pero en el XML incorrecto aparece:

```bash
estado="roto"
```

Como roto no está en la lista de valores permitidos, el validador lo marca como error.

### 5- El id srv01 está repetido

En XML, los atributos de tipo ID tienen que ser únicos.
Eso quiere decir que no puede haber dos elementos con el mismo identificador.

En el archivo aparecen dos item con:
```bash
id="srv01"
```

Eso provoca un error porque el identificador está duplicado.

## Transformación XSL para visualizar HTML

La transformación de XML a HTML se realiza utilizando XSLT (Extensible Stylesheet Language Transformations).
En este proyecto se utiliza el archivo transform.xsl, que define cómo deben mostrarse los datos del XML en formato HTML.

Asociación del XML con la hoja XSLT

Para que el navegador aplique automáticamente la transformación, el archivo datos.xml incluye la siguiente instrucción al inicio del documento:

```bash
<?xml-stylesheet type="text/xsl" href="transform.xsl"?>
```

Esta línea indica que el documento XML debe procesarse utilizando la hoja de estilo transform.xsl.

### Proceso de transformación

El proceso funciona de la siguiente manera:

- El navegador abre el archivo datos.xml.

- Detecta la instrucción xml-stylesheet.

- Carga la hoja de transformación transform.xsl.

- Aplica las reglas definidas en el XSLT.

- Genera una página HTML a partir del contenido del XML.

La transformación permite organizar la información del XML en una estructura visual comprensible para el usuario. Mediante el uso de XSLT, los datos del inventario pueden mostrarse en forma de tablas, lo que facilita la lectura y la comparación de la 
información.

En este proyecto se utiliza un archivo de estilos CSS común para mantener una apariencia visual coherente en todo el portal web del Almería CF. Este archivo CSS no se aplica directamente al documento XML, sino al HTML generado mediante la transformación XSLT.

El proceso funciona de la siguiente manera: el archivo XML contiene los datos estructurados del inventario tecnológico, mientras que el archivo XSLT define cómo deben transformarse esos datos para generar una página HTML. Durante esta transformación, el XSLT 
crea una estructura HTML que incluye clases y elementos que posteriormente serán interpretados por la hoja de estilos CSS.

Dentro del archivo transform.xsl se incluye una referencia al archivo de estilos mediante una etiqueta <link> en la sección <head> del HTML generado. De esta forma, cuando el navegador aplica la transformación XSLT y genera el documento HTML, también carga 
automáticamente la hoja de estilos CSS del proyecto.

Gracias a esta vinculación, el informe generado a partir del XML mantiene el mismo diseño visual que el resto del portal interno del club, utilizando los mismos colores, tipografías, tarjetas informativas y estilos de tablas. Esto permite integrar el 
inventario tecnológico dentro de la misma estética del sitio web, garantizando una presentación uniforme de toda la información.

El resultado final es una página web que muestra la información del inventario del club de forma clara y estructurada, permitiendo consultar fácilmente los distintos elementos que forman parte de la infraestructura tecnológica.

Mediante **las capturas incluidas en la carpeta docs**, se puede [ver](../docs/sin-transformacion.png) como sería el archivo XML sin aplicar una transformación XSLT. Sin embargo, si se aplica correctamente, [Aqui](../docs/transformado.png), se aprecia un resultado más que satisfactorio, ya que como se ha dicho antes, ahora se aprovecha del estilo CSS creado.

## Tecnologías y servicios utilizados

- **XML**
- **DTD (Document Type Definition)**
- **XSLT**
- **HTML**
- **CSS**
- **Visual Studio Code**

---

