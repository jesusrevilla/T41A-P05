
/* =========================================================
                     MODELO FINAL EN 3FN 
      Tablas: Cliente, Articulo, Factura, Detalle_Factura
   ========================================================= */

/* CLIENTE */
CREATE TABLE "Cliente" (
  "CodigoCliente"   VARCHAR(10) PRIMARY KEY,
  "NombreCliente"   VARCHAR(100) NOT NULL
);

/* ARTICULO */
CREATE TABLE "Articulo" (
  "CodigoArticulo"   VARCHAR(10) PRIMARY KEY,
  "NombreArticulo"   VARCHAR(100) NOT NULL,
  "PrecioUnitario"   NUMERIC(10,2) NOT NULL CHECK ("PrecioUnitario" >= 0)
);

/* FACTURA (cabecera) */
CREATE TABLE "Factura" (
  "Sucursal"          VARCHAR(10)  NOT NULL,
  "NumeroFactura"     VARCHAR(10)  NOT NULL,
  "FechaFactura"      DATE         NOT NULL,
  "FormaPagoFactura"  VARCHAR(10)  NOT NULL,
  "CodigoCliente"     VARCHAR(10)  NOT NULL,
  "TotalFactura"      NUMERIC(12,2) NOT NULL CHECK ("TotalFactura" >= 0),
  CONSTRAINT "PK_Factura" PRIMARY KEY ("Sucursal","NumeroFactura"),
  CONSTRAINT "FK_Factura_Cliente"
   FOREIGN KEY ("CodigoCliente") REFERENCES "Cliente"("CodigoCliente")
);

/* DETALLE DE FACTURA (líneas) */
CREATE TABLE "Detalle_Factura" (
  "Sucursal"                VARCHAR(10)  NOT NULL,
  "NumeroFactura"           VARCHAR(10)  NOT NULL,
  "CodigoArticulo"          VARCHAR(10)  NOT NULL,
  "CantidadArticulo"        INTEGER      NOT NULL CHECK ("CantidadArticulo" > 0),
  /* Incluí precio unitario y subtotal aquí
     (aunque se calculen desde Articulo) */
  "PrecioUnitarioArticulo"  NUMERIC(10,2) NOT NULL CHECK ("PrecioUnitarioArticulo" >= 0),
  "SubtotalArticulo"        NUMERIC(12,2) NOT NULL CHECK ("SubtotalArticulo" >= 0),
  CONSTRAINT "PK_Detalle" PRIMARY KEY ("Sucursal","NumeroFactura","CodigoArticulo"),
  CONSTRAINT "FK_Detalle_Factura"
    FOREIGN KEY ("Sucursal","NumeroFactura")
    REFERENCES "Factura"("Sucursal","NumeroFactura"),
  CONSTRAINT "FK_Detalle_Articulo"
    FOREIGN KEY ("CodigoArticulo") REFERENCES "Articulo"("CodigoArticulo")
);
