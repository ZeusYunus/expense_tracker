DECLARE @workspace UNIQUEIDENTIFIER;

SELECT @workspace=id
FROM finance.workspaces;

INSERT INTO finance.merchants
(
    workspace_id,
    merchant_name
)
VALUES
(@workspace,'Checkers'),
(@workspace,'Pick n Pay'),
(@workspace,'Shell'),
(@workspace,'Netflix');
GO