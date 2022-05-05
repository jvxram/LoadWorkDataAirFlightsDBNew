USE AirFlightsDBNew5
GO
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [MANUFACTURER]
      ,[MODEL]
      ,[IATA]
      ,[ICAO]
      ,[ModelDescription]
  FROM [AirFlightsDBNew2].[dbo].[AirCraftModelsView]
  ORDER BY MANUFACTURER, MODEL