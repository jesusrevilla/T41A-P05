
CREATE TABLE clientes(
  codigo_del_cliente SERIAL PRIMARY KEY NOT NULL,
  nombre_del_cliente VARCHAR(30) NOT NULL
);

CREATE TABLE factura(
  sucursal INTEGER NOT NULL,
  numero_de_factura INTEGER NOT NULL,
  fecha_de_la_factura DATE NOT NULL,
  forma_de_pago_factura VARCHAR(2) NOT NULL,
  codigo_del_cliente INTEGER NOT NULL,
  total_de_la_factura NUMERIC(5,2) NOT NULL,
  PRIMARY KEY (sucursal, numero_de_factura),
  FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);

CREATE TABLE articulo(
  codigo_del_articulo SERIAL PRIMARY KEY NOT NULL,
  nombre_del_articulo VARCHAR(20) NOT NULL,
  precio_unitario NUMERIC(4,2) NOT NULL
);


CREATE TABLE detalle_de_factura(
  sucursal INTEGER NOT NULL,
  numero_de_factura INTEGER NOT NULL,
  codigo_de_articulo INTEGER NOT NULL,
  cantidad_del_articulo INTEGER NOT NULL,
  precio_unitario_del_articulo NUMERIC(4,2) NOT NULL,
  subtotal_del_articulo NUMERIC(5,2) NOT NULL,
  PRIMARY KEY (sucursal, numero_de_factura , codigo_de_articulo),
  FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
  FOREIGN KEY (codigo_de_articulo) REFERENCES articulo(codigo_del_articulo)
);
