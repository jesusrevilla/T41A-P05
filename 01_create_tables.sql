CREATE TABLE cliente(
  codigo_cliente TEXT PRIMARY KEY,
  nombre_cliente TEXT NOT NULL 
); 

CREATE TABLE articulo(
  codigo_articulo TEXT PRIMARY KEY,
  nombre_articulo TEXT NOT NULL,
  precio_unitario DECIMAL(6,2) NOT NULL
); 

CREATE TABLE facturas (
  sucursal INTEGER NOT NULL,
  num_factura TEXT NOT NULL,
  fecha_factura DATE NOT NULL,
  forma_pago TEXT NOT NULL,
  codigo_cliente TEXT NOT NULL, 
  total_factura DECIMAL(6,2) NOT NULL,
  PRIMARY KEY(sucursal,num_factura),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

CREATE TABLE detalle_factura(
  sucursal INTEGER NOT NULL,
  num_factura TEXT NOT NULL,
  codigo_articulo TEXT NOT NULL,
  cantidad_articulo INTEGER NOT NULL,
  precioUnitario_articulo DECIMAL(6,2) NOT NULL,
  subtotal_articulo DECIMAL(6,2) NOT NULL,
  FOREIGN KEY (sucursal,num_factura) REFERENCES facturas(sucursal,num_factura),
  FOREIGN KEY (codigo_articulo) REFERENCES articulo(codigo_articulo),
  PRIMARY KEY (sucursal,num_factura,codigo_articulo)
);
