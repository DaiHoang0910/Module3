use quan_ly_ban_hang;
insert into customers
values
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

insert into orders(order_id,customer_id,order_date)
values
(1,1,'2006-3-11'),
(2,2,'2006-3-23'),
(3,1,'2006-3-16');

insert into products
values
(1,'Máy giặt',3),
(2,'Tu Lanh',5),
(3,'Dieu hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);

insert into order_detail
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

SELECT 
    order_id AS oID,
    order_date AS oDate,
    order_total_price AS oPrice
FROM orders;

SELECT 
    customers.customer_id AS CustomerID,
    customers.customer_name AS CustomerName,
    products.product_name AS ProductName
FROM orders
JOIN order_detail ON orders.order_id = order_detail.order_id
JOIN products ON order_detail.product_id = products.product_id
JOIN customers ON orders.customer_id = customers.customer_id
ORDER BY customers.customer_id;

SELECT 
    customer_name AS CustomerName
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
);

SELECT 
    o.order_id AS OrderID,
    o.order_date AS OrderDate,
    SUM(od.order_detail_qty * p.product_price) AS TotalPrice
FROM orders o
JOIN order_detail od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY o.order_id, o.order_date;



