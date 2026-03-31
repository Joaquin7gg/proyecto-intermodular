# Descripción de servicios configurados

## Índice

1. [Servidor de archivos](#servidor-de-archivos)
2. [Servidor de impresión](#servidor-de-impresión)
3. [Servidor FTP](#servidor-ftp)
4. [Intranet](#intranet)
5. [Scripts de administración](#scripts-de-administración)
6. [Escritorio Remoto](#escritorio-remoto)
7. [Raid 5](#raid-5)

---

Una vez completada la instalación del sistema operativo, la configuración del dominio y la gestión de usuarios, se procedió a implementar diversos servicios en el servidor con el objetivo de proporcionar funcionalidades adicionales a la infraestructura del club.

Entre los servicios configurados se encuentran el servidor de archivos, el servidor de impresión, el servidor FTP, la intranet corporativa, scripts de administración, acceso remoto al servidor y la configuración de almacenamiento mediante RAID.

Estos servicios permiten ofrecer recursos compartidos a los distintos departamentos y mejorar la administración del sistema.

## Servidor de archivos

Una vez creada la estructura de usuarios y grupos en Active Directory, se procedió a configurar el servidor de archivos.

Para ello se creó una carpeta principal llamada:

Datos

Dentro de esta carpeta se crearon subcarpetas para cada uno de los departamentos del club, permitiendo organizar los recursos de forma estructurada y facilitar el acceso a la información correspondiente a cada área.

<div align="center">

<img src="capturas/gestion_usuarios/7.png" width="700">

</div>

<div align="center">

*Vista general de las carpetas creadas.*

</div>

## Servidor de impresión

Se implementó un servidor de impresión centralizado mediante el rol **Servicios de impresión y documentos** en Windows Server.

Este servicio permite gestionar de forma centralizada las impresoras disponibles en la organización y controlar qué usuarios o departamentos pueden utilizar cada dispositivo.

Cada departamento del club dispone de acceso a una impresora específica, lo que facilita la organización del sistema de impresión.

<div align="center">

<img src="capturas/servicios/impresora/1.png" width="700">
<img src="capturas/servicios/impresora/2.png" width="700">

</div>

<div align="center">

*Capturas en donde se muestra la instalación del servicio y la impresora ya instalada.*

</div>

Como el club dispone de varias impresoras en red asignadas por departamentos (Prensa y Marketing, Recepción, Soporte IT, Dirección, etc.), la idea es que cada grupo tenga acceso a una impresora en concreto. 

<div align="center">

<img src="capturas/servicios/impresora/3.png" width="700">
<img src="capturas/servicios/impresora/4.png" width="700">

</div>

<div align="center">

*En este caso, la impresora situada en recepción es accesible para Recepción, Tienda oficial y Atención al Socio.*

</div>

La configuración es válida, tal y como se muestra en las siguientes capturas. Para el usuario “Alba Martín”, perteneciente a Recepción, la impresora es accesible. Mientras que, “Javier Sánchez” de Soporte IT, no puede acceder a ella.

<div align="center">

<img src="capturas/servicios/impresora/5.png" width="700">
<img src="capturas/servicios/impresora/6.png" width="700">

</div>

<div align="center">

*Capturas que muestran como “Alba Martín” si puede acceder a la impresora.*

</div>

<div align="center">

<img src="capturas/servicios/impresora/7.png" width="700">


</div>

<div align="center">

*Un usuario de IT no puede acceder a esta impresora.*

</div>

De esta forma, se ha configurado y validado una impresora para cada departamento, garantizando así una administración segura y mantenible.

## Servidor FTP

A continuación, se configuró un servidor FTP utilizando **Internet Information Services (IIS)** que más adelante nos serviría también para configurar la intranet.

Este servicio permite a los usuarios acceder a archivos almacenados en el servidor mediante el protocolo FTP.

Para organizar el acceso, se creó una carpeta FTP con subcarpetas correspondientes a cada departamento del club.

<div align="center">

<img src="capturas/servicios/FTP/1.png" width="700">
<img src="capturas/servicios/FTP/2.png" width="700">

</div>

<div align="center">

*Importante seleccionar Servidor Web primero para luego elegir en servicios de Rol el Servidor FTP.*

</div>

Después, en el directorio C:/FTP, se crearon 7 carpetas correspondientes a cada departamento.

<div align="center">

<img src="capturas/servicios/FTP/3.png" width="700">


</div>

<div align="center">

*Captura que muestra todas las carpetas.*

</div>

Una vez creadas las carpetas, se procedió a agregar el sitio FTP. Durante este paso, se cometió un error en el que se asignó como enlace la dirección IP del propio servidor. Esto provocó que, aunque se produjera la conexión entre cliente y host, el host cerraba de manera instantánea la conexión. Tras investigar, se dio con el error y se procedió a poner en el apartado de "Dirección IP": “Todas las no asignadas” junto al Puerto 21. Del que también se aseguró que estuviera abierto en el Firewall de Windows

<div align="center">

<img src="capturas/servicios/FTP/4.png" width="700">
<img src="capturas/servicios/FTP/5.png" width="700">

</div>

<div align="center">

*Momento de la instalación del servidor FTP y el sitio agregado correctamente con el enlace arreglado.*

</div>

Tras este paso, a cada carpeta creada en FTP se le asignaron los permisos correspondientes. 

<div align="center">

<img src="capturas/servicios/FTP/6.png" width="700">


</div>

<div align="center">

*Ejemplo de como queda una carpeta que pertenece a Atención al Socio.*

</div>

Finalmente, introduciendo en el Explorador de Archivos FTP://srv-club, se podía iniciar sesión con las credenciales correctas.

<div align="center">

<img src="capturas/servicios/FTP/7.png" width="700">


</div>

<div align="center">

*Ejemplo de como queda una carpeta que pertenece a Atención al Socio.*

</div>

Una vez iniciada sesión, hubo que hacer frente a otro problema, el **error 227**. Tras investigar este hecho, se dio con la solución: desactivar la casilla “Usar FTP pasivo” dentro de Opciones de Internet. Al parecer, este modo pasivo indicaba a Windows que se conectara a un puerto cerrado o IP inalcanzable, por lo que la conexión “se rompía”.

<div align="center">

<img src="capturas/servicios/FTP/8.jpg" width="700">
<img src="capturas/servicios/FTP/9.jpg" width="700">

</div>

<div align="center">

*Finalmente se resolvieron estos problemas con algunas dificultades.*

</div>

Al fin, se pudo iniciar sesión. Y como se puede comprobar, los permisos estaban configurados correctamente.

<div align="center">

<img src="capturas/servicios/FTP/10.png" width="700">
<img src="capturas/servicios/FTP/11.png" width="700">

</div>

<div align="center">

*El usuario “amartin”, perteneciente a Recepción, no puede entrar a departamento ajeno, pero si al suyo propio.*

</div>

## Intranet

Para cohesionar el proyecto intermodular, se procedió a la incorporación de una intranet, previamente diseñada en el módulo de **Lenguaje de Marcas** y en la que se introdujeron los datos del módulo de **Bases de datos**. Además, en la sección de "Departamentos", se asignaron permisos para cada uno. De esta forma, cada usuario mediante sus creedenciales puede entrar, o no, al departamento que pinche.

Ya que se había creado anteriormente el servidor web para el servicio FTP, el primer paso en este caso fue la creación de todas las carpetas en la ruta donde estaba alojada la web. Después, una por una, se le asignó a cada carpeta de cada departamento los permisos correspondientes. 

<div align="center">

<img src="capturas/servicios/intranet/1.png" width="700">
<img src="capturas/servicios/intranet/2.png" width="700">

</div>

<div align="center">

*Una vez creadas las carpetas, se les asignó individualmente los permisos correspondientes.*

</div>

Para introducir las creedenciales, se optó por activar la **Autenticación de Windows**.

<div align="center">

<img src="capturas/servicios/intranet/4.png" width="700">
<img src="capturas/servicios/intranet/5.png" width="700">

</div>

<div align="center">

*Capturas en el momento de instalar y activar la Autenticación de Windows.*

</div>

A continuación, **se copió en la ruta** de la intranet los archivos ya diseñados anteriormente en **Visual Code Studio**.

<div align="center">

<img src="capturas/servicios/intranet/6.png" width="700">

</div>

<div align="center">

*Así quedó la ruta donde se aloja el sitio web. Se borraron los archivos de la página por defecto que crea IIS.*

</div>

Para darle prioridad a nuestro index.html, **se elevó a la primera fila** dentro de la sección de Documento predeterminado.

<div align="center">

<img src="capturas/servicios/intranet/7.png" width="700">

</div>

<div align="center">

*Index.html propio como primera opción.*

</div>

Con todo configurado, era el momento de comprobar si este sitio web funcionaba dentro de la sesión de un cliente, ya que en Windows Server si lo hacía. Al principio, el resultado no fue positivo, pero se solucionó **abriendo el puerto 80** en el Firewall de Windows Server.

<div align="center">

<img src="capturas/servicios/intranet/8.png" width="700">

</div>

<div align="center">

*Index.html propio como primera opción.*

</div>

Una vez solucionado esto, era el momento de comprobar si realmente funcionaban los permisos. Para ello, se inició sesión con una cuenta correspondiente a Dirección y Finanzas, procediendo a visitar la intranet.


<div align="center">

<img src="capturas/servicios/intranet/9.png" width="700">
<img src="capturas/servicios/intranet/10.png" width="700">

</div>

<div align="center">

*A la izquierda pantalla de autenticación. A la derecha, el usuario de Dirección y Finanzas, con sus creedenciales, ha podido entrar de manera correca.*

</div>

Pero, ¿qué ocurría si los datos para iniciar sesión eran incorrectos? Aparecía una web de error por defecto que se **decidió cambiar por una propia del club**. Para ello, se procedió a sustituir el archivo 401.htm por 

uno propio. 


<div align="center">

<img src="capturas/servicios/intranet/11.png" width="700">
<img src="capturas/servicios/intranet/12.png" width="700">

</div>

<div align="center">

*Capturas que muestran, primero, la lista de errores y, segundo, el resultado final.*

</div>

## Scripts de administración

Se procedió a instalar dos scripts en Windows Shell. **Ambos para dar de alta o de baja a los usuarios**. Para ello, es escribió el script dentro de un bloc de notas en una ubicación de C:.

<div align="center">

<img src="capturas/servicios/script/1.png" width="700">


</div>

<div align="center">

*Script para dar de alta al usuario.*

</div>

Una vez redactado el Script, dentro de PowerShell se realizaron algunas comprobaciones antes de ejecutarlo. Se usó “Set-ExecutionPolicy RemoteSigned -Scope CurrentUser” para habilitar los scritps locales, y se aseguró de disponer activo del módulo de Active Directory. Tras estos pasos, se ejecutó el script con un resultado positivo.

<div align="center">

<img src="capturas/servicios/script/4.png" width="700">


</div>

<div align="center">

*Momento en el que se ejecutó el script.*

</div>

Para confirmar su funcionamiento, se accedió a IT_Soporte para comprobar que el nuevo usuario aparecía.

<div align="center">

<img src="capturas/servicios/script/5.png" width="700">


</div>

<div align="center">

*El nuevo usuario “Juan Pérez” aparece en Soporte_IT.*

</div>

Tras el éxito del primer script, tocaba realizar uno más para dar de baja a los usuarios.

<div align="center">

<img src="capturas/servicios/script/6.png" width="700">

</div>

<div align="center">

*Script para dar de baja a los usuarios.*

</div>

Se ejecutó el nuevo script con éxito y Juan Pérez desapareció del departamento.

<div align="center">

<img src="capturas/servicios/script/7.png" width="600">
<img src="capturas/servicios/script/8.png" width="600">

</div>

<div align="center">

*Tras ejecutar el script, Juan Pérez desapareció del departamento.*

</div>

## Escritorio Remoto

Para una simulación más realista, se habilitó **Escritorio remoto** desde el servidor local. De esta forma, cualquier empleado de IT puede acceder al Server sin necesidad de acudir al CPD. Para realizarlo, se habilitó en primer luegar y luego se añadieron los permisos. Ya que es un servicio crítico, solo Soporte IT puede acceder a él.

<div align="center">

<img src="capturas/servicios/escrem/1.png" width="700">

</div>

<div align="center">

*Una vez habilitado, se otorgaron los permisos correspondientes.*

</div>

Se comprobó también que el **Firewall** estuviera configurado correctamente, permitiendo la conexión remota.


<div align="center">

<img src="capturas/servicios/escrem/2.png" width="700">

</div>

<div align="center">

*La regla estaba activada por defecto.*

</div>


A través del comando **“mstsc”** se llegó a la aplicación de Escritorio remoto y se conectó de manera satisfactoria. 

<div align="center">

<img src="capturas/servicios/escrem/3.png" width="600">
<img src="capturas/servicios/escrem/4.png" width="600">

</div>

<div align="center">

*Solo faltaba un pequeño ajuste para que funcionara correctamente.*

</div>

Sin embargo, no se podía iniciar sesión. Tras investigar y probar, faltaban por **activar los permisos en la directiva de seguridad local**. A través del comando “secpol.msc”, finalmente se logró.  


<div align="center">

<img src="capturas/servicios/escrem/5.png" width="700">

</div>

<div align="center">

*Lugar en el que se activaron los permisos.*

</div>

Esta vez sí, el inicio de sesión fue correcto, y los usuarios podían iniciar sesión **según sus permisos**.


<div align="center">

<img src="capturas/servicios/escrem/6.png" width="600">
<img src="capturas/servicios/escrem/7.png" width="600">

</div>

<div align="center">

*A la izquierda, usuario de IT en escritorio remoto. A la derecha, usuario de Finanzas no puede entrar.*

</div>

## Raid 5

Por último, y para un modelo más realista, **se implementó un Raid 5 en el servidor central**. Al ser una máquina virtual, primero se instalaron 3 discos duros desde el menú de VirtualBox, para luego, realizar el Raid desde Administración de discos. Una vez allí, se escogió GPT como modelo de tabla de particiones.

<div align="center">

<img src="capturas/servicios/R5/1.png" width="700">

</div>

<div align="center">

*Captura del momento en el que se inicia Administración de discos.*

</div>

Después, se procedió a **activar el Raid 5**, quedando configurado de manera correcta.


<div align="center">

<img src="capturas/servicios/R5/2.png" width="700">
<img src="capturas/servicios/R5/3.png" width="700">

</div>

<div align="center">

*Raid 5 correctamente configurado.*

</div>
