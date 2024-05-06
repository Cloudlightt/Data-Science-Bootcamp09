--1. Create Pizza_Menu table

CREATE TABLE Pizza_Menu (
  menu_id int PRIMARY KEY,
  menu_name text,
  menu_price int
  );

-- Insert data into the Pizza_Menu Table

iNSERT INTO Pizza_Menu VALUES
(1, 'Hawaiian', 100),
(2, 'Ham', 120),
(3, 'Seafood', 110),
(4, 'Cheese', 105),
(5, 'Margarita', 150);

--2. Create Customer information Table

CREATE TABLE Customer (
  customer_id int PRIMARY KEY,
  name varchar(20),
  gender TEXT,
  age int,
  address taxt
  );

-- Insert data into the Customer information Table

INSERT INTO Customer VALUES
  (1, 'Light', 'Male', '26', 'Canada'),
  (2, 'Gift', 'Female', '26','Canada'),
  (3, 'CK', 'Female', '25', 'Canada'),
  (4, 'Nink', 'Female', '26', 'Korean'),
  (5, 'Jay', 'Male', '20', 'Japan'),
  (6, 'Topson', 'Male', '25', 'Finland'),
  (7, 'Ceb', 'Male', '31', 'France'),
  (8, 'Jeen', 'Female', '24', 'England'),
  (9, 'BZM', 'Male', '21', 'France'),
  (10, 'Sumail', 'Male', '20', 'USA');


--3. Create Orders Table

CREATE TABLE Orders (
  order_id int PRIMARY KEY,
  order_date date,
  customer_id int,
  menu_id int,
  quantity int,
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (menu_id) REFERENCES Pizza_Menu(menu_id)
);

-- Insert data into the Orders table
INSERT INTO Orders VALUES
  (1, '2023-01-01', 1, 4, 2),
  (2, '2023-02-02', 2, 4, 2),
  (3, '2023-03-02', 3, 5, 6),
  (4, '2023-08-03', 4, 4, 5),
  (5, '2023-01-03', 5, 5, 3),
  (6, '2023-10-04', 6, 1, 2),
  (7, '2023-09-04', 7, 2, 1),
  (8, '2023-10-06', 8, 3, 4),
  (9, '2023-10-29', 9, 4, 5),
  (10, '2023-10-16', 10, 5, 5),
  (11, '2023-05-12', 2, 4, 3),
  (12, '2022-04-01', 2, 2, 4),
  (13, '2022-05-01', 1, 4, 1),
  (14, '2022-06-01', 1, 2, 2);

-- Check the created tables
.mode box
select * from Pizza_Menu;
select * from Customer;
select * from Orders;


--- Join Table & CREATE VIEW & Aggregate Functions ---

-- Query1 : Find best-selling pizzas. (Join 2 Table & Aggregate Functions)
select
  p.menu_name,
  sum(o.quantity) as Total_Order,
  sum(o.quantity * p.menu_price) as Total_Price
from Orders o
join Pizza_Menu p on o.menu_id = p.menu_id
group by 1
order by 3 desc;


-- Query2 : Find the sales of each menu to the customer's address. (Join 3 Table & Aggregate Functions)
select
  p.menu_name,
  c.address,
  sum(o.quantity) as Total_Order,
  sum(o.quantity * p.menu_price) as Total_Price
from Orders o 
join Pizza_Menu p on o.menu_id = p.menu_id
join Customer c on o.customer_id = c.customer_id
group by 1,2
order by 4 desc;

--Query2.1 : CREATE VIEW + SELECT
CREATE VIEW Order_Stats AS
select
  p.menu_name,
  c.address,
  sum(o.quantity) as Total_Order,
  sum(o.quantity * p.menu_price) as Total_Price
from Orders o 
join Pizza_Menu p on o.menu_id = p.menu_id
join Customer c on o.customer_id = c.customer_id
group by 1,2
order by 4 desc;

--Query3 : Find all the information on each order. (Join 3 Table, Basic)
select 
  o.order_id  AS Order_ID,
  o.order_date AS Order_Date,
  c.name AS Customer_Name,
  c.gender AS Customer_Gender,
  c.age AS Customer_Age,
  c.address AS Customer_Address,
  p.menu_name AS Menu_Name,
  p.menu_price AS Menu_Price,
  o.quantity AS Quantity
FROM Orders  AS o
left join Customer AS c on o.customer_id = c.customer_id
left join Pizza_Menu AS p on o.menu_id = p.menu_id
group by 1,2,8,9
order by 8 DESC;


--- Subqueries or WITH ---

-- Query4 : Find Canada customers who purchase our products in 2023
with Canada_Customer as 
  (select * from Customer where address = 'Canada'),
     Canada_Orders as
  (select * from Orders  where STRFTIME("%Y",order_date) = "2023")

select
  name,
  age,
  gender,
  address,
  COUNT(*)  as Count_Order
from Canada_Customer  as c1
join Canada_Orders as c2 on c1.customer_id = c2.customer_id
group by 1,2,3,4
ORDER by 5 DESC;

-- Query5 : Find France customers who purchase our products in 2023
select
  name,
  age,
  gender,
  address,
  count(*)  as Count_Order
from (SELECT * from Customer where address = 'France') as c1
  join (select * from Orders  where STRFTIME("%Y",order_date) = "2023") as c2 
  on c1.customer_id = c2.customer_id
group by 1,2,3,4
ORDER by 5 DESC;

-----------------------------------------------------------------------------
