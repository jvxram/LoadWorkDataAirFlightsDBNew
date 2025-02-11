USE AirFlightsDBNew52
GO
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT FlightNumberString,  COUNT(FlightNumberString) AS Duplicates, QuantityCounted
  FROM [AirFlightsDBNew52].[dbo].[AirFlightsTable]
  GROUP BY FlightNumberString, QuantityCounted
  HAVING COUNT(*) > 1 -- 409140 авиарейчов с дубликатами
  ORDER BY FlightNumberString