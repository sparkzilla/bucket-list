DROP TABLE sights;
DROP TABLE cities;

CREATE TABLE cities (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE sights (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  status VARCHAR(255),
  city_id INT REFERENCES cities(id)
);
