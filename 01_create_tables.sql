CREATE TABLE facturas (
    sucursal VARCHAR(10),
    numero_factura VARCHAR(10),
    fecha_factura DATE NOT NULL,
    forma_pago_factura CHAR(1) NOT NULL,
    codigo_cliente VARCHAR(10) NOT NULL,
    total_factura NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_factura),
    FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente)
);

CREATE TABLE clientes (
    codigo_cliente VARCHAR(10) PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE articulos (
    codigo_articulo VARCHAR(10) PRIMARY KEY,
    nombre_articulo VARCHAR(100) NOT NULL,
    precio_unitario_articulo NUMERIC(10,2) NOT NULL
);

CREATE TABLE detalle_factura (
    sucursal VARCHAR(10),
    numero_factura VARCHAR(10),
    codigo_articulo VARCHAR(10),
    cantidad_articulo INTEGER NOT NULL,
    subtotal_articulo NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_factura, codigo_articulo),
    FOREIGN KEY (sucursal, numero_factura) REFERENCES facturas(sucursal, numero_factura),
    FOREIGN KEY (codigo_articulo) REFERENCES articulos(codigo_articulo)
);

