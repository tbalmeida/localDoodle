CREATE OR REPLACE VIEW vw_events
AS
SELECT e.id id_event, title, url, description, location, u.name, u.email, count(a.id_user) qty_attendees
, array_to_string(ARRAY(SELECT CONCAT(dt_event,' ', hh_event)
  FROM event_options WHERE (event_options.id_event = e.id)), ', ') AS options
FROM users u
INNER JOIN events e ON u.id = e.id_organizer
LEFT JOIN attendance a ON e.id = a.id_event
GROUP BY u.name, u.email, e.id
ORDER BY e.id;

CREATE OR REPLACE VIEW vw_attendees
AS
SELECT a.id_user, u.email, u.name, a.id_event, ao.id_option, eo.dt_event, eo.hh_event,
CASE ao.availability WHEN false THEN 'No' ELSE 'Yes' END AS available,
e.title, e.url, e.description, e.location,
organizer.name organizer_name, organizer.email organizer_email
FROM attendance a
INNER JOIN events e ON a.id_event = e.id
INNER JOIN users organizer ON e.id_organizer = organizer.id
LEFT JOIN attendee_options ao ON a.id_user = ao.id_user
LEFT JOIN event_options eo ON ao.id_option = eo.id
LEFT JOIN users u ON a.id_user = u.id
ORDER BY a.id_event, eo.dt_event, eo.hh_event, u.name;

CREATE VIEW vw_attendance
AS
SELECT eo.id_event, url, title, dt_event, hh_event,
  COUNT(ao.id_user) FILTER(WHERE availability = false) not_available,
  COUNT(ao.id_user) FILTER(WHERE availability = true) available
FROM events e
INNER JOIN event_options eo ON e.id = eo.id_event
LEFT JOIN attendance a ON a.id_event = e.id
LEFT JOIN attendee_options ao ON ao.id_option = eo.id AND a.id_user = ao.id_user
GROUP BY eo.id_event, url, title, dt_event, hh_event
ORDER BY eo.id_event, dt_event, hh_event;
