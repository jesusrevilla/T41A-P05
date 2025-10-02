import unittest
import psycopg2

class TestDatabaseSchema(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.conn = psycopg2.connect(
            dbname="bd_3fn",
            user="postgres",
            password="postgres",
            host="localhost",
        )
        cls.cur = cls.conn.cursor()

    def test_factura_columns_and_keys(self):
        expected_columns = ['num_factura', 'id_sucursal', 'fecha_factura',
                            'forma_pago', 'cod_cliente', 'total_factura']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'factura';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        # Primary Key
        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'factura' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = {col[0] for col in self.cur.fetchall()}
        self.assertEqual(pk, {'num_factura'})

        # Foreign Keys
        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'factura' AND tc.constraint_type = 'FOREIGN KEY';
        """)
        fk = [col[0] for col in self.cur.fetchall()]
        for col in ['id_sucursal', 'cod_cliente']:
            self.assertIn(col, fk)

    def test_detalle_factura_columns_and_keys(self):
        expected_columns = ['num_factura', 'cod_articulo', 'cantidad', 'subtotal']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'detalle_factura';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        # Primary Key
        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'detalle_factura' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = {col[0] for col in self.cur.fetchall()}
        self.assertEqual(pk, {'num_factura', 'cod_articulo'})

        # Foreign Keys
        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'detalle_factura' AND tc.constraint_type = 'FOREIGN KEY';
        """)
        fk = [col[0] for col in self.cur.fetchall()]
        for col in ['num_factura', 'cod_articulo']:
            self.assertIn(col, fk)

    def test_articulo_columns_and_keys(self):
        expected_columns = ['cod_articulo', 'nombre_articulo', 'precio_unitario']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'articulo';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        # Primary Key
        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'articulo' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['cod_articulo'])

    def test_cliente_columns_and_keys(self):
        expected_columns = ['cod_cliente', 'nombre_cliente']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'cliente';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        # Primary Key
        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'cliente' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['cod_cliente'])

    def test_sucursal_columns_and_keys(self):
        expected_columns = ['id_sucursal', 'nombre_sucursal']
        self.cur.execute("SELECT column_name FROM information_schema.columns WHERE table_name = 'sucursal';")
        columns = [col[0] for col in self.cur.fetchall()]
        for col in expected_columns:
            self.assertIn(col, columns)

        # Primary Key
        self.cur.execute("""
            SELECT kcu.column_name
            FROM information_schema.table_constraints tc
            JOIN information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
            WHERE tc.table_name = 'sucursal' AND tc.constraint_type = 'PRIMARY KEY';
        """)
        pk = [col[0] for col in self.cur.fetchall()]
        self.assertEqual(pk, ['id_sucursal'])

    @classmethod
    def tearDownClass(cls):
        cls.cur.close()
        cls.conn.close()
