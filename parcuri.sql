CREATE TABLE IF NOT EXISTS parcuri(
	fid SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL,
	tip_parc_id INTEGER NOT NULL, --fk
	registration_date DATE NOT NULL,
	FOREIGN KEY(tip_parc_id) REFERENCES tip_parc
);



SELECT * FROM parcuri;