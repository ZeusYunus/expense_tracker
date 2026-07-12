DECLARE @workspace UNIQUEIDENTIFIER;
DECLARE @account UNIQUEIDENTIFIER;
DECLARE @currency UNIQUEIDENTIFIER;
DECLARE @food UNIQUEIDENTIFIER;
DECLARE @salary UNIQUEIDENTIFIER;
DECLARE @merchant UNIQUEIDENTIFIER;
DECLARE @user UNIQUEIDENTIFIER;

SELECT @workspace=id FROM finance.workspaces;
SELECT @account=id FROM finance.accounts;
SELECT @currency=id FROM finance.currencies WHERE iso_code='ZAR';
SELECT @food=id FROM finance.categories WHERE category_name='Food';
SELECT @salary=id FROM finance.categories WHERE category_name='Salary';
SELECT @merchant=id FROM finance.merchants WHERE merchant_name='Checkers';
SELECT @user=id FROM auth.users WHERE email='admin@example.com';

INSERT INTO finance.transactions
(
    workspace_id,
    account_id,
    category_id,
    merchant_id,
    transaction_type,
    amount,
    currency_id,
    transaction_date,
    description,
    created_by
)
VALUES
(@workspace,@account,@salary,NULL,'income',25000,@currency,'2026-01-01','January Salary',@user),

(@workspace,@account,@food,@merchant,'expense',950.25,@currency,'2026-01-03','Weekly Groceries',@user),

(@workspace,@account,@food,@merchant,'expense',425.10,@currency,'2026-01-10','Weekend Shopping',@user);
GO