--1

SELECT 3.14 * 5 ^ 2;

--or

SELECT 3.14 * (5 ^ 2);

--you dont need parentheses because SQL follows the established math standard. There is an mathematical
--order for calculations

--2

SELECT geo_name,
       state_us_abbreviation,
       p0010001 AS total_population,
       p0010005 AS american_indian_alaska_native_alone,
       (CAST (p0010005 AS numeric(8,1)) / p0010001) * 100
           AS percent_american_indian_alaska_native_alone
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY'
ORDER BY percent_american_indian_alaska_native_alone DESC;

-- Franklin County, N.Y.

--3

-- First, you can find the median for each state one at a time:

SELECT percentile_cont(.5)
        WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY';

SELECT percentile_cont(.5)
        WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010
WHERE state_us_abbreviation = 'CA';

-- Or both in one query

SELECT state_us_abbreviation,
       percentile_cont(0.5)
          WITHIN GROUP (ORDER BY p0010001) AS median
FROM us_counties_2010
WHERE state_us_abbreviation IN ('NY', 'CA')
GROUP BY state_us_abbreviation;

-- Finally, this query shows the median for each state:

SELECT state_us_abbreviation,
       percentile_cont(0.5)
          WITHIN GROUP (ORDER BY p0010001) AS median
FROM us_counties_2010
GROUP BY state_us_abbreviation;

-- California had a median county population of 179,140.5 in 2010, almost double
-- that of New York, at 91,301.