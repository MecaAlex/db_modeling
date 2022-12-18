select * from operator_drona
INNER join 
(
	 SELECT * FROM employee where sex='F'
) e
on e.id=operator_drona.employee_id
INNER join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
INNER join projects
on operator_drona_projects.projects_id=projects.id;


select * from employee
inner join operator_drona
on employee.sex='F' and employee.id=operator_drona.employee_id 
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects 
on operator_drona_projects.projects_id=projects.id;


create table angajati_proiecte_feminin as
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
where e.sex='F';


select * from angajati_proiecte_feminin;


create view angajati_proiecte_view as
select e.nume nume_angajat, e.prenume, e.cnp, p.nume as "nume proiect",p.start_date,p.end_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id;


select * from angajati_proiecte_view;

select count(*), p.start_date  from employee e
inner join operator_drona
on e.id=operator_drona.employee_id
inner join operator_drona_projects
on operator_drona.id=operator_drona_projects.operator_drona_id
inner join projects p
on operator_drona_projects.projects_id=p.id
WHERE e.sex='F'
GROUP BY start_date
HAVING p.start_date > '2022-11-27'; 

