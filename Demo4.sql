--- >>>> DEMO 4
--  Reporting Service

-- Connect GENINGSQL07
-- BiSandBox

USE BISandbox;
GO

DROP TABLE IF EXISTS dbo.ElaineR;
GO

CREATE TABLE dbo.ElaineR
(
 ID INT
,DateT SMALLDATETIME
,ValueOF1 INT
,ValueOF2 INT
);
GO

INSERT INTO dbo.ElaineR(id, datet, valueOf1, ValueOF2)
		  SELECT 1,'2018/02/01', 100, 199
UNION ALL SELECT 2,'2018/02/02', 104, 188 
UNION ALL SELECT 3,'2018/02/03', 104, 177 
UNION ALL SELECT 4,'2018/02/04', 105, 166 
UNION ALL SELECT 5,'2018/02/03', 105, 155 
UNION ALL SELECT 6,'2018/02/04', 105, 144 


SELECT * FROM dbo.ElaineR;
GO


------ Query

-- DECLARE @DateOfNothing SMALLDATETIME = '2018/02/02'


-- Calling R to use some stuff
CREATE OR ALTER PROCEDURE dbo.SP_Elaine 
	@DateOfNothing SMALLDATETIME
AS
BEGIN

DECLARE @TSQL NVARCHAR(MAX) = N'
								SELECT 
								 DateT
								,ValueOf1
								,Valueof2
								FROM dbo.ElaineR
								WHERE
								  DateT >= ''' +CAST(@DateOfNothing AS VARCHAR(20))+''';';
PRINT @TSQL
DECLARE @RKoda NVARCHAR(MAX);

SET @RKoda = N'
			df_res <- InputDataSet
			df_res$ValueOf1 <- as.integer(df_res$ValueOf1)
			df_res$Valueof2 <- as.integer(df_res$Valueof2)
			res <- cor(df_res$ValueOf1,df_res$Valueof2)
			OutputDataSet <- data.frame(result=res)'

EXEC sp_execute_external_script
	 @language = N'R'
	,@script = @Rkoda
	,@input_data_1 = @TSQL
 WITH RESULT SETS ((
	ElaineR NUMERIC(10,2)
	));  
END;
GO


EXEC dbo.SP_Elaine 
	@DateOfNothing =  '2018/02/02'


-- Clean up
DROP PROCEDURE IF EXISTS dbo.SP_Elaine;
GO

DROP TABLE IF EXISTS dbo.ElaineR;
GO



