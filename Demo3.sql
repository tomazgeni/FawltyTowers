--- >>>> DEMO 3
--  Reporting Service

-- Connect GENINGSQL07
-- BiSandBox

USE BISandbox;
GO

DROP TABLE IF EXISTS dbo.CosmoKramer;
GO

CREATE TABLE dbo.CosmoKramer
(
 ID INT
,DateT SMALLDATETIME
,ValueOF1 INT
,NameAT VARCHAR(100)
,ValueOF2 INT
);
GO

INSERT INTO dbo.CosmoKramer(id, datet, valueOf1, NameAT, ValueOF2)
		  SELECT 1,'2018/02/01', 100, 'Kramer', 100
UNION ALL SELECT 2,'2018/02/02', 104, 'Kramer', 104 
UNION ALL SELECT 3,'2018/02/03', 104, 'Kramer', 104 
UNION ALL SELECT 4,'2018/02/04', 105, 'Elaine', 105 
UNION ALL SELECT 5,'2018/02/03', 105, 'Elaine', 105 
UNION ALL SELECT 6,'2018/02/04', 105, 'Elaine', 105 


SELECT * FROM dbo.CosmoKramer;
GO


------ Query

DECLARE @DateOfNothing SMALLDATETIME = '2018/02/02'

SELECT 
* 
FROM dbo.CosmoKramer
WHERE
  DateT >= @DateOfNothing



-- Matrix aggregation
SELECT 
 DateT
,SUM(ValueOf2) AS SumOFNothing
FROM dbo.CosmoKramer
WHERE
  DateT >= @DateOfNothing
GROUP BY DateT
ORDER BY DateT


-- Matrix aggregation using SP
CREATE OR ALTER PROCEDURE dbo.SP_Kramer 
	@KramerDate SMALLDATETIME
AS
BEGIN
	SELECT 
	 DateT
	,SUM(ValueOf2) AS SumOFNothing
	FROM dbo.CosmoKramer
	WHERE
	  DateT >= @KramerDate
	GROUP BY DateT;
END;
GO


EXEC dbo.SP_Kramer @KramerDate =  '2018/02/02'


-- Clean up
DROP PROCEDURE IF EXISTS dbo.SP_Kramer;
GO

DROP TABLE IF EXISTS dbo.CosmoKramer;
GO



