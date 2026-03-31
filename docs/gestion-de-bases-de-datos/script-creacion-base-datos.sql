/* Creación de la base de datos */

CREATE DATABASE club_futbol;
USE club_futbol;

/* Creación de tablas */

CREATE TABLE planta (
    id_planta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    id_planta INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    CONSTRAINT fk_departamento_planta
        FOREIGN KEY (id_planta) REFERENCES planta(id_planta)
);

CREATE TABLE empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    id_departamento INT NOT NULL,
    nombre_completo VARCHAR(100) NOT NULL,
    CONSTRAINT fk_empleado_departamento
        FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

CREATE TABLE vlan (
    id_vlan INT AUTO_INCREMENT PRIMARY KEY,
    numero_vlan INT NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    red VARCHAR(50) NOT NULL
);

CREATE TABLE dispositivo (
    id_dispositivo INT AUTO_INCREMENT PRIMARY KEY,
    id_departamento INT NOT NULL,
    id_vlan INT NOT NULL,
    direccion_ip VARCHAR(15) UNIQUE,
    tipo VARCHAR(50) NOT NULL,
    nombre_dispositivo VARCHAR(100) NOT NULL,
    CONSTRAINT fk_dispositivo_departamento
        FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento),
    CONSTRAINT fk_dispositivo_vlan
        FOREIGN KEY (id_vlan) REFERENCES vlan(id_vlan)
);

CREATE TABLE empleado_dispositivo (
    id_empleado INT NOT NULL,
    id_dispositivo INT NOT NULL,
    fecha_asignacion DATE,
    PRIMARY KEY (id_empleado, id_dispositivo),
    CONSTRAINT fk_empleado_dispositivo_empleado
        FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    CONSTRAINT fk_empleado_dispositivo_dispositivo
        FOREIGN KEY (id_dispositivo) REFERENCES dispositivo(id_dispositivo)
);