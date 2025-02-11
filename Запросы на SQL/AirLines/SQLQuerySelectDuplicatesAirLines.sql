USE AirLinesDBNew62
GO
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT AirLineName, AirLineCodeIATA,  COUNT(*) AS Duplicates
  FROM dbo.AirLinesTable
  GROUP BY AirLineName, AirLineCodeIATA
  HAVING COUNT(*) > 1 -- (221 -> 187) авиакомпаний с дубликатами по коду ICAO, есть по 3 и по 4 