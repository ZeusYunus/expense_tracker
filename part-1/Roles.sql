CREATE TABLE auth.roles
(
    id UNIQUEIDENTIFIER
        DEFAULT NEWSEQUENTIALID(),

    name NVARCHAR(100) NOT NULL,

    description NVARCHAR(300),

    created_at DATETIME2
        DEFAULT SYSUTCDATETIME(),

    updated_at DATETIME2
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_roles
        PRIMARY KEY(id),

    CONSTRAINT uq_roles_name
        UNIQUE(name)
);
GO