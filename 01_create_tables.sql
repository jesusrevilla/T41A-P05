/* 
T41A-P05 – 01_create_tables.sql
Autor: Cristian Ricardo Godinez Limones – Matrícula: 183016
Base de datos: PostgreSQL
Descripción: Esquema de una mini-tienda: clientes, productos, pedidos e ítems.
*/

-- Limpieza segura (orden por dependencias)
DROP TABLE IF EXISTS order_items CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS customers CASCADE;

-- Clientes
CREATE TABLE customers (
  customer_id      SERIAL PRIMARY KEY,
  first_name       VARCHAR(80)  NOT NULL,
  last_name        VARCHAR(80)  NOT NULL,
  email            VARCHAR(160) NOT NULL UNIQUE,
  phone            VARCHAR(25),
  created_at       TIMESTAMP    NOT NULL DEFAULT NOW()
);

-- Productos
CREATE TABLE products (
  product_id       SERIAL PRIMARY KEY,
  sku              VARCHAR(40)  NOT NULL UNIQUE,
  product_name     VARCHAR(120) NOT NULL,
  category         VARCHAR(60)  NOT NULL,
  unit_price       NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0),
  active           BOOLEAN NOT NULL DEFAULT TRUE
);

-- Pedidos (cabecera)
CREATE TABLE orders (
  order_id         SERIAL PRIMARY KEY,
  customer_id      INTEGER NOT NULL REFERENCES customers(customer_id) ON DELETE RESTRICT,
  order_date       DATE    NOT NULL DEFAULT CURRENT_DATE,
  status           VARCHAR(20) NOT NULL DEFAULT 'PENDING', -- PENDING | PAID | CANCELED | SHIPPED
  note             VARCHAR(300)
);

-- Ítems del pedido (detalle)
CREATE TABLE order_items (
  order_item_id    SERIAL PRIMARY KEY,
  order_id         INTEGER NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
  product_id       INTEGER NOT NULL REFERENCES products(product_id) ON DELETE RESTRICT,
  quantity         INTEGER NOT NULL CHECK (quantity > 0),
  unit_price       NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0),
  CONSTRAINT uq_order_product UNIQUE (order_id, product_id)
);

-- Vistas de apoyo (opcionales pero útiles para consultas)
CREATE VIEW v_order_totals AS
SELECT 
  o.order_id,
  o.customer_id,
  SUM(oi.quantity * oi.unit_price)::NUMERIC(14,2) AS order_total
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY o.order_id, o.customer_id;

-- Índices recomendados
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_products_category ON products(category);
CREATE INDEX idx_order_items_product ON order_items(product_id);

