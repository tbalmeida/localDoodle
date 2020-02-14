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
  phh_event VARCHAR(8)
  )
 RETURNS VARCHAR(10)
 AS
 $$
 DECLARE
  vID_user INTEGER;
  vID_event INTEGER;
  vURL varchar(10);

 BEGIN

  SELECT addUser ( pName, pEmail ) INTO vID_user;

  INSERT INTO events ( id_organizer, title, location, description)
    VALUES ( vID_user, pTitle, pLocation, pDescription) RETURNING url INTO vURL;

  SELECT last_value FROM events_id_seq INTO vID_event;

  INSERT INTO event_options (id_event, dt_event, hh_event) VALUES (vID_event, pdt_event, phh_event);

 RETURN vURL;
 END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION addAttendee (
  pName VARCHAR(255),
  pEmail VARCHAR(100),
  pURL VARCHAR(10),
  pID_option INTEGER,
  pAvailability BOOLEAN
)
 RETURNS VARCHAR(10)
 AS
 $$
 DECLARE
  vID_user INTEGER;
  vID_event INTEGER;
  vUsername VARCHAR(10);

 BEGIN

  SELECT addUser ( pName, pEmail ) INTO vID_user;

  SELECT username into vUsername FROM users WHERE id = vID_user;

  SELECT id INTO vID_event FROM events WHERE url = pURL;

  PERFORM id_user FROM attendance WHERE id_user = vID_user;
  IF NOT FOUND THEN
    INSERT INTO attendance (id_event, id_user) VALUES (vID_event, vID_user);
  END IF;

  PERFORM id_user FROM attendee_options WHERE id_user = vID_user AND id_option = pID_option;
  IF NOT FOUND THEN
    INSERT INTO attendee_options (id_option, id_user, availability) VALUES (pID_option, vID_user, pAvailability);
  END IF;

  SELECT last_value FROM events_id_seq INTO vID_event;

 RETURN vUsername;
 END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION updateEvent (
  pURL VARCHAR(10),
  pTitle VARCHAR(255),
  pLocation VARCHAR(255),
  pDescription TEXT,
  pdt_event VARCHAR(10),
  phh_event VARCHAR(8),
  pUsername VARCHAR(10),
  pid_option INTEGER
  )
 RETURNS void
 AS
 $$
 DECLARE
  vID_user INTEGER;
  vID_event INTEGER;

 BEGIN

  SELECT id INTO vID_user FROM users WHERE username = pUsername;

  SELECT id INTO vID_event FROM events WHERE url = pURL;

  UPDATE events
    SET title = pTitle, location = pLocation, description = pDescription
    WHERE id_organizer = vID_user AND url = pURL
  RETURNING id INTO vID_event;

  UPDATE event_options
    SET dt_event = pdt_event, hh_event = phh_event
    WHERE id_event = vID_event AND id = pid_option;

 END
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION updateAttendeeOption (
  pUsername VARCHAR(10),
  pURL VARCHAR(10),
  pID_option INTEGER,
  pAvailability BOOLEAN
)
 RETURNS void
 AS
 $$
 DECLARE
  vID_user INTEGER;
  vID_event INTEGER;

 BEGIN

  SELECT id into vID_user FROM users WHERE username = pUsername;

  SELECT id INTO vID_event FROM events WHERE url = pURL;

  UPDATE attendee_options
    SET availability = pAvailability
    WHERE id_option = pID_option
      AND id_user = vID_user;

 END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION deleteAttendeeOption (
  pUsername VARCHAR(10),
  pURL VARCHAR(10),
  pID_option INTEGER
)
 RETURNS void
 AS
 $$
 DECLARE
  vID_user INTEGER;
  vID_event INTEGER;

 BEGIN

  SELECT id into vID_user FROM users WHERE username = pUsername;

  SELECT id INTO vID_event FROM events WHERE url = pURL;

  DELETE FROM attendee_options WHERE id_option = pID_option AND id_user = vID_user;

 END
$$
LANGUAGE plpgsql;
