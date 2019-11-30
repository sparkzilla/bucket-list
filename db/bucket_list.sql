DROP TABLE sights;
DROP TABLE users;

CREATE TABLE users (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE sights (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  user_id INT REFERENCES users(id)
);
