CREATE TABLE factura4 (
  id_factura INT PRIMARY KEY,
  sucursal TEXT NOT NULL,
  fecha DATE NOT NULL,
  forma_pago TEXT NOT NULL
);

CREATE TABLE cliente4 (
  codigo_cliente INT PRIMARY KEY,
  nombre_cliente TEXT NOT NULL
);

CREATE TABLE articulo4 (
  codigo_articulo INT PRIMARY KEY,
  nombre_articulo TEXT NOT NULL,
  precio_unitario FLOAT NOT NULL
);

CREATE TABLE detalles_factura4 (
  id_detalle INT PRIMARY KEY,
  id_factura INT NOT NULL,
  codigo_articulo INT NOT NULL,
  cantidad INT NOT NULL,
  FOREIGN KEY (id_factura) REFERENCES factura4(id_factura),
  FOREIGN KEY (codigo_articulo) REFERENCES articulo4(codigo_articulo)
);
