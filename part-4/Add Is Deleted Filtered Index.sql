CREATE INDEX ix_transactions_active

ON finance.transactions

(
workspace_id,
transaction_date
)

WHERE deleted_at IS NULL;