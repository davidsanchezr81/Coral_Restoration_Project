-- DROP TABLE restorations;

DROP TABLE corals;
DROP TABLE reefs;



CREATE TABLE reefs(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  location VARCHAR(255)
);

CREATE TABLE corals(
  id SERIAL8 PRIMARY KEY,
  species VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  plantdate VARCHAR(255)NOT NULL,
  reef_id INT8 REFERENCES reefs(id)
);
