SELECT first_name, last_name, school
FROM teachers
ORDER BY school ASC, last_name ASC;

SELECT *
FROM teachers
WHERE first_name ILIKE 'S%' AND salary > 40000

SELECT *
FROM teachers
WHERE hire_date >= '2010-01-01'
ORDER BY salary DESC


