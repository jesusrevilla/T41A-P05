CREATE TABLE cliente(
  codigo_de_cliente INT PRIMARY KEY NOT NULL,
  nombre_del_cliente VARCHAR(50) NOT NULL
);

CREATE TABLE factura(
  sucursal VARCHAR(10),
  numero_de_factura VARCHAR(10),
  fecha_de_la_factura TIMESTAMP NOT NULL,
  forma_de_pago_factura VARCHAR(12) NOT NULL,
  codigo_de_cliente INT NOT NULL,--Lo utilizo como foranea
  FOREIGN KEY(codigo_de_cliente) REFERENCES cliente(codigo_de_cliente),
  total_de_la_factura NUMERIC(10,2) NOT NULL,
  PRIMARY KEY(sucursal,numero_de_factura)
);

CREATE TABLE articulo(
  codigo_del_articulo VARCHAR(10) NOT NULL PRIMARY KEY,
  nombre_del_articulo VARCHAR(50) NOT NULL,
  precio_unitario NUMERIC(10,2) NOT NULL
);

CREATE TABLE detalleFactura(
  sucursal VARCHAR(10),
  numero_de_factura VARCHAR(10),
  FOREIGN KEY(sucursal,numero_de_factura) REFERENCES factura(sucursal,numero_de_factura),
  codigo_de_articulo VARCHAR(10) NOT NULL,--Nueva Foranea
  FOREIGN KEY(codigo_de_articulo) REFERENCES articulo(codigo_del_articulo),
  cantidad_del_articulo INT NOT NULL,
  precio_unitario_del_articulo NUMERIC(10,2) NOT NULL,
  subtotal_del_articulo NUMERIC(10,2) NOT NULL,
  PRIMARY KEY(sucursal,numero_de_factura,codigo_de_articulo)
);
