CREATE FUNCTION udf_clean_prod(@prod_in VARCHAR(20))
RETURNS VARCHAR(20)
AS
BEGIN
DECLARE @prod_out VARCHAR(20)

SET @prod_out = CASE
					WHEN @prod_in = 'Social' THEN 'Social'
					WHEN @prod_in = 'Video Platform' THEN 'Video Platform'
					WHEN @prod_in = 'New Business' THEN 'New Business'
					WHEN @prod_in = 'Experiment' THEN 'Experiment'
					ELSE 'Core'
				END
RETURN @prod_out
END; 

