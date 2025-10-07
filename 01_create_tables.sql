-- ========== TABLA: articulo ==========
CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(30) PRIMARY KEY,
    nombre_del_articulo VARCHAR(150) NOT NULL,
    precio_unitario NUMERIC(10,2) NOT NULL,
    CONSTRAINT ck_articulo_precio_pos CHECK (precio_unitario > 0)
);

-- ========== TABLA: clientes ==========
CREATE TABLE clientes (
    codigo_del_cliente VARCHAR(30) PRIMARY KEY,
    nombre_del_cliente VARCHAR(150) NOT NULL
);

-- ========== TABLA: factura ==========
CREATE TABLE factura (
    sucursal VARCHAR(30) NOT NULL,
    numero_de_factura VARCHAR(30) NOT NULL,
    fecha_de_la_factura DATE NOT NULL,
    forma_de_pago_factura VARCHAR(50) NOT NULL,
    codigo_del_cliente VARCHAR(30) NOT NULL,
    total_de_la_factura NUMERIC(12,2),
    CONSTRAINT pk_factura PRIMARY KEY (sucursal, numero_de_factura),
    CONSTRAINT fk_factura_cliente
        FOREIGN KEY (codigo_del_cliente)
        REFERENCES clientes (codigo_del_cliente)
);

-- ========== TABLA: detalle_de_factura ==========
CREATE TABLE detalle_de_factura (
    sucursal VARCHAR(30) NOT NULL,
    numero_de_factura VARCHAR(30) NOT NULL,
    codigo_de_articulo VARCHAR(30) NOT NULL,
    cantidad_del_articulo INTEGER NOT NULL,
    precio_unitario_del_articulo NUMERIC(10,2) NOT NULL,
    subtotal_del_articulo NUMERIC(12,2) NOT NULL,

    CONSTRAINT pk_detall_

