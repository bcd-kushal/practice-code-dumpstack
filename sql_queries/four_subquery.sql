/*
===> Question:
Department(deptno*,dept_name,location)
Employee(id*,name,address,salary,doj,deptno**)

constraints:
locations are pune, hyderabad, gurgaon, chennai

queries:
*/

/*===[ subquery approach ]=============================*/

select name from Employee 
where deptno in (select deptno from Department 
			where lower(location)='gurgaon');

select deptno,dept_name from Department 
where deptno in (select deptno from Employee 
			where lower(name)='srineet yadav');

update Employee 
set salary=1.1*salary 
where deptno in (select deptno from Department 
			where lower(dept_name)='research');

select name,to_char(doj,'dd-mm-yyyy') from Employee
where deptno in (select deptno from Department 
			where lower(dept_name)='hr');

select name,id from Employee a
where a.deptno=b.deptno;
