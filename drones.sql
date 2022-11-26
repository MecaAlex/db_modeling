CREATE TABLE drona(
	id SERIAl PRIMARY KEY NOT NULL,
	model VARCHAR(50) NOT NULL,
	timp_zbor TIME NOT NULL,
	inaltime_zbor INTEGER NOT NULL,
	sarcina_utila INTEGER NOT NULL
);

CREATE TABLE operator_drona(
	employee_id INTEGER NOT NULL,
	drona_id INTEGER NOT NULL,
	PRIMARY KEY(employee_id,drona_id)
);


CREATE TABLE employee(
	id SERIAL PRIMARY KEY NOT NULL,
	nume VARCHAR(50) NOT NULL,
	prenume VARCHAR(50) NOT NULL,
	cnp VARCHAR(13) UNIQUE NOT NULL,
	adresa VARCHAR(200) NOT NULL,
	sex CHAR(1) NOT NULL
);

CREATE TABLE projects(
	id SERIAL PRIMARY KEY NOT NULL,
	nume VARCHAR(100) NOT NULL,
	start_date DATE NOT NULL,
	end_date DATE NOT NULL,
	description VARCHAR(300) NULL,
	client_id INTEGER NOT NULL
);

CREATE TABLE operator_drona_projects(
	operator_drona_id INTEGER NOT NULL,
	projects_id INTEGER NOT NULL,
	PRIMARY KEY(operator_drona_id,projects_id)
);

CREATE TABLE drona_senzori(
	drona_id INTEGER NOT NULL,
	senzor_id INTEGER NOT NULL,
	PRIMARY KEY(drona_id,senzor_id)
);

CREATE TABLE senzori(
	id SERIAL PRIMARY KEY NOT NULL,
	nume VARCHAR(100) NOT NULL,
	tip_senzor VARCHAR(20) NOT NULL
);

CREATE TABLE drona_proiect_senzor(
	proiect_id INTEGER NOT NULL,
	drona_senzor_id INTEGER NOT NULL,
	PRIMARY KEY(proiect_id,drona_senzor_id)
);

CREATE TABLE clients(
	id SERIAL PRIMARY KEY NOT NULL,
	nume VARCHAR(100) NOT NULL,
	contact VARCHAR(200) NOT NULL,
	cui INTEGER NOT NULL
);




