**Proyecto:** Proyecto Intermodular 1º ASIR<br>
**Módulo:** Fundamentos de Hardware<br>
**Alumno:** Joaquín Luis García García

## Índice

- [Análisis de necesidades](Análisis-de-necesidades.md)
- [Componentes del sistema](Componentes-del-sistema.md)
- [Configuración de hardware propuesta](Configuración-de-hardware-propuesta.md)
- [Sistema de almacenamiento](Sistema-de-almacenamiento.md)
- [Mejora o evolución del sistema](Mejora-o-evolución-del-sistema.md)

## Descripción

Este directorio recoge los documentos correspondientes al módulo de **Fundamentos de hardware**, dentro del proyecto intermodular de **1º ASIR**.

En este apartado se muestra la documentación de un repositorio relacionado con la infraestructura hardware propuesta para un club con necesidades similares a las de una pequeña o mediana empresa.

## Objetivos

- Diseñar una infraestructura hardware adaptada a las necesidades reales de cada departamento
- Diferenciar entre equipos estándar, equipos avanzados y estaciones de trabajo
- Proponer un sistema de almacenamiento equilibrado entre velocidad, capacidad y seguridad
- Mantener una solución escalable y preparada para futuras ampliaciones

## Resumen de la infraestructura

### Equipos de usuario
- **16 equipos estándar**
- **2 equipos estándar mejorados** para Prensa y Marketing
- **1 equipo de alto rendimiento diseñado a medida** para Prensa y Marketing
- **3 workstations HP Z4 G5** para Soporte IT

### Portátiles
- **6 Dell Latitude 5440**
- **1 Lenovo ThinkPad T16 Gen 2** para IT

### Red y comunicaciones
- **1 servidor principal**
- **1 switch multicapa**
- **2 switches de acceso**
- **1 router**
- **2 puntos de acceso WiFi**
- **1 SAI**
- **36 cables Ethernet Cat6**

### Periféricos
- **17 monitores de 24”**
- **5 monitores de 27”**
- **6 impresoras multifunción**
- **3 televisiones de 55”**
- **22 unidades USB corporativas**

## Perfiles de hardware principales

### Equipo estándar
Pensado para tareas de oficina, gestión administrativa, navegación web, correo electrónico y uso de aplicaciones corporativas.

- Intel Core i5-14500 vPro
- 16 GB DDR5
- 512 GB SSD NVMe
- Gráficos integrados

### Equipo estándar mejorado
Destinado a Prensa y Marketing para tareas con mayor carga de multitarea y trabajo visual.

- Intel Core Ultra 7 265
- 32 GB DDR5
- 512 GB SSD NVMe
- Gráficos integrados

### Workstation de IT
Equipo profesional orientado a administración de sistemas, diagnóstico, virtualización y soporte técnico avanzado.

- Intel Xeon W3-2425
- 32 GB DDR5 ECC
- 1 TB SSD NVMe PCIe Gen4
- Chipset Intel W790

### Equipo de alto rendimiento a medida
Puesto especial para Prensa y Marketing, orientado a edición avanzada, diseño y creación de contenido multimedia.

- AMD Ryzen 9 9900X
- GIGABYTE X870 AORUS ELITE WIFI7
- 64 GB DDR5
- NVIDIA GeForce RTX 5070
- Samsung 990 Pro NVMe PCIe 4.0 de 2 TB
- Corsair HX1500i
- DeepCool AK620 Zero Dark
- Corsair 4000D Airflow

## Sistema de almacenamiento

La infraestructura combina almacenamiento local rápido y almacenamiento centralizado:

- **SSD / NVMe** en los equipos de sobremesa y portátiles, para mejorar el arranque, la carga de programas y la respuesta general del sistema.
- **3 discos Seagate IronWolf Pro NAS HDD** en el servidor principal, configurados en **RAID 5**, para almacenamiento centralizado, tolerancia a fallos y mayor capacidad de datos compartidos.


---

