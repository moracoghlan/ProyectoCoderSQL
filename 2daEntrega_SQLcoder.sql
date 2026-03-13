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


/* =====================================================
   INSERCIÓN DE DATOS
===================================================== */

-- le pedi a la IA qque me arme 10 records para cada tabla asi tienen datos de relleno 

INSERT INTO proveedor (nombre, email, telefono, direccion) VALUES
('Textiles Sur', 'contacto@textilessur.com', '1111111111', 'Av. Rivadavia 123'),
('Algodones SA', 'ventas@algodonesa.com', '2222222222', 'Calle San Martín 456'),
('InduWear', 'info@induwear.com', '3333333333', 'Av. Belgrano 789'),
('Fabrica Norte', 'norte@fabrica.com', '4444444444', 'Ruta 8 km 34'),
('TelaPlus', 'soporte@telaplus.com', '5555555555', 'Av. Mitre 900'),
('EcoTextil', 'eco@textil.com', '6666666666', 'Calle Verde 123'),
('ModaBase', 'contacto@modabase.com', '7777777777', 'Diagonal 80'),
('UrbanTex', 'ventas@urbantex.com', '8888888888', 'Av. Corrientes 1500'),
('FibraPro', 'info@fibrapro.com', '9999999999', 'Calle Industrial 200'),
('TexAndes', 'andes@tex.com', '1010101010', 'Av. Los Andes 555');

INSERT INTO buzo (nombre_modelo, talla, color, precio, stock, proveedor_id) VALUES
('Classic Hoodie', 'M', 'Negro', 25000, 50, 1),
('Urban Fit', 'L', 'Gris', 27000, 40, 2),
('Oversize Pro', 'XL', 'Blanco', 30000, 30, 3),
('Slim Hoodie', 'S', 'Azul', 24000, 20, 4),
('Street Wear', 'M', 'Rojo', 26000, 35, 5),
('Eco Hoodie', 'L', 'Verde', 28000, 25, 6),
('Minimal', 'M', 'Beige', 25500, 45, 7),
('Night Mode', 'XL', 'Negro', 31000, 15, 8),
('Sport Flex', 'L', 'Azul Marino', 29000, 28, 9),
('Winter Plus', 'XL', 'Gris Oscuro', 33000, 10, 10);

INSERT INTO cliente (nombre, email, telefono, direccion_envio) VALUES
('Juan Pérez', 'juan@mail.com', '111111', 'Av. Siempre Viva 123'),
('Ana Gómez', 'ana@mail.com', '222222', 'Calle Falsa 456'),
('Lucas Díaz', 'lucas@mail.com', '333333', 'Av. Libertador 789'),
('María López', 'maria@mail.com', '444444', 'Calle Sol 321'),
('Sofía Torres', 'sofia@mail.com', '555555', 'Av. Luna 654'),
('Pedro Ruiz', 'pedro@mail.com', '666666', 'Calle Norte 12'),
('Valentina Rojas', 'vale@mail.com', '777777', 'Av. Sur 98'),
('Tomás Silva', 'tomas@mail.com', '888888', 'Diagonal 74'),
('Camila Ortega', 'camila@mail.com', '999999', 'Av. Central 101'),
('Nicolás Castro', 'nico@mail.com', '101010', 'Calle Este 202');

INSERT INTO empleado (nombre, email, telefono, rol) VALUES
('Carlos Medina', 'carlos@empresa.com', '1111', 'Estampador'),
('Laura Benítez', 'laura@empresa.com', '2222', 'Estampadora'),
('Martín Paz', 'martin@empresa.com', '3333', 'Supervisor'),
('Lucía Romero', 'lucia@empresa.com', '4444', 'Diseñadora'),
('Diego Fernández', 'diego@empresa.com', '5555', 'Operario'),
('Florencia Núñez', 'flor@empresa.com', '6666', 'Operaria'),
('Javier Morales', 'javier@empresa.com', '7777', 'Control Calidad'),
('Paula Suárez', 'paula@empresa.com', '8888', 'Estampadora'),
('Andrés Vega', 'andres@empresa.com', '9999', 'Supervisor'),
('Micaela Soto', 'mica@empresa.com', '1010', 'Diseñadora');

INSERT INTO delivery (nombre_empresa, telefono, email, zonas_cubiertas) VALUES
('Correo Express', '4000', 'correo@exp.com', 'CABA'),
('Envios Ya', '4001', 'envios@ya.com', 'GBA'),
('FastShip', '4002', 'fast@ship.com', 'CABA y GBA'),
('MotoFlash', '4003', 'moto@flash.com', 'CABA'),
('LogiSur', '4004', 'logi@sur.com', 'Zona Sur'),
('AndesPack', '4005', 'andes@pack.com', 'Interior'),
('QuickBox', '4006', 'quick@box.com', 'CABA'),
('ShipNow', '4007', 'ship@now.com', 'GBA Norte'),
('Urbano', '4008', 'urbano@mail.com', 'CABA'),
('CargoPlus', '4009', 'cargo@plus.com', 'Nacional');

INSERT INTO pedido (cliente_id, buzo_id, empleado_id, delivery_id, fecha_pedido, cantidad, estado) VALUES
(1, 1, 1, 1, '2025-01-01', 2, 'En proceso'),
(2, 2, 2, 2, '2025-01-02', 1, 'Enviado'),
(3, 3, 3, 3, '2025-01-03', 3, 'Entregado'),
(4, 4, 4, 4, '2025-01-04', 1, 'Pendiente'),
(5, 5, 5, 5, '2025-01-05', 2, 'En proceso'),
(6, 6, 6, 6, '2025-01-06', 1, 'Entregado'),
(7, 7, 7, 7, '2025-01-07', 4, 'Enviado'),
(8, 8, 8, 8, '2025-01-08', 2, 'En proceso'),
(9, 9, 9, 9, '2025-01-09', 1, 'Pendiente'),
(10, 10, 10, 10, '2025-01-10', 5, 'Entregado');

INSERT INTO transferencia (pedido_id, monto, banco_origen, cuenta_origen, banco_destino, cuenta_destino, fecha_hora, estado_pago, cbu) VALUES
(1, 50000, 'Banco Nación', '123', 'Banco Provincia', '999', '2025-01-01 10:00:00', 'Aprobado', '000111'),
(2, 27000, 'Santander', '124', 'BBVA', '998', '2025-01-02 11:00:00', 'Aprobado', '000112'),
(3, 90000, 'Galicia', '125', 'Macro', '997', '2025-01-03 12:00:00', 'Aprobado', '000113'),
(4, 24000, 'BBVA', '126', 'Nación', '996', '2025-01-04 13:00:00', 'Pendiente', '000114'),
(5, 52000, 'Macro', '127', 'Galicia', '995', '2025-01-05 14:00:00', 'Aprobado', '000115'),
(6, 28000, 'Nación', '128', 'Provincia', '994', '2025-01-06 15:00:00', 'Aprobado', '000116'),
(7, 102000, 'Santander', '129', 'BBVA', '993', '2025-01-07 16:00:00', 'Aprobado', '000117'),
(8, 62000, 'Galicia', '130', 'Macro', '992', '2025-01-08 17:00:00', 'Pendiente', '000118'),
(9, 29000, 'BBVA', '131', 'Nación', '991', '2025-01-09 18:00:00', 'Aprobado', '000119'),
(10, 165000, 'Macro', '132', 'Galicia', '990', '2025-01-10 19:00:00', 'Aprobado', '000120');


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

SELECT * FROM pedido_pago;


/* =====================================================
   TABLA COSTOS
===================================================== */

CREATE TABLE cheers_lk.costos (
id_modelo INT NOT NULL auto_increment PRIMARY KEY,
nombre_modelo VARCHAR(100),
tela DECIMAL(10,2),
tinta DECIMAL(8,2),
mano_obra DECIMAL(10,2),
proveedor INT,
total_costo DECIMAL(10,2)
);

INSERT INTO cheers_lk.costos (nombre_modelo, tela, tinta, mano_obra, proveedor, total_costo)
VALUES
('Buzo Classic', 2500.00, 500.00, 3000.00, 1, 6000.00),
('Buzo Oversize', 2800.00, 550.00, 3200.00, 2, 6550.00),
('Buzo Hoodie Logo', 3000.00, 600.00, 3500.00, 1, 7100.00),
('Buzo Minimal', 2200.00, 300.00, 2800.00, 3, 5300.00),
('Buzo Vintage', 2600.00, 450.00, 3100.00, 2, 6150.00),
('Buzo Street', 2900.00, 700.00, 3400.00, 1, 7000.00),
('Buzo Urban', 2700.00, 500.00, 3300.00, 2, 6500.00),
('Buzo Retro', 2400.00, 400.00, 2900.00, 3, 5700.00);


/* =====================================================
   ALTER TABLE
===================================================== */

ALTER TABLE cheers_lk.costos 
ADD CONSTRAINT proveedor_fk
FOREIGN KEY (proveedor)
REFERENCES cheers_lk.proveedor(proveedor_id)
ON DELETE SET NULL
ON UPDATE CASCADE;

ALTER TABLE cheers_lk.buzo
ADD id_modelo INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE cheers_lk.buzo SET id_modelo = 1 WHERE buzo_id = 1;
UPDATE cheers_lk.buzo SET id_modelo = 2 WHERE buzo_id = 2;
UPDATE cheers_lk.buzo SET id_modelo = 3 WHERE buzo_id = 3;
UPDATE cheers_lk.buzo SET id_modelo = 4 WHERE buzo_id = 4;
UPDATE cheers_lk.buzo SET id_modelo = 5 WHERE buzo_id = 5;
UPDATE cheers_lk.buzo SET id_modelo = 6 WHERE buzo_id = 6;
UPDATE cheers_lk.buzo SET id_modelo = 7 WHERE buzo_id = 7;
UPDATE cheers_lk.buzo SET id_modelo = 8 WHERE buzo_id = 8;

DELETE FROM cheers_lk.buzo
WHERE nombre_modelo IS NULL;

ALTER TABLE cheers_lk.buzo
DROP COLUMN nombre_modelo;

ALTER TABLE cheers_lk.buzo
DROP FOREIGN KEY buzo_ibfk_1;

ALTER TABLE cheers_lk.buzo
DROP COLUMN proveedor_id;

ALTER TABLE cheers_lk.buzo
ADD CONSTRAINT modelo_fK
FOREIGN KEY (id_modelo)
REFERENCES cheers_lk.costos(id_modelo)
ON UPDATE CASCADE;


/* =====================================================
   VISTA COSTO GANANCIA
===================================================== */

CREATE VIEW cheers_lk.costo_ganancia AS (

SELECT 
cs.total_costo,
cs.nombre_modelo,
SUM(bu.precio) AS total_precio_buzos,
(
    SELECT SUM(pe.cantidad)
    FROM cheers_lk.pedido AS pe
    WHERE pe.estado = 'Entregado'
) AS total_pedidos_entregados
FROM cheers_lk.buzo AS bu
LEFT JOIN cheers_lk.costos AS cs 
ON bu.id_modelo = cs.id_modelo
GROUP BY cs.id_modelo, cs.total_costo, cs.nombre_modelo
);

SELECT * FROM cheers_lk.costo_ganancia;


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

SELECT ganancia_por_modelo(1);


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

CALL pedidos_por_cliente(1);


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
WHERE buzo_id = NEW.buzo_id;

END //

DELIMITER ;

INSERT INTO pedido (cliente_id, buzo_id, empleado_id, delivery_id, fecha_pedido, cantidad, estado)
VALUES (1,1,1,1,'2025-02-01',2,'En proceso');

SELECT stock FROM buzo WHERE buzo_id = 1;