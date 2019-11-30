DROP TABLE visits;
DROP TABLE sights;
DROP TABLE users;

CREATE TABLE users (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE sights (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE visits (
  id SERIAL8 PRIMARY KEY,
  user_id INT REFERENCES users(id),
  sight_id INT REFERENCES sights(id),
  status VARCHAR
);
