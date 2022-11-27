INSERT INTO projects(nume, start_date, end_date, description, clients_id) VALUES
	('Scanare LIDAR canalizare',NOW(),NOW(),'Scanare conducte canal Aquatim si modelare 3D',1);
	
INSERT INTO projects(nume, start_date, end_date, description, clients_id) VALUES
('Ortofoto multispectral Mun Timisoara','2022-01-01','2023-10-10','Realizare oto pentru primaria TM numai hiperspectral fara termic',2),
('Ortofoto termic Mun Timisoara','2023-01-01','2023-10-10','Realizare oto pentru Gauss numai hiperspectral fara termic',3),
('Mapare retea apa-canal tot municipiul TM','2023-01-01','2023-12-31','Realizare oto Mun TM si vectorizare retea apa-canal dupa planurile tehnice Aquatim',1),
('LIDAR Primaria TM','2023-01-01','2023-04-30','Scanare 3D Lidar petru primaria Mun TM, si modelare 3D pentru cladiri istorice',2);
	

select * from projects;