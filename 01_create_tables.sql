-- Primera Forma Normal

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT FROM pg_database WHERE datname = 'bd_3fn'
    ) THEN
        CREATE DATABASE bd_3fn;
    END IF;
END
$$;

-- Cambiar el contexto a la base de datos bd_3fn
-- Esto no se puede hacer dentro del mismo script en PostgreSQL puro,
-- así que en GitHub Actions debes ejecutar este archivo en dos pasos:
-- 1. Crear la base de datos desde 'postgres'
-- 2. Ejecutar el resto del script desde 'bd_3fn'


CREATE TABLE FACTURA_1FN (
    sucursal_factura VARCHAR(50),
    fecha_factura DATE,
    forma_pago VARCHAR(50),
    cod_cliente INT,
    nombre_cliente VARCHAR(100),
    cod_articulo INT,
    nombre_articulo VARCHAR(100),
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    total_factura DECIMAL(10,2)
);

-- Segunda Forma
-- Tabla de clientes
CREATE TABLE CLIENTE_2FN (
    cod_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100)
);

-- Tabla de artículos
CREATE TABLE ARTICULO_2FN (
    cod_articulo INT PRIMARY KEY,
    nombre_articulo VARCHAR(100),
    precio_unitario DECIMAL(10,2)
);

-- Tabla de facturas
CREATE TABLE FACTURA_2FN (
    num_factura INT PRIMARY KEY,
    sucursal VARCHAR(50),
    fecha_factura DATE,
    forma_pago VARCHAR(50),
    cod_cliente INT,
    total_factura DECIMAL(10,2),
    FOREIGN KEY (cod_cliente) REFERENCES CLIENTE_2FN(cod_cliente)
);

-- Detalle de factura
CREATE TABLE DETALLE_FACTURA_2FN (
    num_factura INT,
    cod_articulo INT,
    cantidad INT,
    subtotal DECIMAL(10,2),
    PRIMARY KEY (num_factura, cod_articulo),
    FOREIGN KEY (num_factura) REFERENCES FACTURA_2FN(num_factura),
    FOREIGN KEY (cod_articulo) REFERENCES ARTICULO_2FN(cod_articulo)
);

-- Tercera Forma Normal
-- Tabla de sucursales (si se repiten)
CREATE TABLE SUCURSAL_3FN (
    id_sucursal INT PRIMARY KEY,
    nombre_sucursal VARCHAR(100)
);

-- Tabla de clientes
CREATE TABLE CLIENTE_3FN (
    cod_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100)
);

-- Tabla de artículos
CREATE TABLE ARTICULO_3FN (
    cod_articulo INT PRIMARY KEY,
    nombre_articulo VARCHAR(100),
    precio_unitario DECIMAL(10,2)
);

-- Tabla de facturas
CREATE TABLE FACTURA_3FN (
    num_factura INT PRIMARY KEY,
    id_sucursal INT,
    fecha_factura DATE,
    forma_pago VARCHAR(50),
    cod_cliente INT,
    total_factura DECIMAL(10,2),
    FOREIGN KEY (id_sucursal) REFERENCES SUCURSAL_3FN(id_sucursal),
    FOREIGN KEY (cod_cliente) REFERENCES CLIENTE_3FN(cod_cliente)
);

-- Detalle de factura
CREATE TABLE DETALLE_FACTURA_3FN (
    num_factura INT,
    cod_articulo INT,
    cantidad INT,
    subtotal DECIMAL(10,2),
    PRIMARY KEY (num_factura, cod_articulo),
    FOREIGN KEY (num_factura) REFERENCES FACTURA_3FN(num_factura),
    FOREIGN KEY (cod_articulo) REFERENCES ARTICULO_3FN(cod_articulo)
);

