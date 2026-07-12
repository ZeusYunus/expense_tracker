                                 +----------------------+
                                 |      Web Client      |
                                 |  React / Angular     |
                                 +----------+-----------+
                                            |
                                            |
                                 HTTPS REST API
                                            |
                                            |
                              +-------------+--------------+
                              |      ASP.NET Core API      |
                              | Authentication (JWT)       |
                              | Authorization (RBAC)       |
                              | Validation                |
                              | Business Logic            |
                              +-------------+-------------+
                                            |
                     +----------------------+----------------------+
                     |                                             |
             Background Jobs                               Reporting API
         (Recurring Transactions)                     (Stored Procedures)
                     |                                             |
                     +----------------------+----------------------+
                                            |
                                   SQL Server 2022
                                            |
     ------------------------------------------------------------------------------------
     |             |              |             |             |            |             |
     |             |              |             |             |            |             |
 Authentication   Workspace     Finance      Budgets      Attachments    Audit      Reporting
     |             |              |             |             |            |             |
 users         workspaces     transactions   budgets    attachments   audit_log     views
 roles         members        accounts       recurring                 procedures
 permissions                 categories
 refresh_tokens              merchants
 login_history               tags
                              currencies