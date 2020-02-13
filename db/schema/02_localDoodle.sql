DROP FUNCTION IF EXISTS getHandle ( len INT );
DROP FUNCTION IF EXISTS addEvent (pName VARCHAR(255),  pEmail VARCHAR(100),  pTitle VARCHAR(255),  pLocation VARCHAR(255),
  pDescription TEXT,   pdt_event VARCHAR(10),  phh_event VARCHAR(5));
DROP FUNCTION IF EXISTS addUser ( pName VARCHAR(255), pEmail VARCHAR(255) );
DROP FUNCTION IF EXISTS getHandle ( len INT );
DROP VIEW IF EXISTS vw_events;
DROP VIEW IF EXISTS vw_attendees;
DROP TABLE IF EXISTS attendee_options;
DROP TABLE IF EXISTS attendees;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS event_options;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS users;
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
CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(10) NOT NULL DEFAULT 'u' || getHandle(9) UNIQUE,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE events (
  id SERIAL PRIMARY KEY NOT NULL,
  id_organizer INTEGER REFERENCES users(id) ON DELETE CASCADE,
  url CHAR(10) NOT NULL DEFAULT 'e' || getHandle(9) UNIQUE,
  title VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  description TEXT NOT NULL
);
CREATE TABLE event_options (
  id SERIAL PRIMARY KEY NOT NULL,
  id_event INTEGER REFERENCES events(id) ON DELETE CASCADE,
  dt_event VARCHAR(10) NOT NULL,
  hh_event VARCHAR(8) NOT NULL
);
CREATE TABLE attendance (
  id_user INTEGER REFERENCES users(id) NOT NULL,
  id_event INTEGER REFERENCES events(id) NOT NULL,
  PRIMARY KEY (id_user, id_event)
);
CREATE TABLE attendee_options (
  id_user INTEGER REFERENCES users(id) ON DELETE CASCADE,
  id_option INTEGER REFERENCES event_options(id) ON DELETE CASCADE,
  availability BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (id_user, id_option)
);
CREATE OR REPLACE VIEW vw_events
AS
SELECT e.id id_event, title, url, description, location, u.name, u.email, e.id_organizer, count(a.id_user) qty_attendees,
array_to_string(ARRAY(SELECT CONCAT(dt_event,' ', hh_event)
  FROM event_options WHERE (event_options.id_event = e.id)), ', ') AS options
FROM users u
INNER JOIN events e ON u.id = e.id_organizer
LEFT JOIN attendance a ON e.id = a.id_event
GROUP BY u.name, u.email, e.id
ORDER BY e.id;
CREATE OR REPLACE VIEW vw_attendees
AS
SELECT a.id_user, u.email, u.name, a.id_event, ao.id_option, eo.dt_event, eo.hh_event,
CASE ao.availability WHEN false THEN 'No' ELSE 'Yes'END AS available,
e.title, e.url, e.description, e.location,
organizer.name organizer_name, organizer.email organizer_email, organizer.username
FROM attendance a
INNER JOIN events e ON a.id_event = e.id
INNER JOIN users organizer ON e.id_organizer = organizer.id
LEFT JOIN attendee_options ao ON a.id_user = ao.id_user
LEFT JOIN event_options eo ON ao.id_option = eo.id
LEFT JOIN users u ON a.id_user = u.id;
