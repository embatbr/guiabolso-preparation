# SYSTEM


CREATE TABLE conf_evolutions (
    id SERIAL PRIMARY KEY,
    evolution INTEGER NOT NULL,
    execution_datetime TIMESTAMP NOT NULL # to be (unique) or not be? Maybe not (to allow distribution)
);


# APPLICATION

# All tables have an UUID as primary key, even when "unnecessary". The UUID was
# chosen to allow a more unique PK (and it's easier to distribute the database).

# The "natural PKs" (e.g., (bank_code, agency_code, account_code) in app_bank_accounts)
# receive the constraint "unique".

# All tables (except the ones used only to represent a relationship) have an ID
# given by the system, to allow more flexibility.


CREATE TABLE app_users (
    id UUID PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    crypted_password TEXT NOT NULL,
    name TEXT NOT NULL,
    age INTEGER,
    state TEXT NOT NULL,
    city TEXT NOT NULL,
    signup_datetime TIMESTAMP NOT NULL
);


CREATE TABLE app_bank_accounts (
    id UUID PRIMARY KEY,
    bank_code TEXT NOT NULL,
    agency_code TEXT NOT NULL,
    account_code TEXT NOT NULL
);

ALTER TABLE app_bank_accounts ADD UNIQUE (bank_code, agency_code, account_code);


CREATE TABLE app_categories (
    id UUID PRIMARY KEY,
    group TEXT NOT NULL,
    name TEXT NOT NULL,
    is_personalized BOOLEAN NOT NULL
);

ALTER TABLE app_categories ADD UNIQUE (group, name);


CREATE TABLE app_tags (
    id UUID PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);


CREATE TABLE app_transactions (
    id UUID PRIMARY KEY,
    value DECIMAL(12, 2) NOT NULL,
    description TEXT NOT NULL
    lauch_datetime TIMESTAMP NOT NULL,
    user_id UUID NOT NULL,
    bank_account_id UUID, # can be a transaction paid with cash
    category_id UUID, # a NULL value means an uncategorized transaction
);

CREATE INDEX idx_app_transactions__user_id ON app_transactions (user_id);
CREATE INDEX idx_app_transactions__bank_account_id ON app_transactions (bank_account_id);
CREATE INDEX idx_app_transactions__category_id ON app_transactions (category_id);

ALTER TABLE app_transactions ADD CONSTRAINT fk_app_transactions__user_id FOREIGN KEY (user_id) REFERENCES app_users (id);
ALTER TABLE app_transactions ADD CONSTRAINT fk_app_transactions__bank_account_id FOREIGN KEY (bank_account_id) REFERENCES app_bank_accounts (id);
ALTER TABLE app_transactions ADD CONSTRAINT fk_app_transactions__category_id FOREIGN KEY (category_id) REFERENCES app_categories (id);


CREATE TABLE app_tagged_transaction (
    tag_id UUID NOT NULL,
    transaction_id UUID NOT NULL,
    PRIMARY KEY (tag_id, transaction_id)
);

CREATE INDEX idx_app_tagged_transaction ON app_tagged_transaction (tag_id, transaction_id);

ALTER TABLE app_tagged_transaction ADD CONSTRAINT fk_app_tagged_transaction__tag_id FOREIGN KEY (tag_id) REFERENCES app_tags (id);
ALTER TABLE app_tagged_transaction ADD CONSTRAINT fk_app_tagged_transaction__transaction_id FOREIGN KEY (transaction_id) REFERENCES app_transactions (id)
