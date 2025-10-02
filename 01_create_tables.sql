CREATE TABLE cliente(
 codigo INTEGER PRIMARY KEY NOT NULL,
 nombre TEXT NOT NULL
);

CREATE TABLE factura(
  sucursal INTEGER NOT NULL,
  numero_factura INTEGER NOT NULL,
  fecha_factura DATE NOT NULL,
  forma_pago TEXT NOT NULL,
  codigo_cliente INTEGER NOT NULL,
  total_factura FLOAT NOT NULL,
  PRIMARY KEY (sucursal,numero_factura),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo)
);

CREATE TABLE articulo(
 codigo INTEGER PRIMARY KEY NOT NULL,
 nombre TEXT NOT NULL,
 precio_unitario FLOAT NOT NULL
);

CREATE TABLE detalle_factura(
 sucursal INTEGER NOT NULL,
 numero_factura INTEGER NOT NULL,
 codigo_articulo INTEGER NOT NULL,
 cantidad_articulo INTEGER NOT NULL,
 precio_unitario INTEGER NOT NULL,
 subtotal_articulo INTEGER NOT NULL,
 PRIMARY KEY(sucursal,numero_factura,codigo_articulo),
 FOREIGN KEY (sucursal, numero_factura) REFERENCES factura3FN(sucursal, numero_factura),
 FOREIGN KEY (codigo_articulo) REFERENCES articulo3FN(codigo)
);
