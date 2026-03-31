**Proyecto:** Proyecto Intermodular 1º ASIR<br>
**Módulo:** Gestión de Bases de Datos<br>
**Alumno:** Joaquín Luis García García

# Sistema de gestión de red — Base de datos

## Índice

- [Descripción del proyecto](#descripción-del-proyecto)
- [Diseño de la base de datos](#diseño-de-la-base-de-datos)

- [Diagrama Entidad-Relación](diagramas/modelo-entidad-relacion.drawio.svg)
- [Modelo relacional](diagramas/modelo-relacional.drawio.svg)

- **Scripts SQL**
  - [Creación de la base de datos](script-creacion-base-datos.sql)
  - [Inserción de datos](script-insercion-datos.sql)
  - [Consultas SQL](script-consultas.sql)
  - [Permisos](script-permisos.sql)

- [Tareas básicas de administración](tareas-basicas-de-administracion.md)

- [Tecnologías utilizadas](#tecnologías-utilizadas)

# Gestión de Bases de Datos

Este directorio recoge los documentos correspondientes al módulo de **Gestión de Bases de Datos**, dentro del proyecto intermodular de **1º ASIR**.

En este apartado se muestra el diseño de una base de datos relacionada con la gestión de la infraestructura informática y la red de un club de fútbol.

## Descripción del proyecto

Este proyecto implementa una base de datos para gestionar la infraestructura informática de un club de fútbol.

El sistema permite almacenar información sobre:

- departamentos del club
- plantas del edificio
- VLAN de red
- dispositivos informáticos
- empleados
- relación entre empleados y dispositivos

La base de datos está diseñada para facilitar la administración de los recursos tecnológicos de la organización y permitir consultas sobre la distribución de equipos en la red.

---

# Diseño de la base de datos

El diseño se ha realizado siguiendo el modelo **Entidad–Relación**, que posteriormente se ha transformado en el modelo relacional implementado en MySQL.

Las principales entidades del sistema son:

- Planta
- Departamento
- VLAN
- Dispositivo
- Empleado

Además, se ha creado una tabla intermedia para gestionar relaciones **N:M** entre empleados y dispositivos.

---

# Modelo relacional

## Tabla `planta`

Representa las distintas plantas del edificio donde se ubican los equipos.

### Campos

| Campo | Tipo | Descripción |
|------|------|-------------|
| id_planta | INT | Identificador de la planta |
| nombre | VARCHAR | Nombre o descripción de la planta |

Ejemplo:

- Planta 1 (oficinas)
- Planta 2 (dirección y CPD)

---

## Tabla `departamento`

Contiene los departamentos del club.

Cada departamento pertenece a una planta.

### Campos

| Campo | Tipo | Descripción |
|------|------|-------------|
| id_departamento | INT | Identificador del departamento |
| id_planta | INT | Planta donde se ubica |
| nombre | VARCHAR | Nombre del departamento |

Ejemplos de departamentos:

- Recepción
- Taquilla y atención al socio
- Prensa y Marketing
- Dirección y Finanzas
- Cuerpo técnico
- Soporte IT
- Tienda oficial

---

## Tabla `vlan`

Define las VLAN utilizadas en la red para segmentar los distintos departamentos.

### Campos

| Campo | Tipo | Descripción |
|------|------|-------------|
| id_vlan | INT | Identificador interno |
| numero_vlan | INT | Número de VLAN |
| nombre | VARCHAR | Nombre descriptivo |
| red | VARCHAR | Red asignada |

### Ejemplo de VLAN

| VLAN | Nombre | Red |
|-----|------|------|
| 10 | Dirección y Finanzas | 192.168.10.0/24 |
| 20 | Marketing | 192.168.20.0/24 |
| 40 | Recepción | 192.168.40.0/24 |
| 50 | Tienda | 192.168.50.0/24 |
| 60 | Cuerpo técnico | 192.168.60.0/24 |
| 99 | Gestión IT | 192.168.99.0/24 |

---

## Tabla `dispositivo`

Almacena todos los dispositivos conectados a la red.

### Campos

| Campo | Tipo | Descripción |
|------|------|-------------|
| id_dispositivo | INT | Identificador del dispositivo |
| id_departamento | INT | Departamento al que pertenece |
| id_vlan | INT | VLAN de red |
| direccion_ip | VARCHAR | Dirección IP (solo fija para algunos dispositivos) |
| tipo | VARCHAR | Tipo de dispositivo |
| nombre_dispositivo | VARCHAR | Nombre identificativo |

### Tipos de dispositivos registrados

- PC corporativo
- estación de trabajo
- portátil
- impresora
- servidor
- switch
- router
- controladora WiFi
- punto de acceso
- televisión

Los equipos de usuario utilizan **DHCP**, mientras que **servidores e impresoras tienen IP fija**.

---

## Tabla `empleado`

Contiene los trabajadores del club.

### Campos

| Campo | Tipo | Descripción |
|------|------|-------------|
| id_empleado | INT | Identificador |
| id_departamento | INT | Departamento |
| nombre_completo | VARCHAR | Nombre del empleado |

---

## Tabla `empleado_dispositivo`

Tabla intermedia para gestionar la relación entre empleados y dispositivos.

Se utiliza porque un empleado puede utilizar varios dispositivos y un dispositivo puede estar asociado a distintos usuarios.

### Campos

| Campo | Tipo | Descripción |
|------|------|-------------|
| id_empleado | INT | Empleado |
| id_dispositivo | INT | Dispositivo |

---

# Relaciones entre tablas

Las relaciones principales del modelo son:

- **planta → departamento** (1:N)
- **departamento → empleado** (1:N)
- **departamento → dispositivo** (1:N)
- **vlan → dispositivo** (1:N)
- **empleado ↔ dispositivo** (N:M)

Esto permite representar de forma flexible la estructura organizativa y tecnológica del club.

---

# Infraestructura de red modelada

La base de datos refleja la infraestructura definida en el diseño de red del proyecto.

El **CPD principal se encuentra en la planta 2**, donde se ubican:

- router corporativo
- switch multicapa
- controladora WiFi
- servidores
- switch de acceso

En la **planta 1** existe un armario de comunicaciones con un switch de acceso que conecta los equipos de esa planta con el núcleo de red.

Los dispositivos están organizados en diferentes VLAN según el departamento al que pertenecen.

---

# Tecnologías utilizadas

- MySQL / MariaDB
- SQL (DDL, DML y DCL)
- phpMyAdmin

---