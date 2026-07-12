CREATE TABLE finance.exchange_rates
(
    id UNIQUEIDENTIFIER NOT NULL
        DEFAULT NEWSEQUENTIALID(),

    from_currency_id UNIQUEIDENTIFIER NOT NULL,

    to_currency_id UNIQUEIDENTIFIER NOT NULL,

    exchange_rate DECIMAL(18,8) NOT NULL,

    effective_date DATE NOT NULL,

    created_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_exchange_rates
        PRIMARY KEY(id),

    CONSTRAINT fk_exchange_from
        FOREIGN KEY(from_currency_id)
        REFERENCES finance.currencies(id),

    CONSTRAINT fk_exchange_to
        FOREIGN KEY(to_currency_id)
        REFERENCES finance.currencies(id),

    CONSTRAINT chk_exchange_rate
        CHECK(exchange_rate > 0)
);
GO