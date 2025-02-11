USE [AirCraftsDBNew62]
GO
/****** Object:  StoredProcedure [dbo].[SPUpdateAirCraft]    Script Date: 29.04.2021 3:45:47 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Тарасов СЕРГЕЙ
-- Create date:	29 апреля 2021 года
-- Изменено:	29 апреля 2021 года
-- Description:	Обновление данных самолета
-- =============================================
CREATE PROCEDURE [dbo].[SPUpdateAirCraft] (@pk BIGINT, @registration XML, @owner XML, @operator XML, @LN varchar(100), @MSN varchar(100), @SN varchar(100), @CN varchar(100))
-- todo Проверить входные xml-ные данные схемами -> @registration XML(DOCUMENT SchemaCollection)
-- todo Распределить параметры по схемам
AS
BEGIN
	-- Тело процедуры
	SET XACT_ABORT ON -- закрываем открытые безхозные транзакции, исходя из того, что одновременно пусть будет открыта только одна транзакция
	SET NOCOUNT ON; -- снимаем ограничение "row(s) affected", SET NOCOUNT ON added to prevent extra result sets from
	-- Тело процедуры
	BEGIN TRY
		-- Первичный ключ уникален, но присваивается автоинкрементом в разных сессиях и поэтому возможны разрывы в сквозной нумерации
		-- Каскадные правила на UPDATE и DELETE 
		DECLARE @TransactionName VARCHAR(32)
		SET @TransactionName = CONCAT('Transaction_SelectCountOf_', @pk)  -- используются <= 32 символов
		SET Transaction Isolation Level Repeatable Read
		BEGIN TRANSACTION @TransactionName WITH MARK  -- пометка транзакции (работает с SQL Server 2008-го)
			-- Обновляем строку с параметрами как было подано на вход процедуры (простейший случай)
			UPDATE dbo.AirCraftsTable SET AirCraftRegistration = @registration, AirLineOwner = @owner, AirLineOperator = @operator, AirCraftLineNumber_LN_MSN = CONCAT(@LN, ' ', @MSN), AirCraftSerialNumber_SN = @SN, AirCraftCNumber = @CN
				WHERE AirCraftUniqueNumber = @pk
		COMMIT TRANSACTION @TransactionName
	END TRY

	-- Обработка исключения
	BEGIN CATCH
		IF @@trancount > 0 ROLLBACK TRANSACTION  -- это откат всей процедуры, не "RowInsertionWithParam"
		DECLARE @msg NVARCHAR(2048) = error_message() -- текст ошибки
		RAISERROR (@msg, 16, 1)
		RETURN 55555 -- просто страховка для SQL Server 2005  и более ранних (не использовать в триггерах)
	END CATCH

	PRINT @TransactionName
	-- Выключаем обратно
	SET XACT_ABORT OFF
	SET NOCOUNT OFF
END
