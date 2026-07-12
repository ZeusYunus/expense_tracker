DECLARE @workspace UNIQUEIDENTIFIER;

SELECT @workspace = id
FROM finance.workspaces;

DECLARE @currency UNIQUEIDENTIFIER;

SELECT @currency = id
FROM finance.currencies
WHERE iso_code='ZAR';

INSERT INTO finance.accounts
(
    workspace_id,
    currency_id,
    account_name,
    account_type,
    opening_balance,
    current_balance
)
VALUES
(
    @workspace,
    @currency,
    'Main Bank Account',
    'bank',
    10000,
    10000
);
GO