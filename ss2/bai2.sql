use quan_ly_ban_hang;
create table customers(
customer_id int primary key,
customer_name varchar(100),
customer_age varchar(100)
);
create table orders(
order_id int primary key,
order_date date,
order_total_price double ,
customer_id int,
foreign key (customer_id) references customers(customer_id)
);
create table products (
product_id int primary key,
product_name varchar(100),
product_price double
);
create table order_detail(
order_id int ,
product_id int,
 order_detail_qty varchar(100),
 foreign key (order_id) references orders(order_id),
 foreign key (product_id) references products(product_id)
);