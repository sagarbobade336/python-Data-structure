create database cloudlitz;
use cloudlitz;
create table employee( emp_id int primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50),
phone_number varchar(50),
job_title varchar(50),
salary decimal(10,2),
deparment varchar(50)
);
show tables;
select * from employee;

insert into employee(emp_id,first_name,last_name,email,phone_number,job_title,salary,deparment)
values
(1,"sagar","Bobade","sagarbobade@gmail.com","8275355816","software Engineer",50000,"IT"),
(2,"nilesh","khaladkar","nileshg@gmail.com","2546781534","project manager",100000,"Operations"),
(3,"varun","kamate","varun@gmail.com","254678913","data analyt","65000","Analytics"),
(4,"harshada","more","harshada@gmail.com","125364975","HR Executive",24000,"HR"),
(5,"Tejshree","Takede","tejshree@gmail.com","245678915","Accountant",36000,"Account");

show tables;
select * from employee;

alter table employee drop column phone_number;

select * from employee;

alter table employee rename to staff;

select * from staff;

alter table Staff rename column salary TO pagar;
 
select * from staff;

select first_name,pagar from staff;

select job_title as "Duty" from staff;

insert into staff (emp_id,first_name,last_name,email,job_title,pagar,deparment)
values (6,"parth","Mule","parth@gmail","field worker","40000","Marketing");

select * from staff;

insert into staff (emp_id,first_name,last_name,email,job_title,pagar,deparment)
values (7,"mayuri","zade","mayuri@gmail","customer relation","50000","Marketing");

update staff set pagar = 500000 where emp_id = 1;


delete from staff where emp_id = 6;

select * from Staff;

select first_name from staff where pagar > 60000;

use cloudlitz;

grant select,update on cloudlitz.staff to "nilesh";

revoke update on staff from "nilesh";

update staff set pagar = 40000 where emp_id = 1;

rollback;

select * from staff;

commit;
























