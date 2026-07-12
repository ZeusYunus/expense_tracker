CREATE TABLE auth.role_permissions
(
    role_id UNIQUEIDENTIFIER NOT NULL,

    permission_id UNIQUEIDENTIFIER NOT NULL,

    granted_at DATETIME2
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_role_permissions
        PRIMARY KEY(role_id, permission_id),

    CONSTRAINT fk_rp_role
        FOREIGN KEY(role_id)
        REFERENCES auth.roles(id),

    CONSTRAINT fk_rp_permission
        FOREIGN KEY(permission_id)
        REFERENCES auth.permissions(id)
);
GO