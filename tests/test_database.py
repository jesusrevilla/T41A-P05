import unittest
import psycopg2

class TestDatabaseSchema(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.conn = psycopg2.connect(
            dbname="test_db",
            user="postgres",
            password="postgres",
            host="localhost",
            port="5432"
        )
        cls.cur = cls.conn.cursor()

    def test_factura_columns_and_keys(self):
        expected_columns = ['sucursal', 'num_factura', 'fecha_factura',
                            'forma_pago', 'codigo_cliente', 'total_factura']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'factura';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'factura' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = {col[0] for col in self.cur.fetchall()}
        self.assertEqual(pk, {'sucursal', 'num_factura'})

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'factura' AND tc.constraint_type = 'FOREIGN KEY';
        """)
        fk = [col[0] for col in self.cur.fetchall()]
        self.assertIn('codigo_cliente', fk)

    def test_detalle_de_factura_columns_and_keys(self):
        expected_columns = ['sucursal', 'num_factura', 'codigo_articulo',
                            'cantidad_articulo', 'precioUnitario_articulo', 'subtotal_articulo']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'detalle_factura';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'detalle_de_factura' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = {col[0] for col in self.cur.fetchall()}
        self.assertEqual(pk, {'sucursal', 'num_factura', 'codigo_articulo'})

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'detalle_de_factura' AND tc.constraint_type = 'FOREIGN KEY';
        """)
        fk = [col[0] for col in self.cur.fetchall()]
        for col in ['sucursal', 'num_factura', 'codigo_articulo']:
            self.assertIn(col, fk)

    def test_articulo_columns_and_keys(self):
        expected_columns = ['codigo_articulo', 'nombre_articulo', 'precioUnitario']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'articulo';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'articulo' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['codigo_articulo'])

    def test_clientes_columns_and_keys(self):
        expected_columns = ['codigo_cliente', 'nombre_cliente']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'cliente';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'cliente' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['codigo_cliente'])

    @classmethod
    def tearDownClass(cls):
        cls.cur.close()
        cls.conn.close()

if __name__ == '__main__':
    unittest.main()
