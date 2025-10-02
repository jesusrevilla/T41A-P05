CREATE TABLE forma_pago(
  forma_de_pago_factura VARCHAR(5) PRIMARY KEY
);

-- Tabla de clientes
CREATE TABLE clientes(
  codigo_del_cliente INTEGER PRIMARY KEY,
  nombre_del_cliente VARCHAR(50) NOT NULL
);

-- Tabla de artículos
CREATE TABLE articulo(
  codigo_del_articulo INTEGER PRIMARY KEY,
  nombre_del_articulo VARCHAR(30) NOT NULL,
  precio_unitario FLOAT NOT NULL
);

-- Tabla de facturas
CREATE TABLE factura(
  sucursal VARCHAR(30) NOT NULL,
  numero_de_factura INTEGER NOT NULL,
  fecha_de_la_factura DATE NOT NULL,
  forma_de_pago_factura VARCHAR(5) NOT NULL,
  codigo_del_cliente INTEGER NOT NULL,
  total_de_la_factura FLOAT NOT NULL,
  PRIMARY KEY(sucursal, numero_de_factura),
  FOREIGN KEY(codigo_del_cliente) REFERENCES clientes(codigo_del_cliente),
  FOREIGN KEY(forma_de_pago_factura) REFERENCES forma_pago(forma_de_pago_factura)
);

-- Tabla de detalle de facturas
CREATE TABLE detalle_de_factura(
  sucursal VARCHAR(30) NOT NULL,
  numero_de_factura INTEGER NOT NULL,
  codigo_de_articulo INTEGER NOT NULL,
  cantidad_del_articulo INTEGER NOT NULL,
  precio_unitario_del_articulo FLOAT NOT NULL,
  subtotal_del_articulo FLOAT NOT NULL,
  PRIMARY KEY(sucursal, numero_de_factura, codigo_de_articulo),
  FOREIGN KEY(codigo_de_articulo) REFERENCES articulo(codigo_del_articulo),
  FOREIGN KEY(sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura)
);
