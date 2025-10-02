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

    def test_factura3_columns_and_keys(self):
        expected_columns = ['id_factura3', 'codigo_cliente3', 'id_sucursal3',
                            'id_forma_pago3', 'fecha3', 'total_factura3']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'factura3';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'factura3' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = {col[0] for col in self.cur.fetchall()}
        self.assertEqual(pk, {'id_factura3'})

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'factura3' AND tc.constraint_type = 'FOREIGN KEY';
        """)
        fk = [col[0] for col in self.cur.fetchall()]
        for col in ['codigo_cliente3', 'id_sucursal3', 'id_forma_pago3']:
            self.assertIn(col, fk)

    def test_detalles_factura3_columns_and_keys(self):
        expected_columns = ['id_factura3', 'codigo_articulo3', 'cantidad_articulo3']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'detalles_factura3';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'detalles_factura3' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = {col[0] for col in self.cur.fetchall()}
        self.assertEqual(pk, {'id_factura3', 'codigo_articulo3'})

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'detalles_factura3' AND tc.constraint_type = 'FOREIGN KEY';
        """)
        fk = [col[0] for col in self.cur.fetchall()]
        for col in ['id_factura3', 'codigo_articulo3']:
            self.assertIn(col, fk)

    def test_articulo3_columns_and_keys(self):
        expected_columns = ['codigo_articulo3', 'nombre_articulo3', 'precio_unitario3']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'articulo3';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'articulo3' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['codigo_articulo3'])

    def test_cliente3_columns_and_keys(self):
        expected_columns = ['codigo_cliente3', 'nombre_cliente3']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'cliente3';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'cliente3' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['codigo_cliente3'])

    def test_sucursal3_columns_and_keys(self):
        expected_columns = ['id_sucursal3', 'nombre_sucursal3']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'sucursal3';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'sucursal3' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['id_sucursal3'])

    def test_forma_pago3_columns_and_keys(self):
        expected_columns = ['id_forma_pago3', 'tipo_pago3']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'forma_pago3';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'forma_pago3' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['id_forma_pago3'])

    @classmethod
    def tearDownClass(cls):
        cls.cur.close()
        cls.conn.close()

if __name__ == '__main__':
    unittest.main()
