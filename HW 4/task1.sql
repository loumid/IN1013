DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet (
  petname VARCHAR(20) NOT NULL PRIMARY KEY,
  owner VARCHAR(45) NOT NULL,
  species VARCHAR(45) NOT NULL,
  gender CHAR(1) NOT NULL,
  birth DATE NOT NULL,
  death DATE
);

CREATE TABLE petEvent (
  petname VARCHAR(20) NOT NULL FOREIGN KEY,
  eventdate DATE NOT NULL,
  eventtype VARCHAR(15) NOT NULL,
  remark VARCHAR(255),
  FOREIGN KEY petName REFERENCES petPet(petname),
  PRIMARY KEY (petname, eventdate)
);