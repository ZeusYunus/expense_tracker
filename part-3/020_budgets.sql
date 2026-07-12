CREATE TABLE finance.budgets
(
    id UNIQUEIDENTIFIER NOT NULL
        DEFAULT NEWSEQUENTIALID(),

    workspace_id UNIQUEIDENTIFIER NOT NULL,

    category_id UNIQUEIDENTIFIER NULL,

    budget_name NVARCHAR(100) NOT NULL,

    amount DECIMAL(18,2) NOT NULL,

    period_type NVARCHAR(20) NOT NULL,

    start_date DATE NOT NULL,

    end_date DATE NOT NULL,

    created_by UNIQUEIDENTIFIER NOT NULL,

    created_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME(),

    updated_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME(),

    deleted_at DATETIME2 NULL,

    row_version ROWVERSION,

    CONSTRAINT pk_budgets
        PRIMARY KEY(id),

    CONSTRAINT fk_budget_workspace
        FOREIGN KEY(workspace_id)
        REFERENCES finance.workspaces(id),

    CONSTRAINT fk_budget_category
        FOREIGN KEY(category_id)
        REFERENCES finance.categories(id),

    CONSTRAINT fk_budget_user
        FOREIGN KEY(created_by)
        REFERENCES auth.users(id),

    CONSTRAINT chk_budget_amount
        CHECK(amount > 0),

    CONSTRAINT chk_budget_period
        CHECK(period_type IN
        (
            'monthly',
            'yearly'
        ))
);
GO