CREATE TABLE clientes (
    codigo_del_cliente VARCHAR(255) PRIMARY KEY,
    nombre_del_cliente VARCHAR(255) NOT NULL
);

CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(255) PRIMARY KEY,
    nombre_del_articulo VARCHAR(255) NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE factura (
    sucursal VARCHAR(10),
    numero_de_factura INT,
    fecha_de_la_factura DATE NOT NULL,
    forma_de_pago_factura VARCHAR(50),
    codigo_del_cliente VARCHAR(255),
    total_de_la_factura DECIMAL(10, 2),
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);

CREATE TABLE stock (
    codigo_del_articulo VARCHAR(255) PRIMARY KEY,
    cantidad_disponible INT NOT NULL DEFAULT 0,
    ultima_actualizacion TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    FOREIGN KEY (codigo_del_articulo) REFERENCES articulo(codigo_del_articulo)
);

CREATE TABLE detalle_de_factura (
    sucursal VARCHAR(10),
    numero_de_factura INT,
    codigo_de_articulo VARCHAR(255),
    cantidad_del_articulo INT NOT NULL,
    subtotal_del_articulo DECIMAL(10, 2),
    precio_unitario_del_articulo DECIMAL(10, 2),
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
    FOREIGN KEY (codigo_de_articulo) REFERENCES articulo(codigo_del_articulo)
);
