# Captain's Log


## Explanation

This is a ongoing report of the repository's progress. Most of the project definition is here.


## Entries

### Stardate 2015-12-05

The first relevant part of the system's design is starting. The main points for a first release are:

1. Use of PostgreSQL as the database, to simulate (see [ER model](databases/er-model-1.png)) the current relational database used by GuiaBolso (it's Aurora, not Postgres, but both are relational and I am used to deal with the second).
2. In order to secure a history of the evolution, files named *(up|down)/number.sql* (such as *up/1.sql* and *down/1.sql*) are used. The folder *up* represents an upgrade, while the folder *down*, a downgrade (similar to evolutions in PlayFramework). The system MUST provide a tracking of the base's evolution.
3. Divide the tables in the ones for the application (with the prefix *app_*) and the ones for the system (e.g., *conf_evolutions*).
4. Create a simple and automated CRUD to simulate users inserting (manually) new transactions and updating existing ones (e.g., categorize).
5. Extract simple stats from the base (categorize users by age, region, types of spending).


### Stardate 2015-12-07

1. Changed tables *app_bank_accounts* and *app_transactions* in hierarchy. Now a BankAccount references a User, and a Transaction references this BankAccount.
2. After the visit to GuiaBolso's HQ, create a base of knowledge (mocked, using some webcrawler or other means) and categorize the transacions (semi) automatically.
3. Should (or *must*) use the Big Data tools provided by Amazon.
4. Should read about DynamoDB.


### Stardate 2015-12-09

1. Removed columns *email* and *crypted_password* (even the name was wrong...). Those are unnecessary.
2. Changed name of relation-table.
3. Removed columns "is_personalized" from table "app_categories".