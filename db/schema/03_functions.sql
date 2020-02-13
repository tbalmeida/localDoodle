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
  pEmail VARCHAR(100),
  pTitle VARCHAR(255),
  pLocation VARCHAR(255),
  pDescription TEXT,
  pdt_event VARCHAR(10),
  phh_event VARCHAR(5)
  )
 RETURNS VARCHAR(10)
 AS
 $$
 DECLARE
  vID_user INTEGER;
  vURL VARCHAR(10);
  vID_event INTEGER;

 BEGIN

  SELECT addUser ( pName, pEmail ) INTO vID_user;
  SELECT getHandle ( 10 ) INTO vURL;

  INSERT INTO events ( id_organizer, url, title, location, description)
    VALUES ( vID_user, vURL, pTitle, pLocation, pDescription);

  SELECT last_value FROM events_id_seq INTO vID_event;

  INSERT INTO event_options (id_event, dt_event, hh_event) VALUES (vID_event, pdt_event, phh_event);

 RETURN vURL;
 END
$$
LANGUAGE plpgsql;
