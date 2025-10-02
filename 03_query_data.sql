
/* =========================================================
   03_query_data.sql
   Consulta que une las 4 tablas (Cliente, Articulo, Factura,
   Detalle_Factura) para mostrar la factura completa.
   ========================================================= */

SELECT f."Sucursal",
       f."NumeroFactura"     AS "NroFactura",
       f."FechaFactura",
       f."FormaPagoFactura"  AS "FormaPago",
       f."CodigoCliente",
       c."NombreCliente",
       d."CodigoArticulo",
       a."NombreArticulo",
       d."CantidadArticulo"  AS "Cantidad",
       d."PrecioUnitarioArticulo" AS "PrecioUnitario",
       d."SubtotalArticulo"  AS "Subtotal",
       f."TotalFactura"
FROM "Factura" f
JOIN "Cliente" c
  ON f."CodigoCliente" = c."CodigoCliente"
JOIN "Detalle_Factura" d
  ON f."Sucursal" = d."Sucursal"
 AND f."NumeroFactura" = d."NumeroFactura"
JOIN "Articulo" a
  ON d."CodigoArticulo" = a."CodigoArticulo"
ORDER BY f."Sucursal", f."NumeroFactura", d."CodigoArticulo";
