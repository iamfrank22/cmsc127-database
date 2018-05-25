use okiya;

#1
select employee.Fname, employee.Minit, employee.Lname, employee.Address from employee
inner join department on employee.Dno = department.Dnumber where department.Dname = 'Research';


#2
select project.Pnumber, project.Dnum, employee.Lname, employee.Address, employee.Bdate
from ((department
inner join project on department.Dnumber = project.Dnum) 
inner join employee on department.Mgr_ssn = employee.Super_ssn) where project.Plocation='Stafford';


#3
select distinct employee.Fname, employee.Minit, employee.Lname
from works_on
inner join project on works_on.Pno = project.Pnumber
inner join employee on employee.Ssn = works_on.ESSN
where employee.Dno = 5; 


#4
Select distinct works_on.Pno
from works_on
inner join employee on works_on.ESSN = employee.Ssn
inner join department on works_on.ESSN = department.Mgr_ssn 
or works_on.ESSN != department.Mgr_ssn
where employee.Lname = 'Smith'; 


#5
select employee.Fname, employee.Minit, employee.Lname
from employee
inner join dependent on employee.Ssn = dependent.Essn
group by dependent.Essn
having count(dependent.Essn) >= 2; 


#6
select Fname, Minit, Lname
from employee
where Ssn
not in (select ESSN from dependent);


#7
select employee.Fname, employee.Minit, employee.Lname
from department
inner join dependent on department.Mgr_ssn = dependent.Essn
inner join employee on department.Mgr_ssn = employee.Ssn
group by dependent.Essn
having count(dependent.Essn) >= 1;
