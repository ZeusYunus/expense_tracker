CREATE TABLE finance.transaction_tags
(
    transaction_id UNIQUEIDENTIFIER NOT NULL,

    tag_id UNIQUEIDENTIFIER NOT NULL,

    CONSTRAINT pk_transaction_tags
        PRIMARY KEY(transaction_id, tag_id),

    CONSTRAINT fk_tt_transaction
        FOREIGN KEY(transaction_id)
        REFERENCES finance.transactions(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_tt_tag
        FOREIGN KEY(tag_id)
        REFERENCES finance.tags(id)
        ON DELETE CASCADE
);
GO