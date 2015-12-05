# The drops are executed in an order inverse than the creates.


DROP INDEX IF EXISTS idx_tagged_transaction;

DROP TABLE IF EXISTS tagged_transaction;


DROP INDEX IF EXISTS idx_transactions__user_id;
DROP INDEX IF EXISTS idx_transactions__bank_account_id;
DROP INDEX IF EXISTS idx_transactions__category_id;

DROP TABLE IF EXISTS transactions;


DROP TABLE IF EXISTS tags;


DROP TABLE IF EXISTS categorys;


DROP TABLE IF EXISTS bank_accounts;


DROP TABLE IF EXISTS users;