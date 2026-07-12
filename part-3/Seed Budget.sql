DECLARE @workspace UNIQUEIDENTIFIER;
DECLARE @category UNIQUEIDENTIFIER;
DECLARE @user UNIQUEIDENTIFIER;

SELECT @workspace = id
FROM finance.workspaces;

SELECT @category = id
FROM finance.categories
WHERE category_name = 'Food';

SELECT @user = id
FROM auth.users
WHERE email = 'admin@example.com';

INSERT INTO finance.budgets
(
    workspace_id,
    category_id,
    budget_name,
    amount,
    period_type,
    start_date,
    end_date,
    created_by
)
VALUES
(
    @workspace,
    @category,
    'Monthly Food',
    5000,
    'monthly',
    '2026-01-01',
    '2026-01-31',
    @user
);
GO