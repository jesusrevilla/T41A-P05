-- Cliente
CREATE TABLE cliente (
  cod_cliente SERIAL PRIMARY KEY,
  nom_cliente TEXT NOT NULL
);

-- Artículo
CREATE TABLE articulo (
  cod_articulo SERIAL PRIMARY KEY,
  nom_articulo TEXT NOT NULL
);

-- Factura
CREATE TABLE factura (
  num_fac INT NOT NULL,
  sucursal INT NOT NULL,
  fecha_fac DATE NOT NULL,
  forma_pago TEXT NOT NULL,
  cod_cliente INT NOT NULL,
  PRIMARY KEY (sucursal, num_fac),
  FOREIGN KEY (cod_cliente) REFERENCES cliente(cod_cliente)
);

-- Detalle de factura
CREATE TABLE detalle_factura (
  sucursal INT NOT NULL,
  num_fac INT NOT NULL,
  cod_articulo INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario FLOAT NOT NULL,
  PRIMARY KEY (sucursal, num_fac, cod_articulo),
  FOREIGN KEY (sucursal, num_fac) REFERENCES factura(sucursal, num_fac),
  FOREIGN KEY (cod_articulo) REFERENCES articulo(cod_articulo)
);
