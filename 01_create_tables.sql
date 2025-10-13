CREATE TABLE articulo (
    codigo_del_articulo VARCHAR(10) PRIMARY KEY,
    nombre_del_articulo VARCHAR(100) NOT NULL,
    precio_unitario NUMERIC(10, 2) NOT NULL CHECK (precio_unitario >= 0)
);

CREATE TABLE clientes (
    codigo_del_cliente VARCHAR(10) PRIMARY KEY,
    nombre_del_cliente VARCHAR(100) NOT NULL
);

CREATE TABLE factura (
    sucursal VARCHAR(5) NOT NULL,
    numero_de_factura INTEGER NOT NULL,
    fecha_de_la_factura DATE NOT NULL DEFAULT CURRENT_DATE,
    forma_de_pago_factura VARCHAR(50) NOT NULL,
    codigo_del_cliente VARCHAR(10) NOT NULL,
    total_de_la_factura NUMERIC(10, 2) NOT NULL CHECK (total_de_la_factura >= 0),
    
    PRIMARY KEY (sucursal, numero_de_factura),
    
      FOREIGN KEY (codigo_del_cliente) REFERENCES clientes (codigo_del_cliente)
);

CREATE TABLE detalle_de_factura (
    sucursal VARCHAR(5) NOT NULL,
    numero_de_factura INTEGER NOT NULL,
    codigo_de_articulo VARCHAR(10) NOT NULL,
    cantidad_del_articulo INTEGER NOT NULL CHECK (cantidad_del_articulo > 0),
    precio_unitario_del_articulo NUMERIC(10, 2) NOT NULL CHECK (precio_unitario_del_articulo >= 0),
    subtotal_del_articulo NUMERIC(10, 2) NOT NULL CHECK (subtotal_del_articulo >= 0),
    
    PRIMARY KEY (sucursal, numero_de_factura, codigo_de_articulo),
    
    FOREIGN KEY (sucursal, numero_de_factura) 
        REFERENCES factura (sucursal, numero_de_factura),

    FOREIGN KEY (codigo_de_articulo) 
        REFERENCES articulo (codigo_del_articulo)
);
