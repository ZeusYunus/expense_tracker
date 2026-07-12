CREATE TABLE finance.workspaces
(
    id UNIQUEIDENTIFIER
        DEFAULT NEWSEQUENTIALID(),

    workspace_name NVARCHAR(150) NOT NULL,

    owner_user_id UNIQUEIDENTIFIER NOT NULL,

    created_at DATETIME2
        DEFAULT SYSUTCDATETIME(),

    updated_at DATETIME2
        DEFAULT SYSUTCDATETIME(),

    deleted_at DATETIME2,

    CONSTRAINT pk_workspaces
        PRIMARY KEY(id),

    CONSTRAINT fk_workspace_owner
        FOREIGN KEY(owner_user_id)
        REFERENCES auth.users(id)
);
GO