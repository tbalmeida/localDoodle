CREATE OR REPLACE FUNCTION getHandle ( len INT )
  RETURNS VARCHAR
  AS
  $$
  DECLARE handle VARCHAR;
  BEGIN
  SELECT array_to_string(ARRAY(SELECT chr((65 + round(random() * 25)) :: integer)
  FROM generate_series(1,len)), '') INTO handle;

  RETURN handle;
  END
  $$
  LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION addUser (
  pName VARCHAR(255),
  pEmail VARCHAR(255)
)
  RETURNS INTEGER
  AS
  $$
  DECLARE
    idUser INTEGER;

  BEGIN

    SELECT id INTO idUser FROM users WHERE email = pEmail;
    IF NOT FOUND THEN
      INSERT INTO users (name, email) VALUES (pName, pEmail);
      select last_value into idUser from users_id_seq;
    END IF;

    RETURN idUser;
    END
    $$
    LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION addEvent (
  pName VARCHAR(255),
  pEmail VARCHAR(255),
  pTitle VARCHAR(255),
  pLocation VARCHAR(255),
  pDescription TEXT
)
RETURNS VARCHAR(10)
AS
$$
DECLARE
  idUser INTEGER;
  vURL VARCHAR(10);
BEGIN
  SELECT addUser ( pName, pEmail ) INTO idUser;
  SELECT getHandle ( 10 ) INTO vURL;

  INSERT INTO events ( id_organizer, url, title, location, description)
   VALUES ( idUser, vURL, pTitle, pLocation, pDescription);

  RETURN vURL;
END
$$
LANGUAGE plpgsql;
