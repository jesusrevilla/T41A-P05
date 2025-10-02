-- Tabla Cliente 
CREATE TABLE clientes (
  codigo_del_cliente INT PRIMARY KEY,
  nombre_del_cliente VARCHAR(100)
);

-- Tabla Articulo
CREATE TABLE articulo (
  codigo_del_articulo INT PRIMARY KEY,
  nombre_del_articulo VARCHAR(100),
  precio_unitario NUMERIC(10,2)
);

-- Tabla Factura 
CREATE TABLE factura (
  sucursal VARCHAR(50),
  numero_de_factura INT,
  fecha_de_la_factura DATE,
  forma_de_pago_factura VARCHAR(30),
  codigo_del_cliente INT,
  total_de_la_factura INT,
  PRIMARY KEY (sucursal, numero_de_factura),
  FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);

-- Tabla de DetalleFactura
CREATE TABLE detalle_de_factura(
  sucursal VARCHAR(50),
  numero_de_factura INT,
  codigo_de_articulo INT,
  cantidad_del_articulo INT,
  precio_unitario_del_articulo INT,
  subtotal_del_articulo INT,
  PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
  FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
  FOREIGN KEY (codigo_de_articulo) REFERENCES articulo(codigo_del_articulo)
);
