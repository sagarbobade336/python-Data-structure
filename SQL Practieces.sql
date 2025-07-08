create database xyz_company;
use xyz_company;

create table employee(
id int primary key,
Name varchar(50),
salary int
);

insert into employee
(id,Name,salary)
values
(1,"adam",25000),
(2,"bob",30000),
(3,"casey",40000);

select * from employee;

Drop database xyz_company;

use college;
show tables;
drop table student;

create table college(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(50)
);

insert into college (rollno,name,marks,grade,city)
values
(101,"anil",78,"C","Pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"aman",12,"F","Delhi"),
(106,"farah",82,"B","Delhi");

select* from college;

select name,marks from college;

select distinct city from college;  # distinct = only give unique values not repeted

select * from college where marks > 80;   #where clause = to defin some condition  query =select col1,col2 from table_name  where conditions;

select * from college where city="Mumbai";

select * from college where marks+10 > 100 and city="Mumbai";

select * from college where marks between 80 and 90;  # Between = (selects for a given range)

select * from college where city IN ("Delhi","Mumbai");  # IN = (matches any value in the list)

select * from college where city NOT IN ("Delhi","Mumbai"); # NOT =(negate the given condition)

#Limit Clause = sets an upper limit on number of [tuples]rows to be returned  give limited amount of data we requried
select * from college limit 3;

select * from college where marks > 75 limit 3;

#Order by Clause = to sort in ascending (ASC) pr descending order(DESC)
# Query = select col1,col2 from table_name order by col_names ASC/DESC 

select * from college order by grade ASC;

select * from college order by marks desc limit 3;


#Aggregate Functions = Aggregate functions perform a calculation on a set of values,and return a single values. 
#count()
#max()
#min()
#Sum()
#Avg()

select max(marks) from college;
select min(marks) from college;
select sum(marks) from college;
select avg(marks) from college;
select count(name) from college;

# Group by clause = Groups rows that have the same values into summary rows.
# It collects data from mutiple records and groups the result by one or more colume. 
# *generally we use group by with some aggregation function.

# Query = 

select city,count(rollno)
from college
group by city;

# Practice Question: write the Query to find avg marks in each city n ascending order

select city,avg(marks)
from college
group by city
order by city asc;

select *from college;

use college;

select grade,count(grade) from college
group by grade
order by grade;



create table payment (
customer_id int,
customer varchar (50),
mode varchar (50),
city varchar (50)
);

insert into payment (customer_id,customer,mode,city)
values
(101,"olivia Barrett","Netbanking","portland"),
(102,"Ethan Sinclair","Credit card","Miami"),
(103,"Maya Hernandez","Credit card","Seattle"),
(104,"Liarn Donovan","Netbanking","Denver"),
(105,"Sophia Nguyen","Credit card","New Orieans"),
(106,"Caleb Foster","Debit card","Minneapolis"),
(107,"Ava Patel","Debit card","Phoenix"),
(108,"Lucas Carter","Netbanking","Boston"),
(109,"Isabella Martinez","Netbanking","Nashville"),
(110,"Jackson Brooks","Credit card","Britain");

select * from payment;

select mode,count(mode) from payment
group by mode;

select mode ,count(customer) from payment
group by mode;

# Having Clause = Similar to Where i.e applies some condition on rows.
# Used when we want to apply any condition after grouping.

select count(name),city
from college 
group by city
having max(marks)>90;

select city
from college
where grade="A"
group by city
having max(marks)>93;

update college
set city="Goa"
where rollno ="101";

update college
set grade = "O"
where grade = "A";

update college
set marks = 35
where rollno = 105;

set sql_safe_updates = 0;

update college
set grade="D"
where marks = 35;

insert into college
values
(107,"sagar",100,"O","Phaltan");

update college
set grade="A"
where marks between 80 and 95;

update college
set marks = marks + 1;

update college
set marks = marks - 1
where name="sagar";

select * from college;

create table dept(
id int primary key,
name varchar(50)
);

insert into dept
values
(100,"English"),
(200,"Hindi"),
(300,"Science");

select * from dept;

update dept
set id = 103
where id = 100;

create table teacher(
id int primary key,
name varchar(50),
dept_id int,
foreign key (dept_id) references dept(id)
on update cascade
on delete cascade
);

insert into teacher
values
(101,"Adam",100),
(102,"Eve",200); 

select * from teacher;

#Alter (to change the schema) -- design (columns,data types ,constraint)

# ADD column --
# Query -- 
# ALTER TABLE table_name  Add COLUMN column_name datatype constraint;

# DROP column --
# Query --
# ALTER TABLE table_name  DROP COLUNM column_name;

# CHANGE Column(remane)
# Query --
# ALTER TABLE table_name CHANGE COLUMN old_name new_name new_datatype constraint;

# MODIFY column (modify datatypes/ constraint)
# Query --
# ALTER TABLE table_name MODIFY col_name new_datatype new_constraint;

# RENAME table
# Query --
# ALTER TABLE table_name  RENAME TO new_table_name;

# CHANGE column (rename)
# Query --
# ALTER TABLE table_name CHANGE old_name new_name new_constraint

alter table college add column age int;

select * from college;

alter table college drop column age;

select * from college;

alter table college 
rename to student;

select * from student;

Alter table student
add column age int not null default 19;

select * from student;

alter table student modify age varchar(2);

alter table student change age stu_age int;

select * from student;

truncate table student;

alter table student drop column stu_age;

insert into student (rollno,name,marks,grade,city)
values
(101,"anil",78,"C","Pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"aman",12,"F","Delhi"),
(106,"farah",82,"B","Delhi");
 
 select * from student;
 
 
 # Practices Qs
 # a) change the name of colume "name" to "full_name"
 # b) Delete all the student who scored marks less than 80.
 # c) Delete the column for grades
 
 alter table student CHANGE name full_name varchar(50);
 
 delete from student where marks < 80;
 
 alter table student drop column grade;
 
 select * from student;