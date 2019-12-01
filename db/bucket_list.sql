DROP TABLE sights;
DROP TABLE cities;
DROP TABLE countries;


CREATE TABLE countries (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE cities (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  country_id INT REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE sights (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  status VARCHAR(255),
  city_id INT REFERENCES cities(id) ON DELETE CASCADE
);
