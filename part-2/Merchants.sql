CREATE TABLE finance.merchants
(
    id UNIQUEIDENTIFIER NOT NULL
        DEFAULT NEWSEQUENTIALID(),

    workspace_id UNIQUEIDENTIFIER NOT NULL,

    merchant_name NVARCHAR(200) NOT NULL,

    website NVARCHAR(300),

    phone NVARCHAR(50),

    notes NVARCHAR(500),

    created_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_merchants
        PRIMARY KEY(id),

    CONSTRAINT fk_merchant_workspace
        FOREIGN KEY(workspace_id)
        REFERENCES finance.workspaces(id)
);
GO