INSERT INTO finance.workspace_members
(
    workspace_id,
    user_id,
    is_owner
)
SELECT
    w.id,
    u.id,
    1
FROM finance.workspaces w
INNER JOIN auth.users u
ON w.owner_user_id=u.id;
GO