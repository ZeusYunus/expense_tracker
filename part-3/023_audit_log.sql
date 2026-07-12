CREATE TABLE audit.audit_log
(
    id BIGINT IDENTITY(1,1) PRIMARY KEY,

    table_name NVARCHAR(100) NOT NULL,

    record_id UNIQUEIDENTIFIER NOT NULL,

    operation NVARCHAR(20) NOT NULL,

    old_values NVARCHAR(MAX),

    new_values NVARCHAR(MAX),

    changed_by UNIQUEIDENTIFIER NULL,

    ip_address NVARCHAR(50),

    changed_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME()
);
GO