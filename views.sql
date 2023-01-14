-- CREATE VIEW
CREATE VIEW first_view AS
SELECT * FROM employee;

-- SELECT FROM VIEW
SELECT * FROM first_view;

-- CREATE VIEW WITH JOINS
create view angajati_proiecte_view as
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id;

--- SELECT FROM PREVIEWS VIEW
select * from angajati_proiecte_view;

-- FILTER SELECTED COLUMNS FROM VIEW
SELECT nume_angajat, cnp FROM angajati_proiecte_view;

-- EQUIVALENT WITH PREVIOUS
SELECT nume_angajat, cnp FROM 
(
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
) AS t


SELECT av.*,e.adresa FROM angajati_proiecte_view AS av
INNER JOIN employee as e
ON av.cnp=e.cnp;

-- EQUIVALENT WITH PREVIOUS
SELECT av.*,e.adresa FROM 
(
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
) AS av
INNER JOIN employee as e
ON av.cnp=e.cnp;


CREATE TABLE generated AS
SELECT av.*,e.adresa FROM angajati_proiecte_view AS av
INNER JOIN employee as e
ON av.cnp=e.cnp;

-- EQUIVALENT WITH PREVIOUS
CREATE TABLE generated AS
SELECT av.*,e.adresa FROM 
(
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
) AS av
INNER JOIN employee as e
ON av.cnp=e.cnp;

-- VIEW FOR INSERT
INSERT INTO generated
SELECT av.*,e.adresa FROM angajati_proiecte_view AS av
INNER JOIN employee as e
ON av.cnp=e.cnp;

-- VIEW FOR UPDATE
UPDATE generated SET adresa = 'Mun. Timisoara, Jud. Timis' WHERE nume_angajat='George';

-- EQUIVALENT WITH PREVIOUS
UPDATE generated SET adresa = 'Mun. Timisoara, Jud. Timis' 
WHERE nume_angajat=(
					SELECT DISTINCT nume_angajat FROM angajati_proiecte_view WHERE cnp ='1234567890127' 
					);
					
-- EQUIVALENT WITH PREVIOUS
UPDATE generated SET adresa = 'Mun. Timisoara, Jud. Timis' 
WHERE nume_angajat IN (
					SELECT nume_angajat FROM angajati_proiecte_view WHERE cnp ='1234567890127' 
					);
					
					
-- EQUIVALENT WITH PREVIOUS
UPDATE generated SET adresa = 'Mun. Timisoara, Jud. Timis' 
WHERE nume_angajat=(
SELECT DISTINCT nume_angajat FROM 
(
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id	
) AS t		
WHERE t.cnp ='1234567890127' 
);

--DELETE FROM generated
DELETE FROM generated WHERE nume_angajat IN (
					SELECT nume_angajat FROM angajati_proiecte_view WHERE cnp ='1234567890127' 
					);
