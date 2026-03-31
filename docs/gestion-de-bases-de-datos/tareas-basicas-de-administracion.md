# Tareas básicas de administración

Las tareas básicas de administración de esta base de datos se han planteado para un entorno **MySQL/MariaDB**, pudiendo gestionarse en local mediante herramientas como **phpMyAdmin** o desde consola SQL.

En el proyecto, estas tareas se han diseñado de forma teórica y práctica para representar cómo se administraría la seguridad de la base de datos en un entorno real. Aunque durante el desarrollo se han probado en local, la idea del proyecto es que la base de datos pueda desplegarse en un entorno **en la nube**, por ejemplo en una instancia Linux de AWS.

En ese caso, la gestión de accesos no dependería únicamente de MySQL, sino también de otros elementos de seguridad como:

- acceso a la máquina virtual o servidor
- reglas de firewall o grupos de seguridad
- subredes privadas o redes internas
- usuarios, roles y permisos definidos dentro del SGBD

De esta forma, un usuario no solo necesitaría tener permisos dentro de MySQL, sino también estar autorizado para conectarse desde una red o dirección IP permitida.

## 1. Creación de usuarios

En la base de datos se han creado distintos usuarios que representan los perfiles de acceso de cada departamento del club.

Cada usuario está restringido a su red mediante la dirección IP correspondiente a su VLAN.

Ejemplo:

```sql
CREATE USER 'admin_club'@'localhost'
IDENTIFIED BY 'Admin123!';
```
De esta forma, cada perfil solo puede conectarse desde su propia red.

## 2. Creación de roles

Para facilitar la gestión de permisos, se han definido distintos roles:

```sql
CREATE ROLE rol_admin;
CREATE ROLE rol_it;
CREATE ROLE rol_consulta;
CREATE ROLE rol_recepcion;
```
Cada rol agrupa un conjunto de permisos según el tipo de usuario.

## 3. Asignación de permisos a roles

Los permisos no se asignan directamente a los usuarios, sino a los roles.

Ejemplo:

```sql
GRANT SELECT 
ON club_futbol.empleado 
TO rol_recepcion;
```
Esto permite aplicar el principio de mínimo privilegio, asignando únicamente los permisos necesarios a cada perfil.

## 4. Asignación de roles a usuarios

Una vez definidos los roles, se asignan a los usuarios correspondientes.

Ejemplo:

```sql
GRANT rol_it 
TO 'it_club'@'192.168.99.%';
```
De esta forma, cada usuario hereda los permisos del rol asignado.

## 5. Consulta de permisos

Para verificar los permisos de un usuario se utiliza el siguiente comando:

```sql
SHOW GRANTS 
FOR 'it_club'@'192.168.99.%';
```
## 6. Revocación de permisos

En caso necesario, se pueden retirar permisos a un usuario o rol.

```sql
REVOKE SELECT
ON club_futbol.*
FROM 'marketing_club'@'192.168.20.%';
```
