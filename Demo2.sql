--- >>>> DEMO 2
--  Reporting Service

-- Connect GENINGSQL07
-- BiSandBox

USE BISandbox;
GO

DROP TABLE IF EXISTS dbo.GerogeCostanza;
GO

CREATE TABLE dbo.GerogeCostanza
(
 ID INT
,DateT SMALLDATETIME
,ValueOF1 INT
,NameAT VARCHAR(100)
,ValueOF2 INT
);
GO

INSERT INTO dbo.GerogeCostanza(id, datet, valueOf1, NameAT, ValueOF2)
		  SELECT 1,'2018/02/01', 100, 'Kramer', 100
UNION ALL SELECT 2,'2018/02/02', 104, 'Kramer', 104 
UNION ALL SELECT 3,'2018/02/03', 104, 'Kramer', 104 
UNION ALL SELECT 4,'2018/02/04', 105, 'Elaine', 105 
UNION ALL SELECT 5,'2018/02/03', 105, 'Elaine', 105 
UNION ALL SELECT 6,'2018/02/04', 105, 'Elaine', 105 


SELECT * FROM dbo.GerogeCostanza;
GO


------ Query

DECLARE @LordofIdiots NVARCHAR(100) = 'Kramer'

SELECT 
* 
FROM dbo.GerogeCostanza
WHERE
  NameAT = @LordOfIdiots



SELECT 
NameAT
FROM dbo.GerogeCostanza
GROUP BY NameAT
ORDER BY NameAT


-- Clean up
DROP TABLE IF EXISTS dbo.GerogeCostanza;
GO



