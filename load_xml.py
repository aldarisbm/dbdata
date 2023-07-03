import psycopg2
import os

class PostgresConnection:
    def __init__(self):
        print("Connecting to Postgres...")
        self.conn = connect_to_postgres()
        self.cursor = self.conn.cursor()
        print(self.conn.info)
    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.conn.commit()
        self.cursor.close()
        self.conn.close()

    def load_row_into_table(self, table_name: str, columns: list, values: list):
        if len(columns) != len(values):
            raise Exception("Columns and values must be the same length")
        columns_str = ', '.join(columns)
        values_str = ', '.join(values)

        # res = self.cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public' AND table_type = 'BASE TABLE';")
        # print(res)
        query = f"INSERT INTO {table_name} ({columns_str}) VALUES ({values_str})"
        print(f'Inserting: {query}...')
        self.cursor.execute(query)

def connect_to_postgres():
    postgres_password = os.environ.get('POSTGRES_PASSWORD')
    if not postgres_password:
        postgres_password = "postgres"
    try:
        conn = psycopg2.connect(
            host="localhost",
            port="5432",
            database="stackexchange",
            user="postgres",
            password=postgres_password
        )
        return conn
    except:
        print("Unable to connect to Postgres")
