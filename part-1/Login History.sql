CREATE TABLE auth.login_history
(
    id UNIQUEIDENTIFIER
        DEFAULT NEWSEQUENTIALID(),

    user_id UNIQUEIDENTIFIER,

    login_time DATETIME2
        DEFAULT SYSUTCDATETIME(),

    ip_address NVARCHAR(50),

    device NVARCHAR(200),

    browser NVARCHAR(200),

    success BIT NOT NULL,

    failure_reason NVARCHAR(200),

    CONSTRAINT pk_login_history
        PRIMARY KEY(id),

    CONSTRAINT fk_login_user
        FOREIGN KEY(user_id)
        REFERENCES auth.users(id)
);
GO