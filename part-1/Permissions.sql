CREATE TABLE auth.permissions
(
    id UNIQUEIDENTIFIER
        DEFAULT NEWSEQUENTIALID(),

    permission_name NVARCHAR(150) NOT NULL,

    description NVARCHAR(300),

    created_at DATETIME2
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_permissions
        PRIMARY KEY(id),

    CONSTRAINT uq_permissions
        UNIQUE(permission_name)
);
GO