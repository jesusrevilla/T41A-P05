import unittest
import psycopg2

class TestDatabaseIntegrity(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.conn = psycopg2.connect(
            dbname="bd_3fn",
            user="postgres",
            password="postgres",
            host="localhost",
        )
        cls.cur = cls.conn.cursor()

        # Insertar datos de prueba
        cls.cur.execute("""
            INSERT INTO articulo (cod_articulo, nombre_articulo, precio_unitario)
            VALUES ('A100', 'Artículo Prueba', 50.00)
            ON CONFLICT (cod_articulo) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO cliente (cod_cliente, nombre_cliente)
            VALUES ('C100', 'Cliente Prueba')
            ON CONFLICT (cod_cliente) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO sucursal (id_sucursal, nombre_sucursal)
            VALUES (99, 'Sucursal Prueba')
            ON CONFLICT (id_sucursal) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO factura (num_factura, id_sucursal, fecha_factura, forma_pago, cod_cliente, total_factura)
            VALUES (9999, 99, CURRENT_DATE, 'Efectivo', 'C100', 100.00)
            ON CONFLICT (num_factura) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO detalle_factura (num_factura, cod_articulo, cantidad, subtotal)
            VALUES (9999, 'A100', 2, 100.00)
            ON CONFLICT (num_factura, cod_articulo) DO NOTHING;
        """)

    def test_precio_unitario_integridad(self):
        # Cambiar el precio en tabla articulo
        self.cur.execute("""
            UPDATE articulo SET precio_unitario = 75.00 WHERE cod_articulo = 'A100';
        """)

        # Verificar que el subtotal en detalle_factura no cambió
        self.cur.execute("""
            SELECT subtotal / cantidad FROM detalle_factura
            WHERE num_factura = 9999 AND cod_articulo = 'A100';
        """)
        precio_detalle = self.cur.fetchone()[0]
        self.assertEqual(precio_detalle, 50.00)

    @classmethod
    def tearDownClass(cls):
        # Limpiar datos de prueba
        cls.cur.execute("DELETE FROM detalle_factura WHERE num_factura = 9999 AND cod_articulo = 'A100';")
        cls.cur.execute("DELETE FROM factura WHERE num_factura = 9999;")
        cls.cur.execute("DELETE FROM cliente WHERE cod_cliente = 'C100';")
        cls.cur.execute("DELETE FROM articulo WHERE cod_articulo = 'A100';")
        cls.cur.execute("DELETE FROM sucursal WHERE id_sucursal = 99;")
        cls.cur.close()
        cls.conn.close()

