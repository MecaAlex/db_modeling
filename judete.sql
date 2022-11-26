-- create table judete
CREATE TABLE IF NOT EXISTS judete(
	fid SERIAL PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL, 
	indicativ CHAR(2) NOT NULL,
	edited DATE DEFAULT NOW()
);

INSERT INTO judete(name, indicativ) VALUES ('Timis','TM');

SELECT * FROM judete;

