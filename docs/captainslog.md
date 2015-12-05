# Captain's Log


## Explanation

This is a ongoing report of the repository's progress. Most of the project definition is here.


## Entries

### 2015-12-05

The first relevant part of the system's design is starting. The main points for a first release are:

- Use of PostgreSQL as the database, to simulate (see [ER model](databases/postgresql/diagrams/1.png)) the current relational database used by GuiaBolso (it's Aurora, not Postgres, but both are relational and I am used to deal with the second).
- In order to secure a history of the evolution, files named <number>.<up|down>.sql (such as 1.up.sql and 1.down.sql) are used. The *.up.sql represents an upgrade, while a *.down.sql represents a downgrade (similar to evolutions in PlayFramework). The database MUST have (and I MUST create a base script) tables to version control and similar. Suggestion: use "sys_*" for this and "app_*" for the application tables (app_users, app_transactions and etc.).
- Create a simple and automated CRUD to simulate users inserting (manually) new transactions and updating existing ones (e.g., categorize).
- Extract simple stats from the base (categorize users by age, region, types of spending).