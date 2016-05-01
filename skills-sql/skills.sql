-- Note: Please consult the directions for this assignment
-- for the most explanatory version of each question.

-- 1. Select all columns for all brands in the Brands table.
    SELECT * FROM brands;

-- 2. Select all columns for all car models made by Pontiac in the Models table.
    SELECT * FROM models JOIN brands USING (name) WHERE name = 'Pontiac';

-- 3. Select the brand name and model
--    name for all models made in 1964 from the Models table.
    SELECT brand_name, name, year FROM models WHERE year = 1964;

-- 4. Select the model name, brand name, and headquarters for the Ford Mustang
--    from the Models and Brands tables.
    SELECT ta1.brand_name, ta1.name, ta2.headquarters
    FROM models AS ta1 JOIN brands AS ta2 ON (ta2.name = ta1.brand_name)
    WHERE ta1.brand_name = 'Ford' AND ta1.name = 'Mustang';

-- 5. Select all rows for the three oldest brands
--    from the Brands table (Hint: you can use LIMIT and ORDER BY).
    SELECT * FROM brands ORDER BY founded LIMIT 3;

-- 6. Count the Ford models in the database (output should be a number).
    SELECT COUNT(*) FROM models WHERE brand_name LIKE 'Ford%';

-- 7. Select the name of any and all car brands that are not discontinued.
    SELECT name FROM brands WHERE discontinued IS NULL;

-- 8. Select rows 15-25 of the DB in alphabetical order by model name.
    SELECT * FROM brands WHERE id BETWEEN 15 AND 25 ORDER BY name;
    SELECT * FROM models WHERE id BETWEEN 15 AND 25 ORDER BY name;

-- 9. Select the brand, name, and year the model's brand was
--    founded for all of the models from 1960. Include row(s)
--    for model(s) even if its brand is not in the Brands table.
--    (The year the brand was founded should be NULL if
--    the brand is not in the Brands table.)

    SELECT brand_name, models.name, founded FROM models FULL JOIN brands
    ON brands.name = brand_name WHERE year = 1960;

-- Part 2: Change the following queries according to the specifications.
-- Include the answers to the follow up questions in a comment below your
-- query.

-- 1. Modify this query so it shows all brands that are not discontinued
-- regardless of whether they have any models in the models table.
-- before:
    -- SELECT b.name,
    --        b.founded,
    --        m.name
    -- FROM Model AS m
    --   LEFT JOIN brands AS b
    --     ON b.name = m.brand_name
    -- WHERE b.discontinued IS NULL;

    SELECT brands.name, models.brand_name, brands.discontinued
    FROM brands JOIN models
    ON brands.name = models.brand_name
    WHERE brands.discontinued IS NULL;

-- 2. Modify this left join so it only selects models that have brands in the Brands table.
-- before:
    -- SELECT m.name,
    --        m.brand_name,
    --        b.founded
    -- FROM Models AS m
    --   LEFT JOIN Brands AS b
    --     ON b.name = m.brand_name;
    SELECT models.brand_name, brands.name FROM models
    LEFT JOIN brands ON brands.name = models.brand_name;

-- followup question: In your own words, describe the difference between
-- left joins and inner joins.
    "Inner joins display all rows that have something in common with the content from other tables, and left joins
    show all the rows from the left table and whatever matches from the right table, including whatever is 'null'."

-- 3. Modify the query so that it only selects brands that don't have any models in the models table.
-- (Hint: it should only show Tesla's row.)
-- before:
    -- SELECT name,
    --        founded
    -- FROM Brands
    --   LEFT JOIN Models
    --     ON brands.name = Models.brand_name
    -- WHERE Models.year > 1940;

    SELECT models.brand_name, brands.name FROM brands
    LEFT JOIN models ON models.brand_name = brands.name WHERE models.brand_name IS NULL;



-- 4. Modify the query to add another column to the results to show
-- the number of years from the year of the model until the brand becomes discontinued
-- Display this column with the name years_until_brand_discontinued.
-- before:
    -- SELECT b.name,
    --        m.name,
    --        m.year,
    --        b.discontinued
    -- FROM Models AS m
    --   LEFT JOIN brands AS b
    --     ON m.brand_name = b.name
    -- WHERE b.discontinued NOT NULL;


*****************************************I dont know what to do here...*****************************************"

-- Part 3: Further Study

-- 1. Select the name of any brand with more than 5 models in the database.

-- 2. Add the following rows to the Models table.

.. FIXME
    example here has name and brand_name backwards. Instructions are ambiguous.

-- year    name       brand_name
-- ----    ----       ----------
-- 2015    Chevrolet  Malibu
-- 2015    Subaru     Outback

-- 3. Write a SQL statement to crate a table called `Awards`
--    with columns `name`, `year`, and `winner`. Choose
--    an appropriate datatype and nullability for each column
--   (no need to do subqueries here).

-- 4. Write a SQL statement that adds the following rows to the Awards table:

.. FIXME
    These instructions no longer match with the solution or the .rst instructions

--   name                 year      winner_model_id
--   ----                 ----      ---------------
--   IIHS Safety Award    2015      the id for the 2015 Chevrolet Malibu
--   IIHS Safety Award    2015      the id for the 2015 Subaru Outback

-- 5. Using a subquery, select only the *name* of any model whose
-- year is the same year that *any* brand was founded.





