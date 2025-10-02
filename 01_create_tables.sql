-- Tabla de Sucursales
CREATE TABLE Sucursal (
    id_sucursal VARCHAR(10) PRIMARY KEY,
    nombre_sucursal VARCHAR(50) NOT NULL
);
 
-- Tabla de Clientes
CREATE TABLE Cliente (
    id_cliente VARCHAR(10) PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL
);
 
-- Tabla de Artículos
CREATE TABLE Articulo (
    id_articulo VARCHAR(10) PRIMARY KEY,
    nombre_articulo VARCHAR(100) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
);
 
-- Tabla de Facturas
CREATE TABLE Factura (
    id_factura VARCHAR(15) PRIMARY KEY,
    id_sucursal VARCHAR(10) NOT NULL,
    id_cliente VARCHAR(10) NOT NULL,
    fecha DATE NOT NULL,
    forma_pago VARCHAR(20) NOT NULL,
    total DECIMAL(10,2),
 
    CONSTRAINT fk_factura_sucursal FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal),
    CONSTRAINT fk_factura_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
 
-- Tabla de DetalleFactura
CREATE TABLE DetalleFactura (
    id_detalle SERIAL PRIMARY KEY,
    id_factura VARCHAR(15) NOT NULL,
    id_articulo VARCHAR(10) NOT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
 
    CONSTRAINT fk_detalle_factura FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
    CONSTRAINT fk_detalle_articulo FOREIGN KEY (id_articulo) REFERENCES Articulo(id_articulo)
);
