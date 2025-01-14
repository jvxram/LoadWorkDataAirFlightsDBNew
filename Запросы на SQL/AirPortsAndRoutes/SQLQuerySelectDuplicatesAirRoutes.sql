USE AirFlightsDBNew52
GO
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT AirPortDeparture, AirPortArrival,  COUNT(*) AS Duplicates
  FROM [AirFlightsDBNew52].[dbo].[AirRoutesTable]
  GROUP BY AirPortDeparture, AirPortArrival
  HAVING COUNT(*) > 1 -- маршрутов с дубликатами пока нету