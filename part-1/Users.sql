CREATE TABLE auth.users
(
    id UNIQUEIDENTIFIER NOT NULL
        DEFAULT NEWSEQUENTIALID(),

    email NVARCHAR(255) NOT NULL,

    password_hash NVARCHAR(500) NOT NULL,

    first_name NVARCHAR(100) NOT NULL,

    last_name NVARCHAR(100) NOT NULL,

    phone_number NVARCHAR(30),

    is_email_verified BIT NOT NULL
        DEFAULT 0,

    is_active BIT NOT NULL
        DEFAULT 1,

    created_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME(),

    updated_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME(),

    deleted_at DATETIME2 NULL,

    row_version ROWVERSION,

    CONSTRAINT pk_users
        PRIMARY KEY CLUSTERED(id),

    CONSTRAINT uq_users_email
        UNIQUE(email)
);
GO