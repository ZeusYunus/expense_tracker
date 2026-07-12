CREATE TABLE finance.transactions
(
    id UNIQUEIDENTIFIER NOT NULL
        DEFAULT NEWSEQUENTIALID(),

    workspace_id UNIQUEIDENTIFIER NOT NULL,

    account_id UNIQUEIDENTIFIER NOT NULL,

    category_id UNIQUEIDENTIFIER NULL,

    merchant_id UNIQUEIDENTIFIER NULL,

    transaction_type NVARCHAR(20) NOT NULL,

    amount DECIMAL(18,2) NOT NULL,

    currency_id UNIQUEIDENTIFIER NOT NULL,

    exchange_rate DECIMAL(18,8)
        DEFAULT 1,

    transaction_date DATETIME2 NOT NULL,

    description NVARCHAR(300),

    notes NVARCHAR(MAX),

    status NVARCHAR(20)
        DEFAULT 'posted',

    created_by UNIQUEIDENTIFIER NOT NULL,

    created_at DATETIME2
        DEFAULT SYSUTCDATETIME(),

    updated_at DATETIME2
        DEFAULT SYSUTCDATETIME(),

    deleted_at DATETIME2,

    row_version ROWVERSION,

    CONSTRAINT pk_transactions
        PRIMARY KEY(id),

    CONSTRAINT fk_transaction_workspace
        FOREIGN KEY(workspace_id)
        REFERENCES finance.workspaces(id),

    CONSTRAINT fk_transaction_account
        FOREIGN KEY(account_id)
        REFERENCES finance.accounts(id),

    CONSTRAINT fk_transaction_category
        FOREIGN KEY(category_id)
        REFERENCES finance.categories(id),

    CONSTRAINT fk_transaction_merchant
        FOREIGN KEY(merchant_id)
        REFERENCES finance.merchants(id),

    CONSTRAINT fk_transaction_currency
        FOREIGN KEY(currency_id)
        REFERENCES finance.currencies(id),

    CONSTRAINT fk_transaction_user
        FOREIGN KEY(created_by)
        REFERENCES auth.users(id),

    CONSTRAINT chk_transaction_type
        CHECK(transaction_type IN
        (
            'expense',
            'income',
            'transfer'
        )),

    CONSTRAINT chk_amount
        CHECK(amount > 0),

    CONSTRAINT chk_status
        CHECK(status IN
        (
            'pending',
            'posted',
            'cancelled'
        ))
);
GO