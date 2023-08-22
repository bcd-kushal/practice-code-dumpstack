/*
[ASSIGNMENT 2]

===> Question:
Employee(id*,name,dept,addr,doj,salary,job_level)

constraints:
each employee id must begin with 'EMP'
departments = Accounts, HR, Sales, Marketing and Research
job_level = Junior, Mid and Senior

queries:
find details of employees joined in 2000
find ids and names of employees whose name start with 'A'
find no of senior employees in the HR department
find the no of kolkata based employees
find names of all the junior employees joined on january 2019
*/

create table Employee(
	id varchar2(6),
	name varchar2(25),
	dept varchar2(9),
	addr varchar2(50),
	doj date,
	salary number(6),
	job_level varchar2(6),
	constraint idPrimary primary key(id),
	constraint empBeginsWith check(id like 'EMP%'),
	constraint checkDept check(dept in('Accounts','HR','Sales','Marketing','Research')),
	constraint checkJobLvl check(job_level in('Junior','Mid','Senior'))
);

select * from Employee
where to_char(doj,'yyyy') = 2000;

select id,name from Employee
where name like 'A%';

select count(*) from Employee
where job_level='Senior' and dept='HR';

select count(*) from Employee
where addr like '%Kolkata%';

select name from Employee
where job_level='Junior' and to_char(doj,'mon/yyyy') = 'jan/2019';


