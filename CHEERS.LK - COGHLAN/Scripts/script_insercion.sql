

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

INSERT INTO buzo (talla, color, precio, stock, id_modelo) VALUES
('M', 'Negro', 25000, 50, 1),
('L', 'Gris', 27000, 40, 2),
( 'XL', 'Blanco', 30000, 30, 3),
('S', 'Azul', 24000, 20, 4),
( 'M', 'Rojo', 26000, 35, 5),
( 'L', 'Verde', 28000, 25, 6),
( 'M', 'Beige', 25500, 45, 7),
( 'XL', 'Negro', 31000, 15, 8),
('L', 'Azul Marino', 29000, 28, 3),
('XL', 'Gris Oscuro', 33000, 10, 2);

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



INSERT INTO pedido (cliente_id, buzo_id, empleado_id, delivery_id, fecha_pedido, cantidad, estado)
VALUES (1,1,1,1,'2025-02-01',2,'En proceso');


INSERT INTO buzo (talla, color, precio, stock, id_modelo) VALUES
('M','Negro',26000,30,1),
('L','Negro',26000,25,1),
('XL','Blanco',27000,20,1),

('M','Gris',28000,35,2),
('L','Gris',28000,30,2),
('XL','Negro',29000,20,2),

('S','Blanco',30000,15,3),
('M','Blanco',30000,25,3),

('M','Beige',25000,40,4),
('L','Beige',25000,30,4),

('M','Rojo',27000,20,5),
('L','Rojo',27000,25,5),

('M','Verde',28000,18,6),
('XL','Verde',28000,15,6),

('M','Azul',29000,22,7),
('L','Azul',29000,20,7),

('M','Negro',31000,10,8),
('XL','Negro',31000,8,8);


INSERT INTO pedido (cliente_id, buzo_id, empleado_id, delivery_id, fecha_pedido, cantidad, estado) VALUES
(1, 1, 1, 1, '2025-02-01', 2, 'Entregado'),
(2, 2, 2, 2, '2025-02-02', 1, 'Entregado'),
(3, 11, 3, 3, '2025-02-03', 3, 'Enviado'),
(4, 12, 4, 4, '2025-02-04', 2, 'Entregado'),
(5, 13, 5, 5, '2025-02-05', 1, 'Pendiente'),
(6, 14, 6, 6, '2025-02-06', 4, 'Entregado'),
(7, 15, 7, 7, '2025-02-07', 2, 'En proceso'),
(8, 16, 8, 8, '2025-02-08', 3, 'Entregado'),
(9, 17, 9, 9, '2025-02-09', 1, 'Enviado'),
(10, 18, 10, 10, '2025-02-10', 2, 'Entregado');

INSERT INTO transferencia (pedido_id, monto, banco_origen, cuenta_origen, banco_destino, cuenta_destino, fecha_hora, estado_pago, cbu) VALUES
(11, 52000, 'Nacion', '200', 'Provincia', '300', '2025-02-01 10:00:00', 'Aprobado', '111111'),
(12, 28000, 'Santander', '201', 'BBVA', '301', '2025-02-02 11:00:00', 'Aprobado', '111112'),
(13, 90000, 'Galicia', '202', 'Macro', '302', '2025-02-03 12:00:00', 'Pendiente', '111113'),
(14, 54000, 'BBVA', '203', 'Nacion', '303', '2025-02-04 13:00:00', 'Aprobado', '111114'),
(15, 27000, 'Macro', '204', 'Galicia', '304', '2025-02-05 14:00:00', 'Pendiente', '111115'),
(16, 112000, 'Nacion', '205', 'Provincia', '305', '2025-02-06 15:00:00', 'Aprobado', '111116'),
(17, 58000, 'Santander', '206', 'BBVA', '306', '2025-02-07 16:00:00', 'Aprobado', '111117'),
(18, 87000, 'Galicia', '207', 'Macro', '307', '2025-02-08 17:00:00', 'Aprobado', '111118'),
(19, 29000, 'BBVA', '208', 'Nacion', '308', '2025-02-09 18:00:00', 'Pendiente', '111119'),
(20, 62000, 'Macro', '209', 'Galicia', '309', '2025-02-10 19:00:00', 'Aprobado', '111120');





SELECT * FROM pedido_pago;



SET SQL_SAFE_UPDATES = 0;

UPDATE cheers_lk.buzo SET id_modelo = 1 WHERE buzo_id = 1;
UPDATE cheers_lk.buzo SET id_modelo = 2 WHERE buzo_id = 2;
UPDATE cheers_lk.buzo SET id_modelo = 3 WHERE buzo_id = 3;
UPDATE cheers_lk.buzo SET id_modelo = 4 WHERE buzo_id = 4;
UPDATE cheers_lk.buzo SET id_modelo = 5 WHERE buzo_id = 5;
UPDATE cheers_lk.buzo SET id_modelo = 6 WHERE buzo_id = 6;
UPDATE cheers_lk.buzo SET id_modelo = 7 WHERE buzo_id = 7;
UPDATE cheers_lk.buzo SET id_modelo = 8 WHERE buzo_id = 8;


SET autocommit = 0;
START TRANSACTION;

UPDATE buzo SET id_modelo = 1 WHERE buzo_id IN (1,9);
UPDATE buzo SET id_modelo = 2 WHERE buzo_id IN (2,10);

SELECT * FROM cheers_lk.costo_ganancia;
SELECT * FROM cheers_lk.buzo;
SELECT * FROM cheers_lk.cliente;
SELECT * FROM cheers_lk.costos;
SELECT * FROM cheers_lk.delivery;
SELECT * FROM cheers_lk.empleado;
SELECT * FROM cheers_lk.pedido;
SELECT * FROM cheers_lk.proveedor;
SELECT * FROM cheers_lk.transferencia;
SELECT * FROM cheers_lk.pedido_pago;
SELECT * FROM cheers_lk.pedidos_por_estado;
SELECT * FROM cheers_lk.stock_por_modelo;
