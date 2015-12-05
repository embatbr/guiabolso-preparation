# All tables have an UUID as primary key, even when "unnecessary". The UUID was
# chosen to allow a more unique PK (and it's easier to distribute the database).

# The "natural PKs" (e.g., (bank_code, agency_code, account_code) in bank_accounts)
# receive the constraint "unique".

# All tables (except the ones used only to represent a relationship) have an ID
# given by the system, to allow more flexibility.


CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    crypted_password TEXT NOT NULL,
    name TEXT NOT NULL,
    age INTEGER,
    state TEXT,
    city TEXT,
    signup_datetime TIMESTAMP NOT NULL
);


CREATE TABLE IF NOT EXISTS bank_accounts (
    id UUID PRIMARY KEY,
    bank_code TEXT NOT NULL,
    agency_code TEXT NOT NULL,
    account_code TEXT NOT NULL
);

ALTER TABLE bank_accounts ADD UNIQUE (bank_code, agency_code, account_code);


CREATE TABLE IF NOT EXISTS categorys (
    id UUID PRIMARY KEY,
    group TEXT NOT NULL,
    name TEXT NOT NULL,
    is_personalized BOOLEAN NOT NULL
);

ALTER TABLE categorys ADD UNIQUE (group, name);


CREATE TABLE IF NOT EXISTS tags (
    id UUID PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS transactions (
    id UUID PRIMARY KEY,
    value DECIMAL(12, 2) NOT NULL,
    lauch_datetime TIMESTAMP NOT NULL,
    user_id UUID NOT NULL,
    bank_account_id UUID NOT NULL,
    category_id UUID,
    description TEXT
);

CREATE INDEX idx_transactions__user_id ON transactions (user_id);
CREATE INDEX idx_transactions__bank_account_id ON transactions (bank_account_id);
CREATE INDEX idx_transactions__category_id ON transactions (category_id);

ALTER TABLE transactions ADD CONSTRAINT fk_transactions__user_id FOREIGN KEY (user_id) REFERENCES users (id);
ALTER TABLE transactions ADD CONSTRAINT fk_transactions__bank_account_id FOREIGN KEY (bank_account_id) REFERENCES bank_accounts (id);
ALTER TABLE transactions ADD CONSTRAINT fk_transactions__category_id FOREIGN KEY (category_id) REFERENCES categorys (id);


CREATE TABLE IF NOT EXISTS tagged_transaction (
    tag_id UUID NOT NULL,
    transaction_id UUID NOT NULL,
    PRIMARY KEY (tag_id, transaction_id)
);

CREATE INDEX idx_tagged_transaction ON tagged_transaction (tag_id, transaction_id);

ALTER TABLE tagged_transaction ADD CONSTRAINT fk_tagged_transaction__tag_id FOREIGN KEY (tag_id) REFERENCES tags (id);
ALTER TABLE tagged_transaction ADD CONSTRAINT fk_tagged_transaction__transaction_id FOREIGN KEY (transaction_id) REFERENCES transactions (id)
