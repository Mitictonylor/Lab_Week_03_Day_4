Codeclan week 3 day 4
Lab practice for ruby and PostgreSQL CRUD

To access the database:
First, create a database called ‘marvel’

terminal
createdb imdb
Next, run the provided SQL script to populate your database:

terminal
psql -d imdb -f imdb.sql

# IMDb


**Brief**

Your IMDb should have:

- **Movies**
- title
- genre
- **Stars**
- first name
- last name
- **Castings**
- movie_id
- star_id
- fee

The app should be able to

- handle CRUD actions for all three models
- display all the stars for a particular movie
- display all the movies a particular star is cast in

**Extension**

- add a budget to your movie model and create a method that will return the remaining budget once all a movie’s star’s fees have been taken into consideration!
