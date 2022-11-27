
UPDATE employee SET adresa='Mun. Arad, Jud. Arad';

UPDATE employee SET adresa='Mun. Timisoara, Jud. Timis' WHERE id=1;
UPDATE employee SET adresa='Mun. Timisoara, Jud. Timis' WHERE id IN (1,3,6);


UPDATE employee SET adresa='Mun. Buzias, Jud. Timis' WHERE nume='Ceapa';

UPDATE employee SET adresa='Mun. Arad, Jud. Arad' WHERE nume='Ceapa' AND sex='M';

select * from  employee;

select * from employee where id in(
select employee_id from operator_drona where drona_id=5
);

select * from employee where id in -- step 3
(
	select employee_id from operator_drona where drona_id =  --step 2
	(
		select id from drona where model='Phantom 4 RTK' -- step 1
	)
);


UPDATE employee SET adresa='Mun. Sibiu, Jud. Sibiu' WHERE id IN -- step 3 update
(
	select employee_id from operator_drona where drona_id =  --step 2
	(
		select id from drona where model='Phantom 4 RTK' -- step 1
	)
);


delete from operator_drona where employee_id in
(
	select employee_id from operator_drona where drona_id =  --step 2
	(
		select id from drona where model='Phantom 4 RTK' -- step 1
	)
);

alter table employee
rename column etnie to etnie_angajat;


alter table employee drop column etnie;

select * from employee;





