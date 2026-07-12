# Expense Tracker System Overview

## Introduction

The Expense Tracker is a personal finance application that allows users to record income and expenses, manage budgets, and monitor their financial activity. The system is designed with scalability and maintainability in mind so that future features can be added without major changes to the database.

---

# How the System Works

## User Authentication

Users register an account using their email address and password.

After a successful login:

* A JSON Web Token (JWT) is issued.
* The user is assigned to their personal workspace.
* All requests are authenticated using the JWT.

---

## Workspaces

Every user belongs to a workspace.

A workspace owns all financial data, including:

* Accounts
* Categories
* Transactions
* Budgets
* Tags
* Merchants

This design ensures that users cannot access another user's financial information.

---

## Accounts

Accounts represent where money is stored.

Examples include:

* Cash
* Bank Account
* Credit Card
* Digital Wallet

All transactions are linked to an account.

---

## Categories

Categories organize transactions into meaningful groups.

Examples:

* Food
* Transport
* Utilities
* Entertainment
* Salary

Categories can also have subcategories to provide more detailed reporting.

---

## Transactions

Transactions are the core of the system.

Each transaction records:

* Transaction type (Income, Expense, or Transfer)
* Amount
* Date
* Account
* Category
* Merchant (optional)
* Description
* Notes (optional)

All reports and dashboards are generated from transaction data.

---

## Budgets

Users can create monthly or yearly budgets.

Budgets can apply to:

* An entire workspace
* A specific category

The application compares spending against the budget to calculate the remaining available amount.

---

## Recurring Transactions

Recurring transactions are templates for payments or income that occur regularly, such as:

* Salary
* Rent
* Subscriptions
* Insurance

A scheduled background process creates new transactions automatically based on these templates.

---

## Attachments

Receipts and supporting documents can be attached to transactions.

Only the file information is stored in the database. The actual files are stored in external file storage.

---

## Audit Logging

Important changes are automatically recorded in the audit log.

Each audit entry stores:

* Operation performed
* Date and time
* User
* Previous values
* New values

This provides a history of changes for troubleshooting and accountability.

---

# Typical Workflow

1. Register and log in.
2. Create one or more financial accounts.
3. Create custom categories if needed.
4. Record income and expenses.
5. Assign categories and merchants.
6. Set monthly budgets.
7. Upload receipts when available.
8. View reports and dashboards to monitor spending.

---

# Reports

The system provides reports such as:

* Monthly spending
* Spending by category
* Spending by merchant
* Income vs. Expenses
* Budget vs. Actual
* Cash Flow
* Recent Transactions

These reports are generated using SQL Server stored procedures for performance and consistency.

---

# Security

The system follows several security best practices:

* Passwords are stored as secure hashes.
* Authentication uses JWT tokens.
* Role-Based Access Control (RBAC) restricts access to protected features.
* Foreign key constraints protect data integrity.
* Audit logging records important changes.
* Users can only access data within their own workspace.

---

# Future Enhancements

The current architecture is designed to support future features such as:

* Organizations and Teams
* Shared Workspaces
* Split Expenses
* Savings Goals
* CSV and Bank Statement Imports
* Mobile Applications
* Advanced Analytics

These features can be added without requiring major database redesigns.
