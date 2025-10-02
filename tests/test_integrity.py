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

    def test_precio_unitario_integridad(self):
        # Guardar precio original del artículo 101 (Laptop)
        self.cur.execute("SELECT precio_unitario FROM articulo4 WHERE codigo_articulo = 101;")
        precio_original = self.cur.fetchone()[0]

        # Cambiar el precio en articulo4
        self.cur.execute("UPDATE articulo4 SET precio_unitario = 20000.00 WHERE codigo_articulo = 101;")

        # Verificar que la cantidad en detalles_factura4 sigue igual
        self.cur.execute("""
            SELECT cantidad FROM detalles_factura4
            WHERE id_factura = 1001 AND codigo_articulo = 101;
        """)
        cantidad = self.cur.fetchone()[0]

        self.assertEqual(cantidad, 1)  # sigue siendo 1 Laptop en la factura 1001

        # Restaurar el precio original
        self.cur.execute("UPDATE articulo4 SET precio_unitario = %s WHERE codigo_articulo = 101;", (precio_original,))

    def test_join_factura_articulos(self):
        # Verificar que el join entre factura4 y detalles_factura4 devuelve los datos correctos
        self.cur.execute("""
            SELECT f.id_factura, f.sucursal, a.nombre_articulo, d.cantidad
            FROM factura4 f
            JOIN detalles_factura4 d ON f.id_factura = d.id_factura
            JOIN articulo4 a ON d.codigo_articulo = a.codigo_articulo
            WHERE f.id_factura = 1001
            ORDER BY a.codigo_articulo;
        """)
        resultados = self.cur.fetchall()

        esperado = [
            (1001, 'Plaza San Luis', 'Laptop', 1),
            (1001, 'Plaza San Luis', 'Mouse', 2)
        ]

        self.assertEqual(resultados, esperado)

    def test_factura2_con_teclado(self):
        # Verificar que en factura 1002 solo aparece el Teclado con cantidad 1
        self.cur.execute("""
            SELECT f.id_factura, f.sucursal, a.nombre_articulo, d.cantidad
            FROM factura4 f
            JOIN detalles_factura4 d ON f.id_factura = d.id_factura
            JOIN articulo4 a ON d.codigo_articulo = a.codigo_articulo
            WHERE f.id_factura = 1002;
        """)
        resultado = self.cur.fetchone()

        esperado = (1002, 'Plaza El Dorado', 'Teclado', 1)

        self.assertEqual(resultado, esperado)

    @classmethod
    def tearDownClass(cls):
        cls.cur.close()
        cls.conn.close()

if __name__ == '__main__':
    unittest.main()
