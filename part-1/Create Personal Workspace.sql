INSERT INTO finance.workspaces
(
    workspace_name,
    owner_user_id
)
SELECT
    'Personal Workspace',
    id
FROM auth.users
WHERE email='admin@example.com';
GO