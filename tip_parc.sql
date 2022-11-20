-- CREATE tip_parc table
CREATE TABLE IF NOT EXISTS tip_parc(
	id SERIAL PRIMARY KEY NOT NULL,
	type VARCHAR(20) NOT NULL,
	description VARCHAR(400)
);

-- INSERT DATA INTO TABLE AFTER CREATE
INSERT INTO tip_parc(type,description) VALUES
					('Parc national','Arie protejata infiintata conform regulament Romsilva'),
					('Parc natural','Arie naturala protejata conform OUG Life Natura 2000'),
					('Stiintifica','Rezervatie apartinand UVT, Departament Geografie'),
					('Sit Natura 2000', 'Sit cartat si fundamentat conform Life Natura 200 Project');


--UPDATE DATA IF REQUIRED
UPDATE tip_parc SET
       type='Rez stiintifica',
	   description='Rezervatie apartinand UVT, Departament Geografie & FMI'
WHERE type='Stiintifica';


SELECT * FROM tip_parc;