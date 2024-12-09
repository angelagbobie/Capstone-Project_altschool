import psycopg2
import pandas as pd
# Connect to the database
conn = psycopg2.connect(
    host="localhost",
    database="ecommerce",
    user="postgres",
    password="postgres"
)

# Create tables
tables = ["orders", "products", "customers", "order_items"]
for table in tables:
    df = pd.read_csv(f"{table}.csv")
    df.to_sql(table, conn, if_exists="replace", index=False)

# Close the connection
conn.close()
