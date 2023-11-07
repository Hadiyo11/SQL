CREATE DATABASE zoo;

CREATE TABLE animals(
id bigserial,
breed varchar,
age numeric
);

INSERT INTO animals (breed, age)
VALUES('Dog', 10),('Pig', 12), ('Rat', 6), ('Snake', 2);
