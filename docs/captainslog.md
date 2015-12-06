# Captain's Log


## Explanation

This is a ongoing report of the repository's progress. Most of the project definition is here.


## Entries

### 2015-12-05

The first relevant part of the system's design is starting. The main points for a first release are:

- Use of PostgreSQL as the database, to simulate (see [ER model](databases/er-model-1.png)) the current relational database used by GuiaBolso (it's Aurora, not Postgres, but both are relational and I am used to deal with the second).
- In order to secure a history of the evolution, files named *(up|down)/number.sql* (such as *up/1.sql* and *down/1.sql*) are used. The folder *up* represents an upgrade, while the folder *down*, a downgrade (similar to evolutions in PlayFramework). The system MUST provide a tracking of the base's evolution.
- Divide the tables in the ones for the application (with the prefix *app_*) and the ones for the system (e.g., *conf_evolutions*).
- Create a simple and automated CRUD to simulate users inserting (manually) new transactions and updating existing ones (e.g., categorize).
- Extract simple stats from the base (categorize users by age, region, types of spending).