CREATE INDEX ix_users_email
ON auth.users(email);

CREATE INDEX ix_refresh_user
ON auth.refresh_tokens(user_id);

CREATE INDEX ix_workspace_owner
ON finance.workspaces(owner_user_id);

CREATE INDEX ix_login_user
ON auth.login_history(user_id);

CREATE INDEX ix_login_time
ON auth.login_history(login_time DESC);
GO