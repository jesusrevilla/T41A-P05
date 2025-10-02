/* 
T41A-P05 – 03_query_data.sql
Autor: Cristian Ricardo Godinez Limones – Matrícula: 183016
Consultas representativas (joins, agregaciones, filtros y ventanas).
*/

-- 1) Listado de clientes con total gastado (solo pedidos no cancelados)
SELECT 
  c.customer_id,
  c.first_name,
  c.last_name,
  COALESCE(SUM(CASE WHEN o.status <> 'CANCELED' THEN oi.quantity * oi.unit_price END), 0)::NUMERIC(14,2) AS total_spent
FROM customers c
LEFT JOIN orders o        ON o.customer_id = c.customer_id
LEFT JOIN order_items oi  ON oi.order_id   = o.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC, c.customer_id;

-- 2) Top 5 productos por unidades vendidas (excluye cancelados)
SELECT 
  p.product_id,
  p.sku,
  p.product_name,
  SUM(CASE WHEN o.status <> 'CANCELED' THEN oi.quantity ELSE 0 END) AS units_sold
FROM products p
LEFT JOIN order_items oi ON oi.product_id = p.product_id
LEFT JOIN orders o       ON o.order_id    = oi.order_id
GROUP BY p.product_id, p.sku, p.product_name
ORDER BY units_sold DESC, p.product_id
LIMIT 5;

-- 3) Ingreso por categoría (excluye cancelados)
SELECT 
  p.category,
  SUM(CASE WHEN o.status <> 'CANCELED' THEN oi.quantity * oi.unit_price ELSE 0 END)::NUMERIC(14,2) AS revenue
FROM products p
LEFT JOIN order_items oi ON oi.product_id = p.product_id
LEFT JOIN orders o       ON o.order_id    = oi.order_id
GROUP BY p.category
ORDER BY revenue DESC, p.category;

-- 4) Promedio de valor de pedido (no cancelados)
SELECT 
  ROUND(AVG(t.order_total), 2) AS avg_order_value
FROM v_order_totals t
JOIN orders o ON o.order_id = t.order_id
WHERE o.status <> 'CANCELED';

-- 5) Pedidos con más de 1 artículo (no cancelados)
SELECT 
  o.order_id,
  COUNT(*) AS items_count
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status <> 'CANCELED'
GROUP BY o.order_id
HAVING COUNT(*) > 1
ORDER BY items_count DESC, o.order_id;

-- 6) Clientes sin pedidos
SELECT c.*
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;

-- 7) Ranking por gasto con función de ventana
WITH spend AS (
  SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COALESCE(SUM(CASE WHEN o.status <> 'CANCELED' THEN oi.quantity * oi.unit_price END),0) AS total_spent
  FROM customers c
  LEFT JOIN orders o       ON o.customer_id = c.customer_id
  LEFT JOIN order_items oi ON oi.order_id   = o.order_id
  GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT 
  s.*,
  RANK() OVER (ORDER BY s.total_spent DESC) AS spend_rank
FROM spend s
ORDER BY spend_rank, s.customer_id;

-- 8) Últimos pedidos (5 más recientes)
SELECT 
  o.order_id, o.customer_id, o.order_date, o.status,
  COALESCE(t.order_total, 0)::NUMERIC(14,2) AS order_total
FROM orders o
LEFT JOIN v_order_totals t ON t.order_id = o.order_id
ORDER BY o.order_date DESC, o.order_id DESC
LIMIT 5;

-- 9) Productos activos sin ventas
SELECT p.*
FROM products p
LEFT JOIN order_items oi ON oi.product_id = p.product_id
WHERE p.active = TRUE
GROUP BY p.product_id, p.sku, p.product_name, p.category, p.unit_price, p.active
HAVING COUNT(oi.order_item_id) = 0
ORDER BY p.product_id;

-- 10) Ingreso mensual (no cancelados)
SELECT 
  DATE_TRUNC('month', o.order_date)::date AS month_start,
  SUM(oi.quantity * oi.unit_price)::NUMERIC(14,2) AS monthly_revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
WHERE o.status <> 'CANCELED'
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month_start;

