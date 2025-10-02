CREATE TABLE clientes(
  codigo_del_cliente VARCHAR(5) PRIMARY KEY,
  nombre_del_cliente VARCHAR(50)
);

CREATE TABLE factura(
 sucursal VARCHAR(3) NOT NULL,
 numero_de_factura INTEGER NOT NULL,
 fecha_de_la_factura DATE NOT NULL,
 forma_de_pago_factura VARCHAR(50) NOT NULL,
 codigo_del_cliente VARCHAR(5) REFERENCES clientes(codigo_del_cliente),
 total_de_la_factura DECIMAL(6,2) NOT NULL,
 PRIMARY KEY (sucursal, numero_de_factura)
);

CREATE TABLE articulo(
  codigo_del_articulo VARCHAR(5) PRIMARY KEY,
  nombre_del_articulo VARCHAR(50) NOT NULL,
  precio_unitario DECIMAL(6,2) NOT NULL
);

CREATE TABLE detalle_de_factura(
  sucursal VARCHAR(3) NOT NULL,
  numero_de_factura INTEGER NOT NULL,
  codigo_de_articulo VARCHAR(5) REFERENCES articulo(codigo_del_articulo),
  cantidad_del_articulo INTEGER NOT NULL,
  precio_unitario_del_articulo DECIMAL(6,2) NOT NULL,
  subtotal_del_articulo DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (sucursal,numero_de_factura,codigo_de_articulo),
  FOREIGN KEY (sucursal,numero_de_factura) REFERENCES factura(sucursal,numero_de_factura)
);

