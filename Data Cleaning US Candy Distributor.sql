-- 1 -- Create staging tables and generate PK
SELECT *
INTO candy_sales_stg
FROM candy_sales;

SELECT * 
INTO location_stg
FROM location;

CREATE TABLE candy_targets_stg(
	target_id INT IDENTITY(1,1),
	division varchar(50),
	target varchar(50)
);

INSERT INTO candy_targets_stg(division,target)
SELECT *
FROM candy_targets

CREATE TABLE candy_factories_stg(
	factory_id INT IDENTITY (1,1),
	factory varchar(50),
	latitude varchar(50),
	longitude varchar(50)
	);

INSERT INTO candy_factories_stg( factory, latitude, longitude)
SELECT *
FROM candy_factories

ALTER TABLE candy_products
ADD factory_id int, target_id int;


UPDATE p
SET p.factory_id = f.factory_id, 
    p.target_id = t.target_id
FROM candy_products p
JOIN candy_factories_stg f 
    ON p.factory = f.factory
JOIN candy_targets_stg t
    ON p.division = t.division;


-- Lowercase each column name (replace table name)
DECLARE @table_name NVARCHAR(255) = 'candy_products';
DECLARE @sql NVARCHAR(MAX) = '';

SELECT @sql = @sql + 
              'EXEC sp_rename ''' + @table_name + '.' + COLUMN_NAME + ''', ''' + 
              LOWER(COLUMN_NAME) + '''; '  -- Convert column name to lowercase
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @table_name;


EXEC sp_executesql @sql;

-- 2 -- Remove Irrelevant Columns
ALTER TABLE location_stg
DROP COLUMN county_fips_all, zcta, parent_zcta, county_weights, county_names_all, imprecise, military;

ALTER TABLE candy_sales_stg
DROP COLUMN product_name, division, country_region, city, state_province, region;

ALTER TABLE candy_products
DROP COLUMN division, factory

-- 3 -- Find and Remove duplicates
SELECT *
FROM
(
  SELECT
    order_id, 
    order_date, 
    ship_date, 
    ship_mode, 
    customer_id, 
    country_region, 
    city, 
    state_province, 
    postal_code, 
    division, 
    region, 
    product_id, 
    product_name, 
    sales, 
    units, 
    gross_profit, 
    cost,
    ROW_NUMBER() OVER(PARTITION BY 
		    order_id, 
			order_date, 
			ship_date, 
			ship_mode, 
			customer_id, 
			country_region, 
			city, 
			state_province, 
			postal_code, 
			division, 
			region, 
			product_id, 
			product_name, 
			sales, 
			units, 
			gross_profit, 
			cost
	ORDER BY order_id) AS row_num
  FROM candy_sales_stg
) AS subquery
WHERE row_num > 1
ORDER BY order_date;

-- the above code determine there is 313 rows that are duplicates in candy_sales_stg table
-- code to remove duplicates

WITH delete_CTE AS (
		  SELECT
			row_id,
			order_id, 
			order_date, 
			ship_date, 
			ship_mode, 
			customer_id, 
			country_region, 
			city, 
			state_province, 
			postal_code, 
			division, 
			region, 
			product_id, 
			product_name, 
			sales, 
			units, 
			gross_profit, 
			cost,
			ROW_NUMBER() OVER(PARTITION BY 
					order_id, 
					order_date, 
					ship_date, 
					ship_mode, 
					customer_id, 
					country_region, 
					city, 
					state_province, 
					postal_code, 
					division, 
					region, 
					product_id, 
					product_name, 
					sales, 
					units, 
					gross_profit, 
					cost
			ORDER BY order_id) AS row_num
		  FROM candy_sales_stg
		  )
DELETE FROM candy_sales_stg
WHERE row_id IN (
	SELECT row_id
	FROM delete_CTE
	WHERE row_num > 1
	);

-- 4 -- Handle missing values
-- all records in candy_sales table have values 
-- however i will remove records that dont matter to the analysis 
-- there are 194 sales that occurred in Canada, this analysis is based on US market 
-- therefore sales from Cananda should not be included 
DELETE c
FROM candy_sales_stg c
LEFT JOIN location_details_stg l ON c.postal_code = l.zip
WHERE l.state_name IS NULL;

-- this code removes the unneccessary records in locations details
DELETE l
FROM location_details_stg l
LEFT JOIN candy_sales_stg s 
ON l.zip = s.postal_code
WHERE row_id IS NULL;

-- 5 -- Transfer data
-- these are codes to transfer all the data into final tables into a new database
SELECT *
INTO candy_factories
FROM candy_sales_db.dbo.candy_factories_stg

SELECT *
INTO candy_products
FROM candy_sales_db.dbo.candy_products

SELECT *
INTO candy_sales
FROM candy_sales_db.dbo.candy_sales_stg

SELECT *
INTO candy_targets
FROM candy_sales_db.dbo.candy_targets_stg

SELECT *
INTO location_details
FROM candy_sales_db.dbo.location_stg