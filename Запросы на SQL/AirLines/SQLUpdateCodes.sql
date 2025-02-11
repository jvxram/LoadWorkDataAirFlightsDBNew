/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT TOP (1000) [AirLineUniqueNumber]
      ,[AirLine_ID]
      ,[AirLineName]
      ,[AirLineAlias]
      ,[AirLineCodeIATA]
      ,[AirLineCodeICAO]
      ,[AirLineCallSighn]
      ,[AirLineCity]
      ,[AirLineCountry]
      ,[AirLineStatus]
      ,[CreationDate]
      ,[AirLineDescription]
      ,[Aliance]
      ,[Hubs]
  FROM [AirLinesDBNew62].[dbo].[AirLinesTable]
  WHERE AirLineCodeIATA IS NULL AND AirLineCodeICAO = 'None'
  GO

  UPDATE [AirLinesDBNew62].[dbo].[AirLinesTable] SET  AirLineCodeIATA = 'VC', AirLineCodeICAO = 'CIG' WHERE  AirLineCodeIATA IS NULL AND AirLineCodeICAO = 'None'
  GO
