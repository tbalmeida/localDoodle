DROP VIEW IF EXISTS vw_events;
DROP VIEW IF EXISTS vw_attendees;

DROP TABLE IF EXISTS attendee_options;
DROP TABLE IF EXISTS attendees;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS event_options;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS users;

DROP FUNCTION IF EXISTS getHandle
  ( len INT );

DROP FUNCTION IF EXISTS addUser
  ( pName VARCHAR(255), pEmail VARCHAR(255) );

DROP FUNCTION IF EXISTS addEvent
  (pName VARCHAR(255),  pEmail VARCHAR(100),  pTitle VARCHAR(255),  pLocation VARCHAR(255),
  pDescription TEXT,   pdt_event VARCHAR(10),  phh_event VARCHAR(5));

DROP FUNCTION IF EXISTS updateEvent
  ( pURL VARCHAR(10), pTitle VARCHAR(255), pLocation VARCHAR(255), pDescription TEXT,
  pdt_event VARCHAR(10), phh_event VARCHAR(8), pUsername VARCHAR(10), pid_option INTEGER );

DROP FUNCTION IF EXISTS deleteAttendeeOption
  ( pUsername VARCHAR(10), pURL VARCHAR(10), pID_option INTEGER );

DROP FUNCTION IF EXISTS updateAttendeeOption
  ( pUsername VARCHAR(10), pURL VARCHAR(10), pID_option INTEGER, pAvailability BOOLEAN);

DROP FUNCTION IF EXISTS addAttendee
  ( pName VARCHAR(255), pEmail VARCHAR(100), pURL VARCHAR(10), pID_option INTEGER, pAvailability BOOLEAN )
