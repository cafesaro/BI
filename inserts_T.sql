INSERT INTO SEGURO_G27625529.PAIS(COD_PAIS,NB_PAIS) VALUES
(1,'Venezuela'),
(2,'Colombia'),
(3,'Mexico'),
(4,'Estados Unidos'),
(5,'España'),
(6,'Australia');

INSERT INTO SEGURO_G27625529.CIUDAD(COD_CIUDAD,COD_PAIS,NB_CIUDAD) VALUES
(1,1,'Caracas'),
(2,1,'Valencia'),
(3,1,'Maracaibo'),
(4,1,'Socopo'),
(5,2,'Bogota'),
(6,2,'Medellin'),
(7,3,'Cuidad de Mexico'),
(8,3,'Veracruz'),
(9,4,'New York'),
(10,4,'Miami'),
(11,5,'Madrid'),
(12,5,'Barcelona'),
(13,6,'Sydney'),
(14,6,'Melbourne');

INSERT INTO SEGURO_G27625529.SUCURSAL(COD_SUCURSAL,COD_CIUDAD,NB_SUCURSAL) VALUES
(1,1,'Sucursal Caracas'),
(2,2,'Sucursal Valencia'),
(3,3,'Sucursal Maracaibo'),
(4,4,'Sucursal Socopo'),
(5,5,'Sucursal Bogota'),
(6,6,'Sucursal Medellin'),
(7,7,'Sucursal Cuidad de Mexico'),
(8,8,'Sucursal Veracruz'),
(9,9,'Sucursal New York'),
(10,10,'Sucursal Miami'),
(11,11,'Sucursal Madrid'),
(12,12,'Sucursal Barcelona'),
(13,13,'Sucursal Sydney'),
(14,14,'Sucursal Melbourne');

INSERT INTO SEGURO_G27625529.TIPO_PRODUCTO(COD_TIPO_PRODUCTO,NB_TIPO_PRODUCTO) VALUES
(1,'Prestación de Servicios'),
(2,'Personales'),
(3,'Daños'),
(4,'Patrimoniales');

INSERT INTO SEGURO_G27625529.PRODUCTO(COD_PRODUCTO,NB_PRODUCTO, DESCRIPCION, COD_TIPO_PRODUCTO, CALIFICACION) VALUES
(1,'Crédito y Caución','Este es el seguro 1',1, 'Malo'),
(2,'Salud','Este es el seguro 2',2, 'Bueno'),
(3,'Incendios','Este es el seguro 3',3, 'Excelente'),
(4,'Automóvil','Este es el seguro 4',4, 'Regular');

INSERT INTO SEGURO_G27625529.CLIENTE(COD_CLIENTE,NB_CLIENTE, CI_RIF, TELEFONO,SEXO,EMAIL,COD_SUCURSAL) VALUES
(1,'Carlos Sanchez','27985940','1111111','Masculino','cafesaro@gmail.com',1 ),
(2,'Gabriel Tagliafico','27625529','22222','Masculino','gabot@gmail.com',2 ),
(3,'Sofia Rodirguez','27777777','33333333','Femenino','sofilin@gmail.com',3 ),
(4,'Juan Hernandez','2666666','44444444','Masculino','juanH@gmail.com',4 ),
(5,'Cesar Guzman','28888888','55555555','Masculino','viaincorrecta@gmail.com',5 ),
(6,'Sebastian Gonzalez','25555555','6666666666','Masculino','sebas@gmail.com',6 ),
(7,'Andrea Parima','24445522','77777777','Femenino','andre@gmail.com',2 ),
(8,'Maria Pinto','26688554','55555544','Femenino','maripin@gmail.com',14 ),
(9,'Santiago Sanchez','30222555','8888888','Masculino','santisan@gmail.com',3 ),
(10,'Manuel Mendez','27555666','9999999','Masculino','Mnumendez66@gmail.com',4 ),
(11,'Jacob Cortez','26555444','1010101010','Masculino','mesiguenono@gmail.com',9 ),
(12,'Corina Smith','24333111','11112233','Femenino','corimusic@gmail.com',10 );

INSERT INTO SEGURO_G27625529.EVALUACION_SERVICIO(COD_EVALUACION_SERVICIO,NB_EVALUACION_SERVICIO) VALUES
(1,'Malo'),
(2,'Regular'),
(3,'Bueno'),
(4,'Muy Bueno'),
(5,'Excelente');

INSERT INTO SEGURO_G27625529.RECOMIENDA(COD_CLIENTE,COD_EVALUACION_SERVICIO,COD_PRODUCTO,RECOMIENDA_AMIGO) VALUES
(1,1,1,to_timestamp('05-01-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss')),
(2,4,1,to_timestamp('06-01-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss')),
(3,2,3,to_timestamp('07-01-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss')),
(5,5,4,to_timestamp('08-01-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss')),
(4,4,2,to_timestamp('09-01-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss')),
(6,3,3,to_timestamp('10-01-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss')),
(6,2,2,to_timestamp('11-01-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss')),
(1,5,4,to_timestamp('12-01-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss'));

INSERT INTO SEGURO_G27625529.CONTRATO(NRO_CONTRATO,DESCRIPCION_CONTRATO) VALUES
(1,'Contrato 1' ),
(2,'Contrato 2' ),
(3,'Contrato 3' ),
(4,'Contrato 4' ),
(5,'Contrato 5' ),
(6,'Contrato 6' ),
(7,'Contrato 7' ),
(8,'Contrato 8' ),
(9,'Contrato 9' ),
(10,'Contrato 10' );

INSERT INTO SEGURO_G27625529.REGISTRO_CONTRATO(NRO_CONTRATO,COD_PRODUCTO,COD_CLIENTE,FECHA_INCIO,FECHA_FIN,MONTO,ESTADO_CONTRATO) VALUES
(1,1,1,to_timestamp('05-01-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),100, 'Activo'),
(2,2,2,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),200, 'Vencido'),
(3,3,3,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),300, 'Suspendido'),
(4,4,4,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),400, 'Vencido'),
(5,4,5,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),500, 'Vencido'),
(6,3,6,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),600, 'Activo'),
(7,2,7,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),700, 'Suspendido'),
(8,1,8,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),800, 'Activo'),
(9,3,9,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),900, 'Activo'),
(10,3,10,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2022 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),1000, 'Suspendido');

INSERT INTO SEGURO_G27625529.SINIESTRO(NRO_SINIESTRO,DESCRIPCION_SINIESTRO) VALUES
(1,'Siniestro 1' ),
(2,'Siniestro 2' ),
(3,'Siniestro 3' ),
(4,'Siniestro 4' ),
(5,'Siniestro 5' ),
(6,'Siniestro 6' ),
(7,'Siniestro 7' ),
(8,'Siniestro 8' ),
(9,'Siniestro 9' ),
(10,'Siniestro 10' );

INSERT INTO SEGURO_G27625529.REGISTRO_SINIESTRO(NRO_CONTRATO,NRO_SINIESTRO,FECHA_SINIESTRO,FECHA_RESPUESTA,ID_RECHAZO,MONTO_SOLICITADO,MONTO_RECONOCIDO) VALUES
(1,1,to_timestamp('05-01-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),'SI',100, 100),
(2,2,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),'NO',200, 300),
(3,3,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),'SI',300, 200),
(4,4,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),'NO',400, 400),
(5,5,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),'SI',500, 100),
(6,6,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),'NO',600, 600),
(7,7,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),'SI',700, 300),
(8,8,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),'NO',800, 200),
(9,9,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),'SI',900, 100),
(10,10,to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),to_timestamp('26-10-2021 10:26:26', 'DD-MM-YYYY hh24:mi:ss'),'NO',1000, 1000);