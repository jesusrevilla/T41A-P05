-- Tabla clientes
CREATE TABLE clientes (
    codigo_del_cliente INT PRIMARY KEY,
    nombre_del_cliente VARCHAR(100) NOT NULL
);

-- Tabla articulo
CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(10) PRIMARY KEY,
    nombre_del_articulo VARCHAR(100) NOT NULL,
    precio_unitario NUMERIC(10, 2) NOT NULL
);

-- Tabla factura
CREATE TABLE factura (
    sucursal VARCHAR(10),
    numero_de_factura INT,
    fecha_de_la_factura DATE,
    forma_de_pago_factura VARCHAR(20),
    codigo_del_cliente INT,
    total_de_la_factura NUMERIC(12, 2),
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);

-- Tabla detalle_de_factura
CREATE TABLE detalle_de_factura (
    sucursal VARCHAR(10),
    numero_de_factura INT,
    codigo_de_articulo VARCHAR(10),
    cantidad_del_articulo INT,
    precio_unitario_del_articulo NUMERIC(10, 2),
    subtotal_del_articulo NUMERIC(12, 2),
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
    FOREIGN KEY (codigo_de_articulo) REFERENCES articulo(codigo_del_articulo)
);
