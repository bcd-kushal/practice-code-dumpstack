/*
===> Question:
Department(deptno*,dept_name,location)
Employee(id*,name,address,salary,doj,deptno**)

constraints:
locations are pune, hyderabad, gurgaon, chennai

queries:
*/

create table Department(
	deptno number(3),
	dept_name varchar2(15),
	location varchar2(9),
	constraint deptPrimary primary key(deptno),
	constraint locationCheck check(location in('Gurgaon','Chennai','Pune','Hyderabad'))
);

create table Employee(
	id varchar2(5),
	name varchar2(25),
	address varchar2(50),
	salary number(6),
	doj date,
	deptno number(3),
	constraint EmpID primary key(id),
	constraint salCheck check(salary>0),
	constraint foreignKeyCheck foreign key (deptno) references Department(deptno)
);

select a.name from Employee a natural join Department b
where lower(b.location)='gurgaon';

select b.dept_name from Employee a natural join Department b
where lower(a.name)='srineet yadav';

select a.doj from Employee a natural join Department b
where upper(b.dept_name)='HR';

select a.id,a.name,b.dept_name,b.location from Employee a natural join Department b;