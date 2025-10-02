CREATE TABLE FormaPago (
  forma_pago VARCHAR(5) PRIMARY KEY
);

CREATE TABLE Cliente (
  codigo_cliente INTEGER PRIMARY KEY,
  nombre_cliente VARCHAR(50) NOT NULL
);

CREATE TABLE Articulo (
  codigo_articulo INTEGER PRIMARY KEY,
  nombre_articulo VARCHAR(30) NOT NULL
);

CREATE TABLE Factura (
  sucursal VARCHAR(30) NOT NULL,
  numero_factura INTEGER NOT NULL,
  fecha_factura DATE NOT NULL,
  forma_pago VARCHAR(5) NOT NULL,
  codigo_cliente INTEGER NOT NULL,
  PRIMARY KEY(sucursal, numero_factura),
  FOREIGN KEY(codigo_cliente) REFERENCES Cliente(codigo_cliente),
  FOREIGN KEY(forma_pago) REFERENCES FormaPago(forma_pago)
);


CREATE TABLE DetalleFactura (
  sucursal VARCHAR(30) NOT NULL,
  numero_factura INTEGER NOT NULL,
  codigo_articulo INTEGER NOT NULL,
  cantidad_articulo INTEGER NOT NULL,
  precio_unitario FLOAT NOT NULL,
  PRIMARY KEY(sucursal, numero_factura, codigo_articulo),
  FOREIGN KEY(codigo_articulo) REFERENCES Articulo(codigo_articulo),
  FOREIGN KEY(sucursal, numero_factura) REFERENCES Factura(sucursal, numero_factura)
);


