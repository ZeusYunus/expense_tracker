CREATE UNIQUE INDEX ux_category_name
ON finance.categories
(
workspace_id,
category_name
);