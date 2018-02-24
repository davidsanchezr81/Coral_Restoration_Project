DROP TABLE restoration;
DROP TABLE reefs;
DROP TABLE corals;



CREATE TABLE reefs(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255)
);

CREATE TABLE corals(
  id SERIAL8 PRIMARY KEY,
  species VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL
);


CREATE TABLE restoration(
  id SERIAL8 PRIMARY KEY,
  reef_id INT8 REFERENCES reefs(id),
  coral_id INT8 REFERENCES corals(id)
);
