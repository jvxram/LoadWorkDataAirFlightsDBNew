USE AirFlightsDBNew62
GO
/*  Самолеты  */
SET Transaction Isolation Level Read Committed
SELECT AirLineName AS AIRLINE, ALIANCE,
       AirCraftRegistration AS REGISTRATION,
	   Name AS MANUFACTURER,
	   ModelName AS MODEL,
	   AirCraftDescription, SourceCSVFile,
	   AirCraftLineNumber_LN_MSN AS LN_MSN,
	   AirCraftSerialNumber_SN AS SN,
	   AirCraftCNumber AS CN,
	   Owner1, Owner2, Owner3, [Type], [State]
  FROM dbo.AirCraftView
  -- WHERE AirCraftRegistration = 'VQ-BJG' -- UTair из Адлера в Москву (Внуково)
 -- WHERE AirCraftRegistration = 'M-IABU'
 -- G-BDXJ - on test track of Top Gear
  -- WHERE AirLineName <> 'Unknown'   -- Самолеты с указанной регистрацией (пока всего 3786 -> 7842 -> 7674)
  -- WHERE (Name = 'Unknown') OR (ModelName = 'Unknown Model')  -- (пока 635 -> 4573 -> 4405)
   WHERE AirLineName IS NOT NULL AND AirLineName <> 'Unknown'  -- Самолеты с проставленной авиакомпанией (пока 3831 -> 7842 -> 7674)
   ORDER BY AIRLINE, REGISTRATION
-- Всего: 75880 -> 75712
