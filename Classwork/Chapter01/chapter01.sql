CREATE DATABASE zoo;

CREATE TABLE AnimalKinds (
  kind_id SERIAL PRIMARY KEY,
  kind_name VARCHAR(100) NOT NULL,
  class_name VARCHAR(100) NOT NULL,
  habitat VARCHAR(100),
  diet VARCHAR(100)
);

CREATE TABLE AnimalDetails (
  animal_id SERIAL PRIMARY KEY,
  kind_id INTEGER REFERENCES AnimalKinds(kind_id),
  name VARCHAR(100) NOT NULL,
  age INTEGER,
  gender VARCHAR(10),
  weight DECIMAL(5, 2),
  birth_date DATE,
  arrival_date DATE
);

INSERT INTO AnimalKinds (kind_name, class_name, habitat, diet)
VALUES ('Lion', 'Mammal', 'Grasslands', 'Carnivore'), ('Elephant', 'Mammal', 'Savannah', 'Herbivore');

INSERT INTO AnimalDetails (kind_id, name, age, gender, weight, birth_date, arrival_date)
VALUES (1, 'Simba', 5, 'Male', 200, '2018-06-12', '2021-03-18'),(2, 'Dumbo', 12, 'Female', 400, '2009-11-25', '2020-08-02');