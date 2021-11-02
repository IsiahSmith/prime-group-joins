-- 1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id";

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT  "order_date", "description", "quantity" FROM "orders"
JOIN "line_items" ON "line_items"."order_id" = "orders"."id"
JOIN "products" ON "line_items"."product_id" = "products"."id";

-- 3. Which warehouses have cheetos?
SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product"."warehouse_id" = "warehouse"."id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "first_name", COUNT(orders.id) FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id"
JOIN "orders" ON "addresses"."id" = "orders"."address_id"
GROUP BY "first_name";

-- 6. How many customers do we have?
SELECT COUNT(*) FROM "customers"

-- 7. How many products do we carry?
SELECT COUNT(*) FROM "products"

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT "products"."description", SUM(warehouse_product.on_hand) FROM "warehouse_product"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi'
GROUP BY "products"."description";

-- 9. How much was the total cost for each order?
SELECT "orders"."id", SUM("line_items"."quantity" * "products"."unit_price") FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
JOIN "products" ON "products"."id" = "line_items"."product_id"
GROUP BY "orders"."id"

-- 10. How much has each customer spent in total?


-- 11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).

