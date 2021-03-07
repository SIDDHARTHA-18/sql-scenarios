show databases;
create database scenario3;
show databases;
use scenario3;
-- creation of employee table
create table employee(emp_id int(5) primary key,emp_name varchar(20));
desc employee;
-- creation of department table
create table dept(dept_id int(5) primary key,dept_name varchar(20));
desc dept;
-- creation of paydetails table
create table payd(emp_id int(5) references employee(emp_id),dept_id int(5) references dept(dept_id),basic_sal int(10),deductions int(10),additions int(10),doj date);
desc payd;
-- creation of payrolls table
create table payroll(emp_id int(5) references employee(emp_id),pay_date date);
desc payroll;
-- insertion of data into employee table
insert into employee(emp_id,emp_name) values (1,"sai"),(2,"manoj"),(3,"pramod"),(4,"alluri"),(5,"ram");
select *from employee;
-- insertion of data into department table
insert into dept(dept_id,dept_name) values(11,"CSE"),(12,"IT"),(13,"ECE");
select *from dept;
-- insertion of data into paydetails table
insert into payd(emp_id,dept_id,basic_sal,deductions,additions,doj) values(1,11,50000,6000,2000,"2021-02-11"),(2,12,51000,4000,5000,"2021-15-12"),(3,11,45000,5000,3000,"2019-08-03"),(4,13,35000,4500,2000,"2021-02-21"),(5,12,50000,6000,2000,"2021-08-21");
select *from payd;
-- insertion of data into payroll table
insert into payroll(emp_id,pay_date) values(1,"2021-02-28"),(2,"2021-02-28"),(3,"2021-02-28"),(4,"2021-02-28"),(5,"2021-02-28");
select *from payroll;
-- employee details department wise
select e.emp_id,e.emp_name,d.dept_id,d.dept_name from employee e,dept d,payd p where e.emp_id=p.emp_id and d.dept_id=p.dept_id;
-- list all employee details who joined after particular date="2021-02-11"
select e.emp_id,e.emp_name,p.doj from employee e,payd p where p.doj>"2021-02-11" and e.emp_id=p.emp_id;
-- list all employee detais whose basic salary is between 30000 and 45000;
select e.emp_id,e.emp_name,p.basic_sal from employee e,payd p where e.emp_id=p.emp_id and p.basic_sal between 30000 and 45000;
-- employee details whose netsalry greater than 45000 netsalary=basic-deductions+additions
select e.emp_id,e.emp_name,(p.basic_sal-p.deductions+p.additions) as net_salary from employee e,payd p where p.basic_sal-p.deductions+p.additions>45000 and e.emp_id=p.emp_id;
-- details of employee having emp_id is 4
select e.emp_id,e.emp_name,d.dept_id,d.dept_name,(p.basic_sal-p.deductions+p.additions) as net_salary from employee e,payd p,dept d where e.emp_id=p.emp_id and d.dept_id=p.dept_id;
-- view which lists out the employee_id, employee_name, department_name, basic_salary, deductions, additions and net_salary
create view v as select e.emp_id,e.emp_name,d.dept_id,d.dept_name,p.basic_sal,p.deductions,p.additions,(p.basic_sal-p.deductions+p.additions)as net_salary from employee e,dept d,payd p where e.emp_id=p.emp_id and d.dept_id=p.dept_id;
select *from v;
-- view which lists out the employee_id, employee_name and netsalary.
create view vi as select e.emp_id,e.emp_name,(p.basic_sal-p.deductions+p.additions) as net_salary from employee e,payd p where e.emp_id=p.emp_id;
select *from vi;