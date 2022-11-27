select 2;

select 2+2;

select TRUE;

select NOW();

select * from employee;

SELECT nume, prenume, cnp from employee;

SELECT nume, prenume, cnp, NOW() from employee;

SELECT nume as "Nume angajat", prenume as "Prenume angajat", cnp as "CNP", NOW() as "Data raport" from employee;

SELECT nume "Nume angajat", prenume "Prenume angajat", cnp "CNP", NOW() "Data raport" from employee;

SELECT nume "Nume angajat", prenume "Prenume angajat", cnp "CNP", NOW() "Data raport" from employee as e;

SELECT nume , prenume , cnp as "CNP", NOW() as "Data raport" from employee as e;

SELECT nume , prenume , cnp as "CNP", NOW() as "Data raport", (id * 3)/2 as "Id anagajat" from employee;

SELECT nume , prenume , cnp as "CNP", NOW() as "Data raport", (id + cnp) as "Id multiplicat" from employee;

-- filtrare rezultate cu WHERE
SELECT * FROM employee WHERE id=3;

SELECT nume, prenume, cnp from employee  WHERE id=3;

SELECT nume , prenume from employee where id=3;

select * from EMPLOYEE where id in (3,5,6);

select * from employee where id >3;

select * from employee where id >=3;
select * from employee where id <=3;

select * from employee where id = 3 and prenume='Popescu';

select * from employee where id = 3 OR prenume='Popescu';

select * from employee where id <> 3 AND prenume='Popescu';
select * from employee where id != 3 AND prenume='Popescu';

select * from employee where id not in (3,5,6);

select * from employee where nume not in ('Vasile','George');

select * from employee where (nume ='Viorel' and id>3 or id =5) and adresa='Mun. Arad, Jud. Arad';

select * from employee where nume like('%r%');

select * from employee where prenume like('P%');

select * from employee where adresa like('%Ar%');

SELECT e.nume "Nume angajat", e.prenume "Prenume angajat", e.cnp "CNP", NOW() "Data raport" from employee as e
WHERE e.nume = 'George';

SELECT employee.nume as "Nume angajat", employee.prenume as "Prenume angajat", employee.cnp as "CNP", NOW() as "Data raport" from employee;

CREATE TABLE employee_extended AS
	SELECT nume as "Nume angajat", prenume as "Prenume angajat", cnp as "CNP", NOW() as "Data raport" from employee;

CREATE VIEW employee_extended_view AS
	SELECT nume as "Nume angajat", prenume as "Prenume angajat", cnp as "CNP", NOW() as "Data raport" from employee;

select * from employee_extended;

select * from employee_extended_view;


select model,timp_zbor from
	(
		select *, NOW() as "acum" from drona
	) as temp;
	



