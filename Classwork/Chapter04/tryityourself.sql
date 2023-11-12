CREATE TABLE movies(
    id numeric,
    movie varchar(90),
    actor varchar(90)
);

INSERT INTO movies
VALUES
    (50, 'Mission Impossible', 'Tom Cruise');

COPY movies (id, movie, actor)
FROM 'C:\SQL\movies.txt'
WITH (FORMAT CSV, HEADER);
WITH (FORMAT CSV, HEADER, DELIMITER '|');

COPY (
  SELECT county_name, state, housing_unit_count_100_percent
  FROM us_counties_2010
  ORDER BY housing_unit_count_100_percent DESC
  LIMIT 20
) TO 'C:\SQL\output.csv' CSV HEADER;