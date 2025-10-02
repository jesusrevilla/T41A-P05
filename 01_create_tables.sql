CREATE TABLE sucursal3(
  id_sucursal3 SERIAL PRIMARY KEY,
  nombre_sucursal3 VARCHAR(100) NOT NULL
);

CREATE TABLE forma_pago3(
  id_forma_pago3 SERIAL PRIMARY KEY,
  tipo_pago3 VARCHAR(50) NOT NULL
);

CREATE TABLE cliente3(
  codigo_cliente3 SERIAL PRIMARY KEY,
  nombre_cliente3 VARCHAR(100) NOT NULL
);

CREATE TABLE factura3(
  id_factura3 SERIAL PRIMARY KEY,
  codigo_cliente3 INT NOT NULL,
  id_sucursal3 INT NOT NULL,
  id_forma_pago3 INT NOT NULL,
  fecha3 DATE NOT NULL,
  total_factura3 NUMERIC(10, 2) NOT NULL,
  FOREIGN KEY (codigo_cliente3) REFERENCES cliente3(codigo_cliente3),
  FOREIGN KEY (id_sucursal3) REFERENCES sucursal3(id_sucursal3),
  FOREIGN KEY (id_forma_pago3) REFERENCES forma_pago3(id_forma_pago3)
);

CREATE TABLE articulo3(
  codigo_articulo3 SERIAL PRIMARY KEY,
  nombre_articulo3 VARCHAR(100) NOT NULL,
  precio_unitario3 NUMERIC(10, 2) NOT NULL
);

CREATE TABLE detalles_factura3(
  id_factura3 INT NOT NULL,
  codigo_articulo3 INT NOT NULL,
  cantidad_articulo3 INT NOT NULL,
  PRIMARY KEY (id_factura3, codigo_articulo3),
  FOREIGN KEY (id_factura3) REFERENCES factura3(id_factura3),
  FOREIGN KEY (codigo_articulo3) REFERENCES articulo3(codigo_articulo3)
);


