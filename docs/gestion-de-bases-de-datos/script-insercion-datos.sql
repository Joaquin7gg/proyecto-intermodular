/* Inserción de datos */

/* Plantas */

INSERT INTO planta (nombre) VALUES
('Atención al público - 1'),
('Dirección y CPD - 2');

/* Departamentos */

INSERT INTO departamento (id_planta, nombre) VALUES
(1, 'Recepción'),
(1, 'Taquilla y atención al socio'),
(1, 'Tienda Oficial'),
(1, 'Prensa y Marketing'),
(1, 'Soporte IT'),
(2, 'Dirección y Finanzas'),
(2, 'Cuerpo Técnico'),
(1, 'Sala reuniones planta 1'),
(2, 'Sala reuniones planta 2'),
(2, 'CPD');

/* Empleados */

INSERT INTO empleado (id_departamento, nombre_completo) VALUES
(1, 'Alba Martín'),
(1, 'Diego Paredes'),

(2, 'Laura Vela'),
(2, 'Óscar Roldán'),
(2, 'Sara Núñez'),

(3, 'Víctor Cano'),
(3, 'Natalia Pérez'),

(4, 'Clara Benítez'),
(4, 'Hugo Rivera'),
(4, 'Paula Esteban'),

(5, 'Rubén Sierra'),
(5, 'Joaquín Garcia'),
(5, 'Manolo Rodríguez'),

(6, 'Laura Gómez'),
(6, 'Andrés Ruiz'),
(6, 'Ángela Serrano'),
(6, 'Javier Sánchez'),

(7, 'Carlos Peña'),
(7, 'Sergio Navarro'),
(7, 'Iván Torres'),
(7, 'Rubén Morales');


/* VLAN */

INSERT INTO vlan (numero_vlan, nombre, red) VALUES
(10, 'Dirección y Finanzas', '192.168.10.0/24'),
(20, 'Marketing y Prensa', '192.168.20.0/24'),
(30, 'Servidores', '192.168.30.0/24'),
(40, 'Recepción / Taquilla', '192.168.40.0/24'),
(50, 'Tienda oficial', '192.168.50.0/24'),
(60, 'Cuerpo técnico', '192.168.60.0/24'),
(70, 'WLAN_empleados', '192.168.70.0/24'),
(80, 'WLAN_invitados', '192.168.80.0/24'),
(99, 'Gestión IT', '192.168.99.0/24');

/* Dispositivos por departamentos */

/*Dirección y Finanzas (VLAN 10)*/
INSERT INTO dispositivo (id_departamento,id_vlan,direccion_ip,tipo,nombre_dispositivo) VALUES
(6,1,NULL,'pc_corporativo','pc_finanzas_01'),
(6,1,NULL,'pc_corporativo','pc_finanzas_02'),
(6,1,NULL,'pc_corporativo','pc_finanzas_03'),
(6,1,NULL,'pc_corporativo','pc_finanzas_04');

/*Prensa y Marketing (VLAN 20)*/
INSERT INTO dispositivo (id_departamento,id_vlan,direccion_ip,tipo,nombre_dispositivo) VALUES
(4,2,NULL,'equipo_diseno','pc_diseno_marketing_01'),
(4,2,NULL,'equipo_diseno','pc_diseno_marketing_02'),
(4,2,NULL,'pc_corporativo','pc_marketing_01');

/*Recepción (VLAN 40)*/
INSERT INTO dispositivo (id_departamento,id_vlan,direccion_ip,tipo,nombre_dispositivo) VALUES
(1,4,NULL,'pc_corporativo','pc_recepcion_01'),
(1,4,NULL,'pc_corporativo','pc_recepcion_02');

/*Taquilla y atención al socio (VLAN 40)*/
INSERT INTO dispositivo (id_departamento,id_vlan,direccion_ip,tipo,nombre_dispositivo) VALUES
(2,4,NULL,'pc_corporativo','pc_taquilla_01'),
(2,4,NULL,'pc_corporativo','pc_taquilla_02'),
(2,4,NULL,'pc_corporativo','pc_taquilla_03');

/*Tienda oficial (VLAN 50)*/
INSERT INTO dispositivo (id_departamento,id_vlan,direccion_ip,tipo,nombre_dispositivo) VALUES
(3,5,NULL,'pc_corporativo','pc_tienda_01'),
(3,5,NULL,'pc_corporativo','pc_tienda_02');

/*Cuerpo Técnico (VLAN 60)*/
INSERT INTO dispositivo (id_departamento,id_vlan,direccion_ip,tipo,nombre_dispositivo) VALUES
(7,6,NULL,'pc_corporativo','pc_tecnico_01'),
(7,6,NULL,'pc_corporativo','pc_tecnico_02'),
(7,6,NULL,'pc_corporativo','pc_tecnico_03'),
(7,6,NULL,'pc_corporativo','pc_tecnico_04');

/*Soporte IT (VLAN 99)*/
INSERT INTO dispositivo (id_departamento,id_vlan,direccion_ip,tipo,nombre_dispositivo) VALUES
(5,9,NULL,'workstation','ws_it_01'),
(5,9,NULL,'workstation','ws_it_02'),
(5,9,NULL,'workstation','ws_it_03');

/*Sala de reuniones planta 1*/
INSERT INTO dispositivo (id_departamento,id_vlan,direccion_ip,tipo,nombre_dispositivo) VALUES
(8,7,NULL,'portatil','laptop_sala1_01'),
(8,7,NULL,'portatil','laptop_sala1_02'),
(8,7,NULL,'portatil','laptop_sala1_03'),
(8,7,NULL,'television','tv_sala1');

/*Sala de reuniones planta 2*/
INSERT INTO dispositivo (id_departamento,id_vlan,direccion_ip,tipo,nombre_dispositivo) VALUES
(9,7,NULL,'portatil','laptop_sala2_01'),
(9,7,NULL,'portatil','laptop_sala2_02'),
(9,7,NULL,'portatil','laptop_sala2_03'),
(9,7,NULL,'television','tv_sala2'),
(9,7,NULL,'punto_acceso','ap_sala2');

/*CPD (infraestructura)*/
INSERT INTO dispositivo (id_departamento,id_vlan,direccion_ip,tipo,nombre_dispositivo) VALUES
(10,9,NULL,'router','router_corporativo'),
(10,9,NULL,'switch_core','switch_core'),
(10,9,NULL,'switch_acceso','switch_acceso_cpd'),
(10,9,NULL,'controladora_wifi','wlc_2504');

/*Impresoras*/
INSERT INTO dispositivo (id_departamento,id_vlan,direccion_ip,tipo,nombre_dispositivo) VALUES
(8,3,'192.168.30.201','impresora','impresora_sala1'),
(1,3,'192.168.30.202','impresora','impresora_recepcion'),
(7,3,'192.168.30.203','impresora','impresora_cuerpo_tecnico'),
(6,3,'192.168.30.204','impresora','impresora_finanzas'),
(9,3,'192.168.30.205','impresora','impresora_sala2');

/*Servidores*/
INSERT INTO dispositivo (id_departamento,id_vlan,direccion_ip,tipo,nombre_dispositivo) VALUES
(10,3,'192.168.30.11','servidor','srv_principal'),
(10,3,'192.168.30.12','servidor','srv_backup');

