# guiabolso-preparation

Collection of reviews and a mock system to study prior the beginning at GuiaBolso.


## What to do

- Create a mock database (possibly using PostgreSQL) of the GuiaBolso's. Create random data, using a structure similar to the platform's (spents divided in categories).
- Migrate the relational database to one using Apache Cassandra (or other NoSQL database).
- Extract information hidden in the database. At this stage, the Machine Learning techniques used will be defined.

It is advisable to use Python and Python-like tools and frameworks.


## Steps

1. Create a simulation of part of GuiaBolso's system. It must have a database in which an user can register and a transaction (credit of debit) containing a description (e.g., a restaurant/supermarket/shopping name), value and a date.
2. Extract information from the transactions from the users. The information must be of two types: (1) relevant information for the user (financial planning, sink holes of money and etc.) and (2) segmentation of users in profiles (economic, loose, investor and etc.)
3. Increase the database with new users and transactions, as such as new types of data (expand the models). This will simulate the platform's growth. There's a possibility of use multiple SQL databases in a distributed system. That's when the next item is needed.
4. Migration to a NoSQL database. The logical suggestion is Cassandra, but Mongo, Couch and other "paradigms" should be also considered (provides a better study).

This steps are iteractive and incremental.


## Good Practices

Try to use TDD for everything. Use the [Captain's Log](docs/captainslog.md)


## Sources of knowledge

- check the big data tools provided by Amazon
- https://www.youtube.com/playlist?list=PL77JVjKTJT2jyVllJeO3TZV9D5cfSvSjR
- http://nbviewer.ipython.org/url/norvig.com/ipython/Probability.ipynb
- https://www.quora.com/How-can-I-become-a-data-scientist
- https://www.quora.com/How-do-I-get-started-with-data-engineering
- https://www.udemy.com/home/my-courses/learning/
- http://www.forbes.com/sites/bernardmarr/2015/06/22/spark-or-hadoop-which-is-the-best-big-data-framework/2/
- http://solutions-review.com/data-integration/hadoop-vs-spark-which-big-data-framework-is-better/
- https://www.linkedin.com/groups/4332669/4332669-6068486384849547264
- http://cwbuecheler.com/web/tutorials/2013/node-express-mongo/
- http://rest.elkstein.org/
- https://about.gitlab.com/
- http://www.marinamele.com/taskbuster-django-tutorial/taskbuster-working-environment-and-start-django-project