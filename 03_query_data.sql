SELECT 
    c.nom_cliente,
    a.nom_articulo,
    df.cantidad
FROM detalle_factura df
JOIN factura f 
    ON df.num_fac = f.num_fac AND df.sucursal = f.sucursal
JOIN cliente c 
    ON f.cod_cliente = c.cod_cliente
JOIN articulo a 
    ON df.cod_articulo = a.cod_articulo;
