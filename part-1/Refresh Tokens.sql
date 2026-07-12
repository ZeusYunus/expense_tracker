CREATE TABLE auth.refresh_tokens
(
    id UNIQUEIDENTIFIER
        DEFAULT NEWSEQUENTIALID(),

    user_id UNIQUEIDENTIFIER NOT NULL,

    token_hash NVARCHAR(500) NOT NULL,

    expires_at DATETIME2 NOT NULL,

    revoked_at DATETIME2 NULL,

    ip_address NVARCHAR(50),

    user_agent NVARCHAR(500),

    created_at DATETIME2
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_refresh_tokens
        PRIMARY KEY(id),

    CONSTRAINT fk_refresh_user
        FOREIGN KEY(user_id)
        REFERENCES auth.users(id)
        ON DELETE CASCADE
);
GO