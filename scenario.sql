create database scenario1;
show databases;
use scenario1;
create table customer(cust_id int(10) primary key,cust_name varchar(20));
create table items(item_id int(10) primary key,item_name varchar(10),price int(10));
create table sales(bill_no int(10),bill_date date,cust_id int(10) references customer(cust_id),item_id int(10) references items(item_id),quantity int(5) );
desc customer;
desc items;
desc sales;
insert into customer(cust_id,cust_name) values (1,"jai"),(2,"ram"),(3,"sanjay"),(4,"sanjeeth"),(5,"vishawank");
select *from customer;
insert into items(item_id,item_name,price) values (11,"pencil",5),(12,"eraser",3),(13,"sharpner",5),(14,"pen",10),(15,"Note book",30);
select *from items;
insert into sales(bill_no,bill_date,cust_id,item_id,quantity) values (21,"2021-02-21",1,11,1),(22,"2021-02-21",2,12,1),(23,"2021-02-19",3,13,2),(24,"2021-02-15",4,14,1),(25,"2021-02-18",5,15,1);
select *from sales;
-- bills for the current date with the customer names and item numbers
select c.cust_id,c.cust_name,i.item_id,i.item_name from customer c,items i,sales s where c.cust_id=s.cust_id and i.item_id=s.item_id and s.bill_date="2021-02-18";
--  total bill details with the quantity sold, price of the item and the final amount
select i.item_id,i.item_name,i.price,(i.price*s.quantity) as Total from items i,sales s where i.item_id=s.item_id;
--  details of the customer who have bought a product which has a price >=5
select c.cust_id,c.cust_name,i.item_id,i.item_name,i.price from customer c,items i,sales s where c.cust_id=s.cust_id and i.item_id=s.item_id and i.price>=5;
-- count of how many products have been bought by each customer
select count(s.quantity),c.cust_name from customer c,sales s,items i where c.cust_id=s.cust_id and i.item_id=s.item_id group by c.cust_id;
-- list of products bought by a customer having customer_id as 5
select c.cust_id,i.item_id,i.item_name from items i,customer c,sales s where i.item_id=s.item_id and c.cust_id=s.cust_id and c.cust_id=5;
-- List the items sold and their quantity as of today=2021-2-19
select i.item_id,i.item_name,s.quantity from items i,sales s where i.item_id=s.item_id and s.bill_date="2021-2-19";
-- Create a view which lists out the bill_no, bill_date, customer_id, item_id, price, quantity, amount.
create view bills as select s.bill_no,s.bill_date,c.cust_id,i.item_id,s.quantity,(i.price*s.quantity) as amount from customer c,items i,sales s where i.item_id=s.item_id and c.cust_id=s.item_id; 
select *from bills;