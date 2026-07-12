CREATE TABLE auth.user_roles
(
    user_id UNIQUEIDENTIFIER NOT NULL,

    role_id UNIQUEIDENTIFIER NOT NULL,

    assigned_at DATETIME2
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_user_roles
        PRIMARY KEY(user_id, role_id),

    CONSTRAINT fk_user_role_user
        FOREIGN KEY(user_id)
        REFERENCES auth.users(id),

    CONSTRAINT fk_user_role_role
        FOREIGN KEY(role_id)
        REFERENCES auth.roles(id)
);
GO