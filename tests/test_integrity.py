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
            INSERT INTO articulo (codigo_articulo, nombre_articulo, preciounitario_articulo )
            VALUES ('A100', 'Articulo Prueba', 50.00)
            ON CONFLICT (codigo_articulo) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO cliente (codigo_cliente, nombre_cliente)
            VALUES ('C100', 'Cliente Prueba')
            ON CONFLICT (codigo_cliente) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO facturas (sucursal, num_factura, fecha_factura, forma_pago, codigo_cliente, total_factura)
            VALUES ('S1', 1, CURRENT_DATE, 'Efectivo', 'C100', 100.00)
            ON CONFLICT (sucursal, num_factura) DO NOTHING;
        """)
        cls.cur.execute("""
            INSERT INTO detalle_factura (sucursal, num_factura, codigo_articulo, cantidad_articulo, preciounitario_articulo, subtotal_articulo)
            VALUES ('S1', 1, 'A100', 2, 50.00, 100.00)
            ON CONFLICT (sucursal, num_factura, codigo_articulo) DO NOTHING;
        """)

    def test_precio_unitario_integridad(self):
        # Cambiar el precio del artículo en la tabla articulo
        self.cur.execute("""
            UPDATE articulo SET preciounitario_articulo = 75.00 WHERE codigo_articulo = 'A100';
        """)

        # Verificar que el precio en detalle_de_factura no cambió
        self.cur.execute("""
            SELECT preciounitario_articulo FROM detalle_factura
            WHERE sucursal = 'S1' AND num_factura = 1 AND codigo_articulo = 'A100';
        """)
        precio_detalle = self.cur.fetchone()[0]
        self.assertEqual(precio_detalle, 50.00)

    @classmethod
    def tearDownClass(cls):
        # Limpiar los datos de prueba
        cls.cur.execute("DELETE FROM detalle_factura WHERE sucursal = 'S1' AND num_factura = 1 AND codigo_articulo = 'A100';")
        cls.cur.execute("DELETE FROM facturas WHERE sucursal = 'S1' AND num_factura = 1;")
        cls.cur.execute("DELETE FROM cliente WHERE codigo_cliente = 'C100';")
        cls.cur.execute("DELETE FROM articulo WHERE codigo_articulo = 'A100';")
        cls.cur.close()
        cls.conn.close()

if __name__ == '__main__':
    unittest.main()
