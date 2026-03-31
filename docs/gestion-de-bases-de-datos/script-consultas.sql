/* 1. Mostrar todos los empleados con su departamento*/

SELECT e.nombre_completo, d.nombre AS departamento
FROM empleado e
JOIN departamento d
ON e.id_departamento = d.id_departamento;

/* 2. Mostrar los tipos de dispositivos existentes y cuántos hay de cada uno */

SELECT tipo, COUNT(*) AS total
FROM dispositivo
GROUP BY tipo;

/* 3. Media de dispositivos por departamento*/

SELECT AVG(total_dispositivos) AS media_dispositivos_por_departamento
FROM (
    SELECT COUNT(*) AS total_dispositivos
    FROM dispositivo
    GROUP BY id_departamento
) AS conteo;

/* 4. Mostrar los dispositivos que tienen dirección IP fija*/

SELECT nombre_dispositivo, direccion_ip
FROM dispositivo
WHERE direccion_ip IS NOT NULL;

/* 5. Contar el número de dispositivos por VLAN*/

SELECT v.numero_vlan, COUNT(*) AS total_dispositivos
FROM dispositivo d
JOIN vlan v
ON d.id_vlan = v.id_vlan
GROUP BY v.numero_vlan;

/* 6. Mostrar los departamentos que tienen más de 3 dispositivos*/

SELECT dep.nombre, COUNT(*) AS total
FROM dispositivo d
JOIN departamento dep
ON d.id_departamento = dep.id_departamento
GROUP BY dep.nombre
HAVING COUNT(*) > 3;

/* 7. Mostrar todos los dispositivos junto con su departamento y VLAN*/

SELECT di.nombre_dispositivo, di.tipo, dep.nombre AS departamento, v.numero_vlan
FROM dispositivo di
JOIN departamento dep
ON di.id_departamento = dep.id_departamento
JOIN vlan v
ON di.id_vlan = v.id_vlan;

/* 8. Contar cuántos empleados hay en cada departamento*/

SELECT d.nombre AS departamento, COUNT(e.id_empleado) AS total_empleados
FROM departamento d
LEFT JOIN empleado e
ON d.id_departamento = e.id_departamento
GROUP BY d.nombre;

/* 9. Contar cuántos empleados hay en cada departamento*/

SELECT d.nombre
FROM departamento d
LEFT JOIN empleado e
ON d.id_departamento = e.id_departamento
WHERE e.id_empleado IS NULL;

/* 10. Contar cuántos dispositivos hay en cada departamento*/

SELECT d.nombre AS departamento, COUNT(*) AS total_dispositivos
FROM dispositivo di
JOIN departamento d
ON di.id_departamento = d.id_departamento
GROUP BY d.nombre;


