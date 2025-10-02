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
            INSERT INTO articulo (codigo, nombre, precio_unitario)
            VALUES ('A100', 'Articulo Prueba', 50.00)
            ON CONFLICT (codigo) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO cliente (codigo, nombre)
            VALUES ('C100', 'Cliente Prueba')
            ON CONFLICT (codigo) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO factura (sucursal, numero_factura, fecha_factura, forma_pago, codigo_cliente, total_factura)
            VALUES ('S1', 1, CURRENT_DATE, 'Efectivo', 'C100', 100.00)
            ON CONFLICT (sucursal, numero_factura) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO detalle_factura (sucursal, numero_factura, codigo_articulo, cantidad_articulo, precio_unitario, subtotal_articulo)
            VALUES ('S1', 1, 'A100', 2, 50.00, 100.00)
            ON CONFLICT (sucursal, numero_factura, codigo_articulo) DO NOTHING;
        """)

    def test_precio_unitario_integridad(self):
        # Cambiar el precio del artículo en la tabla articulo
        self.cur.execute("""
            UPDATE articulo SET precio_unitario = 75.00 WHERE codigo = 'A100';
        """)

        # Verificar que el precio en detalle_de_factura no cambió
        self.cur.execute("""
            SELECT precio_unitario FROM detalle_factura
            WHERE sucursal = 'S1' AND numero_factura = 1 AND codigo_articulo = 'A100';
        """)
        precio_detalle = self.cur.fetchone()[0]
        self.assertEqual(precio_detalle, 50.00)

    @classmethod
    def tearDownClass(cls):
        # Limpiar los datos de prueba
        cls.cur.execute("DELETE FROM detalle_factura WHERE sucursal = 'S1' AND numero_factura = 1 AND codigo_articulo = 'A100';")
        cls.cur.execute("DELETE FROM factura WHERE sucursal = 'S1' AND numero_factura = 1;")
        cls.cur.execute("DELETE FROM cliente WHERE codigo = 'C100';")
        cls.cur.execute("DELETE FROM articulo WHERE codigo = 'A100';")
        cls.cur.close()
        cls.conn.close()

if __name__ == '__main__':
    unittest.main()
