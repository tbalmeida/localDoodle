INSERT INTO users (id, name, email) VALUES(1, 'Pamela Jobs', 'pjobs1@notreal.com');
INSERT INTO users (id, name, email) VALUES(2, 'Anna Lee', 'alee2@aol.com');
INSERT INTO users (id, name, email) VALUES(3, 'Rita Borham', 'rborham3@notreal.com');
INSERT INTO users (id, name, email) VALUES(4, 'Stella Kubitz', 'skubitz4@aol.com');
INSERT INTO users (id, name, email) VALUES(5, 'George Stevenson', 'gstevenson5@aol.com');
INSERT INTO users (id, name, email) VALUES(6, 'Anna Jobs', 'ajobs6@aol.com');
INSERT INTO users (id, name, email) VALUES(7, 'Dianne Gates', 'dgates7@notreal.com');
INSERT INTO users (id, name, email) VALUES(8, 'Helen Brown', 'hbrown8@fake.com');
INSERT INTO users (id, name, email) VALUES(9, 'Mark Brown', 'mbrown9@aol.com');
INSERT INTO users (id, name, email) VALUES(10, 'Anna Orlof', 'aorlof10@aol.com');
INSERT INTO users (id, name, email) VALUES(11, 'James Orlof', 'jorlof11@icq.com');
INSERT INTO users (id, name, email) VALUES(12, 'Madison Silva', 'msilva12@wontwork.com');
INSERT INTO users (id, name, email) VALUES(13, 'Olga Borham', 'oborham13@aol.com');
INSERT INTO users (id, name, email) VALUES(14, 'Dianne Silva', 'dsilva14@wontwork.com');
INSERT INTO users (id, name, email) VALUES(15, 'James Brown', 'jbrown15@wontwork.com');
INSERT INTO users (id, name, email) VALUES(16, 'Pamela Dafoe', 'pdafoe16@wontwork.com');
INSERT INTO users (id, name, email) VALUES(17, 'Mary Liu', 'mliu17@wontwork.com');
INSERT INTO users (id, name, email) VALUES(18, 'Brian Park', 'bpark18@aol.com');
INSERT INTO users (id, name, email) VALUES(19, 'Michael Kubitz', 'mkubitz19@notreal.com');
INSERT INTO users (id, name, email) VALUES(20, 'Madison Borham', 'mborham20@fake.com');
INSERT INTO users (id, name, email) VALUES(21, 'Anna Campos', 'acampos21@aol.com');
INSERT INTO users (id, name, email) VALUES(22, 'Olga Silva', 'osilva22@wontwork.com');
INSERT INTO users (id, name, email) VALUES(23, 'Helen Robertson', 'hrobertson23@notreal.com');
INSERT INTO users (id, name, email) VALUES(24, 'William Dafoe', 'wdafoe24@aol.com');
INSERT INTO users (id, name, email) VALUES(25, 'George Orlof', 'gorlof25@aol.com');
INSERT INTO users (id, name, email) VALUES(26, 'Art Borham', 'aborham26@aol.com');
INSERT INTO users (id, name, email) VALUES(27, 'Carol Clark', 'cclark27@notreal.com');
INSERT INTO users (id, name, email) VALUES(28, 'Stella Murray', 'smurray28@fake.com');
INSERT INTO users (id, name, email) VALUES(29, 'Charles Campos', 'ccampos29@aol.com');
INSERT INTO users (id, name, email) VALUES(30, 'Michael Clark', 'mclark30@aol.com');
INSERT INTO users (id, name, email) VALUES(31, 'Dianne Lord', 'dlord31@notreal.com');
INSERT INTO users (id, name, email) VALUES(32, 'Dianne Gillan', 'dgillan32@aol.com');
INSERT INTO users (id, name, email) VALUES(33, 'Lucy Campos', 'lcampos33@notreal.com');
INSERT INTO users (id, name, email) VALUES(34, 'Pamela Silva', 'psilva34@fake.com');
INSERT INTO users (id, name, email) VALUES(35, 'Anna Lee', 'alee35@fake.com');
INSERT INTO users (id, name, email) VALUES(36, 'Mary Morrissete', 'mmorrissete36@aol.com');
INSERT INTO users (id, name, email) VALUES(37, 'Brian Macintosh', 'bmacintosh37@aol.com');
INSERT INTO users (id, name, email) VALUES(38, 'Art Stevenson', 'astevenson38@fake.com');
INSERT INTO users (id, name, email) VALUES(39, 'Anna Silva', 'asilva39@wontwork.com');
INSERT INTO users (id, name, email) VALUES(40, 'Madison Borham', 'mborham40@notreal.com');
INSERT INTO users (id, name, email) VALUES(41, 'Madison Kubitz', 'mkubitz41@wontwork.com');
INSERT INTO users (id, name, email) VALUES(42, 'James Campos', 'jcampos42@aol.com');
INSERT INTO users (id, name, email) VALUES(43, 'Rita Robertson', 'rrobertson43@wontwork.com');
INSERT INTO users (id, name, email) VALUES(44, 'James Clark', 'jclark44@icq.com');
INSERT INTO users (id, name, email) VALUES(45, 'Steve Bond', 'sbond45@wontwork.com');
INSERT INTO users (id, name, email) VALUES(46, 'Rita Campos', 'rcampos46@notreal.com');
INSERT INTO users (id, name, email) VALUES(47, 'Olga Stevenson', 'ostevenson47@aol.com');
INSERT INTO users (id, name, email) VALUES(48, 'Steve Smith', 'ssmith48@wontwork.com');
INSERT INTO users (id, name, email) VALUES(49, 'Jacob Santos', 'jsantos49@notreal.com');
INSERT INTO users (id, name, email) VALUES(50, 'Olga Bond', 'obond50@wontwork.com');
ALTER SEQUENCE users_id_seq RESTART WITH 51;

INSERT INTO events(id, id_organizer, url, title, location, description) VALUES (1, 21, 'e4Ul8m1nS', 'Week 1/10', 'Work Nicer Stephen Ave- 6th Floor', 'Testing Schoodle' );
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (1, 1, '2020-01-27', '10:00');
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (2, 1, '2020-01-27', '15:00');

INSERT INTO attendance (id_user, id_event) VALUES (1, 1);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (1, 1, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (2, 1, false);

INSERT INTO attendance (id_user, id_event) VALUES (2, 1);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (1, 2, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (2, 2, false);

INSERT INTO events(id, id_organizer, url, title, location, description) VALUES (2, 22, 'eU1ZyTLPU', 'Week 2/10', 'Work Nicer Stephen Ave- 6th Floor', 'Testing Schoodle' );
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (3, 2, '2020-05-25', '08:00');
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (4, 2, '2020-05-25', '19:00');

INSERT INTO attendance (id_user, id_event) VALUES (3, 2);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (3, 3, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (4, 3, true);

INSERT INTO attendance (id_user, id_event) VALUES (4, 2);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (3, 4, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (4, 4, false);

INSERT INTO events(id, id_organizer, url, title, location, description) VALUES (3, 23, 'eDTFRySEF', 'Week 3/10', 'Work Nicer Stephen Ave- 6th Floor', 'Testing Schoodle' );
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (5, 3, '2020-07-14', '08:00');
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (6, 3, '2020-07-14', '19:00');

INSERT INTO attendance (id_user, id_event) VALUES (5, 3);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (5, 5, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (6, 5, true);

INSERT INTO attendance (id_user, id_event) VALUES (6, 3);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (5, 6, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (6, 6, true);

INSERT INTO events(id, id_organizer, url, title, location, description) VALUES (4, 24, 'eNc6xu5Nl', 'Week 4/10', 'Work Nicer Stephen Ave- 6th Floor', 'Testing Schoodle' );
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (7, 4, '2020-06-05', '07:00');
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (8, 4, '2020-06-05', '19:00');

INSERT INTO attendance (id_user, id_event) VALUES (7, 4);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (7, 7, true);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (8, 7, true);

INSERT INTO attendance (id_user, id_event) VALUES (8, 4);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (7, 8, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (8, 8, true);

INSERT INTO events(id, id_organizer, url, title, location, description) VALUES (5, 25, 'ei9oi0Rrv', 'Week 5/10', 'Work Nicer Stephen Ave- 6th Floor', 'Testing Schoodle' );
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (9, 5, '2020-03-05', '08:00');
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (10, 5, '2020-03-05', '18:00');

INSERT INTO attendance (id_user, id_event) VALUES (9, 5);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (9, 9, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (10, 9, false);

INSERT INTO attendance (id_user, id_event) VALUES (10, 5);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (9, 10, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (10, 10, false);

INSERT INTO events(id, id_organizer, url, title, location, description) VALUES (6, 26, 'er7SYRJbR', 'Week 6/10', 'Work Nicer Stephen Ave- 6th Floor', 'Testing Schoodle' );
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (11, 6, '2020-08-03', '06:00');
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (12, 6, '2020-08-03', '17:00');

INSERT INTO attendance (id_user, id_event) VALUES (11, 6);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (11, 11, true);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (12, 11, true);

INSERT INTO attendance (id_user, id_event) VALUES (12, 6);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (11, 12, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (12, 12, false);

INSERT INTO events(id, id_organizer, url, title, location, description) VALUES (7, 27, 'esTuLLbYS', 'Week 7/10', 'Work Nicer Stephen Ave- 6th Floor', 'Testing Schoodle' );
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (13, 7, '2020-04-11', '08:00');
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (14, 7, '2020-04-11', '14:00');

INSERT INTO attendance (id_user, id_event) VALUES (13, 7);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (13, 13, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (14, 13, false);

INSERT INTO attendance (id_user, id_event) VALUES (14, 7);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (13, 14, true);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (14, 14, false);

INSERT INTO events(id, id_organizer, url, title, location, description) VALUES (8, 28, 'eWFGu0o2A', 'Week 8/10', 'Work Nicer Stephen Ave- 6th Floor', 'Testing Schoodle' );
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (15, 8, '2020-08-15', '10:00');
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (16, 8, '2020-08-15', '16:00');

INSERT INTO attendance (id_user, id_event) VALUES (15, 8);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (15, 15, true);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (16, 15, false);

INSERT INTO attendance (id_user, id_event) VALUES (16, 8);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (15, 16, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (16, 16, false);

INSERT INTO events(id, id_organizer, url, title, location, description) VALUES (9, 29, 'eUlTwRNIu', 'Week 9/10', 'Work Nicer Stephen Ave- 6th Floor', 'Testing Schoodle' );
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (17, 9, '2020-11-27', '10:00');
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (18, 9, '2020-11-27', '19:00');

INSERT INTO attendance (id_user, id_event) VALUES (17, 9);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (17, 17, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (18, 17, true);

INSERT INTO attendance (id_user, id_event) VALUES (18, 9);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (17, 18, true);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (18, 18, false);

INSERT INTO events(id, id_organizer, url, title, location, description) VALUES (10, 30, 'emfOJ6DWy', 'Week 10/10', 'Work Nicer Stephen Ave- 6th Floor', 'Testing Schoodle' );
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (19, 10, '2020-09-14', '11:00');
INSERT INTO event_options (id, id_event, dt_event, hh_event) VALUES (20, 10, '2020-09-14', '15:00');

INSERT INTO attendance (id_user, id_event) VALUES (19, 10);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (19, 19, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (20, 19, true);

INSERT INTO attendance (id_user, id_event) VALUES (20, 10);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (19, 20, false);
INSERT INTO attendee_options (id_option, id_user, availability) VALUES (20, 20, true);

ALTER SEQUENCE events_id_seq RESTART WITH 11;
ALTER SEQUENCE event_options_id_seq RESTART WITH 21;