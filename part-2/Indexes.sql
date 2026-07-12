CREATE INDEX ix_account_workspace
ON finance.accounts(workspace_id);

CREATE INDEX ix_category_workspace
ON finance.categories(workspace_id);

CREATE INDEX ix_merchant_workspace
ON finance.merchants(workspace_id);

CREATE INDEX ix_transaction_workspace_date
ON finance.transactions
(
    workspace_id,
    transaction_date DESC
);

CREATE INDEX ix_transaction_category
ON finance.transactions(category_id);

CREATE INDEX ix_transaction_account
ON finance.transactions(account_id);

CREATE INDEX ix_transaction_merchant
ON finance.transactions(merchant_id);

CREATE INDEX ix_transaction_type
ON finance.transactions(transaction_type);

CREATE INDEX ix_transaction_created_by
ON finance.transactions(created_by);

CREATE INDEX ix_tag_workspace
ON finance.tags(workspace_id);
GO