CREATE INDEX ix_budget_workspace

ON finance.budgets

(
workspace_id,
start_date,
end_date
);