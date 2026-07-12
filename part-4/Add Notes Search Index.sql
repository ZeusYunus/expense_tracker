CREATE FULLTEXT CATALOG expense_catalog;
GO

CREATE FULLTEXT INDEX
ON finance.transactions(notes)
KEY INDEX pk_transactions;
GO