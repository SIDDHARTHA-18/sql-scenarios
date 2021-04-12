show databases;
CREATE DATABASE scenario4;
USE scenario4;
-- Create the tables with the appropriate integrity constraints.
CREATE TABLE customers (
    customer_id INT(5) primary key,
    customer_name VARCHAR(50));

CREATE TABLE memberships (
    membership_id int(5) primary key,
    (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE cassettes (
    cassette_id int(5) primary key,
    cassette_name VARCHAR(10) ,
    cassette_language varchar(10) ,
) ;

CREATE TABLE issues (
    issue_id int(5) primary key,
    issue_date date,
    membership_id int(5) references memberships(membership_id),
    cassette_id int(5) references cassettes(cassette_id)
);

-- Insert records in each of the tables.
INSERT INTO customers (customer_id,customer_name) values (1,"sai"),(2,"ajith"),(3,"pavan"),(4,"saketh"),(5,nithish);
INSERT INTO memberships (membership_id,customer_id) values (11,1),(12,2),(13,3),(14,4),(15,5);
       
INSERT INTO cassettes (cassette_id,cassette_name, cassette_language) VALUES (21,"saaho","telugu"),(22,"manoharudu","tamil"),(23,"Pushpa","telugu"),(24,"dhoom","Hindi"),(25,"KGF","kannada");
       
INSERT INTO issues (issue_id,issue_date, membership_id, cassette_id) values(31,"2020-10-12",21,1),(32,"2020-11-12",22,2),(33,"2021-11-02",23,3),(34,"2021-02-02",24,4),(35,"2021-01-01",25,5);

-- List all the customers with their membership details.
SELECT
    c.customer_id,
    c.customer_name,
    m.membership_id from customers c,memberships m where c.customer_id=m.customer_id;
-- List all the issues for the current date with the customer names and cassette names
SELECT
   i.issue_id,c.cassette_name,c.cassette_language from issues i,cassettes c,memberships m,customers cu where cu.customer_id=m.customer_id and m.membership_id=i.membership_id and c.cassette_id=i.cassette_id;
   
   

-- List the details of the customer who has bought the cassette with the title "Manoharudu"
SELECT
    issue_id,
    customer_id,
    customer_name,
    cassette_name
    from 
    customers c,memberships m,issues i,cassettes ca 
WHERE cassette_name = 'Manoharudu' and c.customer_id=m.customer_id and m.membership_id=i.membership_id;

-- Give a list of cassettes bought by customer with membership_id as 12.
SELECT 
    customer_id,
    customer_name,
    from 
    customers c,memberships m,issues i,cassettes ca 
WHERE customer_id = 12 and c.customer_id=m.customer_id and c.customer_id=m.customer_id and m.membership_id=i.membership_id;


-- List the sales of cassettes issued as of today.
SELECT
    cassette_id,
    cassette_name,
    cassette_language,
    COUNT(issue_id) AS cassettes_sold
FROM
    issues
        INNER JOIN
    cassettes USING (cassette_id)
GROUP BY cassette_id
ORDER BY cassettes_sold DESC;

-- Create a view which lists out the issue_id, issue_date, customer_name, cassette_name.
create view basic as 
select i.issue_id,i.issue_date,c.customer_name,c.cassette_name 
from customers c,memberships m,issues s,cassettes ca 
where c.customer_id=m.customer_id and c.customer_id=m.customer_id and m.membership_id=i.membership_id;
;
-- Create a view which lists the issues date wise for the last one week.
create view basic1 as 
select i.issue_id from issues i 
where i.issue_date between "2020-04-19" and "2020-04-02";
