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

        # Insertar datos de prueba
        
        cls.cur.execute("""
            INSERT INTO forma_de_pago (forma_pago)
            VALUES ('Efectivo')
            ON CONFLICT DO NOTHING;
        """)

        cls.cur.execute("""
            INSERT INTO articulo (codigo_del_articulo, nombre_del_articulo, precio_unitario)
            VALUES ('A100', 'Articulo Prueba', 50.00)
            ON CONFLICT (codigo_del_articulo) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO clientes (codigo_del_cliente, nombre_del_cliente)
            VALUES ('C100', 'Cliente Prueba')
            ON CONFLICT (codigo_del_cliente) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO factura (sucursal, numero_de_factura, fecha_de_la_factura, forma_de_pago_factura, codigo_del_cliente, total_de_la_factura)
            VALUES ('S1', 1, CURRENT_DATE, 'Efectivo', 'C100', 100.00)
            ON CONFLICT (sucursal, numero_de_factura) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO detalle_de_factura (sucursal, numero_de_factura, codigo_de_articulo, cantidad_del_articulo, precio_unitario_del_articulo)
            VALUES ('S1', 1, 'A100', 2, 50.00)
            ON CONFLICT (sucursal, numero_de_factura, codigo_de_articulo) DO NOTHING;
        """)

    def test_precio_unitario_integridad(self):
        # Cambiar el precio del artículo en la tabla articulo
        self.cur.execute("""
            UPDATE articulo SET precio_unitario = 75.00 WHERE codigo_del_articulo = 'A100';
        """)

        # Verificar que el precio en detalle_de_factura no cambió
        self.cur.execute("""
            SELECT precio_unitario_del_articulo FROM detalle_de_factura
            WHERE sucursal = 'S1' AND numero_de_factura = 1 AND codigo_de_articulo = 'A100';
        """)
        precio_detalle = self.cur.fetchone()[0]
        self.assertEqual(precio_detalle, 50.00)

    @classmethod
    def tearDownClass(cls):
        # Limpiar los datos de prueba
        cls.cur.execute("DELETE FROM detalle_de_factura WHERE sucursal = 'S1' AND numero_de_factura = 1 AND codigo_de_articulo = 'A100';")
        cls.cur.execute("DELETE FROM factura WHERE sucursal = 'S1' AND numero_de_factura = 1;")
        cls.cur.execute("DELETE FROM clientes WHERE codigo_del_cliente = 'C100';")
        cls.cur.execute("DELETE FROM articulo WHERE codigo_del_articulo = 'A100';")
        cls.cur.close()
        cls.conn.close()

if __name__ == '__main__':
    unittest.main()
