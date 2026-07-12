DECLARE @workspace UNIQUEIDENTIFIER;

SELECT @workspace = id
FROM finance.workspaces;

INSERT INTO finance.tags
(
    workspace_id,
    tag_name
)
VALUES
(@workspace,'Business'),
(@workspace,'Family'),
(@workspace,'Vacation'),
(@workspace,'Fuel');
GO