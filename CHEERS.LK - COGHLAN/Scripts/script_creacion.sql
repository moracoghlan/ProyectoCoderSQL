-- ACLARACION le pase a chat gpt el codigo completo para que lo ordene de una forma que sea mas agradable de leer. 

/* =====================================================
   CREACIÓN DE BASE DE DATOS
===================================================== */

CREATE DATABASE IF NOT EXISTS cheers_lk;
USE cheers_lk;


/* =====================================================
   CREACIÓN DE TABLAS
===================================================== */

CREATE TABLE IF NOT EXISTS proveedor (
    proveedor_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(50),
    direccion VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS buzo (
    buzo_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_modelo VARCHAR(50) NOT NULL,
    talla VARCHAR(10),
    color VARCHAR(30),
    precio FLOAT,
    stock INT,
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES proveedor(proveedor_id)
);

CREATE TABLE IF NOT EXISTS cliente (
    cliente_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(50),
    direccion_envio VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS empleado (
    empleado_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(50),
    rol VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS delivery (
    delivery_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_empresa VARCHAR(100),
    telefono VARCHAR(50),
    email VARCHAR(100),
    zonas_cubiertas VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS pedido (
    pedido_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    buzo_id INT,
    empleado_id INT,
    delivery_id INT,
    fecha_pedido DATE,
    cantidad INT,
    estado VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
    FOREIGN KEY (buzo_id) REFERENCES buzo(buzo_id),
    FOREIGN KEY (empleado_id) REFERENCES empleado(empleado_id),
    FOREIGN KEY (delivery_id) REFERENCES delivery(delivery_id)
);

CREATE TABLE IF NOT EXISTS transferencia (
    transferencia_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT UNIQUE,
    monto FLOAT,
    banco_origen VARCHAR(50),
    cuenta_origen VARCHAR(50),
    banco_destino VARCHAR(50),
    cuenta_destino VARCHAR(50),
    fecha_hora DATETIME,
    estado_pago VARCHAR(50),
    cbu VARCHAR(50),
    FOREIGN KEY (pedido_id) REFERENCES pedido(pedido_id)
);


CREATE TABLE cheers_lk.costos (
id_modelo INT NOT NULL auto_increment PRIMARY KEY,
nombre_modelo VARCHAR(100),
tela DECIMAL(10,2),
tinta DECIMAL(8,2),
mano_obra DECIMAL(10,2),
proveedor INT,
total_costo DECIMAL(10,2)
);

/* =====================================================
   ALTER TABLE
===================================================== */

DELETE FROM cheers_lk.buzo
WHERE nombre_modelo IS NULL;

ALTER TABLE cheers_lk.buzo
DROP COLUMN nombre_modelo;

ALTER TABLE cheers_lk.buzo
DROP FOREIGN KEY buzo_ibfk_1;

ALTER TABLE cheers_lk.buzo
DROP COLUMN proveedor_id;

ALTER TABLE cheers_lk.buzo
ADD id_modelo INT;

ALTER TABLE cheers_lk.buzo
ADD CONSTRAINT modelo_fK
FOREIGN KEY (id_modelo)
REFERENCES cheers_lk.costos(id_modelo)
ON UPDATE CASCADE;


ALTER TABLE cheers_lk.costos 
ADD CONSTRAINT proveedor_fk
FOREIGN KEY (proveedor)
REFERENCES cheers_lk.proveedor(proveedor_id)
ON DELETE SET NULL
ON UPDATE CASCADE;





/* =====================================================
   VISTAS
===================================================== */

CREATE VIEW pedido_pago AS (

SELECT pe.fecha_pedido, pe.estado, pe.cantidad, tr.estado_pago, (
SELECT cl.nombre
FROM cheers_lk.cliente AS cl 
WHERE pe.cliente_id=cl.cliente_id) AS cliente
FROM cheers_lk.pedido AS pe 
LEFT JOIN cheers_lk.transferencia AS tr ON pe.pedido_id=tr.pedido_id
WHERE tr.estado_pago='Aprobado');



/* =====================================================
   VISTA COSTO GANANCIA
===================================================== */

SET autocommit = 0;
START TRANSACTION; 
CREATE VIEW cheers_lk.costo_ganancia AS (

SELECT 
cs.total_costo,
cs.nombre_modelo,
SUM(bu.precio) AS total_precio_buzos,
(
    SELECT SUM(pe.cantidad)
    FROM cheers_lk.pedido AS pe
	JOIN cheers_lk.buzo AS bu ON bu.buzo_id = pe.buzo_id
	WHERE pe.estado = 'Entregado' AND bu.id_modelo = cs.id_modelo

) AS total_pedidos_entregados
FROM cheers_lk.buzo AS bu
LEFT JOIN cheers_lk.costos AS cs 
ON bu.id_modelo = cs.id_modelo
GROUP BY cs.id_modelo, cs.total_costo, cs.nombre_modelo
);
COMMIT;

/* =====================================================
   FUNCIÓN
===================================================== */

-- ---------------------------------------------------------------------------------------------------------------------------
-- FUNCION: CALCULAR GANANCIA POR MODELO
-- Esta función calcula la ganancia promedio de un modelo de buzo restando el costo de producción al precio promedio de venta.
-- Permite conocer la rentabilidad de cada modelo de buzo para tomar decisiones comerciales.
-- TABLAS USADAS: buzo y costos
-- columnas usadas: bu.precio, co.total_costos, id_modelo de ambas tablas

USE cheers_lk; 

DELIMITER //

CREATE FUNCTION ganancia_por_modelo (id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN

DECLARE ganancia DECIMAL(10,2);

SELECT AVG(bu.precio) - co.total_costo
INTO ganancia
FROM cheers_lk.buzo AS bu
JOIN cheers_lk.costos AS co 
ON bu.id_modelo = co.id_modelo
WHERE co.id_modelo = id
GROUP BY co.total_costo;

RETURN ganancia;

END //

DELIMITER ;

SELECT ganancia_por_modelo(5);


/* =====================================================
   STORED PROCEDURE
===================================================== */

USE cheers_lk

DELIMITER //

CREATE PROCEDURE pedidos_por_cliente(IN id_cliente INT)
BEGIN

SELECT 
pe.pedido_id,
cl.nombre AS cliente,
pe.buzo_id,
pe.fecha_pedido,
pe.cantidad,
pe.estado
FROM pedido AS pe
JOIN cliente AS cl 
ON pe.cliente_id = cl.cliente_id
WHERE pe.cliente_id = id_cliente;

END //

DELIMITER ;

CALL pedidos_por_cliente(8);


/* =====================================================
   TRIGGER
===================================================== */

DELIMITER //

CREATE TRIGGER actualizar_stock
AFTER INSERT ON pedido
FOR EACH ROW
BEGIN

UPDATE buzo
SET stock = stock - NEW.cantidad
WHERE buzo_id = NEW.buzo_id;costo_ganancia

END DELIMITER //





