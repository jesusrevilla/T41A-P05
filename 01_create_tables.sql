
CREATE TABLE cliente(
  codigo_cliente SERIAL PRIMARY KEY,
  nombre_cliente TEXT NOT NULL
);

CREATE TABLE articulo(
  codigo_articulo SERIAL PRIMARY KEY,
  nombre_articulo TEXT NOT NULL,
  precioUnitario DECIMAL(6,2) NOT NULL
);

CREATE TABLE factura(
  sucursal INTEGER NOT NULL,
  num_factura INTEGER NOT NULL,
  fecha_factura DATE NOT NULL,
  forma_pago TEXT NOT NULL,
  codigo_cliente INTEGER REFERENCES cliente(codigo_cliente) NOT NULL,
  total_factura DECIMAL(6,2) NOT NULL,
  PRIMARY KEY(sucursal,num_factura)
);

CREATE TABLE detalle_factura(
  sucursal INTEGER NOT NULL,
  num_factura INTEGER NOT NULL,
  codigo_articulo INTEGER REFERENCES articulo(codigo_articulo) NOT NULL,
  cantidad_articulo INTEGER NOT NULL,
  precioUnitario_articulo DECIMAL(6,2) NOT NULL,
  subtotal_articulo DECIMAL(6,2) NOT NULL,
  FOREIGN KEY (sucursal,num_factura) REFERENCES factura(sucursal,num_factura),
  PRIMARY KEY (sucursal,num_factura,codigo_articulo)
);
