# Documento de análisis de hardware

## Índice

- [Introducción](#introducción)
- [Equipos necesarios en el sistema](#equipos-necesarios-en-el-sistema)
- [Equipos de red y comunicaciones](#equipos-de-red-y-comunicaciones)
- [Sistema de alimentación y continuidad eléctrica](#sistema-de-alimentación-y-continuidad-eléctrica)
- [Dispositivos de almacenamiento](#dispositivos-de-almacenamiento)
- [Periféricos necesarios](#periféricos-necesarios)
- [Cantidad total de equipos y distribución funcional](#cantidad-total-de-equipos-y-distribución-funcional)
- [Conclusión](#conclusión)

## Introducción

La infraestructura hardware propuesta corresponde a un club de tamaño modesto, con unas necesidades similares a las de una pequeña o mediana empresa. El objetivo principal del sistema es proporcionar un entorno de trabajo estable, seguro y fácil de mantener, sin recurrir a soluciones sobredimensionadas ni excesivamente costosas.

Para ello, se plantea una infraestructura equilibrada compuesta por equipos de usuario, equipos de administración y soporte, dispositivos de red, sistemas de almacenamiento y periféricos. Cada uno de estos elementos cumple una función concreta dentro del sistema y ha sido seleccionado en función de las necesidades reales de la organización.

Este análisis de hardware permite identificar qué equipos son necesarios, cuántas unidades se requieren y cuál es su función dentro de la infraestructura general del proyecto.

## Equipos necesarios en el sistema

### Equipos de usuario

Los equipos de usuario son los ordenadores destinados al trabajo diario de la mayoría de empleados del club. Estos puestos están orientados a tareas corporativas habituales, como gestión administrativa, uso de aplicaciones ofimáticas, correo electrónico, navegación web, acceso a recursos compartidos y uso de aplicaciones internas.

Para cubrir estas necesidades se han previsto:

- **16 ordenadores de sobremesa estándar**
- **16 monitores de 24 pulgadas**
- **6 ordenadores portátiles de apoyo**

Los ordenadores de sobremesa estándar permiten desarrollar el trabajo diario de los distintos departamentos con un buen equilibrio entre rendimiento, coste y facilidad de mantenimiento. Por su parte, los portátiles se utilizarán en salas de reuniones y en tareas que requieran cierta movilidad dentro de la organización.

La función principal de estos equipos es facilitar el acceso de los empleados a la red corporativa, a los servicios centralizados y a las herramientas de trabajo del sistema.

### Equipos de administración y gestión

Dentro del sistema también existen puestos con funciones de dirección, coordinación o gestión interna, que aunque no requieren una potencia extrema, sí necesitan equipos fiables y preparados para un uso profesional continuado.

En este grupo se incluyen principalmente los equipos de sobremesa estándar ya mencionados, distribuidos entre departamentos como recepción, administración, dirección y finanzas. Estos equipos permiten gestionar documentación, comunicaciones internas, bases de datos, acceso a intranet y tareas organizativas del club.

Además, las salas de reuniones cuentan con recursos de apoyo, como portátiles y televisiones de gran formato, que facilitan la coordinación entre departamentos, la presentación de informes y la realización de reuniones corporativas.

### Equipos de mayor rendimiento para tareas específicas

No todos los departamentos tienen las mismas necesidades. Existen áreas que requieren un nivel de potencia superior debido al tipo de trabajo que realizan.

#### Departamento de Prensa y Marketing

Para este departamento se han previsto:

- **1 equipo de alto rendimiento diseñado a medida**
- **2 ordenadores de sobremesa con configuración superior**
- **3 monitores de 27 pulgadas con panel IPS**

Estos equipos están pensados para tareas de diseño gráfico, edición de contenido visual, tratamiento de imágenes, creación de material publicitario y multitarea más exigente. Necesitan mayor memoria RAM, mejor procesador y pantallas de mayor calidad visual que los puestos estándar.

#### Departamento de Soporte IT

Para el personal técnico se han previsto:

- **3 estaciones de trabajo profesionales**
- **3 monitores de 27 pulgadas**
- **1 portátil de alto rendimiento**

Estos equipos están destinados a auditorías, virtualización, diagnóstico de incidencias, administración de sistemas, pruebas técnicas y otras funciones avanzadas. En este caso, el hardware debe ofrecer un rendimiento superior al habitual, ya que el departamento de IT trabaja con herramientas especializadas y cargas de trabajo más complejas.

La existencia de estos equipos de alto rendimiento permite adaptar la infraestructura a las necesidades reales de cada área, evitando que todos los puestos tengan el mismo coste y prestaciones cuando no es necesario.

## Equipos de red y comunicaciones

La infraestructura necesita además varios dispositivos de red para garantizar la conectividad entre todos los equipos, el acceso a Internet y la comunicación entre departamentos.

### Servidor central

- **2 servidores central**

El servidor es uno de los elementos más importantes del sistema. Su función es centralizar servicios de red y recursos compartidos, como autenticación de usuarios, archivos, intranet, DNS, FTP o servicios internos de empresa. También permite organizar mejor la información y mejorar la seguridad de la infraestructura.

### Switch multicapa

- **1 switch multicapa de capa 3**

Este dispositivo actúa como núcleo de la red. Su función es interconectar distintas VLANs o segmentos de red y permitir el enrutamiento interno entre ellos. Gracias a ello, la red puede organizarse de forma más segura y eficiente.

### Switches de acceso

- **2 switches de acceso**

Se encargan de conectar los equipos finales de cada planta, como ordenadores, impresoras o puntos de acceso WiFi. Son fundamentales para distribuir la conectividad de red a los distintos puestos de trabajo.

### Router

- **1 router empresarial**

Su función principal es proporcionar salida a Internet y gestionar funciones como NAT y parte de la seguridad perimetral básica. Actúa como punto de enlace entre la red interna y el exterior.

### Puntos de acceso inalámbrico

- **2 puntos de acceso WiFi**

Permiten ofrecer conectividad inalámbrica en salas de reuniones y zonas donde se utilizan portátiles. Se trata de una solución profesional, más adecuada que un router doméstico, ya que permite mejor cobertura, mayor seguridad y una integración más correcta en la red corporativa.

### Cableado de red

- **36 cables Ethernet Cat6**

El cableado de red es el medio físico que conecta la mayoría de dispositivos del sistema. Garantiza una conectividad estable, rápida y segura entre ordenadores, impresoras, switches, router y servidor. Además, se ha previsto un pequeño margen adicional para futuras ampliaciones o sustituciones.

## Sistema de alimentación y continuidad eléctrica

Para proteger los equipos críticos del sistema se ha previsto:

- **1 SAI (Sistema de Alimentación Ininterrumpida)**

Este dispositivo permite mantener temporalmente en funcionamiento el servidor y los equipos principales de red en caso de corte eléctrico. Su función es evitar apagados bruscos, reducir el riesgo de pérdida de datos y proteger la infraestructura frente a picos de tensión o incidencias eléctricas.

Se trata de un elemento especialmente importante en el CPD, ya que contribuye a la continuidad del servicio y a la protección del hardware más sensible.

## Dispositivos de almacenamiento

El sistema de almacenamiento es esencial para garantizar la conservación, disponibilidad y protección de la información.

### Almacenamiento del servidor

- **3 discos duros de alta capacidad**

Estos discos se instalan en el servidor central y se configuran en **RAID 5**, lo que permite mantener el servicio operativo aunque falle uno de los discos. Este sistema mejora la tolerancia a fallos y aumenta la seguridad de los datos almacenados.

Su función es guardar archivos compartidos, documentación interna, copias de seguridad operativas y servicios centralizados del club.

### Unidades USB corporativas

- **22 unidades USB de 1 TB**

Cada empleado dispone de una unidad de almacenamiento USB corporativa. Su función es permitir el transporte o almacenamiento puntual de información de trabajo sin necesidad de utilizar dispositivos personales externos. Esta medida ayuda a reducir riesgos de seguridad, como la introducción de malware o el uso de soportes no autorizados.

## Periféricos necesarios

Además de los equipos principales, el sistema necesita distintos periféricos que complementan el trabajo diario de los usuarios.

### Monitores

- **17 monitores de 24 pulgadas**
- **5 monitores de 27 pulgadas con panel IPS**

Los monitores son necesarios para proporcionar salida visual a los ordenadores. Se han diferenciado dos tamaños según el uso: los de 24 pulgadas para puestos estándar y los de 27 pulgadas para departamentos que necesitan mayor espacio de trabajo o mejor fidelidad de imagen.

### Impresoras

- **6 impresoras multifunción de red**

Las impresoras permiten cubrir las necesidades de impresión, escaneo y gestión documental de los diferentes departamentos. Al tratarse de impresoras en red, pueden ser compartidas por varios usuarios. Además, se ha optado por un modelo de renting, lo que simplifica el mantenimiento y el suministro de consumibles.

### Televisiones para salas de reuniones

- **3 televisiones de 55 pulgadas**

Se utilizan como soporte visual en reuniones, presentaciones corporativas, formación interna o visualización de contenidos compartidos. Son especialmente útiles en entornos colaborativos y mejoran la comunicación interna.

### Teclado y ratón

Aunque no aparezcan de forma independiente en el inventario principal, también forman parte del hardware necesario de cada puesto de trabajo. Su función es permitir la interacción directa con los equipos informáticos de forma cómoda y eficiente.

## Cantidad total de equipos y distribución funcional

A nivel global, la infraestructura hardware queda compuesta por los siguientes elementos principales:

- 1 servidor central
- 1 switch multicapa
- 2 switches de acceso
- 1 router
- 2 puntos de acceso WiFi
- 1 SAI
- 36 cables Ethernet
- 16 ordenadores de sobremesa estándar
- 2 ordenadores de sobremesa de alto rendimiento para Prensa y Marketing
- 1 ordenador de sobremesa a medida de última generación para Prensa y Marketing
- 3 estaciones de trabajo HP Z4 G5 para  Soporte IT
- 16 monitores de 24”
- 5 monitores de 27”
- 6 portátiles estándar
- 1 portátil de alto rendimiento para IT
- 3 discos duros para el servidor
- 22 unidades USB corporativas
- 6 impresoras multifunción
- 3 televisiones para reuniones

Esta distribución responde a una infraestructura ajustada al tamaño de la organización, donde cada equipo tiene una función concreta y justificada. No se plantea un hardware excesivo, sino una solución proporcionada a las necesidades reales del entorno de trabajo.

## Conclusión

El análisis de hardware realizado demuestra que el sistema necesita una combinación equilibrada de equipos de usuario, equipos técnicos especializados, dispositivos de red, almacenamiento y periféricos. La propuesta cubre tanto las necesidades diarias de los empleados como los requisitos técnicos de áreas más exigentes, como Prensa y Marketing o Soporte IT.

Además, la infraestructura prioriza aspectos clave para una pyme, como la fiabilidad, la seguridad, la continuidad del servicio y la facilidad de mantenimiento. De este modo, el club dispone de una base hardware coherente, funcional y preparada para sostener el correcto funcionamiento del sistema diseñado.