CREATE FUNCTION deactivate_unpaid_accounts() RETURNS void

LANGUAGE SQL

AS $$

  UPDATE generated SET prenume = 'Iorgulescu';

$$;

SELECT deactivate_unpaid_accounts();


CREATE PROCEDURE update_address()

LANGUAGE SQL

AS $$

  UPDATE generated SET adresa = 'Arad';

$$;

CALL update_address();


CREATE FUNCTION account_type_count(cnp text, id integer) RETURNS integer
LANGUAGE plpgsql
AS $$
  DECLARE account_count int;
BEGIN
  SELECT count(*) INTO account_count
  FROM generated
  inner join employee e
  on e.id=generated.id
  WHERE generated.cnp = $1 and e.id=$2;

  RETURN account_count;
END;

$$;

select account_type_count('1234567890126',2);

CREATE OR REPLACE PROCEDURE AddNewEntryToGenerated(CNP_p VARCHAR(13))
LANGUAGE plpgsql
AS
$$
BEGIN
INSERT INTO generated
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
	ON av.cnp=e.cnp
	WHERE e.cnp=CNP_p;
END
$$;

CREATE OR REPLACE PROCEDURE DeleteFromGenerated(CNP_P varchar(13))
LANGUAGE plpgsql
AS
$$
BEGIN
--DELETE FROM generated
DELETE FROM generated WHERE nume_angajat IN (
					SELECT nume_angajat FROM angajati_proiecte_view WHERE cnp = CNP_P
					);
END
$$;

CREATE OR REPLACE PROCEDURE AddDrones(
	model_p VARCHAR(50), 
	timp_zbor_p TIME,
	inaltime_zbor_p INTEGER, 
	sarcina_utila_p INTEGER
)
LANGUAGE plpgsql
AS
$$
BEGIN
INSERT INTO drona(model, timp_zbor, inaltime_zbor, sarcina_utila) values(model_p, timp_zbor_p, inaltime_zbor_p, sarcina_utila_p);
END
$$;

CREATE OR REPLACE PROCEDURE UpdateDroneName(
	model_p VARCHAR(50)
)
LANGUAGE plpgsql
AS
$$
BEGIN
INSERT INTO drona(model, timp_zbor, inaltime_zbor, sarcina_utila) values(model_p, timp_zbor_p, inaltime_zbor_p, sarcina_utila_p);
END
$$;


CREATE OR REPLACE FUNCTION GetProjectCount()
RETURNS BIGINT
LANGUAGE SQL
AS
$$
SELECT COUNT(*) AS nr_proiecte FROM projects;
$$;


CREATE OR REPLACE FUNCTION GetProjectInfoForId(proict_id_p INTEGER)
RETURNS projects
LANGUAGE SQL
AS
$$
SELECT * FROM projects WHERE id=proict_id_p;
$$;

