import unittest
import psycopg2

class TestDatabaseIntegrity(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.conn = psycopg2.connect(
            dbname="test_db",
            user="postgres",
            password="postgres",
            host="localhost",
            port="5432"
        )
        cls.conn.autocommit = True
        cls.cur = cls.conn.cursor()

        cls.cur.execute("""
            INSERT INTO sucursal3 (id_sucursal3, nombre_sucursal3)
            VALUES (999, 'Sucursal Prueba')
            ON CONFLICT (id_sucursal3) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO forma_pago3 (id_forma_pago3, tipo_pago3)
            VALUES (999, 'Efectivo')
            ON CONFLICT (id_forma_pago3) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO cliente3 (codigo_cliente3, nombre_cliente3)
            VALUES (999, 'Cliente Prueba')
            ON CONFLICT (codigo_cliente3) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO articulo3 (codigo_articulo3, nombre_articulo3, precio_unitario3)
            VALUES (999, 'Articulo Prueba', 50.00)
            ON CONFLICT (codigo_articulo3) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO factura3 (id_factura3, codigo_cliente3, id_sucursal3, id_forma_pago3, fecha3, total_factura3)
            VALUES (999, 999, 999, 999, CURRENT_DATE, 100.00)
            ON CONFLICT (id_factura3) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO detalles_factura3 (id_factura3, codigo_articulo3, cantidad_articulo3)
            VALUES (999, 999, 2)
            ON CONFLICT (id_factura3, codigo_articulo3) DO NOTHING;
        """)

    def test_precio_unitario_integridad(self):
        self.cur.execute("""
            UPDATE articulo3 SET precio_unitario3 = 75.00 WHERE codigo_articulo3 = 999;
        """)

        self.cur.execute("""
            SELECT total_factura3 FROM factura3 WHERE id_factura3 = 999;
        """)
        total_factura = self.cur.fetchone()[0]
        self.assertEqual(total_factura, 100.00)

    @classmethod
    def tearDownClass(cls):
        cls.cur.execute("DELETE FROM detalles_factura3 WHERE id_factura3 = 999 AND codigo_articulo3 = 999;")
        cls.cur.execute("DELETE FROM factura3 WHERE id_factura3 = 999;")
        cls.cur.execute("DELETE FROM articulo3 WHERE codigo_articulo3 = 999;")
        cls.cur.execute("DELETE FROM cliente3 WHERE codigo_cliente3 = 999;")
        cls.cur.execute("DELETE FROM sucursal3 WHERE id_sucursal3 = 999;")
        cls.cur.execute("DELETE FROM forma_pago3 WHERE id_forma_pago3 = 999;")
        cls.cur.close()
        cls.conn.close()

if __name__ == '__main__':
    unittest.main()
