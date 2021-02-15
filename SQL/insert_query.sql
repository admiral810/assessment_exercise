-- delete all data from fact table, keep headers
TRUNCATE TABLE fact_table;

-- FACT TABLE VALUES
-- [Platform ID], Platform, Date, [Product ID], Product, Revenue, Device, Format, Units, Environment, [Price per Thousand Units]

USE ias;

-- insert amazon data
INSERT INTO fact_table ([Platform ID], Platform, Date, [Product ID], Product, Revenue, Device, Format)
SELECT plat.ID, s.Company, TRY_CAST(CAST(Year AS varchar(4)) + Month AS DATE), prod.[Product ID], dbo.udf_clean_prod(s.Product), s.Revenue, s.Device, s.Format
FROM Amazon s
LEFT JOIN dim_platform plat
	ON s.Company = plat.Platform
LEFT JOIN dim_product prod
	ON dbo.udf_clean_prod(s.Product) = prod.[Product Type];

-- insert apple data
INSERT INTO fact_table ([Platform ID], Platform, Date, [Product ID], Product, Revenue, Device, Format, Units)
SELECT plat.ID, s.Platform, TRY_CAST(CAST(Year AS varchar(4)) + Month AS DATE), prod.[Product ID], dbo.udf_clean_prod(s.Product), s.Cost, s.Device, s.Format, s.Units
FROM Apple s
LEFT JOIN dim_platform plat
	ON s.Platform = plat.Platform
LEFT JOIN dim_product prod
	ON dbo.udf_clean_prod(s.Product) = prod.[Product Type];

-- insert ganges data
INSERT INTO fact_table ([Platform ID], Platform, Date, [Product ID], Product, Revenue, Device, Format)
SELECT plat.ID, 'Ganges', CAST(Month AS DATE), prod.[Product ID], dbo.udf_clean_prod(s.Product), s.Revenue, s.Device, s.Format
FROM Ganges s
LEFT JOIN dim_platform plat
	ON 'Ganges' = plat.Platform
LEFT JOIN dim_product prod
	ON dbo.udf_clean_prod(s.Product) = prod.[Product Type];

-- insert grape data
INSERT INTO fact_table ([Platform ID], Platform, Date, [Product ID], Product, Revenue, Device, Format, Units, Environment)
SELECT plat.ID, s.Company, TRY_CAST(CAST(Year AS varchar(4)) + Month AS DATE), prod.[Product ID], dbo.udf_clean_prod(s.Product), s.Revenue, s.Device, s.Format, s.Widgets, s.Environment
FROM Grape s
LEFT JOIN dim_platform plat
	ON s.Company = plat.Platform
LEFT JOIN dim_product prod
	ON dbo.udf_clean_prod(s.Product) = prod.[Product Type];

-- insert kiwi data
INSERT INTO fact_table ([Platform ID], Platform, Date, [Product ID], Product, Revenue, Device, Format, Units, [Price per Thousand Units])
SELECT plat.ID, s.Company, TRY_CAST(CAST(Year AS varchar(4)) + Month AS DATE), prod.[Product ID], dbo.udf_clean_prod(s.Product), s.Revenue, s.Device, s.Format, s.Units, s.[Cost per thousand units]
FROM Kiwi s
LEFT JOIN dim_platform plat
	ON s.Company = plat.Platform
LEFT JOIN dim_product prod
	ON dbo.udf_clean_prod(s.Product) = prod.[Product Type];

-- insert mississippi data
INSERT INTO fact_table ([Platform ID], Platform, Date, [Product ID], Product, Revenue, Device, Format)
SELECT plat.ID, s.Platform, TRY_CAST(CAST(Year AS varchar(4)) + Month AS DATE), prod.[Product ID], dbo.udf_clean_prod(s.Product), s.Revenue, s.Device, s.Format
FROM Mississippi s
LEFT JOIN dim_platform plat
	ON s.Platform = plat.Platform
LEFT JOIN dim_product prod
	ON dbo.udf_clean_prod(s.Product) = prod.[Product Type];

-- insert nile data
INSERT INTO fact_table ([Platform ID], Platform, Date, [Product ID], Product, Revenue, Device, Format)
SELECT plat.ID, s.Partner, TRY_CAST(CAST(Year AS varchar(4)) + Month AS DATE), prod.[Product ID], dbo.udf_clean_prod(s.Product), s.[Cost to Partner], s.Device, s.Format
FROM Nile s
LEFT JOIN dim_platform plat
	ON s.Partner = plat.Platform
LEFT JOIN dim_product prod
	ON dbo.udf_clean_prod(s.Product) = prod.[Product Type];

-- insert nile data
INSERT INTO fact_table ([Platform ID], Platform, Date, [Product ID], Product, Revenue, Device, Format)
SELECT plat.ID, s.Partner, TRY_CAST(CAST(Year AS varchar(4)) + Month AS DATE), prod.[Product ID], dbo.udf_clean_prod(s.Product), s.[Cost to Partner], s.Device, s.Format
FROM Nile s
LEFT JOIN dim_platform plat
	ON s.Partner = plat.Platform
LEFT JOIN dim_product prod
	ON dbo.udf_clean_prod(s.Product) = prod.[Product Type];

-- insert orange data
INSERT INTO fact_table ([Platform ID], Platform, Date, [Product ID], Product, Revenue, Device, Format)
SELECT plat.ID, 'Orange', CAST(Date AS DATE), prod.[Product ID], dbo.udf_clean_prod(s.Product), s.Revenue, s.Device, s.Format
FROM Orange s
LEFT JOIN dim_platform plat
	ON 'Orange' = plat.Platform
LEFT JOIN dim_product prod
	ON dbo.udf_clean_prod(s.Product) = prod.[Product Type];

-- insert pear data
INSERT INTO fact_table ([Platform ID], Platform, Date, [Product ID], Product, Revenue, Device, Format)
SELECT plat.ID, 'Pear', TRY_CAST(CAST(Year AS varchar(4)) + Month AS DATE), prod.[Product ID], dbo.udf_clean_prod(s.Product), s.[Revenue to Partner], s.Device, s.Format
FROM Pear s
LEFT JOIN dim_platform plat
	ON 'Pear' = plat.Platform
LEFT JOIN dim_product prod
	ON dbo.udf_clean_prod(s.Product) = prod.[Product Type];

-- insert yangtze data
INSERT INTO fact_table ([Platform ID], Platform, Date, [Product ID], Product, Revenue, Device, Format, Environment)
SELECT plat.ID, s.Company, TRY_CAST(CAST(Year AS varchar(4)) + Month AS DATE), prod.[Product ID], dbo.udf_clean_prod(s.Product), s.Revenue, s.Device, s.Format, s.Environment
FROM Yangtze s
LEFT JOIN dim_platform plat
	ON s.Company = plat.Platform
LEFT JOIN dim_product prod
	ON dbo.udf_clean_prod(s.Product) = prod.[Product Type];

SELECT *
FROM fact_table
