CREATE TABLE Clientes (
    codigo_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(255) NOT NULL
);

CREATE TABLE Articulos (
    codigo_articulo INT PRIMARY KEY,
    nombre_articulo VARCHAR(255) NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Facturas (
    sucursal VARCHAR(10),
    numero_factura INT,
    fecha_factura DATE NOT NULL,
    forma_pago_factura VARCHAR(50),
    codigo_cliente INT,
    total_factura DECIMAL(10, 2),
    PRIMARY KEY (sucursal, numero_factura),
    FOREIGN KEY (codigo_cliente) REFERENCES Clientes(codigo_cliente)
);

CREATE TABLE Stock (
    codigo_articulo INT PRIMARY KEY,
    cantidad_disponible INT NOT NULL DEFAULT 0,
    ultima_actualizacion TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    FOREIGN KEY (codigo_articulo) REFERENCES Articulos(codigo_articulo)
);

CREATE TABLE DetalleFactura (
    sucursal VARCHAR(10),
    numero_factura INT,
    codigo_articulo INT,
    cantidad_articulo INT NOT NULL,
    subtotal_articulo DECIMAL(10, 2),
    PRIMARY KEY (sucursal, numero_factura, codigo_articulo),
    FOREIGN KEY (sucursal, numero_factura) REFERENCES Facturas(sucursal, numero_factura),
    FOREIGN KEY (codigo_articulo) REFERENCES Articulos(codigo_articulo)
);

CREATE TABLE Stock (
    codigo_articulo INT PRIMARY KEY,
    cantidad_disponible INT NOT NULL DEFAULT 0,
    ultima_actualizacion TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    FOREIGN KEY (codigo_articulo) REFERENCES Articulos(codigo_articulo) 
);
