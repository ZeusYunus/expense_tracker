CREATE TABLE finance.tags
(
    id UNIQUEIDENTIFIER NOT NULL
        DEFAULT NEWSEQUENTIALID(),

    workspace_id UNIQUEIDENTIFIER NOT NULL,

    tag_name NVARCHAR(100) NOT NULL,

    created_at DATETIME2
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_tags
        PRIMARY KEY(id),

    CONSTRAINT fk_tag_workspace
        FOREIGN KEY(workspace_id)
        REFERENCES finance.workspaces(id)
);
GO