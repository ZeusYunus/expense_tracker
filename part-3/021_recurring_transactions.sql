CREATE TABLE finance.recurring_transactions
(
    id UNIQUEIDENTIFIER NOT NULL
        DEFAULT NEWSEQUENTIALID(),

    workspace_id UNIQUEIDENTIFIER NOT NULL,

    account_id UNIQUEIDENTIFIER NOT NULL,

    category_id UNIQUEIDENTIFIER NULL,

    merchant_id UNIQUEIDENTIFIER NULL,

    transaction_type NVARCHAR(20) NOT NULL,

    amount DECIMAL(18,2) NOT NULL,

    frequency NVARCHAR(20) NOT NULL,

    next_run_date DATE NOT NULL,

    end_date DATE NULL,

    description NVARCHAR(300),

    is_active BIT NOT NULL
        DEFAULT 1,

    created_by UNIQUEIDENTIFIER NOT NULL,

    created_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_recurring
        PRIMARY KEY(id),

    CONSTRAINT fk_recurring_workspace
        FOREIGN KEY(workspace_id)
        REFERENCES finance.workspaces(id),

    CONSTRAINT fk_recurring_account
        FOREIGN KEY(account_id)
        REFERENCES finance.accounts(id),

    CONSTRAINT fk_recurring_category
        FOREIGN KEY(category_id)
        REFERENCES finance.categories(id),

    CONSTRAINT fk_recurring_merchant
        FOREIGN KEY(merchant_id)
        REFERENCES finance.merchants(id),

    CONSTRAINT fk_recurring_user
        FOREIGN KEY(created_by)
        REFERENCES auth.users(id),

    CONSTRAINT chk_frequency
        CHECK(frequency IN
        (
            'daily',
            'weekly',
            'monthly',
            'yearly'
        ))
);
GO