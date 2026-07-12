CREATE TABLE finance.currencies
(
    id UNIQUEIDENTIFIER NOT NULL
        DEFAULT NEWSEQUENTIALID(),

    iso_code CHAR(3) NOT NULL,

    currency_name NVARCHAR(100) NOT NULL,

    symbol NVARCHAR(10) NOT NULL,

    is_active BIT NOT NULL
        DEFAULT 1,

    created_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_currencies
        PRIMARY KEY(id),

    CONSTRAINT uq_currency_iso
        UNIQUE(iso_code)
);
GO