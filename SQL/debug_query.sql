USE ias;
SELECT plat.Platform, rev.Product AS prod, reps.[Sales Representative] AS rep, sum(rev.Revenue) AS Revenue, sum(rev.Units) AS Units

FROM fact_table as rev
LEFT JOIN dim_platform AS plat
	ON rev.[Platform ID] = plat.ID
LEFT JOIN dim_sales_rep reps
	ON plat.[Account Manager ID] = reps.ID

WHERE rev.Product Is NOT NULL
	AND Environment NOT LIKE '%unknown%'  -- recommend ommiting unless wish to exclude nulls
	AND Revenue > 0 

GROUP BY plat.Platform, reps.[Sales Representative], rev.Product
ORDER BY Revenue DESC


-- more insight into how not like unknown will omit NULLs
--SELECT *
--FROM fact_table
--WHERE Environment NOT LIKE '%unknown%'