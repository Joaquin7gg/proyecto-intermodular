## Índice

- [Direccionamiento por VLAN](#direccionamiento-por-vlan)
- [Explicación del direccionamiento](#explicación-del-direccionamiento)
- [Evolución del modelo de direccionamiento](#evolución-del-modelo-de-direccionamiento)
- [Direccionamiento de dispositivos principales](#direccionamiento-de-dispositivos-principales)
- [Direccionamiento de equipos de usuario](#direccionamiento-de-equipos-de-usuario)
  - [Planta 1](#planta-1)
  - [Planta 2](#planta-2)
- [Observaciones](#observaciones)

## Direccionamiento por VLAN

A continuación se muestra la tabla de direccionamiento IP utilizada en la infraestructura de red. Cada VLAN dispone de su propia subred **/24**, lo que facilita la administración de la red y permite una clara separación entre departamentos.

| VLAN | Nombre | Red | Máscara | Gateway | Rango de hosts | Broadcast |
|------|--------|-----|---------|---------|----------------|-----------|
| 10 | Dirección y Finanzas | 192.168.10.0/24 | 255.255.255.0 | 192.168.10.1 | 192.168.10.2 - 192.168.10.254 | 192.168.10.255 |
| 20 | Marketing y Prensa | 192.168.20.0/24 | 255.255.255.0 | 192.168.20.1 | 192.168.20.2 - 192.168.20.254 | 192.168.20.255 |
| 30 | Servidores | 192.168.30.0/24 | 255.255.255.0 | 192.168.30.1 | 192.168.30.2 - 192.168.30.254 | 192.168.30.255 |
| 40 | Recepción / Taquilla | 192.168.40.0/24 | 255.255.255.0 | 192.168.40.1 | 192.168.40.2 - 192.168.40.254 | 192.168.40.255 |
| 50 | Tienda oficial | 192.168.50.0/24 | 255.255.255.0 | 192.168.50.1 | 192.168.50.2 - 192.168.50.254 | 192.168.50.255 |
| 60 | Cuerpo técnico | 192.168.60.0/24 | 255.255.255.0 | 192.168.60.1 | 192.168.60.2 - 192.168.60.254 | 192.168.60.255 |
| 70 | WLAN_empleados | 192.168.70.0/24 | 255.255.255.0 | 192.168.70.1 | 192.168.70.2 - 192.168.70.254 | 192.168.70.255 |
| 80 | WLAN_invitados | 192.168.80.0/24 | 255.255.255.0 | 192.168.80.1 | 192.168.80.2 - 192.168.80.254 | 192.168.80.255 |
| 99 | Gestión IT | 192.168.99.0/24 | 255.255.255.0 | 192.168.99.1 | 192.168.99.2 - 192.168.99.254 | 192.168.99.255 |

---

## Explicación del direccionamiento

El esquema de direccionamiento sigue un criterio sencillo y fácil de administrar:

- El **tercer octeto coincide con el número de VLAN**, lo que facilita identificar rápidamente a qué red pertenece cada dispositivo.
- Cada VLAN dispone de **hasta 254 direcciones disponibles**, suficientes para el tamaño de la infraestructura.
- La **dirección .1 se reserva para la puerta de enlace**, configurada en el switch multicapa.
- La **dirección .255 se reserva como dirección de broadcast**, utilizada para comunicaciones de difusión dentro de la red.

Este esquema facilita la **escalabilidad, administración y resolución de problemas de red**.

---

## Evolución del modelo de direccionamiento

Originalmente, la infraestructura se configuró utilizando un modelo de **direccionamiento estático**. En esta primera fase, cada equipo de usuario y dispositivo de red tenía asignada una IP fija manualmente. Si bien esto permitió las pruebas iniciales de conectividad, luego se transformó en un modelo más realista implementando DHCP.

Tras la implementación de los servicios de red en el Switch Multicapa, se ha realizado una transición hacia un modelo mixto:

* **Direccionamiento Estático (Infraestructura y Servicios):** Equipos críticos como el WLC, el Access Point, las impresoras y especialmente los **Servidores**, mantienen su configuración estática. En una infraestructura profesional, esto es fundamental para garantizar que los servicios estén siempre en una dirección fija, evitando que los clientes pierdan el acceso por un cambio de IP inesperado.
* **Direccionamiento Dinámico (Equipos de Usuario):** Se ha migrado a un modelo **DHCP (Dynamic Host Configuration Protocol)** para los PCs y dispositivos inalámbricos. Esto elimina la carga administrativa de configurar cada terminal uno a uno, evita conflictos de IPs duplicadas y permite una gestión ágil de los dispositivos móviles (portátiles y smartphones) que se conectan y desconectan de la red.

Este esquema híbrido combina la **estabilidad** necesaria en los servicios del CPD con la **flexibilidad** requerida por los usuarios finales.

---

## Direccionamiento de dispositivos principales

| Dispositivo | VLAN | Dirección IP | Máscara | Gateway | Observaciones |
|-------------|------|--------------|---------|---------|---------------|
| Switch multicapa - SVI VLAN 10 | 10 | 192.168.10.1 | 255.255.255.0 | — | Gateway de Dirección y Finanzas |
| Switch multicapa - SVI VLAN 20 | 20 | 192.168.20.1 | 255.255.255.0 | — | Gateway de Marketing y Prensa |
| Switch multicapa - SVI VLAN 30 | 30 | 192.168.30.1 | 255.255.255.0 | — | Gateway de Servidores |
| Switch multicapa - SVI VLAN 40 | 40 | 192.168.40.1 | 255.255.255.0 | — | Gateway de Recepción / Taquilla |
| Switch multicapa - SVI VLAN 50 | 50 | 192.168.50.1 | 255.255.255.0 | — | Gateway de Tienda oficial |
| Switch multicapa - SVI VLAN 60 | 60 | 192.168.60.1 | 255.255.255.0 | — | Gateway de Cuerpo técnico |
| Switch multicapa - SVI VLAN 99 | 99 | 192.168.99.1 | 255.255.255.0 | — | Gateway de Gestión IT |
| Servidor 1 | 30 | 192.168.30.10 | 255.255.255.0 | 192.168.30.1 | Servidor del CPD |
| Servidor 2 | 30 | 192.168.30.11 | 255.255.255.0 | 192.168.30.1 | Servidor del CPD |
| Impresora 1 | 30 | 192.168.30.201 | 255.255.255.0 | 192.168.30.1 | Impresora Planta 1 |
| Impresora 2 | 30 | 192.168.30.203| 255.255.255.0 | 192.168.30.1 | Impresora Planta 2 |
| Wireless LAN Controller 2504 | 99 | 192.168.99.2/24 | 255.255.255.0 | 192.168.99.1 | Gestión centralizada de la red inalámbrica |
| Access Point (LAP-PT) | 99 | 192.168.99.13/24 | 255.255.255.0 | 192.168.99.1 | Punto de acceso ligero |
| Router (si se conecta a red externa) | Red de tránsito | 192.168.254.1 | 255.255.255.0 | — | Enlace con el switch multicapa |
| Switch multicapa - enlace al router | Red de tránsito | 192.168.254.2 | 255.255.255.0 | 192.168.254.1 | Comunicación con el router |

---

## Direccionamiento de equipos de usuario

### Planta 1

| Departamento | Equipo | VLAN | Dirección IP | Máscara | Gateway |
|--------------|--------|------|--------------|---------|---------|
| Marketing / Prensa | Clara Benítez | 20 | Asignada por DHCP | 255.255.255.0 | 192.168.20.1 |
| Taquilla | Alba Martín | 40 | 192.168.40.20 | Asignada por DHCP | 192.168.40.1 |
| Recepción | Sara Núñez | 40 | 192.168.40.12 | Asignada por DHCP | 192.168.40.1 |
| Tienda oficial | Victor Cano | 50 | 192.168.50.10 | Asignada por DHCP | 192.168.50.1 |
| Gestión IT | Joaquín García | 99 | Asignada por DHCP | 255.255.255.0 | 192.168.99.1 |

### Planta 2

| Departamento | Equipo | VLAN | Dirección IP | Máscara | Gateway |
|--------------|--------|------|--------------|---------|---------|
| Dirección y Finanzas | Javier Sánchez | 10 | Asignada por DHCP | 255.255.255.0 | 192.168.10.1 |
| Cuerpo técnico | Rubén Morales | 60 | Asignada por DHCP | 255.255.255.0 | 192.168.60.1 |
| Gestión IT | Manolo Rodríguez | 99 | Asignada por DHCP | 255.255.255.0 | 192.168.99.1 |

---

## Observaciones

- Cada VLAN dispone de una **puerta de enlace propia** configurada en el **switch multicapa**.
- Se ha reservado la **VLAN 30** para los servidores ubicados en el **CPD**.
- La **VLAN 99** se destina a tareas de **gestión y administración**.
- El direccionamiento utilizado facilita la identificación rápida de cada departamento, ya que el tercer octeto coincide con el número de VLAN.
- No se han cableado todos los ordenadores ni todas las impresoras para no congestionar todo el esquema de cables, lo que podría dificultar la visualización clara de la infraestructura completa.