# Plan de implantación

## Índice

1. [Introducción](#1-introducción)
2. [Implantación en entorno simulado](#2-implantación-en-entorno-simulado)
3. [Implantación en un entorno real](#3-implantación-en-un-entorno-real)
4. [Instalación del servidor](#4-instalación-del-servidor)
5. [Instalación de los equipos cliente](#5-instalación-de-los-equipos-cliente)
6. [Sistemas operativos implantados](#6-sistemas-operativos-implantados)
7. [Integración en la infraestructura](#7-integración-en-la-infraestructura)
8. [Validación del sistema](#8-validación-del-sistema)

---

## 1. Introducción

El objetivo de este plan de implantación es definir el proceso mediante el cual se desplegarán los sistemas operativos y servicios dentro de la infraestructura del club.

En este proyecto, el entorno ha sido implementado mediante **máquinas virtuales**, lo que permite simular una infraestructura completa sin necesidad de disponer de hardware físico. Esta decisión facilita la realización de pruebas, la documentación del proceso y la validación de los servicios antes de su posible despliegue en un entorno real.

No obstante, el procedimiento descrito a continuación también refleja cómo se llevaría a cabo una implantación profesional en una organización real.

---

## 2. Implantación en entorno simulado

En este proyecto se ha utilizado **VirtualBox** para crear un entorno virtual en el que se han desplegado los distintos sistemas operativos.

Este entorno virtual permite simular:

- Un servidor central
- Equipos cliente
- Diferentes sistemas operativos
- Servicios de red corporativos

El uso de virtualización permite realizar pruebas de configuración, verificar la conectividad entre equipos y comprobar el correcto funcionamiento de los servicios antes de su implantación definitiva.

La instalación de los sistemas operativos y su configuración se documenta detalladamente en el apartado **Documentación de la instalación del sistema**.

---

## 3. Implantación en un entorno real

En un entorno corporativo real, la implantación de sistemas operativos en una infraestructura de aproximadamente **22 equipos** se realizaría siguiendo un procedimiento estructurado y planificado.

En primer lugar, se definiría el **servidor central**, que actuaría como núcleo de la infraestructura y alojaría los servicios principales de la organización.

Posteriormente se procederá a la instalación de los sistemas operativos en los distintos equipos de la organización.

Dependiendo del caso, los equipos pueden llegar con el sistema operativo preinstalado por el fabricante. En caso contrario, el departamento de IT debe realizar la instalación manual utilizando medios de instalación oficiales.

---

## 4. Instalación del servidor

El primer sistema que debe implantarse es el **servidor central**, ya que será el encargado de gestionar el dominio, los usuarios y los recursos compartidos de la organización.

En este caso se utilizará **Windows Server 2022**, que permitirá implementar servicios fundamentales como:

- Active Directory
- DNS
- Gestión centralizada de usuarios
- Servidor de archivos
- Servidor de impresión
- administración remota (RDP)

La instalación del servidor debe realizarse utilizando **licencias oficiales de Microsoft**, garantizando el cumplimiento de los requisitos legales y de seguridad.

Una vez instalado el sistema operativo, el servidor será configurado como **controlador de dominio**, permitiendo la administración centralizada de los equipos cliente.

### Administración remota mediante Escritorio Remoto

Para facilitar la administración del servidor sin necesidad de acceder físicamente al CPD, se habilitará el acceso remoto mediante **Escritorio Remoto (Remote Desktop Protocol - RDP)**.

Esta herramienta permite al personal del departamento de IT conectarse al servidor desde otros equipos de la red corporativa y gestionarlo como si estuvieran trabajando directamente en él.

Entre las principales ventajas del uso de Escritorio Remoto se encuentran:

- Administración remota del servidor desde cualquier equipo autorizado de la red
- Acceso completo al entorno gráfico del servidor
- Posibilidad de realizar tareas de mantenimiento y configuración sin desplazarse al CPD
- Mayor eficiencia en la gestión de la infraestructura

El acceso remoto se controlará mediante permisos asignados únicamente al personal autorizado del departamento de IT, garantizando así la seguridad del sistema.

---

## 5. Instalación de los equipos cliente

Una vez configurado el servidor, se procede a la instalación de los sistemas operativos en los equipos cliente de la organización.

En este proyecto se han contemplado aproximadamente **22 equipos de trabajo**, distribuidos entre distintos departamentos.

La instalación de los sistemas operativos puede realizarse de distintas formas:

### Instalación manual

En entornos pequeños o medianos, el departamento de IT puede instalar el sistema operativo **equipo por equipo**, utilizando un dispositivo USB de instalación oficial.

Este proceso consiste en:

1. Arrancar el equipo desde el medio de instalación.
2. Seleccionar el sistema operativo correspondiente.
3. Configurar el disco duro.
4. Completar la instalación del sistema.
5. Instalar actualizaciones y controladores.

Este procedimiento sería viable para una organización con un número reducido de equipos como el presente caso. Y por ello, asi se haría para este proyecto: **se realizaría una instalación manual y atendida**, es decir, se iría supervisando paso por paso.

### Instalación automatizada

En entornos empresariales más grandes, lo habitual es utilizar herramientas de despliegue automatizado y con una instalación desatentida como:

- Windows Deployment Services (WDS)
- Microsoft Deployment Toolkit (MDT)
- System Center Configuration Manager (SCCM)

Estas herramientas permiten instalar el sistema operativo en múltiples equipos de forma simultánea mediante la red, pero en este proyecto no se usará.

---

## 6. Sistemas operativos implantados

En el entorno descrito se han seleccionado los siguientes sistemas operativos:

### Windows Server 2022

Utilizado como servidor principal de la infraestructura.

### Windows 11 Pro

Utilizado en la mayoría de los equipos cliente de los distintos departamentos.

### Ubuntu Desktop

Utilizado en algunos equipos técnicos, especialmente en áreas relacionadas con soporte técnico o tareas especializadas.

### Kali Linux

Utilizado por el departamento de IT para tareas relacionadas con seguridad informática y pruebas de auditoría interna.

---

## 7. Integración en la infraestructura

Una vez instalados los sistemas operativos, los equipos cliente deben integrarse dentro de la infraestructura corporativa.

Esto implica:

- Configurar la red
- Establecer la comunicación con el servidor
- Integrar los equipos en el dominio corporativo
- Aplicar las políticas de seguridad

Una vez completados estos pasos, los equipos estarán preparados para utilizar los servicios de la organización.

---

## 8. Validación del sistema

Tras completar la implantación de los sistemas operativos, el departamento de IT debe verificar que todos los equipos funcionan correctamente dentro de la infraestructura.

Entre las comprobaciones habituales se incluyen:

- conectividad con el servidor
- resolución de nombres
- acceso a recursos compartidos
- inicio de sesión en el dominio
- funcionamiento de los servicios corporativos

Una vez realizadas estas comprobaciones, el entorno se considera listo para su uso por parte de los distintos departamentos.