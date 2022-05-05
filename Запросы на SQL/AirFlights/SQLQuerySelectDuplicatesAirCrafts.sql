USE AirFlightsDBNew52
GO
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT AirCraftRegistration, AirCraftUniqueNumber,  COUNT(*) AS Duplicates
  FROM [AirFlightsDBNew52].[dbo].[AirCraftsTable]
  GROUP BY AirCraftRegistration, AirCraftUniqueNumber
  HAVING COUNT(*) > 1 -- самолетов с дубликатами пока нет