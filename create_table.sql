CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customers(id),
  order_date DATE NOT NULL
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE order_items (
  id SERIAL PRIMARY KEY,
  order_id INTEGER NOT NULL REFERENCES orders(id),
  product_id INTEGER NOT NULL REFERENCES products(id),
  quantity INTEGER NOT NULL
);

- CREATE TABLE: creates a new table in the database.
- customers, orders, products, and order_items: are the table names.
- id: is the primary key column for each table.
- SERIAL: is a data type that automatically increments the value for each new row.
- PRIMARY KEY: specifies the primary key column for each table.
- REFERENCES: specifies the foreign key relationship between tables.
- NOT NULL: specifies that the column cannot be null.
