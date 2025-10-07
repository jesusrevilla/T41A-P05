CREATE TABLE clientes (
    codigo_del_cliente TEXT PRIMARY KEY,
    nombre_del_cliente TEXT NOT NULL
);

CREATE TABLE articulo (
    codigo_del_articulo TEXT PRIMARY KEY,
    nombre_del_articulo TEXT NOT NULL,
    precio_unitario DECIMAL NOT NULL
);

CREATE TABLE factura (
    sucursal TEXT NOT NULL,
    numero_de_factura INT NOT NULL,
    fecha_de_la_factura DATE NOT NULL,
    forma_de_pago_factura CHAR(3) NOT NULL,
    codigo_del_cliente TEXT NOT NULL,
    total_de_la_factura INT NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);

CREATE TABLE detalle_de_factura (
    sucursal TEXT NOT NULL,
    numero_de_factura INT NOT NULL,
    codigo_de_articulo TEXT NOT NULL,
    cantidad_del_articulo INT NOT NULL,
    precio_unitario_del_articulo DECIMAL NOT NULL,
    subtotal_del_articulo DECIMAL NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
    FOREIGN KEY (codigo_de_articulo) REFERENCES articulo(codigo_del_articulo)
);
