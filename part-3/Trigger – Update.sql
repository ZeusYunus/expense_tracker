CREATE TRIGGER finance.trg_transactions_updated_at
ON finance.transactions
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET updated_at = SYSUTCDATETIME()
    FROM finance.transactions t
    INNER JOIN inserted i
        ON t.id = i.id;
END;
GO