CREATE TABLE clientes (
    codigo_cliente SERIAL PRIMARY KEY,
    nombre_cliente TEXT NOT NULL
);

CREATE TABLE articulos (
    codigo_articulo SERIAL PRIMARY KEY,
    nombre_articulo TEXT NOT NULL,
    precio_unitario_articulo DECIMAL(6,2) NOT NULL
);

CREATE TABLE facturas (
    sucursal INTEGER NOT NULL,
    numero_factura INTEGER NOT NULL,
    fecha_factura DATE NOT NULL,
    forma_pago_factura TEXT NOT NULL,
    codigo_cliente INTEGER NOT NULL REFERENCES clientes(codigo_cliente),
    total_factura DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (sucursal, numero_factura)
);

CREATE TABLE detalle_factura (
    sucursal INTEGER NOT NULL,
    numero_factura INTEGER NOT NULL,
    codigo_articulo INTEGER NOT NULL REFERENCES articulos(codigo_articulo),
    cantidad_articulo INTEGER NOT NULL,
    precioUnitario_articulo DECIMAL(6,2) NOT NULL,
    subtotal_articulo DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (sucursal, numero_factura) REFERENCES facturas(sucursal, numero_factura),
    PRIMARY KEY (sucursal, numero_factura, codigo_articulo)
);
