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
            INSERT INTO articulo (cod_articulo, nom_articulo)
            VALUES (1000, 'Articulo Prueba')
            ON CONFLICT (cod_articulo) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO cliente (cod_cliente, nom_cliente)
            VALUES (1000, 'Cliente Prueba')
            ON CONFLICT (cod_cliente) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO factura (sucursal, num_factura, fecha_fac, forma_pago, cod_cliente)
            VALUES (1, 1, CURRENT_DATE, 'Efectivo', 100)
            ON CONFLICT (sucursal, num_fac) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO detalle_factura (sucursal, num_fac, cod_articulo, cantidad, precio_unitario)
            VALUES (1, 1, 100, 2, 50.00)
            ON CONFLICT (sucursal, num_fac, cod_articulo) DO NOTHING;
        """)

    def test_precio_unitario_integridad(self):
        # Cambiar el precio del artículo en la tabla articulo
        self.cur.execute("""
            UPDATE articulo SET precio_unitario = 75.00 WHERE cod_articulo = 100;
        """)

        # Verificar que el precio en detalle_de_factura no cambió
        self.cur.execute("""
            SELECT precio_unitario FROM detalle_factura
            WHERE sucursal = 1 AND num_fac = 1 AND cod_articulo = 100;
        """)
        precio_detalle = self.cur.fetchone()[0]
        self.assertEqual(precio_detalle, 50.00)

    @classmethod
    def tearDownClass(cls):
        # Limpiar los datos de prueba
        cls.cur.execute("DELETE FROM detalle_factura WHERE sucursal = 1 AND num_fac = 1 AND cod_articulo = 100;")
        cls.cur.execute("DELETE FROM factura WHERE sucursal = 1 AND num_fac = 1;")
        cls.cur.execute("DELETE FROM cliente WHERE cod_cliente = 100;")
        cls.cur.execute("DELETE FROM articulo WHERE cod_articulo = 100;")
        cls.cur.close()
        cls.conn.close()

if __name__ == '__main__':
    unittest.main()
