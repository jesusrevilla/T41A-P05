-- Tabla: clientes
-- PK: codigo_del_cliente
CREATE TABLE IF NOT EXISTS clientes (
    codigo_del_cliente VARCHAR(10) PRIMARY KEY,
    nombre_del_cliente VARCHAR(100) NOT NULL
);

-- Tabla: articulo
-- PK: codigo_del_articulo
CREATE TABLE IF NOT EXISTS articulo (
    codigo_del_articulo VARCHAR(10) PRIMARY KEY,
    nombre_del_articulo VARCHAR(100) NOT NULL,
    precio_unitario NUMERIC(10, 2) NOT NULL
);

-- Tabla: factura
-- PK: (sucursal, numero_de_factura)
-- FK: codigo_del_cliente -> clientes
CREATE TABLE IF NOT EXISTS factura (
    sucursal VARCHAR(10) NOT NULL,
    numero_de_factura INT NOT NULL,
    fecha_de_la_factura DATE NOT NULL,
    forma_de_pago_factura VARCHAR(50) NOT NULL,
    codigo_del_cliente VARCHAR(10) NOT NULL,
    total_de_la_factura NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);

-- Tabla: detalle_de_factura
-- PK: (sucursal, numero_de_factura, codigo_de_articulo)
-- FK: (sucursal, numero_de_factura) -> factura
-- FK: codigo_de_articulo -> articulo
CREATE TABLE IF NOT EXISTS detalle_de_factura (
    sucursal VARCHAR(10) NOT NULL,
    numero_de_factura INT NOT NULL,
    codigo_de_articulo VARCHAR(10) NOT NULL,
    cantidad_del_articulo INT NOT NULL,
    -- Importante: El precio unitario se guarda aquí para preservar el valor histórico de la transacción,
    -- tal como lo exige la prueba 'test_precio_unitario_integridad' en test_integrity.py.
    precio_unitario_del_articulo NUMERIC(10, 2) NOT NULL,
    subtotal_del_articulo NUMERIC(10, 2) NOT NULL,
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
    FOREIGN KEY (codigo_de_articulo) REFERENCES articulo(codigo_del_articulo)
);
