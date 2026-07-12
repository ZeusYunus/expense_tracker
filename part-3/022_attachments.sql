CREATE TABLE finance.attachments
(
    id UNIQUEIDENTIFIER NOT NULL
        DEFAULT NEWSEQUENTIALID(),

    transaction_id UNIQUEIDENTIFIER NOT NULL,

    file_name NVARCHAR(255) NOT NULL,

    file_url NVARCHAR(1000) NOT NULL,

    mime_type NVARCHAR(100),

    file_size BIGINT,

    uploaded_by UNIQUEIDENTIFIER NOT NULL,

    uploaded_at DATETIME2 NOT NULL
        DEFAULT SYSUTCDATETIME(),

    CONSTRAINT pk_attachments
        PRIMARY KEY(id),

    CONSTRAINT fk_attachment_transaction
        FOREIGN KEY(transaction_id)
        REFERENCES finance.transactions(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_attachment_user
        FOREIGN KEY(uploaded_by)
        REFERENCES auth.users(id)
);
GO