# APPLICATION


DROP INDEX idx_app_tag_assigned_to_transaction;
DROP TABLE app_tag_assigned_to_transaction;


DROP INDEX idx_app_transactions__bank_account_id;
DROP INDEX idx_app_transactions__category_id;
DROP TABLE app_transactions;


DROP TABLE app_tags;


DROP TABLE app_categories;


DROP INDEX idx_app_bank_accounts__user_id;
DROP TABLE app_bank_accounts;


DROP TABLE app_users;


# SYSTEM


DROP TABLE conf_evolutions;