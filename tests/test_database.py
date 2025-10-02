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

    def test_factura4_columns_and_keys(self):
        expected_columns = ['id_factura', 'sucursal', 'fecha', 'forma_pago']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'factura4';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        # PK
        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'factura4' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['id_factura'])

    def test_cliente4_columns_and_keys(self):
        expected_columns = ['codigo_cliente', 'nombre_cliente']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'cliente4';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        # PK
        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'cliente4' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['codigo_cliente'])

    def test_articulo4_columns_and_keys(self):
        expected_columns = ['codigo_articulo', 'nombre_articulo', 'precio_unitario']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'articulo4';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        # PK
        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'articulo4' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['codigo_articulo'])

    def test_detalles_factura4_columns_and_keys(self):
        expected_columns = ['id_detalle', 'id_factura', 'codigo_articulo', 'cantidad']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'detalles_factura4';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        # PK
        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'detalles_factura4' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['id_detalle'])

        # FKs
        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'detalles_factura4' AND tc.constraint_type = 'FOREIGN KEY';
        """)
        fk = [col[0] for col in self.cur.fetchall()]
        for col in ['id_factura', 'codigo_articulo']:
            self.assertIn(col, fk)

    @classmethod
    def tearDownClass(cls):
        cls.cur.close()
        cls.conn.close()

if __name__ == '__main__':
    unittest.main()
