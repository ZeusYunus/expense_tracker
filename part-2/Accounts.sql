CREATE TABLE finance.accounts
(
    id UNIQUEIDENTIFIER NOT NULL
        DEFAULT NEWSEQUENTIALID(),

    workspace_id UNIQUEIDENTIFIER NOT NULL,

    currency_id UNIQUEIDENTIFIER NOT NULL,

    account_name NVARCHAR(100) NOT NULL,

    account_type NVARCHAR(30) NOT NULL,

    opening_balance DECIMAL(18,2) NOT NULL
        DEFAULT 0,

    current_balance DECIMAL(18,2) NOT NULL
        DEFAULT 0,

    is_active BIT NOT NULL
        DEFAULT 1,

    created_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME(),

    updated_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME(),

    deleted_at DATETIME2 NULL,

    CONSTRAINT pk_accounts
        PRIMARY KEY(id),

    CONSTRAINT fk_account_workspace
        FOREIGN KEY(workspace_id)
        REFERENCES finance.workspaces(id),

    CONSTRAINT fk_account_currency
        FOREIGN KEY(currency_id)
        REFERENCES finance.currencies(id),

    CONSTRAINT chk_account_type
        CHECK(account_type IN
        (
            'cash',
            'bank',
            'wallet',
            'credit_card'
        ))
);
GO