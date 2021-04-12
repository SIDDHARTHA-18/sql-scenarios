create database scenario5;
show databases;
use scenario5;
-- student laboratory scenario
-- creating tables with appropriate integrity constraints
create table classes(class_id int(5) primary key,class_name varchar(10));
desc classes;
create table labs(lab_id int(5) primary key,lab_name varchar(10),class_id int(5) references classes(class_id));
desc labs;
create table students(stud_id int(5) primary key,stud_name varchar(10),class_id int(5) references classes(class_id));
desc students;
create table allotments(stud_id int(5) references students(stud_id),lab_id int(5) references labs(lab_id),day varchar(20));
desc allotments;
-- inserting data into tables
insert into classes(class_id,class_name) values (1,"IT"),(2,"CSE"),(3,"ECE"),(4,"EEE"),(5,"MECH");
select *from classes;
insert into labs(lab_id,lab_name,class_id) values (11,"PYTHON",1),(12,".NET",2),(13,"CIR",3),(14,"THE",4),(15,"TD",5);
select*from labs;
insert into students(stud_id,stud_name,class_id) values(21,"prabhas",1),(22,"mahesh",2),(23,"pavan",3),(24,"nag",4),(25,"ram",5);
select *from students;
insert into allotments(stud_id,lab_id,day) values(21,11,"mon"),(22,12,"tue"),(23,13,"wed"),(24,14,"thu"),(25,15,"fri");
select *from allotments;
-- allotments with the student_name, class_name, lab_name and day_of_week
select s.stud_name,c.class_name,l.lab_name,a.day from classes c,labs l,students s,allotments a where c.class_id=l.class_id and c.class_id=s.class_id and l.lab_id=a.lab_id and s.stud_id=a.stud_id ;
-- total no.of lab allotments day wise
 select a.day,count(l.lab_id) as count from lab l,allotments a where l.lab_id=a.lab_id and group by(a.day);
-- allotment details for the student with student_id as 
select s.stud_id,s.stud_name,l.lab_id,c.class_id,a.day from classes c,labs l,students s,allotments a where c.class_id=l.class_id and c.class_id=s.class_id and l.lab_id=a.lab_id and s.stud_id=a.stud_id and s.stud_id=25;
-- Create a view which lists out the student_id, student_name, class_id, lab_id and day_of_week
create view basic1 as select s.stud_id,s.stud_name,c.class_id,l.lab_id and a.day from students s,labs l,classes c,allotments a  where c.class_id=l.class_id and c.class_id=s.class_id and l.lab_id=a.lab_id and s.stud_id=a.stud_id ;
select *from basic1;
-- Create a view which lists the labs that occur on "Thursday".
create view basic2 as select l.lab_id,l.lab_name,a.day from labs l,allotments a where l.lab_id=a.lab_id and a.day="thu";
select *from basic2;
