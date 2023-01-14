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

