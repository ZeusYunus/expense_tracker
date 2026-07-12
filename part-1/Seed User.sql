INSERT INTO auth.users
(
    email,
    password_hash,
    first_name,
    last_name,
    is_email_verified
)
VALUES
(
    'admin@example.com',
    'REPLACE_WITH_REAL_PASSWORD_HASH',
    'System',
    'Administrator',
    1
);
GO