CREATE TABLE finance.categories
(
    id UNIQUEIDENTIFIER NOT NULL
        DEFAULT NEWSEQUENTIALID(),

    workspace_id UNIQUEIDENTIFIER NOT NULL,

    parent_category_id UNIQUEIDENTIFIER NULL,

    category_name NVARCHAR(100) NOT NULL,

    icon NVARCHAR(100),

    color NVARCHAR(20),

    created_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_categories
        PRIMARY KEY(id),

    CONSTRAINT fk_category_workspace
        FOREIGN KEY(workspace_id)
        REFERENCES finance.workspaces(id),

    CONSTRAINT fk_parent_category
        FOREIGN KEY(parent_category_id)
        REFERENCES finance.categories(id)
);
GO