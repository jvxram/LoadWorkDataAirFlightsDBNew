/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
USE AirFlightsDBNew62
GO

SELECT [AirCraftUniqueNumber]
      ,[AirCraftRegistration]
      ,[AirCraftModel]
      ,[AirCraftAirLine]
      ,[BuildDate]
      ,[RetireDate]
      ,[SourceCSVFile]
      ,[AirCraftDescription]
      ,[AirCraftLineNumber_LN_MSN]
      ,[AirCraftSerialNumber_SN]
      ,[AirCraftCNumber]
      ,[EndDate]
      ,[Owner1]
      ,[Type]
      ,[State]
      ,[AirCraftImage]
  FROM dbo.AirCraftsTable
  WHERE AirCraftRegistration IS NULL
		OR AirCraftRegistration = 'Unknown'
		OR AirCraftRegistration = 'UNKNOWN'
		OR AirCraftRegistration = 'nan'
		OR AirCraftRegistration = 'Nan'
		OR AirCraftRegistration = 'NAN'
		OR AirCraftRegistration = 'UNKNOW'
  ORDER BY AirCraftRegistration