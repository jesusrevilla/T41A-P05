CREATE TABLE factura (

    sucursal VARCHAR(10) NOT NULL,
    numero_de_factura INT NOT NULL,
    fecha_de_la_factura DATE NOT NULL,
    forma_de_pago_factura VARCHAR(20) NOT NULL,
    codigo_del_cliente VARCHAR(10) NOT NULL,
    total_de_la_factura FLOAT NOT NULL,
    
    PRIMARY KEY (sucursal, numero_factura),
    FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente)
);

CREATE TABLE detalle_de_factura(
    sucursal VARCHAR(10) NOT NULL,
    numero_de_factura INT NOT NULL,
    codigo_de_articulo VARCHAR(5) NOT NULL,
    cantidad_del_articulo INT NOT NULL,
    precio_unitario_del_articulo FLOAT NOT NULL,
    subtotal_del_articulo FLOAT NOT NULL,
    
    PRIMARY KEY (sucursal, numero_factura, codigo_articulo),
    FOREIGN KEY (sucursal, numero_factura) REFERENCES factura(sucursal, numero_factura),
    FOREIGN KEY (codigo_articulo) REFERENCES articulos(codigo_articulo)
);

CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(5) PRIMARY KEY,
    nombre_del_articulo VARCHAR(15) NOT NULL,
    precio_unitario FLOAT NOT NULL
);

CREATE TABLE clientes (
    codigo_del_cliente VARCHAR(10) PRIMARY KEY,
    nombre_del_cliente VARCHAR(30) NOT NULL
);
