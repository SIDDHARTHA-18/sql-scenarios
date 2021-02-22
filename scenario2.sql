create database scenario2;
show databases;
use scenario2;
-- creation of student table
create table student(std_id int(10) primary key,std_name varchar(20));
desc student;
-- creation of memberships table
create table membership(mem_id int(10) primary key,std_id int(10) references student(std_id));
desc membership;
-- creation of books  table
create table book(book_id int(10) primary key,book_name varchar(20),book_author varchar(20));
desc book;
-- creation of issue table
create table issue(is_id int(10),is_date date,mem_id int(10) references membership(mem_id),book_id int(10) references book(book_id));
desc issue;
-- inserting data into student table
insert into student(std_id,std_name) values (1,"jai"),(2,"ram"),(3,"sanjay"),(4,"akshay"),(5,"sanjeeth");
select *from student;
-- inserting data into membership table
insert into membership(mem_id,std_id) values (11,1),(12,2),(13,3),(14,4),(15,5);
select *from membership;
-- inserting data into book table
insert into book(book_id,book_name,book_author) values (21,"web technology","achyuth s.godbole"),(22,"software engineering","roger s pressman"),(23,"data base management system","Raghu ramankrishnan"),(24,"Formal languages and automata theory","eric frank"),(25,"Python programming","Martin brown");
select *from book;
-- inserting data into issue table
insert into issue(is_id,is_date,mem_id,book_id) values (31,"2021-02-21",11,21),(32,"2021-02-21",12,22),(33,"2021-02-19",13,23),(34,"2021-02-22",14,25),(35,"2021-02-18",15,24);
select *from issue;
-- list of all student names with their membership ids;
select s.std_name,m.mem_id from student s,membership m where s.std_id=m.std_id;
-- list of all the issues for the current date(2021-02-22) with student and book names;
select s.std_name,b.book_name,i.is_date from student s ,book b,issue i,membership m where i.is_date="21-02-22" and s.std_id=m.std_id and m.mem_id=i.mem_id and b.book_id=i.book_id;
-- details of the student who borrowed book written by raghu ramakrishna
select s.std_id,s.std_name,b.book_id,b.book_name from student s,membership m,book b,issue i where s.std_id=m.std_id and m.mem_id=i.mem_id and b.book_id=i.book_id and b.book_author="raghu ramakrishna";

-- count of books bought by each student;
select count(*),s.std_name as Count from student s,book b,membership m,issue group by b.book_id where s.std_id=m.std_id and m.mem_id=i.mem_id and b.book_id=i.book_id;
-- list of books taken by student with id 3
 select s.std_id,b.book_id,b.book_name from student s,book b,membership m,issue i where s.std_id=3 and s.std_id=m.std_id and s.std_id=m.std_id and m.mem_id=i.mem_id and b.book_id=i.book_id;
-- details of books issued as of today
select b.book_name ,i.is_id from book b,issue i where b.book_id=i.book_id;