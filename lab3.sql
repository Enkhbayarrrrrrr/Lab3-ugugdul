drop database lab;
create database lab;
use lab;

-- Customers Table
create table customers(
    customer_id int primary key auto_increment,
    name varchar(50),
    city varchar(50)
);

-- Orders Table
create table orders (
    order_id int primary key auto_increment,
    customer_id int,
    order_date date,
    foreign key (customer_id) references customers(customer_id)
);

-- Products Table
create table products(
    product_id int primary key auto_increment,
    product_name varchar(50),
    price decimal(10,2)
);

-- Order Items Table
create table order_items (
    item_id int primary key auto_increment,
    order_id int,
    product_id int,
    quantity int,
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

-- Employees Table (Self Join Example)
create table employees (
    employee_id int primary key auto_increment,
    name varchar(50),
    manager_id int,
    foreign key (manager_id) references employees(employee_id)
);

-- Insert Customers
insert into customers(name , city ) values 
('bat','ulaanbaatar'),
('sara','darkhan'),
('bold','ulaanbaatar');

-- Insert Orders
insert into orders (customer_id, order_date) values
(1,'2024-01-10'),
(2,'2024-01-11'),
(3,'2024-01-12');

-- Insert Products
insert into products (product_name, price) values 
('keyboard',120000),
('mouse',80000),
('monitor',60000);

-- Insert Order Items
insert into order_items (order_id,product_id,quantity ) values 
(1,1,1),
(1,2,2),
(2,3,1),
(3,1,1);

-- Insert Employees
insert into employees (name , manager_id) values 
('Manager A',null),
('Employee B',1),
('Employee C',2);

--------------------------------------------------
-- INNER JOIN (Customers + Orders)
select c.name , o.order_id
from customers c
inner join orders o 
on c.customer_id = o.customer_id;

--------------------------------------------------
select c.name , o.order_id
from customers c
left join orders o 
on c.customer_id = o.customer_id;
select c.name , o.order_id
from customers c
right join orders o 
on c.customer_id = o.customer_id;
select c.name , o.order_id
from customers c
left join orders o 
on c.customer_id = o.customer_id

union

select c.name , o.order_id
from customers c
right join orders o 
on c.customer_id = o.customer_id;
select 
    e.name as employee,
    m.name as manager
from employees e
left join employees m
on e.manager_id = m.employee_id;
select c.name , o.order_id
from customers c
inner join orders o 
on c.customer_id = o.customer_id
where c.city = 'ulaanbaatar';
select 
    c.name,
    o.order_id,
    p.product_name,
    oi.quantity,
    p.price,
    (p.price * oi.quantity) as total
from customers c
inner join orders o on c.customer_id = o.customer_id
inner join order_items oi on o.order_id = oi.order_id
inner join products p on oi.product_id = p.product_id;



