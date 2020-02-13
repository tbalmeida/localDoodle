CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(10) NOT NULL DEFAULT 'u' || getHandle(9),
  name VARCHAR(255) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE events (
  id SERIAL PRIMARY KEY NOT NULL,
  id_organizer INTEGER REFERENCES users(id) ON DELETE CASCADE,
  url VARCHAR(10) NOT NULL DEFAULT 'e' || getHandle(9),
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
