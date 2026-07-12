CREATE TRIGGER finance.trg_transactions_audit
ON finance.transactions
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- INSERT
    INSERT INTO audit.audit_log
    (
        table_name,
        record_id,
        operation,
        new_values
    )
    SELECT
        'finance.transactions',
        i.id,
        'INSERT',
        (
            SELECT i.*
            FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
        )
    FROM inserted i
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM deleted d
        WHERE d.id = i.id
    );

    -- DELETE
    INSERT INTO audit.audit_log
    (
        table_name,
        record_id,
        operation,
        old_values
    )
    SELECT
        'finance.transactions',
        d.id,
        'DELETE',
        (
            SELECT d.*
            FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
        )
    FROM deleted d
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM inserted i
        WHERE i.id = d.id
    );

    -- UPDATE
    INSERT INTO audit.audit_log
    (
        table_name,
        record_id,
        operation,
        old_values,
        new_values
    )
    SELECT
        'finance.transactions',
        i.id,
        'UPDATE',
        (
            SELECT d.*
            FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
        ),
        (
            SELECT i.*
            FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
        )
    FROM inserted i
    INNER JOIN deleted d
        ON i.id = d.id;
END;
GO