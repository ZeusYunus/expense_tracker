DECLARE @workspace UNIQUEIDENTIFIER;
DECLARE @account UNIQUEIDENTIFIER;
DECLARE @category UNIQUEIDENTIFIER;
DECLARE @merchant UNIQUEIDENTIFIER;
DECLARE @user UNIQUEIDENTIFIER;

SELECT @workspace=id FROM finance.workspaces;
SELECT @account=id FROM finance.accounts;
SELECT @category=id
FROM finance.categories
WHERE category_name='Entertainment';
SELECT @merchant=id
FROM finance.merchants
WHERE merchant_name='Netflix';
SELECT @user=id
FROM auth.users
WHERE email='admin@example.com';

INSERT INTO finance.recurring_transactions
(
    workspace_id,
    account_id,
    category_id,
    merchant_id,
    transaction_type,
    amount,
    frequency,
    next_run_date,
    description,
    created_by
)
VALUES
(
    @workspace,
    @account,
    @category,
    @merchant,
    'expense',
    199.99,
    'monthly',
    '2026-02-01',
    'Netflix Subscription',
    @user
);
GO