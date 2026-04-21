# Sistema de almacenamiento

## Índice

- [Introducción](#introducción)
- [Tipos de almacenamiento utilizados](#tipos-de-almacenamiento-utilizados)
- [Almacenamiento en los equipos de usuario](#almacenamiento-en-los-equipos-de-usuario)
- [Almacenamiento en los equipos de mayor rendimiento](#almacenamiento-en-los-equipos-de-mayor-rendimiento)
- [Sistema de almacenamiento del servidor](#sistema-de-almacenamiento-del-servidor)
- [Capacidad de almacenamiento necesaria](#capacidad-de-almacenamiento-necesaria)
- [Ventajas de cada tipo de almacenamiento](#ventajas-de-cada-tipo-de-almacenamiento)
- [Uso previsto del almacenamiento](#uso-previsto-del-almacenamiento)
- [Conclusión](#conclusión)

## Introducción

El sistema de almacenamiento es uno de los elementos más importantes dentro de una infraestructura informática, ya que se encarga de guardar de forma permanente el sistema operativo, las aplicaciones y los datos de trabajo de la organización. En este proyecto, el almacenamiento se ha diseñado teniendo en cuenta las necesidades reales de un club con estructura similar a la de una pyme, buscando un equilibrio entre capacidad, velocidad, seguridad y coste.

La propuesta combina distintos tipos de almacenamiento según el uso previsto de cada equipo. Por un lado, los puestos de trabajo utilizan unidades **SSD**, que ofrecen un mejor rendimiento en el arranque del sistema y en la apertura de programas. Por otro lado, el servidor central utiliza **discos duros HDD** de alta capacidad configurados en **RAID 5**, priorizando la disponibilidad de los datos y la tolerancia a fallos.

De este modo, el sistema de almacenamiento se adapta a las distintas funciones de la infraestructura, diferenciando entre el almacenamiento local de los usuarios y el almacenamiento centralizado del servidor.

## Tipos de almacenamiento utilizados

En la infraestructura propuesta se utilizan principalmente dos tipos de almacenamiento: **SSD** y **HDD**.

### SSD

Los **SSD** o unidades de estado sólido se emplean en los equipos de usuario, en los equipos de mayor rendimiento, en las workstations y en los portátiles. Este tipo de almacenamiento no utiliza piezas mecánicas móviles, lo que permite alcanzar una velocidad de lectura y escritura mucho mayor que la de un disco duro tradicional.

Su principal ventaja dentro del sistema es que mejora notablemente la experiencia de uso del equipo. Gracias al SSD, el sistema operativo arranca más rápido, las aplicaciones se cargan en menos tiempo y el equipo responde de forma más fluida. Por ello, es la opción más adecuada para ordenadores de sobremesa y portátiles destinados al trabajo diario.

En este proyecto, los SSD se utilizan en:

- Equipos estándar
- Equipos de configuración superior
- Workstations de Soporte IT
- Equipo de alto rendimiento diseñado a medida
- Portátiles corporativos

En todos estos casos se utilizarán **las unidades SSD ya incorporadas en los propios equipos**, por lo que no será necesario adquirir un sistema de almacenamiento adicional independiente para cada ordenador.

### HDD

Los **HDD** o discos duros mecánicos se utilizan en el servidor central. A diferencia de los SSD, los HDD ofrecen una velocidad menor, pero tienen como ventaja una mayor capacidad de almacenamiento por un coste más reducido.

En el contexto del proyecto, el servidor necesita guardar una gran cantidad de datos compartidos, documentación interna, recursos del sistema, copias de trabajo y servicios centralizados. Por ello, el uso de discos HDD de gran capacidad resulta adecuado, ya que permite almacenar muchos datos sin disparar el coste total de la infraestructura.

## Almacenamiento en los equipos de usuario

Los equipos de usuario estándar y los equipos portátiles utilizan unidades **SSD** incorporadas de fábrica, ya que estos puestos necesitan rapidez en el trabajo diario más que una gran capacidad de almacenamiento local.

En estos casos, el SSD se utiliza para almacenar:

- El sistema operativo
- Aplicaciones corporativas
- Herramientas de ofimática
- Archivos temporales de trabajo
- Documentación de uso habitual

La elección de **512 GB SSD** como capacidad de referencia en la mayoría de puestos resulta adecuada porque proporciona espacio suficiente para el software del usuario y sus documentos, sin recurrir a un almacenamiento local excesivo. Además, buena parte de la información importante debe almacenarse en el servidor central o en recursos compartidos de la empresa, no únicamente en el ordenador local.

Por tanto, en los puestos de usuario el almacenamiento se plantea con una lógica de **rapidez y productividad**, mientras que la conservación centralizada de los datos más importantes recae en el servidor.

## Almacenamiento en los equipos de mayor rendimiento

Los equipos de configuración superior, las workstations de Soporte IT y el equipo de alto rendimiento diseñado a medida también utilizan almacenamiento **SSD**, aunque en estos casos el papel de la velocidad es todavía más importante.

En departamentos como **Prensa y Marketing**, el almacenamiento rápido permite abrir proyectos grandes, trabajar con imágenes, documentos pesados o contenido multimedia con mayor fluidez. En el área de **Soporte IT**, una unidad SSD de mayor capacidad también resulta útil para almacenar herramientas técnicas, imágenes del sistema, máquinas virtuales o archivos de diagnóstico.

En particular:

- Los equipos superiores mantienen una configuración equilibrada con **512 GB SSD**
- Las workstations de IT aumentan la capacidad a **1 TB SSD**
- El equipo a medida incorpora **2 TB SSD**, pensando en un uso más intensivo y en archivos de mayor tamaño

En todos estos casos, se aprovecha el **almacenamiento ya integrado en cada equipo**, lo que simplifica la instalación y evita la necesidad de adquirir unidades externas adicionales para los puestos individuales.

Esto demuestra que la capacidad de almacenamiento se ha adaptado al perfil de cada puesto, manteniendo siempre la ventaja de rendimiento que aporta la tecnología SSD.

## Sistema de almacenamiento del servidor

El almacenamiento más importante del sistema se encuentra en el **servidor central**, ya que es el encargado de alojar buena parte de los datos corporativos y de los servicios compartidos de la organización.

Para ello, la empresa dispondrá de **3 discos duros Seagate IronWolf Pro NAS HDD**, destinados al almacenamiento del servidor principal. Estas tres unidades se utilizarán para formar un sistema **RAID 5**, lo que permite combinar capacidad, tolerancia a fallos y continuidad del servicio.

En esta configuración, los discos del servidor no son los mismos que utilizan los puestos de trabajo, sino un sistema de almacenamiento específico y centralizado para la infraestructura. Mientras que los ordenadores y portátiles usarán los SSD que ya incorporan de fábrica, el servidor contará con estos **3 HDD dedicados** para almacenar la información compartida de toda la empresa.

El uso de **RAID 5** tiene varias ventajas dentro del proyecto:

- Permite combinar capacidad y redundancia
- Ofrece tolerancia al fallo de un disco
- Mejora la continuidad del servicio
- Resulta más adecuado para almacenamiento centralizado que depender de un único disco

En una configuración RAID 5, los datos se reparten entre los distintos discos junto con información de paridad. Esto significa que, si uno de los discos falla, el sistema puede seguir funcionando y los datos pueden reconstruirse a partir de la información restante. Por tanto, no solo se busca almacenar información, sino también protegerla frente a fallos físicos de hardware.

En este proyecto, este almacenamiento del servidor se destina a:

- Archivos compartidos de la empresa
- Documentación interna
- Recursos de red
- Posibles perfiles de usuario
- Servicios internos como intranet, FTP o almacenamiento común
- Información operativa del club

## Capacidad de almacenamiento necesaria

La capacidad de almacenamiento necesaria no es la misma en todos los equipos.

En los puestos estándar y en los portátiles, **512 GB SSD** es una cantidad suficiente para cubrir las necesidades habituales de trabajo. Estos equipos no están pensados para almacenar grandes volúmenes de datos localmente, sino para acceder a recursos compartidos del sistema.

En los equipos más potentes, la capacidad crece porque el tipo de trabajo también es más exigente:

- **512 GB SSD** en equipos superiores
- **1 TB SSD** en la workstation de IT
- **2 TB SSD** en el equipo a medida de alto rendimiento

En el servidor, la capacidad se amplía mucho más, ya que centraliza el almacenamiento compartido de toda la organización. Al utilizar **3 discos HDD Seagate IronWolf Pro NAS HDD** en **RAID 5**, el sistema dispone de un volumen de almacenamiento mucho mayor que el de cualquier puesto individual, algo imprescindible para soportar archivos comunes, documentación interna y crecimiento futuro.

Por tanto, la infraestructura no plantea una única solución de almacenamiento para todos los casos, sino una distribución escalonada según la función de cada equipo.

## Ventajas de cada tipo de almacenamiento

### Ventajas del SSD

El uso de **SSD** ofrece varias ventajas importantes dentro del entorno del proyecto:

- Mayor velocidad de arranque del sistema operativo
- Menor tiempo de carga de programas y aplicaciones
- Mejor rendimiento general del equipo
- Menor ruido, al no disponer de partes mecánicas móviles
- Menor sensibilidad a golpes o vibraciones

Estas características hacen que el SSD sea la mejor opción para los equipos con los que trabajan directamente los usuarios. Por este motivo, en los ordenadores de sobremesa, workstations y portátiles del sistema se utilizará el **almacenamiento incorporado en cada equipo**, basado en unidades SSD, ya que este tipo de soporte resulta más adecuado para el trabajo diario.

### Ventajas del HDD

Por su parte, el **HDD** sigue siendo una opción muy útil en el servidor por motivos diferentes:

- Mayor capacidad por menor coste
- Adecuado para almacenar grandes volúmenes de datos
- Solución razonable para almacenamiento centralizado
- Buen equilibrio entre capacidad, fiabilidad y coste en entornos de empresa

Aunque su velocidad es inferior a la de un SSD, en este proyecto su función principal no es ofrecer la máxima rapidez a un único usuario, sino proporcionar almacenamiento centralizado para toda la organización.

En este caso, la empresa dispondrá de **3 discos duros Seagate IronWolf Pro NAS HDD**, destinados al **almacenamiento en RAID 5 del servidor principal**. Esta elección resulta adecuada porque se trata de discos orientados a funcionamiento continuado y a entornos donde la fiabilidad del almacenamiento es especialmente importante.

## Uso previsto del almacenamiento

El almacenamiento del sistema se ha planteado según el uso previsto de cada parte de la infraestructura.

En los **equipos de usuario**, el almacenamiento se orienta principalmente a la rapidez de uso y a guardar el sistema operativo, los programas y los archivos de trabajo local. En estos casos, se empleará el **almacenamiento SSD incorporado en los propios equipos**, tanto en los ordenadores de sobremesa como en los portátiles.

En los **equipos de mayor rendimiento**, como los puestos superiores de Prensa y Marketing, las workstations de Soporte IT o el equipo a medida, también se utilizará el almacenamiento SSD incorporado en cada ordenador. En estos casos, además de la rapidez, también se necesita una mayor capacidad, ya que pueden manejarse archivos más pesados, proyectos multimedia, herramientas técnicas o software más exigente.

En el **servidor principal**, el almacenamiento tiene una función distinta. Aquí no se busca tanto la velocidad de uso individual como la **centralización, disponibilidad y protección de los datos corporativos**. Para ello, se utilizarán **3 discos Seagate IronWolf Pro NAS HDD**, configurados en **RAID 5**.

Este sistema permite que la información quede repartida entre los discos junto con datos de paridad, de forma que, si uno de ellos falla, el servidor puede seguir funcionando sin perder inmediatamente el acceso a la información. De esta manera, el almacenamiento del servidor se orienta a:

- Archivos compartidos de la empresa
- Documentación interna
- Recursos comunes de red
- Información operativa del club
- Servicios centralizados del sistema

Así, el diseño del almacenamiento diferencia claramente entre dos niveles:

- **Almacenamiento local**, usando los SSD incorporados en los equipos de usuario
- **Almacenamiento centralizado**, usando discos HDD en RAID 5 en el servidor principal

## Conclusión

El sistema de almacenamiento propuesto combina distintas tecnologías según las necesidades reales del proyecto. Los **SSD** se utilizan en los equipos de sobremesa, workstations y portátiles, aprovechando las unidades incorporadas en cada dispositivo para garantizar rapidez, fluidez y productividad en el trabajo diario.

Por otro lado, el servidor principal utilizará **3 discos Seagate IronWolf Pro NAS HDD** configurados en **RAID 5**, una solución más adecuada para el almacenamiento centralizado de la empresa. Esta configuración aporta una mayor capacidad total y, al mismo tiempo, mejora la tolerancia a fallos frente a la avería de uno de los discos.

En conjunto, esta propuesta demuestra una gestión coherente del almacenamiento a nivel físico, diferenciando entre el almacenamiento local de los usuarios y el almacenamiento centralizado del servidor. De este modo, la infraestructura combina velocidad, capacidad, seguridad y continuidad del servicio de forma adaptada a cada tipo de equipo.