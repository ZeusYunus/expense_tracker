CREATE TABLE finance.workspace_members
(
    workspace_id UNIQUEIDENTIFIER NOT NULL,

    user_id UNIQUEIDENTIFIER NOT NULL,

    is_owner BIT NOT NULL
        DEFAULT 0,

    joined_at DATETIME2
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_workspace_members
        PRIMARY KEY(workspace_id, user_id),

    CONSTRAINT fk_wm_workspace
        FOREIGN KEY(workspace_id)
        REFERENCES finance.workspaces(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_wm_user
        FOREIGN KEY(user_id)
        REFERENCES auth.users(id)
        ON DELETE CASCADE
);
GO