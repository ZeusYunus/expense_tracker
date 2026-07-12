                                USERS
                                  |
                    +-------------+-------------+
                    |                           |
             USER_ROLES                 LOGIN_HISTORY
                    |
                    |
                  ROLES
                    |
            ROLE_PERMISSIONS
                    |
               PERMISSIONS


USERS
   |
   |
WORKSPACES
   |
   +----------------------------+
   |                            |
WORKSPACE_MEMBERS         ACCOUNTS
                                |
                                |
                         TRANSACTIONS
                          /    |    \
                         /     |     \
                CATEGORIES  MERCHANTS  CURRENCIES
                     |
                     |
              (Parent Category)
                     |
                    TAGS
                     |
              TRANSACTION_TAGS

TRANSACTIONS
       |
ATTACHMENTS

WORKSPACES
      |
  BUDGETS

WORKSPACES
      |
RECURRING_TRANSACTIONS

TRANSACTIONS
      |
AUDIT_LOG