ALTER TABLE employee
ADD COLUMN age INTEGER NOT NULL DEFAULT 0;

SELECT AVG(age)::INTEGER AS medie FROM employee;

SELECT COUNT(*) AS nr_angajati FROM employee;
SELECT COUNT(distinct id) AS nr_angajati FROM employee;

SELECT COUNT(nume) AS nr_angajati FROM employee;
SELECT COUNT(distinct nume) AS nr_angajati FROM employee;

SELECT MIN(age) AS varsta_minima FROM employee;

SELECT MAX(age) AS varsta_max FROM employee;

SELECT SUM(age) AS total FROM employee;

SELECT SUM(age)/COUNT(*) AS medie FROM employee;


SELECT AVG(age)::INTEGER AS medie_varsta, COUNT(*) AS nr_angajati, 
	    MIN(age) AS varsta_minima, MAX(age) AS varsta_max,SUM(age) AS total
FROM employee;


SELECT COUNT(*) AS nr_angajati FROM employee WHERE age > 50 and sex='F';

SELECT sex,COUNT(*) FROM employee 
WHERE age < 50 
GROUP BY sex 

SELECT sex,COUNT(id) FROM employee 
WHERE age < 50 AND sex='F' 
GROUP BY sex 
HAVING COUNT(id)<3;

SELECT sex,COUNT(*) FROM employee 
WHERE age < 50 
GROUP BY sex 
HAVING COUNT(*)<3 AND sex='F' ;
