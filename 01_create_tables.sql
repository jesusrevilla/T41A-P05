CREATE TABLE clientes (
    codigo_del_cliente int PRIMARY KEY,
    nombre_del_cliente varchar(50)
);

CREATE TABLE articulo (
    codigo_del_articulo int PRIMARY KEY,  
    nombre_del_articulo varchar(50),
    precio_unitario float
);

CREATE TABLE factura (
    sucursal int,
    numero_de_factura int,
    fecha_de_la_factura date,
    forma_de_pago_factura varchar(50),
    codigo_del_cliente int,
    total_de_la_factura float,
    PRIMARY KEY (sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_cliente) REFERENCES clientes(codigo_del_cliente)
);

CREATE TABLE detalle_de_factura (
    sucursal int,
    numero_de_factura int,
    codigo_del_articulo int,              
    cantidad_del_articulo int,
    precio_unitario_del_articulo int,
    subtotal_del_articulo float,
    PRIMARY KEY (sucursal, numero_de_factura, codigo_del_articulo),
    FOREIGN KEY (sucursal, numero_de_factura) REFERENCES factura(sucursal, numero_de_factura),
    FOREIGN KEY (codigo_del_articulo) REFERENCES articulo(codigo_del_articulo)
);

