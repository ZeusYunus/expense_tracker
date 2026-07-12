DECLARE @workspace UNIQUEIDENTIFIER;

SELECT @workspace=id
FROM finance.workspaces;

INSERT INTO finance.categories
(
    workspace_id,
    category_name,
    icon,
    color
)
VALUES

(@workspace,'Food','restaurant','#FF6384'),
(@workspace,'Transport','car','#36A2EB'),
(@workspace,'Utilities','bolt','#FFCE56'),
(@workspace,'Entertainment','movie','#4BC0C0'),
(@workspace,'Salary','money','#2ECC71');
GO