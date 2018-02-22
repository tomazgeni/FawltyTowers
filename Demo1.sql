--- >>>> DEMO 1
--  Reporting Service

-- Connect GENINGSQL07
-- BiSandBox

USE BISandbox;
GO

DROP TABLE IF EXISTS dbo.JerrySeinfeld;
GO

CREATE TABLE dbo.JerrySeinfeld
(
 ID INT
,DateT SMALLDATETIME
,ValueOF INT
,NameAT VARCHAR(100)
);
GO

INSERT INTO dbo.JerrySeinfeld(id, datet, valueOf, NameAT)
		  SELECT 1,'2018/02/01', 100, 'Kramer'
UNION ALL SELECT 2,'2018/02/02', 104, 'Kramer' 
UNION ALL SELECT 3,'2018/02/03', 104, 'Kramer' 
UNION ALL SELECT 4,'2018/02/04', 105, 'Elaine' 
UNION ALL SELECT 5,'2018/02/03', 105, 'Elaine' 
UNION ALL SELECT 6,'2018/02/04', 105, 'Elaine' 


SELECT * FROM dbo.JerrySeinfeld;
GO


DROP TABLE IF EXISTS dbo.JerrySeinfeld;
GO
