CREATE INDEX ix_workspace_date

ON finance.transactions

(
workspace_id,
transaction_date
);