CREATE VIEW finance.v_account_balances
AS
SELECT
    a.id,
    a.account_name,
    a.opening_balance
        +
        SUM(
            CASE

                WHEN t.transaction_type='income'
                    THEN t.amount

                WHEN t.transaction_type='expense'
                    THEN -t.amount

                ELSE 0

            END
        ) AS balance

FROM finance.accounts a

LEFT JOIN finance.transactions t
ON a.id=t.account_id
AND t.deleted_at IS NULL

GROUP BY

a.id,
a.account_name,
a.opening_balance;