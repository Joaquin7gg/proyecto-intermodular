/*Creación de usuarios */

CREATE USER 'admin_club'@'localhost' IDENTIFIED BY 'Admin123!';
CREATE USER 'it_club'@'192.168.99.%' IDENTIFIED BY 'It123!';
CREATE USER 'marketing_club'@'192.168.20.%' IDENTIFIED BY 'Marketing123!';
CREATE USER 'direccion_club'@'192.168.10.%' IDENTIFIED BY 'Direccion123!';
CREATE USER 'recepcion_club'@'192.168.40.%' IDENTIFIED BY 'Recepcion123!';

/*Creación de roles */

CREATE ROLE rol_admin;
CREATE ROLE rol_it;
CREATE ROLE rol_consulta;
CREATE ROLE rol_recepcion;

/*Asignación de permisos a roles */

/*ADMIN → acceso total*/
GRANT ALL PRIVILEGES 
ON club_futbol.* 
TO rol_admin;

/*IT → gestión técnica*/
GRANT SELECT, INSERT, UPDATE 
ON club_futbol.dispositivo 
TO rol_it;

GRANT SELECT 
ON club_futbol.* 
TO rol_it;

/*CONSULTA → solo lectura (marketing + dirección)*/
GRANT SELECT 
ON club_futbol.* 
TO rol_consulta;

/*RECEPCIÓN → acceso limitado*/
GRANT SELECT 
ON club_futbol.empleado 
TO rol_recepcion;

GRANT SELECT 
ON club_futbol.departamento 
TO rol_recepcion;

/*Asignación de roles a usuarios*/

GRANT rol_admin TO 'admin_club'@'localhost';
GRANT rol_it TO 'it_club'@'192.168.99.%';
GRANT rol_consulta TO 'marketing_club'@'192.168.20.%';
GRANT rol_consulta TO 'direccion_club'@'192.168.10.%';
GRANT rol_recepcion TO 'recepcion_club'@'192.168.40.%';
