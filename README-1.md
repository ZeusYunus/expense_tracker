# Expense Tracker Database Developer Guide (Version 1)

## Overview

The Expense Tracker database is built on **Microsoft SQL Server 2022** using a normalized relational design.

The database is divided into logical schemas:

| Schema      | Purpose                          |
| ----------- | -------------------------------- |
| `auth`      | Authentication and authorization |
| `finance`   | Financial data                   |
| `audit`     | Audit logging                    |
| `reporting` | Views and stored procedures      |

---

# Main Tables

## Authentication (`auth`)

| Table              | Description                      |
| ------------------ | -------------------------------- |
| `users`            | Stores user accounts.            |
| `roles`            | Application roles (Admin, User). |
| `permissions`      | Individual permissions.          |
| `user_roles`       | Assigns roles to users.          |
| `role_permissions` | Assigns permissions to roles.    |
| `refresh_tokens`   | Stores JWT refresh tokens.       |
| `login_history`    | Tracks login attempts.           |

---

## Finance (`finance`)

| Table                    | Description                                              |
| ------------------------ | -------------------------------------------------------- |
| `workspaces`             | Root owner of all financial data.                        |
| `workspace_members`      | Users belonging to a workspace.                          |
| `accounts`               | Bank accounts, wallets, cash, credit cards.              |
| `categories`             | Expense and income categories.                           |
| `merchants`              | Stores merchant information.                             |
| `transactions`           | Stores all income, expenses and transfers.               |
| `tags`                   | Transaction tags.                                        |
| `transaction_tags`       | Many-to-many relationship between transactions and tags. |
| `budgets`                | Budget limits.                                           |
| `recurring_transactions` | Templates for recurring transactions.                    |
| `attachments`            | Receipt metadata.                                        |
| `currencies`             | Supported currencies.                                    |
| `exchange_rates`         | Historical exchange rates.                               |

---

## Audit

| Table       | Description                           |
| ----------- | ------------------------------------- |
| `audit_log` | Records inserts, updates and deletes. |

---

# Database Relationships

The primary ownership chain is:

```text
User
   │
   ▼
Workspace
   │
   ├─────────────┐
   │             │
Accounts     Categories
   │             │
   └──────┬──────┘
          │
    Transactions
          │
  ┌───────┼────────┐
  │       │        │
Tags   Merchant  Attachments
```

Every financial record belongs to a workspace.

---

# Creating Data

## Create User

Insert into:

```text
auth.users
```

After creating the user:

1. Create a workspace.
2. Add the user to `workspace_members`.
3. Assign the default "User" role.

---

## Create Account

Insert into:

```text
finance.accounts
```

Required:

* Workspace
* Currency
* Account Name
* Account Type

---

## Create Category

Insert into:

```text
finance.categories
```

Required:

* Workspace
* Category Name

Optional:

* Parent Category
* Icon
* Color

---

## Create Merchant

Insert into:

```text
finance.merchants
```

Only create a merchant if it does not already exist for the workspace.

---

## Create Transaction

Insert into:

```text
finance.transactions
```

Required fields:

* Workspace
* Account
* Transaction Type
* Amount
* Currency
* Date
* Created By

Optional:

* Category
* Merchant
* Notes

Never update account balances directly. Transactions are the source of truth.

---

## Create Budget

Insert into:

```text
finance.budgets
```

A budget belongs to:

* Workspace
* Category (optional)

---

## Create Recurring Transaction

Insert into:

```text
finance.recurring_transactions
```

A background service reads this table and creates new transactions automatically.

---

# Updating Data

Use `UPDATE` statements only on editable records.

Common updates include:

* User profile
* Account name
* Category name
* Merchant details
* Budget amount
* Transaction description
* Transaction notes

Do **not** update:

* Primary keys
* Workspace ownership
* Audit records

All updates should also set `updated_at`.

---

# Deleting Data

The system uses **soft deletes** for business entities.

Instead of deleting records:

```sql
UPDATE finance.transactions
SET deleted_at = SYSUTCDATETIME()
WHERE id = @TransactionId;
```

This preserves historical data and audit integrity.

---

# Common Joins

## Transaction + Account

```sql
SELECT *
FROM finance.transactions t
INNER JOIN finance.accounts a
ON t.account_id = a.id;
```

---

## Transaction + Category

```sql
SELECT *
FROM finance.transactions t
INNER JOIN finance.categories c
ON t.category_id = c.id;
```

---

## Transaction + Merchant

```sql
SELECT *
FROM finance.transactions t
LEFT JOIN finance.merchants m
ON t.merchant_id = m.id;
```

---

## Full Transaction Details

```sql
SELECT
    t.*,
    a.account_name,
    c.category_name,
    m.merchant_name
FROM finance.transactions t
INNER JOIN finance.accounts a
    ON a.id = t.account_id
LEFT JOIN finance.categories c
    ON c.id = t.category_id
LEFT JOIN finance.merchants m
    ON m.id = t.merchant_id;
```

---

# Stored Procedures

The `reporting` schema contains stored procedures used by the API.

Examples include:

| Procedure                 | Purpose                        |
| ------------------------- | ------------------------------ |
| `usp_dashboard`           | Dashboard summary              |
| `usp_monthly_report`      | Monthly spending               |
| `usp_budget_report`       | Budget vs Actual               |
| `usp_cashflow`            | Cash flow                      |
| `usp_top_categories`      | Highest spending categories    |
| `usp_top_merchants`       | Most frequently used merchants |
| `usp_recent_transactions` | Recent transaction list        |

Applications should call these procedures instead of embedding complex SQL in the application.

---

# Audit Process

Every INSERT, UPDATE, and DELETE on key financial tables writes an entry to:

```text
audit.audit_log
```

The audit record includes:

* Table name
* Record ID
* Operation
* Previous values
* New values
* User
* Timestamp

Audit records should never be modified or deleted.

---

# Development Guidelines

* Use parameterized queries or Entity Framework Core.
* Always filter financial queries by `workspace_id`.
* Do not bypass foreign key constraints.
* Use transactions (`BEGIN TRANSACTION` / `COMMIT`) for operations affecting multiple tables.
* Prefer stored procedures or repository methods for complex business logic.
* Avoid hard deletes unless required for lookup tables.

Following these guidelines ensures data integrity, security, and consistent behavior across the application.
